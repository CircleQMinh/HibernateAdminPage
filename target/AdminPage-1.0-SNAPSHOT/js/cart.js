/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function add_to_cart(pid,pname,price)
{
    let cart = sessionStorage.getItem("cart");
    if (cart === null)
    {
        let products =[];
        let product ={ prdId:pid, prdName:pname ,prdQuantity:1,prdPrice: price };
        products.push(product);
        sessionStorage.setItem("cart",JSON.stringify(products));
        console.log("add the firt time");
    }   
    else
    {
        let prdcart=JSON.parse(cart);
        
        let oldprd=prdcart.find((item)=>item.prdId == pid);
        if(oldprd)
        {
            //increase quantity
            oldprd.prdQuantity = oldprd.prdQuantity +1;
            prdcart.map((item)=>{
                
                if(item.prdId === oldprd.prdId)
                {
                    item.prdQuantity = oldprd.prdQuantity;
                }
                
            });
            
            sessionStorage.setItem("cart",JSON.stringify(prdcart));
            console.log("icrease quantity");
        }
        else
        {
            //add product
            let product ={ prdId:pid, prdName:pname ,prdQuantity:1,prdPrice: price };
            prdcart.push(product);
            sessionStorage.setItem("cart",JSON.stringify(prdcart));
            console.log("product is added");
        }
    }
    updateCart();
}

function updateCart()
{
    let cartString =sessionStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if(cart===null || cart.length===0)
    {
        console.log("cart empity");
        $(".cart-item").html("0");
    }
    else
    {
        console.log(cart);
        $(".cart-item").html(cart.length);
        /*let table ="<table><tr><th>Product</th><th>Quantity</th><th>SubTotal</th></tr>"
            ;
        cart.map((item)=>{
            table +="<tr><td><div class="+"cart-info"+"><img src="+"images/prd6.jpg"+" alt=""><div><p>"+${item.prdName}+"</p><small>Price: "+${item.prdPrice}+"</small><a href="">Remove</a></div></div></td><td><input type="+"number"+" value="+${item.prdQuantity}+"></td><td>"+${item.prdPrice * item.prdQuantity}+"</td></tr>"
        })
        table=table + ' </tabble> ';*/
    }
}
function ReDirect(){
    window.replace("/product-detail.jsp");
}

