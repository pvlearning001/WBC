package hls.wbc.repositories;

import hls.wbc.entities.FileUpload;
import hls.wbc.entities.Introduce;
import hls.wbc.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface FileUploadRepository extends JpaRepository<FileUpload, Integer> {
    boolean existsByHashContent(String hashContent);
    Optional<FileUpload> findByHashContent(String hashContent);
}
