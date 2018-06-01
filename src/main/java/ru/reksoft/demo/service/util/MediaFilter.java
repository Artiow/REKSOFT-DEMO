package ru.reksoft.demo.service.util;

import org.springframework.data.jpa.domain.Specification;
import ru.reksoft.demo.domain.*;
import ru.reksoft.demo.dto.MediaFilterDTO;

import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.Collection;

public class MediaFilter extends PageDivider implements Specification<MediaEntity> {

    private enum MediaSearchType {
        BY_SINGER("bySinger"),
        BY_LABEL("byLabel"),
        BY_ALBUM("byAlbum");

        private String code;

        MediaSearchType(String code) {
            this.code = code;
        }

        @Override
        public String toString() {
            return code;
        }

        public static MediaSearchType getEnum(String code) {
            for(MediaSearchType v : values()) if(v.code.equalsIgnoreCase(code)) return v;
            throw new IllegalArgumentException();
        }
    }

    private MediaSearchType searchType;
    private String searchString;

    private Collection<String> typeCodes;
    private Collection<String> genreCodes;


    public MediaFilter() {
        super();
    }

    public MediaFilter(MediaFilterDTO dto) {
        super(dto);

        configureSearchByString(dto);
        configureSearchByGenres(dto);
        configureSearchByType(dto);
    }

    private void configureSearchByString(MediaFilterDTO dto) {
        String searchType = dto.getSearchType();
        if (searchType != null) {
            if(searchType.equals("")) {
                throw new IllegalArgumentException("Search type must not be empty!");
            }

            String searchString = dto.getSearchString();
            if (searchString == null) {
                throw new IllegalArgumentException("Search string must not be null!");
            }
            if (searchString.equals("")) {
                throw new IllegalArgumentException("Search string must not be empty!");
            }

            this.searchType = MediaSearchType.getEnum(searchType);
            this.searchString = searchString;
        }
    }

    private void configureSearchByGenres(MediaFilterDTO dto) {
        Collection<String> genreCodes = dto.getGenreCodes();
        if ((genreCodes != null) && (!genreCodes.isEmpty())) {
            this.genreCodes = new ArrayList<>(genreCodes);
        }
    }

    private void configureSearchByType(MediaFilterDTO dto) {
        Collection<String> typeCodes = dto.getTypeCodes();
        if ((typeCodes != null) && (!typeCodes.isEmpty())) {
            this.typeCodes = new ArrayList<>(typeCodes);
        }
    }


    @Override
    public Predicate toPredicate(Root<MediaEntity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
        Collection<Predicate> predicates = new ArrayList<>();

        if (searchType != null) {
            switch (searchType) {
                case BY_SINGER:
                    predicates.add(cb.and(root.join(MediaEntity_.album).join(AlbumEntity_.singer).get(SingerEntity_.name).in(searchString)));
                    break;
                case BY_LABEL:
                    predicates.add(cb.and(root.join(MediaEntity_.album).join(AlbumEntity_.label).get(LabelEntity_.name).in(searchString)));
                    break;
                case BY_ALBUM:
                    predicates.add(cb.and(root.join(MediaEntity_.album).get(AlbumEntity_.name).in(searchString)));
                    break;
            }
        }

        if (genreCodes != null) {
            predicates.add(cb.and(root.join(MediaEntity_.album).join(AlbumEntity_.genres).get(GenreEntity_.code).in(genreCodes)));
        }

        if (typeCodes != null) {
            predicates.add(cb.and(root.join(MediaEntity_.type).get(MediaTypeEntity_.code).in(typeCodes)));
        }

        return cb.and(predicates.toArray(new Predicate[0]));
    }
}