package adam.magazyn.controller;

import adam.magazyn.entity.TypCzesci;
import adam.magazyn.entity.TypProduktu;
import adam.magazyn.entity.User;
import adam.magazyn.service.TypCzesciService;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import javax.validation.Validator;

@Controller
@RequestMapping("/typCzesci")
@Log
public class TypCzesciController {

    private final TypCzesciService typCzesciService;

    public TypCzesciController(TypCzesciService typCzesciService) {
        this.typCzesciService = typCzesciService;
    }

    @Autowired
    Validator validator;

    @GetMapping("/add")
    public String addNew(Model model) {
        model.addAttribute("typCzesci", new TypCzesci());
        return "typCzesci/add";
    }

    @PostMapping("/add")
    public String addNew(@Valid TypCzesci typCzesci, BindingResult result) {

        if (result.hasErrors()) {
            return "/add";
        }

        typCzesciService.save(typCzesci);
        return "redirect:/typCzesci/all";
    }

    @GetMapping("/all")
    public String findAll(Model model) {
        model.addAttribute("typyCzesci", typCzesciService.findAll());
        return "typCzesci/all";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        typCzesciService.delete(id);
        return "redirect:/typCzesci/all";
    }
    
    @PostMapping("/edit")
    public void editPerform(Model model, @Valid TypCzesci typCzesci, @RequestParam long id, BindingResult result) {

 //       if (result.hasErrors()) {
 //           return "user/edit";
 //       }
    	model.addAttribute("typyCzesci", typCzesciService.findOne(id));
    	typCzesciService.save(typCzesci);
    }
    
/*
    @GetMapping("/edit/{id}")
    public String edit(Model model, @PathVariable Long id) {
        model.addAttribute("typyCzesci", typCzesciService.findOne(id));
        return "typCzesci/edit";
    }

    @PostMapping("/edit/*")
    public String editPerform(@Valid TypCzesci typCzesci, BindingResult result) {

        if (result.hasErrors()) {
            return "typCzesci/edit";
        }

        typCzesciService.save(typCzesci);
        return "redirect:/typCzesci/all";
    }
*/
}
