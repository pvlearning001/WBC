package hls.wbc.testing.functions;

import hls.wbc.testing.models.class01;
import lombok.Builder;

import java.util.ArrayList;
import java.util.List;
public class function01 {
    public class01 getObject01(){
        class01 it01 = class01.builder()
                .id(1)
                .itemName("Item01")
                .build();
        return it01;
    }

    public List<class01> getObject01List(){
        List<class01> result = new ArrayList<class01>();
        class01 it01 = class01.builder()
                .id(1)
                .itemName("Item01")
                .build();
        class01 it02 = class01.builder()
                .id(2)
                .itemName("Item02")
                .build();
        class01 it03 = class01.builder()
                .id(3)
                .itemName("Item03")
                .build();
        result.add(it01);
        result.add(it02);
        result.add(it03);
        return result;
    }
}
