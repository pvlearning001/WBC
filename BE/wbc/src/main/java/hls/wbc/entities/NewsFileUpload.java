package hls.wbc.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.Instant;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Builder
@Table(name = "news_file_upload")
public class NewsFileUpload extends BaseEntity {
    @Column(name = "news_id")
    int newsId;

    @Column(name = "file_upload_id")
    int fileUploadId;

    @Builder
    public NewsFileUpload(int id, String guid, String remark, boolean isDeleted, Instant insAt, int insBy, Instant updAt, int updBy, int newsId, int fileUploadId){
        super(id, guid, remark, isDeleted, insAt, insBy, updAt, updBy);
        this.newsId = newsId;
        this.fileUploadId = fileUploadId;
    }
}
