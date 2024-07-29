package hls.wbc.services;

import hls.wbc.dto.responses.IntroduceResponse;
import hls.wbc.entities.Introduce;
import hls.wbc.exceptions.AppException;
import hls.wbc.exceptions.ErrorCode;
import hls.wbc.mappers.IntroduceMapper;
import hls.wbc.repositories.IntroduceRepository;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class IntroduceService {
    IntroduceRepository introduceRepository;
    IntroduceMapper introduceMapper;
    public IntroduceResponse getIntroduce(){
        Introduce introduce = introduceRepository.findById(1)
                .orElseThrow(() -> new AppException(ErrorCode.NO_INTRODUCE));
        IntroduceResponse result = introduceMapper.toIntroduceResponse(introduce);
        return result;
        /*
        return introduceMapper.toIntroduceResponse(
                introduceRepository.findById(1)
                .orElseThrow(() -> new AppException(ErrorCode.NO_INTRODUCE))
        );
         */
    }
}
