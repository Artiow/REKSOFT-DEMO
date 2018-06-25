package ru.reksoft.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.reksoft.demo.domain.SingerEntity;
import ru.reksoft.demo.domain.SingerEntity_;
import ru.reksoft.demo.dto.SingerDTO;
import ru.reksoft.demo.dto.pagination.filters.StringSearcherDTO;
import ru.reksoft.demo.dto.pagination.PageDTO;
import ru.reksoft.demo.mapper.SingerMapper;
import ru.reksoft.demo.repository.SingerRepository;
import ru.reksoft.demo.service.generic.AbstractService;

import javax.validation.constraints.NotNull;

@Service
public class SingerService extends AbstractService<SingerDTO> {

    private SingerRepository singerRepository;

    private SingerMapper singerMapper;
    
    @Autowired
    public void setSingerRepository(SingerRepository singerRepository) {
        this.singerRepository = singerRepository;
    }
    
    @Autowired
    public void setSingerMapper(SingerMapper singerMapper) {
        this.singerMapper = singerMapper;
    }


    /**
     * Returns page with searched singers.
     *
     * @param searcherDTO - searcher for singer
     * @return singer page
     */
    @Transactional(readOnly = true)
    public PageDTO<SingerDTO> getList(@NotNull StringSearcherDTO searcherDTO) {
        SingerSearcher searcher = new SingerSearcher(searcherDTO);
        return new PageDTO<>(singerRepository.findAll(searcher, searcher.getPageRequest()).map(singerMapper::toDTO));
    }

    /**
     * Returns singer.
     *
     * @param id - singer id
     * @return found singer
     */
    @Override
    @Transactional(readOnly = true)
    public SingerDTO get(@NotNull Integer id) {
        return singerMapper.toDTO(singerRepository.getOne(id));
    }

    /**
     * Save singer.
     *
     * @param singerDTO - singer
     * @return saved entity id
     */
    @Override
    @Transactional
    public Integer create(@NotNull SingerDTO singerDTO) {
        return singerRepository.save(singerMapper.toEntity(singerDTO)).getId();
    }

    /**
     * Update singer.
     *
     * @param id - singer id
     * @param singerDTO - new singer data
     */
    @Override
    @Transactional
    public void update(@NotNull Integer id, @NotNull SingerDTO singerDTO) {
        //todo: update!
    }

    /**
     * Delete label.
     *
     * @param id - label id
     */
    @Override
    @Transactional
    public void delete(@NotNull Integer id) {
        //todo: delete!
    }


    public static class SingerSearcher extends StringSearcher<SingerEntity> {

        public SingerSearcher(StringSearcherDTO dto) {
            super(dto, SingerEntity_.name);
        }
    }
}
