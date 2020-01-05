package adam.magazyn.service;

import adam.magazyn.entity.TypProduktu;
import adam.magazyn.repository.TypProduktuRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypProduktuService {

    private final TypProduktuRepository typProduktuRepository;

    public TypProduktuService(TypProduktuRepository typProduktuRepository) {
        this.typProduktuRepository = typProduktuRepository;
    }

    public TypProduktu save(TypProduktu typProduktu) {
        return typProduktuRepository.save(typProduktu);
    }

    public TypProduktu findOne(Long id) {
        return typProduktuRepository.findOne(id);
    }

    public void delete(Long id) {
        typProduktuRepository.delete(id);
    }

    public List<TypProduktu> findAll() {
        return typProduktuRepository.findAll();
    }
}
