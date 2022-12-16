package ra.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ra.model.entity.Employee;
import ra.model.serviceImp.EmployeeServiceImp;

import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    EmployeeServiceImp employeeServiceImp;
    @RequestMapping(value = {"/","getAll",""})
    public String showListEmployee(Model model){
        List<Employee> listEmployee = employeeServiceImp.findAll();
        model.addAttribute("listEmployee",listEmployee);
        return "employee/list";
    }
    @RequestMapping("/create")
    public String createFormEmployee(Model model){
        Employee employee = new Employee();
        model.addAttribute("employee",employee);
        return "employee/create";
    }
    @PostMapping("/create")
    public String createEmployee(@ModelAttribute("employee") Employee employee){
        employeeServiceImp.save(employee);
        return "redirect:/employee";
    }

    @RequestMapping("/delete")
    public String deleteEmployee(int id){
        employeeServiceImp.delete(id);
        return "redirect:/employee";
    }

    @RequestMapping("/edit")
    public String editForm(int id,Model model){
        Employee employee = employeeServiceImp.findById(id);
        model.addAttribute("employee",employee);
        return "employee/edit";
    }

    @PostMapping("/edit")
    public String editEmployee(@ModelAttribute("employee") Employee employee){
        Employee oldEmployee = employeeServiceImp.findById(employee.getId());
        String oldAvatar = oldEmployee.getAvatar();
        if(employee.getAvatar().isEmpty()){
            employee.setAvatar(oldAvatar);
        }
        employeeServiceImp.update(employee);
        return "redirect:/employee";
    }

    @PostMapping("/search")
    public String customSearch(String search,Model model){
        return "employee/list";
    }

}
