package ru.reksoft.demo.domain;

import ru.reksoft.demo.domain.generic.AbstractIdentifiedEntity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

@Entity
@Table(name = "order", schema = "demo")
public class OrderEntity extends AbstractIdentifiedEntity {

    @Basic
    @Column(name = "cost")
    private Integer cost;

    @Basic
    @Column(name = "address")
    private String address;

    @Basic
    @Column(name = "ordered")
    private Timestamp orderedTime;

    @OneToMany(mappedBy = "pk.order", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    private Collection<OrderedMediaEntity> medias;

    @ManyToOne
    @JoinColumn(name = "status_id", referencedColumnName = "id", nullable = false)
    private OrderStatusEntity status;


    public Integer getCost() {
        return cost;
    }

    public void setCost(Integer cost) {
        this.cost = cost;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Timestamp getOrderedTime() {
        return orderedTime;
    }

    public void setOrderedTime(Timestamp orderedTime) {
        this.orderedTime = orderedTime;
    }

    public Collection<OrderedMediaEntity> getMedias() {
        return medias;
    }

    public void setMedias(Collection<OrderedMediaEntity> media) {
        this.medias = media;
    }

    public OrderStatusEntity getStatus() {
        return status;
    }

    public void setStatus(OrderStatusEntity status) {
        this.status = status;
    }
}
