package ru.reksoft.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;
import ru.reksoft.demo.dto.MediaDTO;
import ru.reksoft.demo.dto.MediaShortDTO;
import ru.reksoft.demo.service.MediaService;
import ru.reksoft.demo.service.util.MediaFilter;

@RestController
@RequestMapping("api/media")
public class MediaController {

    private MediaService mediaService;

    @Autowired
    public void setMediaService(MediaService mediaService) {
        this.mediaService = mediaService;
    }


    /**
     * Return list of media with base information for current filter
     *
     * @return page with media
     */
    @GetMapping(value = "/list")
    public Page<MediaShortDTO> getMediaList() {
        return mediaService.getMediaList(new MediaFilter(0, 10));
    }

    @GetMapping(value = "/list{page}") //TODO: remove this!
    public Page<MediaShortDTO> getMediaList(@PathVariable int page) {
        return mediaService.getMediaList(new MediaFilter(page, 10));
    }

    /**
     * Return media by id with full information
     *
     * @return media
     */
    @GetMapping(value = "/{id}")
    public MediaDTO getMedia(@PathVariable int id) {
        return mediaService.getMedia(id);
    }

}
