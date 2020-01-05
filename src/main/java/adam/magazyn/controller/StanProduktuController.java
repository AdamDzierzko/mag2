package adam.magazyn.controller;

import adam.magazyn.entity.StanProduktu;
import adam.magazyn.service.StanProduktuService;
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

@Controller
@RequestMapping("/stanProduktu")
@Log
public class StanProduktuController {

    private final StanProduktuService stanProduktuService;

    public StanProduktuController(StanProduktuService stanProduktuService) {
        this.stanProduktuService = stanProduktuService;
    }

    @Autowired
    Validator validator;

    @GetMapping("/add")
    public String addNew(Model model) {
        model.addAttribute("stanProduktu", new StanProduktu());
        return "stanProduktu/add";
    }

    @PostMapping("/add")
    public String preformNew(@Valid StanProduktu stanProduktu, BindingResult result) {
        if (result.hasErrors()) {
            return "stanProduktu/add";
        }
        stanProduktuService.save(stanProduktu);
        return "redirect:/stanProduktu/all";
    }

    @GetMapping("/all")
    public String findAll(Model model) {
        model.addAttribute("stanyProduktu", stanProduktuService.findAll());
        return "stanProduktu/all";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        stanProduktuService.delete(id);
        return "redirect:/stanProduktu/all";
    }

    @GetMapping("/edit/{id}")
    public String edit(Model model, @PathVariable Long id) {
        model.addAttribute("stanProduktu", stanProduktuService.findOne(id));
        return "stanProduktu/edit";
    }

    @PostMapping("/edit/*")
    public String edit(@Valid StanProduktu stanProduktu, BindingResult result) {

        if (result.hasErrors()) {
            return "stanProduktu/edit";
        }

        stanProduktuService.save(stanProduktu);
        return "redirect:/stanProduktu/all";
    }
}
