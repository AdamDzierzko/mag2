package adam.magazyn;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;

@Configuration
@SpringBootApplication
public class MagazynApplication {

    public static void main(String[] args) {

        SpringApplication.run(MagazynApplication.class, args);
    }

}
