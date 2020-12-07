/* global CanvasJS */

function AAA()
{
    alert("AAAAAAAAAA");
}
function LoadPage(pagename){
    openPage(pagename);
}
function SetRedirect(pagename,id){
    var page = document.getElementById('pagere');
    var idre = document.getElementById('idre');
    page.value=pagename;
    idre.value=id;
    document.getElementById("re").submit();
}
function openPage(pageName) {

var i, tabcontent;
tabcontent = document.getElementsByClassName("divcontent");
for (i = 0; i < tabcontent.length; i++) {
  tabcontent[i].style.display = "none";
}
document.getElementById(pageName).style.display = "block";
}
function startTime() {
  var today = new Date();
  var h = today.getHours();
  var m = today.getMinutes();
  var s = today.getSeconds();
  var d = new Date();
  m = checkTime(m);
  s = checkTime(s);
  document.getElementById('time').innerHTML =d.toDateString()+" "+
  h + ":" + m + ":" + s;
  
  var elms = document.querySelectorAll("[id='time']");
  for(var i = 0; i < elms.length; i++) 
  {
       elms[i].innerHTML =d.toDateString()+" "+
         h + ":" + m + ":" + s;
  }
  var t = setTimeout(startTime, 500);
}
function checkTime(i) {
  if (i < 10) {i = "0" + i;}  // add zero in front of numbers < 10
  return i;
}

function miniTable(name,namebtn)
{
    var content=document.getElementById(name);
    var btn=document.getElementById(namebtn);
        if (window.getComputedStyle(content, null).getPropertyValue("display") === 'none') {
            content.style.display = "block";btn.innerHTML="-";
        } 
        else {
            content.style.display = "none";
            btn.innerHTML="+";
         }
}
function miniChart(name,namebtn)
{
    var content=document.getElementById(name);
    var btn=document.getElementById(namebtn);
        if (window.getComputedStyle(content, null).getPropertyValue("display") === 'none') {
            content.style.display = "block";btn.innerHTML="-";
        } 
    content.style.width="500px";
}





function openForm(fname) {
    document.getElementById(fname).style.display = "block";
}

function closeForm(fname) {
    document.getElementById(fname).style.display = "none";
}
function clickme(name){
    document.getElementById(name).click();
}
function FilterTable(name,inputid,btn,sel) {
    var input, filter, table, tr, td, i, txtValue,value;
    input = document.getElementById(inputid);
    filter = input.value.toUpperCase();
    if(filter===""){
        clickme(btn);
    }
    else
    {
        table = document.getElementById(name);
        tr = table.getElementsByTagName("tr");
        value = parseInt(document.getElementById(sel).value);
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[value];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } 
                else {
                     tr[i].style.display = "none";
                }
            }       
        }
    }    
}
function setMindate(name)
{
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
     if(dd<10){
            dd='0'+dd;
        } 
        if(mm<10){
            mm='0'+mm;
        } 
    today = yyyy+'-'+mm+'-'+dd;
    document.getElementById(name).setAttribute("min", today);
}
function setMaxdate(name)
{
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();
     if(dd<10){
            dd='0'+dd;
        } 
        if(mm<10){
            mm='0'+mm;
        } 
    today = yyyy+'-'+mm+'-'+dd;
    document.getElementById(name).setAttribute("max", today);
}
function FillForm1()
{
    document.getElementById("name-emp").value=" ";
    document.getElementById("mail-emp").value=" ";
    document.getElementById("phone-emp").value=" ";
    document.getElementById("add-emp").value=" ";
    document.getElementById("salary-emp").value=" ";
  
}
function FillForm2(name,sex,email,phone,add,pay,sal,eid)
{
    document.getElementById("name-emp-edit").value=name;
    document.getElementById("mail-emp-edit").value=email;
    document.getElementById("phone-emp-edit").value=phone;
    document.getElementById("add-emp-edit").value=add;
    document.getElementById("salary-emp-edit").value=sal;
    document.getElementById("paycheck-emp-edit").value=pay;
    document.getElementById("eid-emp-edit").value=eid;
    if(sex==="Nữ"){
        document.getElementById("sex-emp-edit").options.selectedIndex =1;
    }   
}
function FillForm3(pay,wd,last,eid)
{
    document.getElementById("paycheckempatt-edit").value=pay;
    document.getElementById("eidempatt-edit").value=eid;
    document.getElementById("lastempatt-edit").value=last;
    document.getElementById("workdayempatt-edit").value=wd;
 
}

function FillForm4(a,b,c)
{
    document.getElementById("username_edit_emp").value=a;
    document.getElementById("userpass_edit_emp").value=b;
    document.getElementById("acc_eid_edit").value=c;
}
function FillForm5(a)
{
    document.getElementById("acc_eid_create").value=a;
}

function FillForm6()
{
    document.getElementById("name-cus").value=" ";
    document.getElementById("mail-cus").value=" ";
    document.getElementById("phone-cus").value=" ";
    document.getElementById("add-cus").value=" ";
}
function TinhLuong(sal,wd){
    var a=parseInt(sal);
    var b=parseInt(wd);
    var n=b/30*a;
    return n.toFixed(2);
}

function creatchart1() {    
    var chart = new CanvasJS.Chart("chartContainer1", {
//        width:320,
        title:{
        text: "Top Sell"              
        },
        data: [//array of dataSeries              
                { //dataSeries object

                     /*** Change type "column" to "bar", "area", "line" or "pie"***/
                    type: "column",
                    dataPoints: [
                        { label: "Tháng 7", y: 18000 },
                        { label: "Tháng 8", y: 29000 },
                        { label: "Tháng 9", y: 40000 },                                    
                        { label: "Tháng 10", y: 34000 },
                        { label: "Tháng 11", y: 24000 }
                    ]
                }
        ],
        options: {
                maintainAspectRatio:false,
                responsive: false
        }
        }
        );
    chart.render();
//    alert("AAAAAAAAAAAAAAAAAAA");
}

function creatchart2() {
     var chart = new CanvasJS.Chart("chartContainer2", {

         title:{
         text: "Top Sell"              
         },
         data: [//array of dataSeries              
                     { //dataSeries object

                     /*** Change type "column" to "bar", "area", "line" or "pie"***/
                     type: "column",
                     dataPoints: [
                         { label: "Tháng 7", y: 18000 },
                         { label: "Tháng 8", y: 29000 },
                         { label: "Tháng 9", y: 40000 },                                    
                         { label: "Tháng 10", y: 34000 },
                         { label: "Tháng 11", y: 24000 }
                                 ]
                 }
         ],
         options: {
             responsive: false
         }
         }
         );
         chart.render();
}
