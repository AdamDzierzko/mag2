package adam.magazyn.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "Produkt")
public class Produkt {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotBlank
    @Size(max = 200)
    @Column(unique = true, nullable = false, length = 200)
    private String nazwa;

    @Digits(integer = 30, fraction = 0)
    @Column(unique = true, nullable = false, length = 200)
    private Long numerSeryjny;

    private LocalDateTime data;

    @ManyToOne
    private StanProduktu stanProduktu;

    @ManyToOne
    private User user;

    @ManyToOne
    private TypProduktu typProduktu;
}
