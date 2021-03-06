package ru.reksoft.demo.dto.pagination;

import org.springframework.data.domain.Page;
import ru.reksoft.demo.dto.generic.DataTransferObject;

import java.util.ArrayList;
import java.util.List;

public class PageDTO<T> implements DataTransferObject {

    private List<T> content;
    private Integer pageNumber;
    private Integer numberOfElements;
    private Integer totalElements;
    private Integer totalPages;


    public PageDTO(Page<T> page) {
        this.content = new ArrayList<>(page.getContent());
        this.pageNumber = page.getNumber();
        this.numberOfElements = page.getNumberOfElements();
        this.totalElements = (int) page.getTotalElements();
        this.totalPages = page.getTotalPages();
    }


    public List<T> getContent() {
        return content;
    }

    public Integer getPageNumber() {
        return pageNumber;
    }

    public Integer getNumberOfElements() {
        return numberOfElements;
    }

    public Integer getTotalElements() {
        return totalElements;
    }

    public Integer getTotalPages() {
        return totalPages;
    }
}
