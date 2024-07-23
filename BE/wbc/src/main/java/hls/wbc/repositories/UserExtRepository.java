package hls.wbc.repositories;

import hls.wbc.entities.User;
import hls.wbc.entities.UserExt;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
@Repository
public interface UserExtRepository extends JpaRepository<UserExt, Integer> {
}
