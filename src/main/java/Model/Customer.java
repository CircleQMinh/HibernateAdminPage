package Model;
// Generated Dec 14, 2020 1:23:06 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Customer generated by hbm2java
 */
@Entity
@Table(name="customer"
    ,catalog="dbthuongmaidientu"
)
public class Customer  implements java.io.Serializable {


     private Integer customerId;
     private String customerName;
     private String address;
     private String phone;
     private String email;
     private String sex;
     private Set<Order> orders = new HashSet<Order>(0);

    public Customer() {
    }

	
    public Customer(String customerName) {
        this.customerName = customerName;
    }
    public Customer(String customerName, String address, String phone, String email, String sex, Set<Order> orders) {
       this.customerName = customerName;
       this.address = address;
       this.phone = phone;
       this.email = email;
       this.sex = sex;
       this.orders = orders;
    }
    
    public Customer(String customerName, String address, String phone, String email, String sex) {
       this.customerName = customerName;
       this.address = address;
       this.phone = phone;
       this.email = email;
       this.sex = sex;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="CustomerID", unique=true, nullable=false)
    public Integer getCustomerId() {
        return this.customerId;
    }
    
    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    
    @Column(name="CustomerName", nullable=false, length=45)
    public String getCustomerName() {
        return this.customerName;
    }
    
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    
    @Column(name="Address", length=45)
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }

    
    @Column(name="Phone", length=45)
    public String getPhone() {
        return this.phone;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }

    
    @Column(name="Email", length=45)
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    
    @Column(name="Sex", length=45)
    public String getSex() {
        return this.sex;
    }
    
    public void setSex(String sex) {
        this.sex = sex;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="customer")
    public Set<Order> getOrders() {
        return this.orders;
    }
    
    public void setOrders(Set<Order> orders) {
        this.orders = orders;
    }




}


