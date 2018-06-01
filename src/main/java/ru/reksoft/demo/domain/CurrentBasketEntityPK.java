package ru.reksoft.demo.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Id;
import java.io.Serializable;

@Embeddable
public class CurrentBasketEntityPK implements Serializable {

    private Integer userId;
    private Integer mediaId;


    @Id
    @Column(name = "user_id", nullable = false)
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Id
    @Column(name = "media_id", nullable = false)
    public Integer getMediaId() {
        return mediaId;
    }

    public void setMediaId(Integer mediaId) {
        this.mediaId = mediaId;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CurrentBasketEntityPK that = (CurrentBasketEntityPK) o;

        if (!userId.equals(that.userId)) return false;
        return mediaId.equals(that.mediaId);
    }

    @Override
    public int hashCode() {
        int result = userId.hashCode();
        result = 31 * result + mediaId.hashCode();
        return result;
    }
}
