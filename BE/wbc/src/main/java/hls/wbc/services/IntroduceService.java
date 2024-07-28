package hls.wbc.services;

import hls.wbc.dto.responses.IntroduceResponse;
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
        return introduceMapper.toIntroduceResponse(introduceRepository.findAll()
                .stream()
                .toList().get(1));
    }
}
