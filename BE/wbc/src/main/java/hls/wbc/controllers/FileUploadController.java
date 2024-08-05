package hls.wbc.controllers;

import hls.wbc.dto.requests.FileUploadRequest;
import hls.wbc.dto.requests.UserCreationRequest;
import hls.wbc.dto.responses.ApiResponse;
import hls.wbc.dto.responses.FileUploadResponse;
import hls.wbc.dto.responses.UserResponse;
import hls.wbc.entities.User;
import hls.wbc.enums.Roles;
import hls.wbc.exceptions.AppException;
import hls.wbc.exceptions.ErrorCode;
import hls.wbc.services.FileUploadService;
import jakarta.validation.Valid;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("/upload")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@Slf4j
public class FileUploadController {
    FileUploadService fileUploadService;
    @PostMapping("/images")
    ApiResponse<List<FileUploadResponse>> uploadFile(@ModelAttribute @Valid FileUploadRequest request) throws IOException, NoSuchAlgorithmException {
        return ApiResponse.<List<FileUploadResponse>>builder()
                .result(fileUploadService.uploadFileImagesUser(request))
                .build();
    }
}
