package ru.reksoft.demo.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import ru.reksoft.demo.domain.*;
import ru.reksoft.demo.dto.*;
import ru.reksoft.demo.dto.shortcut.AlbumShortDTO;
import ru.reksoft.demo.mapper.generic.AbstractVersionedMapper;
import ru.reksoft.demo.mapper.manual.JavaTimeMapper;
import ru.reksoft.demo.mapper.manual.uri.PictureURIMapper;

import javax.persistence.OptimisticLockException;
import java.util.Collection;

@Mapper(uses = {JavaTimeMapper.class, PictureURIMapper.class, CompositionMapper.class}, componentModel = "spring")
public interface AlbumMapper extends AbstractVersionedMapper<AlbumEntity, AlbumDTO> {

    @Mappings({
            @Mapping(target = "label", source = "label.name"),
            @Mapping(target = "singer", source = "singer.name"),
            @Mapping(target = "pictureURI", source = "picture.id")
    })
    AlbumShortDTO toShortDTO(AlbumEntity entity);

    @Mappings({
            @Mapping(target = "mediaId", source = "id"),
            @Mapping(target = "mediaPrice", source = "price"),
            @Mapping(target = "type", source = "type.name")
    })
    AlbumDTO.PriceDTO toPriceDTO(MediaEntity entity);

    @Mappings({
            @Mapping(target = "picture.uri", source = "picture.id"),
            @Mapping(target = "priceList", source = "media")
    })
    AlbumDTO toDTO(AlbumEntity entity);

    @Mapping(target = "id", ignore = true)
    AlbumEntity toEntity(AlbumDTO dto);

    @Mapping(target = "name", ignore = true)
    LabelEntity toEntity(LabelDTO dto);

    @Mapping(target = "name", ignore = true)
    SingerEntity toEntity(SingerDTO dto);

    @Mappings({
            @Mapping(target = "size", ignore = true),
            @Mapping(target = "uploaded", ignore = true)
    })
    PictureEntity toEntity(PictureDTO dto);

    @Mappings({
            @Mapping(target = "code", ignore = true),
            @Mapping(target = "name", ignore = true)
    })
    GenreEntity toEntity(GenreDTO dto);


    default AlbumEntity merge(AlbumEntity acceptor, AlbumEntity donor) throws OptimisticLockException {
        AbstractVersionedMapper.super.merge(acceptor, donor);

        acceptor.setName(donor.getName());
        acceptor.setDescription(donor.getDescription());
        acceptor.setReleaseYear(donor.getReleaseYear());

        check(acceptor.getLabel(), donor.getLabel());
        acceptor.setLabel(donor.getLabel());

        check(acceptor.getSinger(), donor.getSinger());
        acceptor.setSinger(donor.getSinger());

        acceptor.setPicture(donor.getPicture());

        acceptor.setMedia(donor.getMedia());

        Collection<CompositionEntity> compositions = acceptor.getCompositions();
        if (!compositions.isEmpty()) {
            compositions.clear();
        }
        for (CompositionEntity composition : donor.getCompositions()) {
            composition.setAlbum(acceptor);
            compositions.add(composition);
        }

        acceptor.setGenres(donor.getGenres());

        return acceptor;
    }
}
