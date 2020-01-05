package adam.magazyn.controller;

import adam.magazyn.entity.TypProduktu;
import adam.magazyn.service.TypProduktuService;
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
@RequestMapping("/typProduktu")
@Log
public class TypProduktuController {

    private final TypProduktuService typProduktuService;

    @Autowired
    Validator validator;

    public TypProduktuController(TypProduktuService typProduktuService) {
        this.typProduktuService = typProduktuService;
    }

    @GetMapping("/add")
    public String addNew(Model model) {
        model.addAttribute("typProduktu", new TypProduktu());
        return "typProduktu/add";
    }

    @PostMapping("/add")
    public String addNew(@Valid TypProduktu typProduktu, BindingResult result) {

        if (result.hasErrors()) {
            return "typProduktu/add";
        }

        typProduktuService.save(typProduktu);
        return "redirect:/typProduktu/all";
    }

    @GetMapping("/all")
    public String findAll(Model model) {
        model.addAttribute("typyProduktu", typProduktuService.findAll());
        return "typProduktu/all";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        typProduktuService.delete(id);
        return "redirect:/typProduktu/all";
    }

    @GetMapping("/edit/{id}")
    public String edit(Model model, @PathVariable Long id) {
        model.addAttribute("typyProduktu", typProduktuService.findOne(id));
        return "typProduktu/edit";
    }

    @PostMapping("/edit/*")
    public String editPerform(@Valid TypProduktu typProduktu, BindingResult result) {
        if (result.hasErrors()) {
            return "typProduktu/edit";
        }
        typProduktuService.save(typProduktu);
        return "redirect:/typProduktu/all";

    }

}
