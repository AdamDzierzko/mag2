package adam.magazyn.controller;

import adam.magazyn.entity.Produkt;
import adam.magazyn.entity.TypProduktu;
import adam.magazyn.service.ProduktService;
import adam.magazyn.service.StanProduktuService;
import adam.magazyn.service.TypProduktuService;
import adam.magazyn.service.UserService;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import javax.validation.Validator;
import java.time.LocalDateTime;

@Controller
@RequestMapping("/produkt")
@Log
public class ProduktController {

    private final ProduktService produktService;
    private final StanProduktuService stanProduktuService;
    private final UserService userService;
    private final TypProduktuService typProduktuService;

    public ProduktController(ProduktService produktService, StanProduktuService stanProduktuService, UserService userService, TypProduktuService typProduktuService) {
        this.produktService = produktService;
        this.stanProduktuService = stanProduktuService;
        this.userService = userService;
        this.typProduktuService = typProduktuService;
    }

    @Autowired
    Validator validator;

    @GetMapping("/add")
    public String addNew(Model model) {
        model.addAttribute("produkt", new Produkt());
        model.addAttribute("stanyProduktu", stanProduktuService.findAll());
        model.addAttribute("users", userService.findAll());
        model.addAttribute("typyProduktu", typProduktuService.findAll());
        return "produkt/add";
    }

    @PostMapping("/add")
    public String performNew(Model model, @Valid Produkt produkt, BindingResult result) {

        if (result.hasErrors()) {
            model.addAttribute("stanyProduktu", stanProduktuService.findAll());
            model.addAttribute("users", userService.findAll());
            model.addAttribute("typyProduktu", typProduktuService.findAll());
            return "produkt/add";
        }

        produkt.setData(LocalDateTime.now());
        produktService.save(produkt);
        return "redirect:/produkt/all";
    }

    @GetMapping("/all")
    public String list(Model model) {
        model.addAttribute("products", produktService.findAll());
        return "produkt/all";
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable Long id) {
        produktService.delete(id);
        return "redirect:/produkt/all";
    }

    @GetMapping("/edit/{id}")
    public String edit(Model model, @PathVariable Long id) {
        model.addAttribute("product", produktService.findOne(id));
        model.addAttribute("stanyProduktu", stanProduktuService.findAll());
        model.addAttribute("users", userService.findAll());
        model.addAttribute("typyProduktu", typProduktuService.findAll());
        return "produkt/edit";
    }

    @PostMapping("/edit/*")
    public String editPreform(Model model, @Valid Produkt produkt, BindingResult result) {

        if (result.hasErrors()) {
            model.addAttribute("stanyProduktu", stanProduktuService.findAll());
            model.addAttribute("users", userService.findAll());
            model.addAttribute("typyProduktu", typProduktuService.findAll());
            return "produkt/edit";
        }

        produkt.setData(LocalDateTime.now());
        produktService.save(produkt);
        return "redirect:/produkt/all";
    }
}
