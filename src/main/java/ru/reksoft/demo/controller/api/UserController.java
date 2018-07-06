package ru.reksoft.demo.controller.api;

import io.jsonwebtoken.JwtException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import ru.reksoft.demo.service.UserService;

@RestController
@RequestMapping("${api-path.user}")
public class UserController {

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }


    @GetMapping
    public String login(@RequestParam String login, @RequestParam String password) throws UsernameNotFoundException, JwtException {
        return userService.login(login, password);
    }
}
