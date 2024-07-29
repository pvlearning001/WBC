package hls.wbc.controllers;

import hls.wbc.dto.responses.ApiResponse;
import hls.wbc.dto.responses.IntroduceResponse;
import hls.wbc.dto.responses.PermissionResponse;
import hls.wbc.services.IntroduceService;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
@RestController
@RequestMapping("/introduce")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class IntroduceController {
    IntroduceService introduceService;
    @GetMapping
    ApiResponse<IntroduceResponse> getIntroduce(){
        return ApiResponse.<IntroduceResponse>builder()
                .result(introduceService.getIntroduce())
                .build();
    }
}
