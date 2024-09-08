package hls.wbc.controllers;

import com.nimbusds.jose.JOSEException;
import hls.wbc.RepositoriesCustom.SPResult;
import hls.wbc.dto.requests.*;
import hls.wbc.dto.responses.*;
import hls.wbc.services.AuthenticationService;
import hls.wbc.services.FileUploadService;
import hls.wbc.services.NewsService;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.experimental.NonFinal;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
@RestController
@CrossOrigin
@RequestMapping("/news")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class NewsController {

    NewsService service;
    FileUploadService fileUploadService;

    @PostMapping("/admin/create")
    ApiResponse<NewsResponse> create(@ModelAttribute @Valid NewsRequest request) throws ParseException, IOException, NoSuchAlgorithmException, JOSEException {
        log.info("Controller: create News");
        return ApiResponse.<NewsResponse>builder()
                .result(service.createEntity(request))
                .build();
    }

    @PostMapping("/admin/update")
    ApiResponse<NewsResponse> update(@ModelAttribute @Valid NewsRequest request) throws ParseException, IOException, NoSuchAlgorithmException, JOSEException {
        log.info("Controller: update News");
        return ApiResponse.<NewsResponse>builder()
                .result(service.updateEntity(request))
                .build();
    }

    @PutMapping("/admin/setdeleted")
    ApiResponse<Integer> setDeleted(@RequestBody  @Valid NewsDeleteRequest request) throws ParseException, IOException, NoSuchAlgorithmException, JOSEException {
        log.info("Controller: update News");
        Integer saveResult = service.setDeleted(request.getId(), request.isDeletedValue());
        return ApiResponse.<Integer>builder()
                .result(saveResult)
                .build();
    }

    @PutMapping("/admin/setshow")
    ApiResponse<Integer> setShow(@RequestBody  @Valid NewsShowRequest request) throws ParseException, IOException, NoSuchAlgorithmException, JOSEException {
        Integer saveResult = service.setShow(request.getId(), request.getCateId());
        return ApiResponse.<Integer>builder()
                .result(saveResult)
                .build();
    }

    @PostMapping("/admin/list")
    ApiResponse<PagingResponse> getList(@RequestBody  @Valid NewsListRequest request){
        PagingResponse res = service.getList(request);
        return ApiResponse.<PagingResponse>builder()
                .result(res)
                .build();
    }

    @GetMapping("/latest")
    ApiResponse<NewsResponse> getLatest() {
        return ApiResponse.<NewsResponse>builder()
                .result(service.getShowLatest(1))
                .build();
    }

    @PostMapping("/getbyid")
    ApiResponse<NewsResponse> getById(@RequestBody  @Valid GetByIdRequest request) {
        return ApiResponse.<NewsResponse>builder()
                .result(service.getById(request.getId()))
                .build();
    }

    @PostMapping("/file")
    ApiResponse<FileAttachmentResponse> getFile(@RequestBody @Valid FileAttachmentRequest request) throws IOException  {
        FileAttachmentResponse fileResponse = fileUploadService.getBinaryArray(request.getId());
        return ApiResponse.<FileAttachmentResponse>builder()
                .result(fileResponse)
                .build();
    }
}
