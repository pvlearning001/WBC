package hls.wbc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class WbcApplication {

	public static void main(String[] args) {
		SpringApplication.run(WbcApplication.class, args);
	}

	@GetMapping("/")
	public String index() {
		return "Hello";
	}
	@GetMapping("/welcome")
	public String hello() {
		return "Greetings from Spring Boot!";
	}

}
