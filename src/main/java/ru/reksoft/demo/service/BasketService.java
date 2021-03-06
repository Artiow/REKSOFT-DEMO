package ru.reksoft.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.reksoft.demo.config.messages.MessageContainer;
import ru.reksoft.demo.domain.CurrentBasketEntity;
import ru.reksoft.demo.domain.UserEntity;
import ru.reksoft.demo.dto.BasketDTO;
import ru.reksoft.demo.mapper.BasketMapper;
import ru.reksoft.demo.repository.CurrentBasketRepository;
import ru.reksoft.demo.repository.MediaRepository;
import ru.reksoft.demo.repository.UserRepository;
import ru.reksoft.demo.repository.UserRoleRepository;
import ru.reksoft.demo.service.generic.AbstractSecurityService;
import ru.reksoft.demo.service.generic.AuthorizationRequiredException;
import ru.reksoft.demo.service.generic.ResourceCannotCreateException;
import ru.reksoft.demo.service.generic.ResourceNotFoundException;

import javax.validation.constraints.NotNull;

@Service
public class BasketService extends AbstractSecurityService {

    private MediaRepository mediaRepository;
    private CurrentBasketRepository currentBasketRepository;

    private BasketMapper basketMapper;

    @Autowired
    public void setMessages(MessageContainer messages) {
        super.setMessages(messages);
    }

    @Autowired
    public void setUserRepository(UserRepository userRepository) {
        super.setUserRepository(userRepository);
    }

    @Autowired
    protected void setUserRoleRepository(UserRoleRepository userRoleRepository) {
        super.setUserRoleRepository(userRoleRepository);
    }

    @Autowired
    public void setMediaRepository(MediaRepository mediaRepository) {
        this.mediaRepository = mediaRepository;
    }

    @Autowired
    public void setCurrentBasketRepository(CurrentBasketRepository currentBasketRepository) {
        this.currentBasketRepository = currentBasketRepository;
    }

    @Autowired
    public void setBasketMapper(BasketMapper basketMapper) {
        this.basketMapper = basketMapper;
    }


    /**
     * Returns basket by user auth.
     *
     * @return basket
     * @throws AuthorizationRequiredException - if authorization is missing
     */
    @Transactional(readOnly = true)
    public BasketDTO get() throws AuthorizationRequiredException {
        return basketMapper.toBasket(getCurrentUserEntity().getBasket());
    }

    /**
     * Add media by media id in user basket by user auth.
     *
     * @param mediaId - media id
     * @throws AuthorizationRequiredException - if authorization is missing
     * @throws ResourceNotFoundException      - if media with id not found
     * @throws ResourceCannotCreateException  - if current basket already exist for user and media
     */
    @Transactional
    public void add(@NotNull Integer mediaId) throws AuthorizationRequiredException, ResourceNotFoundException, ResourceCannotCreateException {
        UserEntity user = getCurrentUserEntity();
        Integer userId = user.getId();

        if (currentBasketRepository.existsByPkUserIdAndPkMediaId(userId, mediaId)) {
            throw new ResourceCannotCreateException(getMessages().getAndFormat("reksoft.demo.Basket.alreadyExist.message", userId, mediaId));
        } else if (!mediaRepository.existsById(mediaId)) {
            throw new ResourceNotFoundException(getMessages().getAndFormat("reksoft.demo.Media.notExistById.message", mediaId));
        } else {
            CurrentBasketEntity newItem = new CurrentBasketEntity();
            newItem.setMedia(mediaRepository.getOne(mediaId));
            newItem.setUser(user);

            user.getBasket().add(newItem);
            getUserRepository().save(user);
        }
    }

    /**
     * Update media quantity by media id in user basket by user auth.
     *
     * @param mediaId  - media id
     * @param quantity - quantity
     * @throws AuthorizationRequiredException - if authorization is missing
     * @throws ResourceNotFoundException      - if media not found in basket
     */
    @Transactional
    public void update(@NotNull Integer mediaId, @NotNull Integer quantity) throws AuthorizationRequiredException, ResourceNotFoundException {
        UserEntity user = getCurrentUserEntity();
        Integer userId = user.getId();

        if (!currentBasketRepository.existsByPkUserIdAndPkMediaId(userId, mediaId)) {
            throw new ResourceNotFoundException(getMessages().getAndFormat("reksoft.demo.Basket.notExist.message", userId, mediaId));
        } else {
            CurrentBasketEntity item = currentBasketRepository.findByPkUserIdAndPkMediaId(userId, mediaId);
            item.setCount(quantity);

            currentBasketRepository.save(item);
        }
    }

    /**
     * Remove media from the basket by media id in user basket by user auth.
     *
     * @param mediaId - media id
     * @throws AuthorizationRequiredException - if authorization is missing
     * @throws ResourceNotFoundException      - if media not found in basket
     */
    @Transactional
    public void remove(@NotNull Integer mediaId) throws AuthorizationRequiredException, ResourceNotFoundException {
        Integer userId = getCurrentUserId();
        if (!currentBasketRepository.existsByPkUserIdAndPkMediaId(userId, mediaId)) {
            throw new ResourceNotFoundException(getMessages().getAndFormat("reksoft.demo.Basket.notExist.message", userId, mediaId));
        }

        currentBasketRepository.deleteByPkUserIdAndPkMediaId(userId, mediaId);
    }
}
