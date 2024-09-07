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
@Table(name = "news")
public class News extends BaseEntity {

    @Column(name = "cate_id")
    int cateId;

    @Column(name = "subject", length = 512)
    String subject;

    @Column(name = "content", length = 1028)
    String content;

    @Column(name = "content_ex_01", length = 1028)
    String contentEx01;

    @Column(name = "content_ex_02", length = 1024)
    String contentEx02;

    @Column(name = "content_ex_03", length = 1024)
    String contentEx03;

    @Column(name = "content_ex_04", length = 1024)
    String contentEx04;

    @Column(name = "content_ex_05", length = 1024)
    String contentEx05;

    @Column(name = "content_ex_06", length = 1024)
    String contentEx06;

    @Column(name = "files_id", length = 250)
    String filesId;

    @Column(name = "files_disabled", length = 250)
    String filesDisabled;

    @Column(name = "is_show")
    boolean isShow;

    @Builder
    public News(int id, String guid, String remark, boolean isDeleted, Instant insAt, int insBy, Instant updAt, int updBy, int cateId, String subject, String content, String contentEx01, String contentEx02, String contentEx03, String contentEx04, String contentEx05, String contentEx06, String filesId, String filesDisabled, boolean isShow){
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
        this.filesId = filesId;
        this.filesDisabled = filesDisabled;
        this.isShow = isShow;
    }
}
