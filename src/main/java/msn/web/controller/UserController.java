package msn.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.http.HttpStatus;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import msn.web.repository.UserRepository;
import msn.web.entity.User;
import msn.web.security.BCrypt;
import msn.web.service.ValidationService;

@RestController
public class UserController {

	@Autowired
	private UserRepository userRepository;

	@Autowired
  private ValidationService validationService;
  
  private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@GetMapping("/")

	public String index() {

		return "Welcome to Springboot";
	}
	
  @PostMapping(
    path = "/api/users",
    consumes = MediaType.APPLICATION_JSON_VALUE,
    produces = MediaType.APPLICATION_JSON_VALUE
  )

  public User newUser(@RequestBody User newUser) {
		String encodedPassword = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());

		newUser.setPassword(encodedPassword);
  
    return userRepository.save(newUser);
  }

	@GetMapping(
    path = "/api/users",
    produces = MediaType.APPLICATION_JSON_VALUE
  )
  public List<User> listUsers() {
      List<User> listUsers = userRepository.findAll();
      
      return listUsers;
  }

	@GetMapping(
    path = "/api/user/{id}",
    produces = MediaType.APPLICATION_JSON_VALUE
  )
  public User getUser(@PathVariable Long id) {
    return userRepository.findById(id)
      .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "User not found with id: " + id));
  }

  @PostMapping(
      path = "/api/user/login",
      consumes = MediaType.APPLICATION_JSON_VALUE,
      produces = MediaType.APPLICATION_JSON_VALUE
  )
  public User login(@RequestBody User request) { // Replace 'RequestClass' with the actual class type
      validationService.validate(request);

      User user = userRepository.findByUsername(request.getUsername())
              .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Username or password wrong"));

      if (BCrypt.checkpw(request.getPassword(), user.getPassword())) {
          logger.info("Login " + user);
          return user;
      } else {
          throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Username or password wrong");
      }
  }
}