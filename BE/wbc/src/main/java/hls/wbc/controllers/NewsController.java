package hls.wbc.controllers;

import com.nimbusds.jose.JOSEException;
import hls.wbc.dto.requests.FileAttachmentRequest;
import hls.wbc.dto.requests.NewsRequest;
import hls.wbc.dto.requests.UserCreationRequest;
import hls.wbc.dto.responses.ApiResponse;
import hls.wbc.dto.responses.FileAttachmentResponse;
import hls.wbc.dto.responses.NewsResponse;
import hls.wbc.dto.responses.UserResponse;
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

    @PostMapping("/create")
    ApiResponse<NewsResponse> create(@ModelAttribute @Valid NewsRequest request) throws ParseException, IOException, NoSuchAlgorithmException, JOSEException {
        log.info("Controller: create News");
        return ApiResponse.<NewsResponse>builder()
                .result(service.createEntity(request))
                .build();
    }

    @PostMapping("/update")
    ApiResponse<NewsResponse> update(@ModelAttribute @Valid NewsRequest request) throws ParseException, IOException, NoSuchAlgorithmException, JOSEException {
        log.info("Controller: update News");
        return ApiResponse.<NewsResponse>builder()
                .result(service.updateEntity(request))
                .build();
    }

    @GetMapping("/latest")
    ApiResponse<NewsResponse> getLatest() {
        return ApiResponse.<NewsResponse>builder()
                .result(service.getShowLatest(1))
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
