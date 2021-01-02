/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var protable_count = 1;
$(document).ready(function(){
    startTime();
    $('#propage').click(function(){
         openForm('formwait');
        $("#home").load( "product.jsp #product", function() {
            startTime();
            $('#productrefresh').click(function(){
                $("#producttable").load( "product.jsp #tablepro",function(){
                    $('#tablepro').tablePagination({
                        perPage: 7,
                        initPage:protable_count,
                        showAllButton:false
                    });           
                    protable_count=1;
                    $("button[id|='pro_edit']").click(function() {
                        openForm('form7edit');   
                        getId_protable(this);
                        var url=$(this).closest('tr').find('img').attr("src");
                        var id=$(this).closest('tr').find('td').eq(0).text();
                        var name=$(this).closest('tr').find('td').eq(1).text();
                        var mota=$(this).closest('tr').find('td').eq(2).text();
                        var price=$(this).closest('tr').find('td').eq(3).text();
                        var qua=$(this).closest('tr').find('td').eq(4).text();
                        var cate=$(this).closest('tr').find('td').eq(5).text();
                        FillForm7edit(name,mota,price,qua,cate,url,id);
                    });
                    $("button[id|='pro_del']").click(function() {
                        if (confirm('Xóa sản phẩm khỏi database?')) {
                            openForm('formwait');
                            getId_protable(this);
                            $(this).closest('tr').find('td').eq(0).each(function() {
                                var textval = $(this).text(); // this will be the text of each <td>
                                console.log(textval);
                                $.ajax({
                                    type: "post",
                                    url: "ajax/product/ajax-delete-product.jsp", //this is my servlet
                                    data: {
                                        ID:textval               
                                    },
                                    success: function ( response ){   
                                        //handleData(response);
                                        var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                                        console.log(success); // div#success
                                        closeForm('formwait');
                                        alert(success);
                                        clickme("productrefresh");
                                    },
                                    error: function(xhr, textStatus, error){
                                        console.log(xhr.statusText);
                                        console.log(textStatus);
                                        console.log(error);
                                        console.log("Fail");
                                    }
                                });
                            }); 
                        } else {

                        }                   
                    });
                });                   
            }); 
            clickme('productrefresh');
            closeForm('formwait');
        });
    });
     $('#orderpage').click(function(){
         openForm('formwait');
         $("#home").load( "order.jsp #order", function() {
            startTime();
                $('#orderrefresh').click(function(){ 
                    $('#ordertable').load("order.jsp #tableorder",function(){
                        $('#tableorder').tablePagination({
                            perPage:10,
                            showAllButton:true
                        });
                        $("button[id|='ord_edit'").click(function(){
                            openForm("updateOrder");
                            var order_edit_id =$(this).closest('tr').find('td').eq(0).text();
                            var order_edit_status=$(this).closest('tr').find('td').eq(5).text();
                            FillFormUpdateOrder(order_edit_id,order_edit_status);
                        });                    
                        $("button[id|='ord_del']").click(function(){
                          if (confirm('Xóa hóa đơn khỏi database?')) {
                                $(this).closest('tr').find('td').eq(0).each(function() {
                                    var textval = $(this).closest('tr').find('td').eq(0).text(); // this will be the text of each <td>
                                    console.log(textval);openForm('formwait');
                                    $.ajax({
                                        type: "post",
                                        url: "ajax/order/ajax-delete-ord.jsp", //this is my servlet
                                        data: {
                                            EID:textval               
                                        },
                                        success: function ( response ){   
                                            //handleData(response);
                                            var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                                            console.log(success); // div#success
                                            alert(success);
                                            clickme("orderrefresh");closeForm('formwait');
                                        },
                                        error: function(xhr, textStatus, error){
                                            console.log(xhr.statusText);
                                            console.log(textStatus);
                                            console.log(error);
                                            console.log("Fail");closeForm('formwait');
                                        }
                                    });
                                }); 
                            } else {

                            }  
                        });
                    });
                });
                $('#orderrefreshCk').click(function(){ 
                    $('#ordertableCk').load("order.jsp #tableorderCk",function(){
                        $('#tableorderCk').tablePagination({
                            perPage:10,
                            showAllButton:true
                        });
                        $("button[id|='ord_edit_Ck'").click(function(){
                            openForm("updateOrder");
                            var order_edit_id =$(this).closest('tr').find('td').eq(0).text();
                            var order_edit_status=$(this).closest('tr').find('td').eq(5).text();
                            FillFormUpdateOrder(order_edit_id,order_edit_status);
                        });                    
                        $("button[id|='ord_del_Ck']").click(function(){
                          if (confirm('Xóa hóa đơn khỏi database?')) {
                                $(this).closest('tr').find('td').eq(0).each(function() {
                                    var textval = $(this).closest('tr').find('td').eq(0).text(); // this will be the text of each <td>
                                    console.log(textval);openForm('formwait');
                                    $.ajax({
                                        type: "post",
                                        url: "ajax/order/ajax-delete-ord.jsp", //this is my servlet
                                        data: {
                                            EID:textval               
                                        },
                                        success: function ( response ){   
                                            //handleData(response);
                                            var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                                            console.log(success); // div#success
                                            alert(success);
                                            clickme("orderrefreshCk");closeForm('formwait');
                                        },
                                        error: function(xhr, textStatus, error){
                                            console.log(xhr.statusText);
                                            console.log(textStatus);
                                            console.log(error);
                                            console.log("Fail");closeForm('formwait');
                                        }
                                    });
                                }); 
                            } else {

                            }  
                        });
                    });
                });
                $('#orderrefreshDv').click(function(){ 
                    $('#ordertableDv').load("order.jsp #tableorderDv",function(){
                        $('#tableorderDv').tablePagination({
                            perPage:10,
                            showAllButton:true
                        });                 
                        $("button[id|='ord_del_Dv']").click(function(){
                          if (confirm('Xóa hóa đơn khỏi database?')) {
                                $(this).closest('tr').find('td').eq(0).each(function() {
                                    var textval = $(this).closest('tr').find('td').eq(0).text(); // this will be the text of each <td>
                                    console.log(textval);openForm('formwait');
                                    $.ajax({
                                        type: "post",
                                        url: "ajax/order/ajax-delete-ord.jsp", //this is my servlet
                                        data: {
                                            EID:textval               
                                        },
                                        success: function ( response ){   
                                            //handleData(response);
                                            var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                                            console.log(success); // div#success
                                            alert(success);
                                            clickme("orderrefreshDv");closeForm('formwait');
                                        },
                                        error: function(xhr, textStatus, error){
                                            console.log(xhr.statusText);closeForm('formwait');
                                            console.log(textStatus);
                                            console.log(error);
                                            console.log("Fail");
                                        }
                                    });
                                }); 
                            } else {

                            }  
                        });
                    });
                });
                $('#orderrefreshHis').click(function(){ 
                    $('#ordertableHis').load("order.jsp #tableorderHis",function(){
                        $('#tableorderHis').tablePagination({
                            perPage:10,
                            showAllButton:true
                        });                 
                        $("button[id|='ord_del_His']").click(function(){
                          if (confirm('Xóa hóa đơn khỏi database?')) {
                                $(this).closest('tr').find('td').eq(0).each(function() {
                                    var textval = $(this).closest('tr').find('td').eq(0).text(); // this will be the text of each <td>
                                    console.log(textval);openForm('formwait');
                                    $.ajax({
                                        type: "post",
                                        url: "ajax/order/ajax-delete-ord.jsp", //this is my servlet
                                        data: {
                                            EID:textval               
                                        },
                                        success: function ( response ){   
                                            //handleData(response);
                                            var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                                            console.log(success); // div#success
                                            alert(success);
                                            clickme("orderrefreshHis");closeForm('formwait');
                                        },
                                        error: function(xhr, textStatus, error){
                                            console.log(xhr.statusText);closeForm('formwait');
                                            console.log(textStatus);
                                            console.log(error);
                                            console.log("Fail");
                                        }
                                    });
                                }); 
                            } else {

                            }  
                        });
                    });
                });
            clickme('orderrefresh');
            clickme('orderrefreshCk');
            clickme('orderrefreshDv');
            clickme('orderrefreshHis');
            closeForm('formwait');
        });
    });
    // jquery của blog
    $('#blogpage').click(function(){
         openForm('formwait');
         $("#home").load( "blog.jsp #blog", function() {
             startTime();
             closeForm('formwait');
        });
    });
    $('#editorder_status').click(function(){
        $.ajax({
            type: "post",
            url: "ajax/order/ajax-edit-ord.jsp", //this is my servlet
            data: {
                eid: $('#orderid-edit').val(),
                status: $('#order-status').val()
            },
            success: function ( response ){   
                //handleData(response);
                var success = $($.parseHTML(response)).filter("#sqlmsg").html();
                console.log(success); // div#success
                alert(success);
                clickme("orderrefresh");
            },
            error: function(xhr, textStatus, error){
                console.log(xhr.statusText);
                console.log(textStatus);
                console.log(error);
            }
        });
    });
    $('#save_pro').click(function(){
        openForm('formwait');
        $.ajax({
           type: "post",
           url: "ajax/product/ajax-insert-product-for-emp.jsp", //this is my servlet
           data: {
               name: $('#name-pro-add').val(), 
               des: $('#mota-pro-add').val(),
               price: $('#price-pro-add').val(), 
               qua: $('#qua-pro-add').val(), 
               category: $('#category-pro-add').val(), 
               url: $('#url-pro-add').val()
           },
           success: function ( response ){   
               //handleData(response);
               var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
               console.log(success); // div#success
               closeForm('formwait');
               alert(success);
               clickme("productrefresh");
           },
           error: function(xhr, textStatus, error){
               console.log(xhr.statusText);
               console.log(textStatus);
               console.log(error);
           }
       });
   });
    $('#edit_pro').click(function (){
       openForm('formwait');
        $.ajax({
            type: "post",
            url: "ajax/product/ajax-edit-product.jsp", //this is my servlet
            data: {
                name: $('#name-pro-edit').val(), 
                des: $('#mota-pro-edit').val(),
                price: $('#price-pro-edit').val(), 
                qua: $('#qua-pro-edit').val(), 
                category: $('#category-pro-edit').val(), 
                url: $('#url-pro-edit').val(),
                id: $('#id-pro-edit').val()
                
            },
            success: function ( response ){   
                //handleData(response);
                var success = $($.parseHTML(response)).filter("#sqlmsg").html();
                console.log(success); // div#success
                alert(success);
                closeForm('formwait');
                clickme("productrefresh");
            },
            error: function(xhr, textStatus, error){
                console.log(xhr.statusText);
                console.log(textStatus);
                console.log(error);
            }
        });
    });
    clickme('propage');
});

function  getId_protable(element) {
    protable_count =  Math.floor((element.parentNode.parentNode.rowIndex-0.5)/7)+1;
}
