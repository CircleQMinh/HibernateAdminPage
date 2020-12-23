package Model;
// Generated Dec 23, 2020 3:48:16 PM by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Order generated by hbm2java
 */
@Entity
@Table(name="order"
    ,catalog="dbthuongmaidientu"
)
public class Order  implements java.io.Serializable {


     private Integer orderId;
     private Customer customer;
     private Date orderDate;
     private Date requiredDate;
     private Date shippedDate;
     private Integer status;
     private String orderName;
     private String orderAdress;
     private String orderPhone;
     private String orderEmail;
     private Set<Orderdetail> orderdetails = new HashSet<Orderdetail>(0);

    public Order() {
    }
    public Order(Customer customer, Date orderDate, Date requiredDate, Date shippedDate, Integer status, Set<Orderdetail> orderdetails) {
       this.customer = customer;
       this.orderDate = orderDate;
       this.requiredDate = requiredDate;
       this.shippedDate = shippedDate;
       this.status = status;
       this.orderdetails = orderdetails;
    }
    public Order(Customer customer, Date orderDate, Date requiredDate, Date shippedDate, Integer status, String orderName, String orderAdress, String orderPhone, String orderEmail, Set<Orderdetail> orderdetails) {
       this.customer = customer;
       this.orderDate = orderDate;
       this.requiredDate = requiredDate;
       this.shippedDate = shippedDate;
       this.status = status;
       this.orderName = orderName;
       this.orderAdress = orderAdress;
       this.orderPhone = orderPhone;
       this.orderEmail = orderEmail;
       this.orderdetails = orderdetails;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="OrderID", unique=true, nullable=false)
    public Integer getOrderId() {
        return this.orderId;
    }
    
    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="CustomerID")
    public Customer getCustomer() {
        return this.customer;
    }
    
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="OrderDate", length=19)
    public Date getOrderDate() {
        return this.orderDate;
    }
    
    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="RequiredDate", length=19)
    public Date getRequiredDate() {
        return this.requiredDate;
    }
    
    public void setRequiredDate(Date requiredDate) {
        this.requiredDate = requiredDate;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="ShippedDate", length=19)
    public Date getShippedDate() {
        return this.shippedDate;
    }
    
    public void setShippedDate(Date shippedDate) {
        this.shippedDate = shippedDate;
    }

    
    @Column(name="Status")
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }

    
    @Column(name="OrderName", length=45)
    public String getOrderName() {
        return this.orderName;
    }
    
    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }

    
    @Column(name="OrderAdress", length=200)
    public String getOrderAdress() {
        return this.orderAdress;
    }
    
    public void setOrderAdress(String orderAdress) {
        this.orderAdress = orderAdress;
    }

    
    @Column(name="OrderPhone", length=45)
    public String getOrderPhone() {
        return this.orderPhone;
    }
    
    public void setOrderPhone(String orderPhone) {
        this.orderPhone = orderPhone;
    }

    
    @Column(name="OrderEmail", length=200)
    public String getOrderEmail() {
        return this.orderEmail;
    }
    
    public void setOrderEmail(String orderEmail) {
        this.orderEmail = orderEmail;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="order")
    public Set<Orderdetail> getOrderdetails() {
        return this.orderdetails;
    }
    
    public void setOrderdetails(Set<Orderdetail> orderdetails) {
        this.orderdetails = orderdetails;
    }




}


