package adam.magazyn.service;

import adam.magazyn.entity.Produkt;
import adam.magazyn.repository.ProduktRepository;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ProduktService {

    private final ProduktRepository produktRepository;

    public ProduktService(ProduktRepository produktRepository) {
        this.produktRepository = produktRepository;
    }

    public Produkt save(Produkt produkt) {
        return produktRepository.save(produkt);
    }

    public Produkt findOne(Long id) {
        return produktRepository.findOne(id);
    }

    public void delete(Long id) {
        produktRepository.delete(id);
    }

    public List<Produkt> findAll() {
        return produktRepository.findAll();
    }
}
