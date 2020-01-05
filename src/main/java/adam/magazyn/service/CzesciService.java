package adam.magazyn.service;

import adam.magazyn.entity.Czesci;
import adam.magazyn.entity.User;
import adam.magazyn.repository.CzesciRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
@Transactional
public class CzesciService {

    private final CzesciRepository czesciRepository;

    public CzesciService(CzesciRepository czesciRepository) {
        this.czesciRepository = czesciRepository;
    }

    public Czesci save(Czesci czesci) {
        return czesciRepository.save(czesci);
    }

    public Czesci findOne(Long id) {
        return czesciRepository.findOne(id);
    }

    public void delete(Long id) {
        czesciRepository.delete(id);
    }

    public List<Czesci> findAll() {
        return czesciRepository.findAll();
    }

    public void zmianaIlości(int zmiana, Long i) {
        czesciRepository.zmianaIlosci(zmiana, i);
    }

    public void zmianaDaty(LocalDateTime d, Long i) {
        czesciRepository.zmianaDaty(d, i);
    }

    public void zmianaUser(User user, Long id) {
        czesciRepository.zmianaUser(user, id);
    }


}
