package ru.reksoft.demo.domain;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "singer", schema = "demo", catalog = "reksoft")
public class SingerEntity {

    private Integer id;
    private String name;

    private Collection<AlbumEntity> albums;

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name", nullable = false)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SingerEntity that = (SingerEntity) o;

        return id.equals(that.id);
    }

    @Override
    public int hashCode() {
        return id.hashCode();
    }


    @OneToMany(mappedBy = "singer")
    public Collection<AlbumEntity> getAlbums() {
        return albums;
    }

    public void setAlbums(Collection<AlbumEntity> albums) {
        this.albums = albums;
    }
}