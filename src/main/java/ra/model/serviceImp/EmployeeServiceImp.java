package ra.model.serviceImp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ra.model.entity.Employee;
import ra.model.repository.EmployeeRepository;
import ra.model.service.EmployeeService;
import java.util.List;
@Service
public class EmployeeServiceImp implements EmployeeService {

    @Autowired
    EmployeeRepository employeeRepository;
    @Override
    public List<Employee> findAll() {
        return employeeRepository.findAll();
    }

    @Override
    public Employee findById(int id) {
        return employeeRepository.findById(id).get();
    }

    @Override

    public void save(Employee employee) {
        employeeRepository.save(employee);

    }

    @Override

    public void update(Employee employee) {
        employeeRepository.save(employee);
    }

    @Override

    public void delete(int id) {
           employeeRepository.deleteById(id);
    }

}
