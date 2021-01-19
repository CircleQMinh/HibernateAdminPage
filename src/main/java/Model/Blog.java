package Model;
// Generated Dec 23, 2020 3:48:16 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Blog generated by hbm2java
 */
@Entity
@Table(name="blog"
    ,catalog="dut78p24cwsag570"
)
public class Blog  implements java.io.Serializable {


     private Integer blogId;
     private String blogName;
     private String blogContent;
     private String synopsis;

    public Blog() {
    }

    public Blog(String blogName, String blogContent, String synopsis) {
       this.blogName = blogName;
       this.blogContent = blogContent;
       this.synopsis = synopsis;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="BlogID", unique=true, nullable=false)
    public Integer getBlogId() {
        return this.blogId;
    }
    
    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }

    
    @Column(name="BlogName", length=200)
    public String getBlogName() {
        return this.blogName;
    }
    
    public void setBlogName(String blogName) {
        this.blogName = blogName;
    }

    
    @Column(name="BlogContent", length=10000)
    public String getBlogContent() {
        return this.blogContent;
    }
    
    public void setBlogContent(String blogContent) {
        this.blogContent = blogContent;
    }

    
    @Column(name="Synopsis", length=500)
    public String getSynopsis() {
        return this.synopsis;
    }
    
    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis;
    }




}


