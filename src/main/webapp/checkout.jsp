<%-- 
    Document   : checkout
    Created on : Dec 25, 2020, 8:21:05 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/checkout.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Check out</title>
</head>
<body>
    <c:if test="${(sessionScope.account==null)}">
        <c:redirect url="login-employee"></c:redirect>
    </c:if>
    <div class="container">
        <div class="header">
            <h2>Nhập thông tin khách hàng : </h2>
        </div>
        <form id="form" class="form" method="get" action="SaveOrder">
            <div class="form-control">
                <label for="username">Họ và tên người nhận: </label>
                <input type="text" placeholder="Nguyễn Văn A" name="CustomerNameShip" id="CustomerNameShip" />
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error message</small>
            </div>
            <div class="form-control">
                <label for="username">Email : </label>
                <input type="email" placeholder="Dongthan@gmail.com" name="EmailShip" id="EmailShip"/>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error message</small>
            </div>
            <div class="form-control">
                <label for="username">Số điện thoại nhận hàng:</label>
                <input type="text" placeholder="0399469372" name="PhoneShip" id="PhoneShip"/>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error message</small>
            </div>
            <div class="form-control">
                <label for="username">Ngày nhận hàng:</label>
                <input type="date" placeholder="Trường ĐH SPKT TPHCM" name="DateShip" id="DateShip"/>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error message</small>
            </div>
            <div class="form-control">
                <label for="username">Địa chỉ nhận hàng:</label>
                <input type="text" placeholder="Trường ĐH SPKT TPHCM" name="AddressShip" id="AddressShip"/>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error message</small>
            </div>
            
            <div>
                <input type="submit" class="btn" id="check_out_btn" onclick="alert('sdssdsdd'); " value="Send"  >
            </div>
        </form>
    </div>
</body>
</html>
<script>
    const CustomerName = document.getElementById('CustomerNameShip');
    const email = document.getElementById('EmailShip');
    const PhoneShip = document.getElementById('PhoneShip');
    const AddressShip = document.getElementById('AddressShip');
    const DateShip = document.getElementById('DateShip');
    function checkInputs() {
        // trim to remove the whitespaces
        const CustomerNameValue = CustomerName.value.trim();
        const PhoneShipValue = PhoneShip.value.trim();
        const AddressShipValue = AddressShip.value.trim();
        const emailValue = email.value.trim();
        const DateValue = DateShip.value.trim();
        var temp=0;
        if(CustomerNameValue === '') {
                    setErrorFor(CustomerName, 'Tên không được để trống');
                    temp=temp+1;
            } else {
                    setSuccessFor(CustomerName);
        }
        if(AddressShipValue === '') {
                    setErrorFor(AddressShip, 'Địa chỉ nhận hàng không được để trống');
                    temp=temp+1;
            } else {
                    setSuccessFor(AddressShip);
        }
        if(PhoneShipValue === '') {
                    setErrorFor(PhoneShip, 'SĐT nhận hàng không được để trống');
                    temp=temp+1;
            } else {
                    setSuccessFor(PhoneShip);
        }
        if(DateValue === '') {
                    setErrorFor(DateShip, 'Ngày nhận hàng không được để trống');
                    temp=temp+1;
            } else {
                    setSuccessFor(DateShip);
        }
    
	if(emailValue === '') {
		setErrorFor(email, 'Email không được để trống');
                temp=temp+1;
	} else if (!isEmail(emailValue)) {
		setErrorFor(email, 'Không đúng định dạng email');
                temp=temp+1;
	} else {
		setSuccessFor(email);
	}
        
        if(temp===0){
            document.getElementById('check_out_btn').disabled = false;
        }
        else {
            document.getElementById('check_out_btn').disabled = true;
        }
	
    }
    function setErrorFor(input, message) {
            const formControl = input.parentElement;
            const small = formControl.querySelector('small');
            formControl.className = 'form-control error';
            small.innerText = message;
    }
    function setSuccessFor(input) {
            const formControl = input.parentElement;
            formControl.className = 'form-control success';
    }
    function isEmail(email) {
            return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
    }
    checkInputs();
    $(function(){
        $('#CustomerNameShip').keyup(function(){
            checkInputs();
        });
        $('#EmailShip').keyup(function(){
            checkInputs();
        });
        $('#PhoneShip').keyup(function(){
            checkInputs();
        });
        $('#AddressShip').keyup(function(){
            checkInputs();
        });
        $('#DateShip').click(function(){
            checkInputs();
        });
    });
    
</script> 