package hls.wbc.testing.controllers;

import hls.wbc.testing.functions.function01;
import hls.wbc.testing.models.class01;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/test01")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class testController01 {
    @GetMapping("/api01")
    public class01 api01(){
        function01 f01 = new function01();
        return f01.getObject01();
    }

    @GetMapping("/api02")
    public List<class01> api02(){
        function01 f01 = new function01();
        return f01.getObject01List();
    }
}
