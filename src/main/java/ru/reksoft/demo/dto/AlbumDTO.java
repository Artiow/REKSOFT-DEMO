package ru.reksoft.demo.dto;

import ru.reksoft.demo.dto.generic.AbstractIdentifiedDTO;

import javax.validation.Valid;
import javax.validation.constraints.*;
import java.time.LocalDate;
import java.util.*;

public class AlbumDTO extends AbstractIdentifiedDTO {

    @NotNull(groups = IdCheck.class)
    @Min(value = 1, groups = IdCheck.class)
    private Integer id;

    @NotNull(groups = CreateCheck.class)
    @Size(min = 1, max = 45, groups = UpdateCheck.class)
    private String name;

    @Size(min = 1, max = 255, groups = UpdateCheck.class)
    private String description;

    @NotNull(groups = CreateCheck.class)
    private LocalDate releaseYear;

    @Valid
    @NotNull(groups = CreateCheck.class)
    private LabelDTO label;

    @Valid
    @NotNull(groups = CreateCheck.class)
    private SingerDTO singer;

    @Valid
    private PictureDTO picture;

    @Valid
    @NotNull(groups = CreateCheck.class)
    @NotEmpty(groups = UpdateCheck.class)
    private List<GenreDTO> genres;

    @Valid
    @NotNull(groups = CreateCheck.class)
    @NotEmpty(groups = UpdateCheck.class)
    private List<CompositionDTO> compositions;


    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public AlbumDTO setId(Integer id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public AlbumDTO setName(String name) {
        this.name = name;
        return this;
    }

    public String getDescription() {
        return description;
    }

    public AlbumDTO setDescription(String description) {
        this.description = description;
        return this;
    }

    public LocalDate getReleaseYear() {
        return releaseYear;
    }

    public AlbumDTO setReleaseYear(LocalDate releaseYear) {
        this.releaseYear = releaseYear;
        return this;
    }

    public LabelDTO getLabel() {
        return label;
    }

    public AlbumDTO setLabel(LabelDTO label) {
        this.label = label;
        return this;
    }

    public SingerDTO getSinger() {
        return singer;
    }

    public AlbumDTO setSinger(SingerDTO singer) {
        this.singer = singer;
        return this;
    }

    public PictureDTO getPicture() {
        return picture;
    }

    public AlbumDTO setPicture(PictureDTO picture) {
        this.picture = picture;
        return this;
    }

    public List<GenreDTO> getGenres() {
        return genres;
    }

    public AlbumDTO setGenres(List<GenreDTO> genres) {
        this.genres = genres;
        return this;
    }

    public List<CompositionDTO> getCompositions() {
        return compositions;
    }

    public AlbumDTO setCompositions(List<CompositionDTO> compositions) {
        this.compositions = compositions;
        return this;
    }


    public interface IdCheck {

    }

    public interface CreateCheck extends UpdateCheck {

    }

    public interface UpdateCheck extends
            LabelDTO.IdCheck, SingerDTO.IdCheck, PictureDTO.IdCheck, CompositionDTO.CreateCheck, GenreDTO.IdCheck
    {

    }
}
