package hls.wbc.repositories;
import hls.wbc.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    boolean existsByUserName(String UserName);
    Optional<User> findByUserName(String UserName);
}
