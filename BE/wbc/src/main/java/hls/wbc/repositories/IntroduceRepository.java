package hls.wbc.repositories;

import hls.wbc.entities.Introduce;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IntroduceRepository extends JpaRepository<Introduce, Integer> {
}
