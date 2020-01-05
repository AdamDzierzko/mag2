package adam.magazyn.service;

import adam.magazyn.entity.TypCzesci;
import adam.magazyn.entity.TypProduktu;
import adam.magazyn.repository.TypCzesciRepository;
import adam.magazyn.repository.TypProduktuRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypCzesciService {

    private final TypCzesciRepository typCzesciRepository;

    public TypCzesciService(TypCzesciRepository typCzesciRepository) {
        this.typCzesciRepository = typCzesciRepository;
    }

    public TypCzesci save(TypCzesci typCzesci) {
        return typCzesciRepository.save(typCzesci);
    }

    public TypCzesci findOne(Long id) {
        return typCzesciRepository.findOne(id);
    }

    public void delete(Long id) {
        typCzesciRepository.delete(id);
    }

    public List<TypCzesci> findAll() {
        return typCzesciRepository.findAll();
    }

}
