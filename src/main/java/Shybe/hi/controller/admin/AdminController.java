package Shybe.hi.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import Shybe.hi.domain.User;
import Shybe.hi.service.AdminService;
import Shybe.hi.service.UserService;

@Controller
public class AdminController {
    private AdminService adminService;
    private UserService userService;

    public AdminController(AdminService adminService, UserService userService) {
        this.adminService = adminService;
        this.userService = userService;
    }

    @GetMapping("/admin")
    public String adminDashborad() {
        return "/admin/dashboard";
    }

    @GetMapping("/admin/showuser")
    public String showUser(Model model) {
        // Lấy danh sách người dùng từ UserService
        List<User> users = userService.findAll();

        // Thêm danh sách người dùng vào model
        model.addAttribute("users", users);
        System.err.println(users);
        // Trả về view (tên trang JSP/HTML mà bạn muốn hiển thị)
        return "admin/alluser";
    }

}
