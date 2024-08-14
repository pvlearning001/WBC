package hls.wbc.repositories;

import hls.wbc.entities.News;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface NewsRepository  extends JpaRepository<News, Integer> {
    @Query("select n from News n where n.isDeleted = false and n.id = (select max(id) from News)")
    public Optional<News> getMaxID();

}
