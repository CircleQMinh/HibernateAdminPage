package Model;
// Generated Dec 11, 2020 10:38:08 AM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Admin generated by hbm2java
 */
@Entity
@Table(name="admin"
    ,catalog="dbthuongmaidientu"
)
public class Admin  implements java.io.Serializable {


     private int id;
     private String name;
     private String phone;
     private String email;
     private String sex;

    public Admin() {
    }

	
    public Admin(int id) {
        this.id = id;
    }
    public Admin(int id, String name, String phone, String email, String sex) {
       this.id = id;
       this.name = name;
       this.phone = phone;
       this.email = email;
       this.sex = sex;
    }
   
     @Id 

    
    @Column(name="ID", unique=true, nullable=false)
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    
    @Column(name="Name", length=45)
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
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




}


