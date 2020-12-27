/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    $('#myorder-refresh').click(function(){
        $('#myordertable').load("shipper.jsp #tablemyorder",function(){
            $('#tablemyorder').tablePagination({
                perPage:15,
                showAllButton:true
            });
        });
    });
    $('#new-order-refresh').click(function(){
        $('#ordertable').load("shipper.jsp #tableorder",function(){
            $('#tableorder').tablePagination({
                perPage:15,
                showAllButton:true
            });
        });
    });
    clickme('myorder-refresh');
    clickme('new-order-refresh');
});    