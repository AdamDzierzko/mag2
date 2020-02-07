package adam.magazyn.repository;

import adam.magazyn.entity.Czesci;
import adam.magazyn.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@Repository
@Transactional
public interface CzesciRepository extends JpaRepository<Czesci, Long> {

    @Modifying
    @Query("update Czesci c set c.ilosc = c.ilosc +:zmiana where c.id=:i")
    void zmianaIlosci(@Param("zmiana") int zmiana, @Param("i") Long i); 

    @Modifying
    @Query("update Czesci c set c.data = :d where c.id=:i")
    void zmianaDaty(@Param("d") LocalDateTime d, @Param("i") Long i);

    @Modifying
    @Query("update Czesci c set c.user = :u where c.id=:i")
    void zmianaUser(@Param("u") User user, @Param("i") Long i); 
}
