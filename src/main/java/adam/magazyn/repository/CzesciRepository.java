package adam.magazyn.repository;

import adam.magazyn.entity.Czesci;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface CzesciRepository extends JpaRepository<Czesci, Long> {
}
