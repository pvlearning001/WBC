package hls.wbc.dto.responses;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.Instant;
import java.util.List;
@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class NewsResponse extends BaseResponse {
    int cateId;
    String subject;
    String content;
    String contentEx01;
    String contentEx02;
    String contentEx03;
    String contentEx04;
    String contentEx05;
    String contentEx06;
    boolean isShow;
    List<FileUploadResponse> files;

    @Builder
    public NewsResponse(int id, String guid, String remark, boolean isDeleted, Instant insAt, int insBy, Instant updAt, int updBy, int cateId, String subject, String content, String contentEx01, String contentEx02, String contentEx03, String contentEx04, String contentEx05, String contentEx06, boolean isShow){
        super(id, guid, remark, isDeleted, insAt, insBy, updAt, updBy);
        this.cateId = cateId;
        this.subject = subject;
        this.content = content;
        this.contentEx01 = contentEx01;
        this.contentEx02 = contentEx02;
        this.contentEx03 = contentEx03;
        this.contentEx04 = contentEx04;
        this.contentEx05 = contentEx05;
        this.contentEx06 = contentEx06;
        this.isShow = isShow;
    }
}
