package hls.wbc.dto.responses;

import jakarta.persistence.Column;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.Instant;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class FileUploadResponse extends BaseResponse {
    String name;
    String path;
    String extName;
    String uniqueName;
    String contentType;
    String hashContent;
    String descriptions;

    @Builder
    public FileUploadResponse(int id, String guid, String remark, boolean isDeleted, Instant insAt, int insBy, Instant updAt, int updBy, String name, String path, String extName, String uniqueName, String contentType, String hashContent, String descriptions){
        super(id, guid, remark, isDeleted, insAt, insBy, updAt, updBy);
        this.name = name;
        this.path = path;
        this.extName = extName;
        this.uniqueName = uniqueName;
        this.contentType = contentType;
        this.hashContent = hashContent;
        this.descriptions = descriptions;
    }
}
