package adam.magazyn.controller;

import adam.magazyn.entity.Czesci;
import adam.magazyn.entity.TypCzesci;
import adam.magazyn.entity.User;
import adam.magazyn.service.CzesciService;
import adam.magazyn.service.TypCzesciService;
import adam.magazyn.service.UserService;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.Validator;
import java.time.LocalDateTime;
import java.util.Date;

@Controller
@RequestMapping("/czesci")
@Log
public class CzesciController {

    private final CzesciService czesciService;
    private final UserService userService;
    private final TypCzesciService typCzesciService;

    public CzesciController(CzesciService czesciService, UserService userService, TypCzesciService typCzesciService) {
        this.czesciService = czesciService;
        this.userService = userService;
        this.typCzesciService = typCzesciService;
    }

    @Autowired
    Validator validator;
    
    @PostMapping("/gettime")
    @ResponseBody
//    public String getServerTime (@RequestParam long id) {
        public String getServerTime () {
    	System.out.println("-----------getServerTime-----------");
    	Date d = new Date();
    	return d.toString();
    }

    @GetMapping("/add")
    public String addNew(Model model) {
        model.addAttribute("czesc", new Czesci());
        model.addAttribute("users", userService.findAll());
        model.addAttribute("typCzesci", typCzesciService.findAll());
        return "czesci/add";
    }

    @PostMapping("/add")
    public String addNew(Model model, @Valid Czesci czesci, BindingResult result) {

        if (result.hasErrors()) {
            model.addAttribute("users", userService.findAll());
            model.addAttribute("typCzesci", typCzesciService.findAll());
            return "czesci/add";
        }

        czesci.setData(LocalDateTime.now());
        czesciService.save(czesci);
        return "redirect:/czesci/all";
    }

    @GetMapping("/all")
    public String findAll(Model model) {
        model.addAttribute("czesci", czesciService.findAll());
        return "czesci/all";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        czesciService.delete(id);
        return "redirect:/czesci/all";
    }
/*
    @GetMapping("/edit/{id}")
    public String edit(Model model, @PathVariable Long id) {
        model.addAttribute("czesci", czesciService.findOne(id));
        model.addAttribute("users", userService.findAll());
        model.addAttribute("typCzesci", typCzesciService.findAll());
        return "czesci/edit";
    }

    @PostMapping("/edit/*")
    public String editPerform(Model model, @Valid Czesci czesci, BindingResult result) {

        if (result.hasErrors()) {
            model.addAttribute("users", userService.findAll());
            model.addAttribute("typCzesci", typCzesciService.findAll());
            return "czesci/edit";
        }

        czesci.setData(LocalDateTime.now());
        czesciService.save(czesci);
        return "redirect:/czesci/all";
    }
*/
    
    // nowe edit 4
    
    @PostMapping("/edit")
    public void editPerform(Model model, @Valid Czesci czesci, 
    		@RequestParam long id,
//    		@RequestParam String nazwa, 
//    		@RequestParam int ilosc, @RequestParam User user,
//    		@RequestParam TypCzesci typCzesci,
    		BindingResult result) {
    	 	
    	System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    	
    	model.addAttribute("czesci", czesciService.findOne(id));
    	czesci.setData(LocalDateTime.now());
    	czesciService.save(czesci);
    	
    }
    
    @GetMapping("/zmiana/{id}")
    public String zmiana(Model model, @PathVariable Long id) {
        model.addAttribute("czesci", czesciService.findOne(id));
        model.addAttribute("users", userService.findAll());
        model.addAttribute("typCzesci", typCzesciService.findAll());

        return "czesci/zmiana";
    }

    @PostMapping("/zmiana/*")
    public String zmianaPreform(Model model, @RequestParam String z, @RequestParam String i,
                                @Valid Czesci czesci, BindingResult result) {
        model.addAttribute("czesc", new Czesci());
        System.out.println(z);
        System.out.println(i);

        int a = Integer.parseInt(z);
        Long b = Long.parseLong(i);

        LocalDateTime d = LocalDateTime.now();

        czesciService.save(czesci);
        czesciService.zmianaIlości(a, b);
        czesciService.zmianaDaty(d, b);

        return "redirect:/czesci/all";
    } 

}
