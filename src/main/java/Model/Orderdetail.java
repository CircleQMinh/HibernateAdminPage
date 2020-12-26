package Model;
// Generated Dec 23, 2020 3:48:16 PM by Hibernate Tools 4.3.1


import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Orderdetail generated by hbm2java
 */
@Entity
@Table(name="orderdetail"
    ,catalog="dbthuongmaidientu"
)
public class Orderdetail  implements java.io.Serializable {


     private OrderdetailId id;
     private Order order;
     private Product product;
     private Integer quantityOrdered;

    public Orderdetail() {
    }

	
    public Orderdetail(OrderdetailId id, Order order, Product product) {
        this.id = id;
        this.order = order;
        this.product = product;
    }
    public Orderdetail(OrderdetailId id, Order order, Product product, Integer quantityOrdered) {
       this.id = id;
       this.order = order;
       this.product = product;
       this.quantityOrdered = quantityOrdered;
    }
   
     @EmbeddedId

    
    @AttributeOverrides( {
        @AttributeOverride(name="orderId", column=@Column(name="OrderID", nullable=false) ), 
        @AttributeOverride(name="productId", column=@Column(name="ProductID", nullable=false) ) } )
    public OrderdetailId getId() {
        return this.id;
    }
    
    public void setId(OrderdetailId id) {
        this.id = id;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="OrderID", nullable=false, insertable=false, updatable=false)
    public Order getOrder() {
        return this.order;
    }
    
    public void setOrder(Order order) {
        this.order = order;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="ProductID", nullable=false, insertable=false, updatable=false)
    public Product getProduct() {
        return this.product;
    }
    
    public void setProduct(Product product) {
        this.product = product;
    }

    
    @Column(name="QuantityOrdered")
    public Integer getQuantityOrdered() {
        return this.quantityOrdered;
    }
    
    public void setQuantityOrdered(Integer quantityOrdered) {
        this.quantityOrdered = quantityOrdered;
    }

    @Override
    public String toString() {
        return "Orderdetail{" + "id=" + id + ", order=" + order + ", product=" + product + ", quantityOrdered=" + quantityOrdered + '}';
    }




}


