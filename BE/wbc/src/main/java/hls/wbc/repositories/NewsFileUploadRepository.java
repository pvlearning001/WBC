package hls.wbc.repositories;

import hls.wbc.entities.NewsFileUpload;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface NewsFileUploadRepository extends JpaRepository<NewsFileUpload, Integer> {
    List<NewsFileUpload> findAllByNewsId(int newId);
}
