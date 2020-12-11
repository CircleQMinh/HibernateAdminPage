/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    startTime();
    setMaxdate('lastempatt-edit');
    setMindate('paycheckempatt-edit');
//                các nút chuyển trang
    $('#dashboard').click(function(){
         openForm('formwait');
         $("#home").load( "dashboard.jsp #ds", function() {
            startTime();
            closeForm('formwait'); 
        });
    });
//                jquery của employee
    $('#emppage').click(function(){
        openForm('formwait');
        $("#home").load( "employee.jsp #employee", function() {
            startTime();            
            $('#employeerefresh').click(function(){
                $("#employeetable").load( "employee.jsp #tableemp",function(){
                    $('#tableemp').tablePagination({
                        perPage: 7,
                        showAllButton:false
                    });
                    $("button[id|='emp_edit']").click(function() {
                        openForm("form2");
                        var emp_edit_eid=$(this).closest('tr').find('td').eq(0).text();
                        var emp_edit_name=$(this).closest('tr').find('td').eq(1).text();
                        var emp_edit_sex=$(this).closest('tr').find('td').eq(2).text();
                        var emp_edit_email=$(this).closest('tr').find('td').eq(3).text();
                        var emp_edit_phone=$(this).closest('tr').find('td').eq(4).text();
                        var emp_edit_add=$(this).closest('tr').find('td').eq(5).text();
                        var emp_edit_pay=$(this).closest('tr').find('td').eq(7).text();
                        var emp_edit_sal=$(this).closest('tr').find('td').eq(6).text();
                        FillForm2(emp_edit_name,emp_edit_sex,emp_edit_email,emp_edit_phone,emp_edit_add,
                                emp_edit_pay,emp_edit_sal,emp_edit_eid);
                    });
                    $("button[id|='emp_del']").click(function() {
                        if (confirm('Xóa nhân viên khỏi database?')) {
                            $(this).closest('tr').find('td').eq(0).each(function() {
                                var textval = $(this).text(); // this will be the text of each <td>
                                console.log(textval);
                                $.ajax({
                                    type: "post",
                                    url: "ajax/employee/ajax-delete-emp.jsp", //this is my servlet
                                    data: {
                                        EID:textval               
                                    },
                                    success: function ( response ){   
                                        //handleData(response);
                                        var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                                        console.log(success); // div#success
                                        alert(success);
                                        clickme("employeerefresh");clickme('att-refresh');
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
            $('#att-refresh').click(function(){
                $("#att-table").load( "employee.jsp #empatt1",function(){
                   $('#empatt1').tablePagination({
                        perPage: 7,
                        showAllButton:false
                    });
                    $("button[id|='editemp-att']").click(function() {
                        openForm("form3");
                        var emp_edit_eid=$(this).closest('tr').find('td').eq(0).text();
                        var emp_edit_pay=$(this).closest('tr').find('td').eq(3).text();
                        var emp_edit_wd=$(this).closest('tr').find('td').eq(4).text();
                        var emp_edit_last=$(this).closest('tr').find('td').eq(5).text();
                        FillForm3(
                                emp_edit_pay,emp_edit_wd,emp_edit_last,emp_edit_eid);
                    });
                    $("button[id|='check-att']").click(function() {
                        if (confirm('Chấm công nhân viên ?')) {                     
                            var eid=$(this).closest('tr').find('td').eq(0).text();
                            var ld=$(this).closest('tr').find('td').eq(5).text();
                            $.ajax({
                                type: "post",
                                url: "ajax/employee/ajax-chamcong-emp.jsp", //this is my servlet
                                data: {
                                    EID:eid,
                                    LD:ld
                                },
                                success: function ( response ){   
                                    //handleData(response);
                                    var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                                    alert(success); // div#success
                                    clickme("att-refresh");clickme("employeerefresh");
                                },
                                error: function(xhr, textStatus, error){
                                    console.log(xhr.statusText);
                                    console.log(textStatus);
                                    console.log(error);
                                    console.log("Fail");
                                }
                            });
                        }
                        else{

                        }
                    });
                    $("button[id|='payluong-att']").click(function() {
                        var eid=$(this).closest('tr').find('td').eq(0).text();
                        var sal=$(this).closest('tr').find('td').eq(2).text();
                        var wd=$(this).closest('tr').find('td').eq(4).text();
                        var msg=TinhLuong(sal,wd);
                        if (confirm('Trả lương cho nhân viên ? Lương phải trả là : '+msg)) {                                 
                            $.ajax({
                                type: "post",
                                url: "ajax/employee/ajax-traluong-emp.jsp", //this is my servlet
                                data: {
                                    EID:eid   
                                },
                                success: function ( response ){   
                                    //handleData(response);
                                    var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                                    alert(success); // div#success
                                    clickme("att-refresh");clickme("employeerefresh");
                                },
                                error: function(xhr, textStatus, error){
                                    console.log(xhr.statusText);
                                    console.log(textStatus);
                                    console.log(error);
                                    console.log("Fail");
                                }
                            });
                        }
                        else{

                        }
                    });
                });
            });
            clickme('employeerefresh');
            clickme('att-refresh');
            closeForm('formwait');
        });

    });
//                jquery của pro
    $('#propage').click(function(){
         openForm('formwait');
        $("#home").load( "product.jsp #product", function() {
            startTime();
            $('#productrefresh').click(function(){
                $("#producttable").load( "product.jsp #tablepro",function(){
                   $('#tablepro').tablePagination({
                        perPage: 7,
                        showAllButton:false
                    });
                });    
            }); 
             
             
            clickme('productrefresh');
            closeForm('formwait');
        });
    });
    $('#cuspage').click(function(){
         openForm('formwait');
         $("#home").load( "customer.jsp #customer", function() {
             startTime();
             closeForm('formwait');
        });
    });
    $('#accpage').click(function(){
         openForm('formwait');
         $("#home").load( "account.jsp #account", function() {
             startTime();
             closeForm('formwait');
        });
    });
    $('#salespage').click(function(){
         openForm('formwait');
         $("#home").load( "sales.jsp #sales", function() {
             startTime();
             closeForm('formwait');
        });
    });
    $('#orderpage').click(function(){
         openForm('formwait');
         $("#home").load( "order.jsp #order", function() {
            startTime();
            closeForm('formwait'); 
        });
    });
    $('#blogpage').click(function(){
         openForm('formwait');
         $("#home").load( "blog.jsp #blog", function() {
             startTime();
             closeForm('formwait');
        });
    });
    $('#stapage').click(function(){
         openForm('formwait');
         $("#home").load( "statistic.jsp #statistic", function() {
             startTime();
             closeForm('formwait');
        });
    });

//                nút của hidden form
//                    form 1 - them nv
    $('#save_emp').click(function(){
         $.ajax({
            type: "post",
            url: "ajax/employee/ajax-insert-emp.jsp", //this is my servlet
            data: {
                name: $('#name-emp').val(), 
                mail: $('#mail-emp').val(),
                phone: $('#phone-emp').val(), 
                address: $('#add-emp').val(), 
                sex: $('#sex-emp').val(), 
                salary: $('#salary-emp').val()
            },
            success: function ( response ){   
                //handleData(response);
                var success =  $($.parseHTML(response)).filter("#sqlmsg").html(); 
                console.log(success); // div#success
                alert(success);
                clickme("employeerefresh");clickme('att-refresh');
            },
            error: function(xhr, textStatus, error){
                console.log(xhr.statusText);
                console.log(textStatus);
                console.log(error);
            }
        });
    });
    //                    form 2 - edit nv
    $('#edit-emp').click(function (){
        $.ajax({
            type: "post",
            url: "ajax/employee/ajax-edit-emp.jsp", //this is my servlet
            data: {
                eid: $('#eid-emp-edit').val(),
                name: $('#name-emp-edit').val(), 
                mail: $('#mail-emp-edit').val(),
                phone: $('#phone-emp-edit').val(), 
                address: $('#add-emp-edit').val(), 
                sex: $('#sex-emp-edit').val(), 
                salary: $('#salary-emp-edit').val(),
                paycheck: $('#paycheck-emp-edit').val()
            },
            success: function ( response ){   
                //handleData(response);
                var success = $($.parseHTML(response)).filter("#sqlmsg").html();
                console.log(success); // div#success
                alert(success);
                clickme("employeerefresh");clickme('att-refresh');
            },
            error: function(xhr, textStatus, error){
                console.log(xhr.statusText);
                console.log(textStatus);
                console.log(error);
            }
        });
    });
//                form 3 - emp att
    $('#editattemp').click(function (){
        $.ajax({
            type: "post",
            url: "ajax/employee/ajax-editatt-emp.jsp", //this is my servlet
            data: {
                eid: $('#eidempatt-edit').val(),
                paycheck: $('#paycheckempatt-edit').val(),
                wd:$('#workdayempatt-edit').val(),
                last:$('#lastempatt-edit').val()
            },
            success: function ( response ){   
                //handleData(response);
                var success = $($.parseHTML(response)).filter("#sqlmsg").html();
                console.log(success); // div#success
                alert(success);
                clickme("att-refresh");clickme("employeerefresh");
            },
            error: function(xhr, textStatus, error){
                console.log(xhr.statusText);
                console.log(textStatus);
                console.log(error);
            }
        });
    });
    $('#save_pro').click(function(){
         $.ajax({
            type: "post",
            url: "ajax/product/ajax-insert-product.jsp", //this is my servlet
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
});

