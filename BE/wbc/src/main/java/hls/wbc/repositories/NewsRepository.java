package hls.wbc.repositories;

import hls.wbc.entities.News;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface NewsRepository  extends JpaRepository<News, Integer> {

}
