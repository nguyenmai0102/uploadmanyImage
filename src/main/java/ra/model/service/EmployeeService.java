package ra.model.service;

import ra.model.entity.Employee;

import java.util.List;

public interface EmployeeService {
    List<Employee> findAll();
    Employee findById(int id);
    void save(Employee employee);
    void update(Employee employee);
    void delete(int id);


}
