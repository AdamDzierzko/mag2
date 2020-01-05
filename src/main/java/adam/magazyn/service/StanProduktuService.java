package adam.magazyn.service;

import adam.magazyn.entity.StanProduktu;
import adam.magazyn.repository.StanProduktuRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StanProduktuService {

    private final StanProduktuRepository stanProduktuRepository;

    public StanProduktuService(StanProduktuRepository stanProduktuRepository) {
        this.stanProduktuRepository = stanProduktuRepository;
    }

    public StanProduktu save(StanProduktu stanProduktu) {
        return stanProduktuRepository.save(stanProduktu);
    }

    public StanProduktu findOne(Long id) {
        return stanProduktuRepository.findOne(id);
    }

    public void delete(Long id) {
        stanProduktuRepository.delete(id);
    }

    public List<StanProduktu> findAll() {
        return stanProduktuRepository.findAll();
    }
}
