package adam.magazyn.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.validation.constraints.Size;

@Entity
//@Data
//@NoArgsConstructor
//@AllArgsConstructor
@Table(name = "users")
//    @ToString(exclude = {"budgets"})    // przerwanie aby się nie zapętlało przez sąsiednie tabele
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @NotBlank
    @Size(max = 50)
    @Column(length = 50, unique = true)
    private String name;

	public User(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public long getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public User() {}
    
  
    
}
