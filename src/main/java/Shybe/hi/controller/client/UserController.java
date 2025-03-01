package Shybe.hi.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import Shybe.hi.domain.User;
import Shybe.hi.service.UserService;

@Controller
public class UserController {

    private UserService userService;

    UserController(UserService userService) {
        this.userService = userService;
    }

    // Trang chủ
    @GetMapping("/")
    public String getHomePage() {
        return "client/homepage";
    }

    // Trang đăng ký, thêm đối tượng "user" vào model
    @GetMapping("/user/register")
    public String getRegister(@ModelAttribute("user") User user) {
        // Đảm bảo rằng "user" được truyền vào model
        return "client/register"; // Trả về trang đăng ký
    }

    // Trang loginlogin
    @GetMapping("/user/login")
    public String login(@ModelAttribute("user") User user) {
        return "client/login"; // Trả về trang đăng ký
    }

    // Xử lý khi form đăng ký được submit
    @PostMapping("/user/register")
    public String registerUser(@ModelAttribute("user") User user) {
        // Lưu người dùng vào database
        userService.save(user);
        // Redirect lại trang đăng ký sau khi xử lý để tránh việc submit lại form
        return "client/login"; // dang ki thanh con chuyen sang trang dang nhap
    }
}
