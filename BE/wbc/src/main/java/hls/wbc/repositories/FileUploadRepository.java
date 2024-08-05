package hls.wbc.repositories;

import hls.wbc.entities.FileUpload;
import hls.wbc.entities.Introduce;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FileUploadRepository extends JpaRepository<FileUpload, Integer> {
    boolean existsByHashContent(String hashContent);
}
