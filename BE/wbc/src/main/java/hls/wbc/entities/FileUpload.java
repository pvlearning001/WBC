package hls.wbc.entities;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.Instant;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "file_upload")
public class FileUpload extends BaseEntity{
    @Column(name = "name")
    String name;

    @Column(name = "path")
    String path;

    @Column(name = "ext_name")
    String extName;

    @Column(name = "unique_name")
    String uniqueName;

    @Column(name = "content_type")
    String contentType;

    @Column(name = "hash_content")
    String hashContent;

    @Column(name = "descriptions")
    String descriptions;

    @Builder
    public FileUpload(int id, String guid, String remark, boolean isDeleted, Instant insAt, int insBy, Instant updAt, int updBy, String name, String path, String fileType, String hashContent, String descriptions){
        super(id, guid, remark, isDeleted, insAt, insBy, updAt, updBy);
        this.name = name;
        this.path = path;
        this.contentType = fileType;
        this.hashContent = hashContent;
        this.descriptions = descriptions;
    }
}
