package ra.model.entity;

import javax.persistence.*;

@Entity
@Table(name = "Employee")
public class Employee {
    @Id
    @Column(name = "EmployeeId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "EmployeeName")
    private String name;
    @Column(name = "EmployeeEmail")
    private String email;
    @Column(name = "EmployeeAvatar")
    private String avatar;
    @ManyToOne(fetch = FetchType.LAZY)

    @JoinColumn(name = "CompanyId",insertable = false,updatable = false)
//    @JoinTable(name = "employee_company", joinColumns = {@JoinColumn(name = "companyId")}, inverseJoinColumns = {@JoinColumn(name = "id")})
    private Company company;
    public Employee() {
    }

    public Employee(String name, String email) {
        this.name = name;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
