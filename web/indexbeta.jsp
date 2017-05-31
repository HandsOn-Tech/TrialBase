<%-- 
    Document   : indexbeta
    Created on : 29 May, 2017, 8:52:55 AM
    Author     : linux
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.io.File"%>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compitible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/stylish-portfolio.css" rel="stylesheet">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        
        <%
            int PID = 0;
            String TagLine = null, Imagename = null;
            String City = "Ahmedabad";
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12176798", "sql12176798", "2lYkxDf2K6");

            //Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/Orbopedia", "root", "h4ck3d321");

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("Select * from places where PlaceName='" + City + "';");
            while (rs.next()) {
                PID = rs.getInt("PID");
            }
            
            ResultSet rs2 = stmt.executeQuery("Select * from placedata where PID=" + PID + ";");
            while (rs2.next()) {
                TagLine = rs2.getString("TagLine");
                Imagename = rs2.getString("CoverImage");
            }
            
            ResultSet rs3 = stmt.executeQuery("Select Location from metadata where Name='PlaceImages';");
            while (rs3.next()) {
                String location = rs3.getString("Location");
            }
            
            String Location = null;
            ResultSet rs4 = stmt.executeQuery("Select * from metadata where Name = 'PlaceAboutText';");
            while (rs4.next()) {
                Location = rs4.getString("Location");
            }
            rs.close();
            rs2.close();
            rs3.close();
            rs4.close();
            stmt.close();
            conn.close();

            /* String jsonString = "{ \"name\": \"Anand\", \"last\": \"Dwivedi\"}";
                JSONObject obj = new JSONObject(jsonString);
                String firstName = obj.getString("name");
                String lastName = obj.getString("last");
                System.out.println(firstName + " " + lastName);*/
        %>
        
        <title>Orbopedia - <%=City%></title>
        <style>
            input {
                    outline: none;
                }
                input[type=search] {
                    -webkit-appearance: textfield;
                    -webkit-box-sizing: content-box;
                    font-family: inherit;
                    font-size: 100%;
                }
                input::-webkit-search-decoration,
                    input::-webkit-search-cancel-button {
                    display: none; 
                }
                input[type=search] {
                    background: #ededed url("searchicon.png") no-repeat 9px center;
                    margin-top:4px;
                    background-size: 20px;
                    border: solid 0px #000;
                    padding: 5px 10px 5px 32px;
                    width: 55px;
                    -webkit-border-radius: 2em;
                    -moz-border-radius: 2em;
                    border-radius: 2em;
                    -webkit-transition: all .3s;
                    -moz-transition: all .3s;
                    transition: all .3s;
                }
                input[type=search] {
                    background-color: teal;
                    width: 20px;
                    float:right;
                    padding-left: 10px;
                    color: transparent;
                    cursor: pointer;
                }
                input[type=search]:hover {
                    background-color: teal;
                }
                 input[type=search]:focus {
                    border:solid 1px teal;
                    width: 120px;
                    padding-left: 32px;
                    color: #fff;
                    background-color: teal;
                    cursor: auto;
                }
                input:-moz-placeholder {
                    color: transparent;
                }
                /*^input 2*/
                input::-webkit-input-placeholder {
                    color: transparent;
                }
            .header{
                background: url(Images/<%=Imagename%>) no-repeat center center scroll;
                color: white;
                background-size: cover;
                z-index: 99;
                position: relative;
            }

            header,
            nav {
                font-size: 0;
            }

            .scroll45{
                white-space: nowrap;
                overflow-x: auto;
                -webkit-overflow-scrolling: touch;
                -ms-overflow-style: -ms-autohiding-scrollbar;
            }

            .affix {
                top: 0;
                width: 100%;
            }

            .affix + .container-fluid {
                padding-top: 70px;
            }

            .onTopView{
                z-index: 100;
            }

            .div1{
                background: transparent;
                position: absolute;
                z-index: 100;
                color: white;
                text-align: center;
                font-size: 1.5em;
                border-color: red;
                border-width: 200px;
            }

            .Image{
                height: 300px; 
                width: 400px;
                background-size: cover;
                margin-left:10px;
            }

            .ImageLook{
                width: 100%;
                height: 100%;
                margin: 10px;
            }

            .ModalMDL{

            }
            /*#imgs{
                width:300px;
                height:300px;
            }*/
            @media screen and(max-width: 450px){
                .ModalMDL{
                    width: 70%;
                    height: 85%;
                }
            }
            .mySlides {display:none}
            .demo {cursor:pointer}
            /*.popimg{max-width:100%}*/
        </style>
        
    </head>
    
    <body>
        
        <div class="w3-container w3-teal">
            <a href="#" class="w3-bar-item w3-button">Orbopedia</a>
            <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hide-medium">Home</a>
            <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hide-medium">Link 1</a>
            <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hide-medium">Link 2</a>
            <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hide-medium">Link 3</a>
            <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hide-medium">Link 3</a>
            <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hide-medium">Link 3</a>
            <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hide-medium">Link 3</a>
            <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hide-medium">Link 3</a>
            <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hide-medium">Link 3</a>
            <button onclick="myFunction()" id="expand1" class="w3-btn w3-ripple w3-teal w3-hide-large w3-right">+</button>
            <input type="search" placeholder="search">
        </div>
        <div id="block" class="w3-animate-right w3-center w3-bar-block w3-teal w3-hide w3-hide-large w3-hide-medium">
            <a href="#" class="w3-bar-item w3-button">home </a>
            <a href="#" class="w3-bar-item w3-button">Link 1</a>
            <a href="#" class="w3-bar-item w3-button">Link 2</a>
            <a href="#" class="w3-bar-item w3-button">Link 3</a>
            <a href="#" class="w3-bar-item w3-button">Link 3</a>
            <a href="#" class="w3-bar-item w3-button">Link 3</a>
            <a href="#" class="w3-bar-item w3-button">Link 3</a>
            <a href="#" class="w3-bar-item w3-button">Link 3</a>
            <a href="#" class="w3-bar-item w3-button">Link 3</a>
        </div>
        <script>
            function myFunction() {
                var x = document.getElementById("block");
                if (x.className.indexOf("w3-show") === -1) {
                    x.className += " w3-show";
                } else { 
                x.className = x.className.replace(" w3-show", "");
                }
            }
        </script>
        
        
        <section id="services" class="services bg-primary">
            <!--<div class="w3-bar w3-black" style="padding-bottom:55px">
                <div class="w3-bar-item w3-center">
                    <%

                        /*File path = new File(Location + PID + ".TRP");
                        Scanner aboutUs = new Scanner(path);
                        while (aboutUs.hasNext()) {
                        out.println(aboutUs.next());
                        }*/
                    %>
                </div>
            </div>
            <div class="w3-content" style="max-width:600px; padding-top: -100px;">
                <img class="mySlides w3-animate-right w3-card-4" onclick="onClick(this)" src="img/portfolio-1.jpg" style="width:100%">
                <img class="mySlides w3-animate-right w3-card-4" src="img/portfolio-2.jpg" style="width:100%">
                <img class="mySlides w3-animate-right w3-card-4" src="img/portfolio-3.jpg" style="width:100%">
            </div>

            <div class="w3-center">
                <div class="w3-section">
                    <button class="w3-button w3-round w3-teal w3-large w3-round- w3-hover-green w3-card-4 w3-border-0" onclick="plusDivs(-1)">Prev</button>&nbsp;
                    <button class="w3-button w3-round w3-teal w3-large w3-round- w3-hover-green w3-card-4 w3-border-0" onclick="plusDivs(1)">Next</button>
                </div>
                <div class="w3-black w3-card-4 scroll45 onTopView w3-padding" data-spy="affix" data-offset-top="680">
                    <img class="w3-bar-item w3-button w3-card-4" onclick="currentDiv(1)" src="img/portfolio-1.jpg" style="width:100px;">
                    <img class="w3-bar-item w3-button w3-card-4" onclick="currentDiv(2)" src="img/portfolio-2.jpg" style="width:100px;">
                    <img class="w3-bar-item w3-button w3-card-4" onclick="currentDiv(3)" src="img/portfolio-3.jpg" style="width:100px;">
                </div>
                <div id="modal01" class="w3-modal" onclick="this.style.display='none'">
                    <span class="w3-button w3-hover-red w3-xlarge w3-display-topright">&times;</span>
                    <div class="w3-modal-content w3-animate-zoom">
                        <img id="img01" width="1500" height="500" class="popimg">
                    </div>
                </div>
            </div>-->
                    <div class="w3-content w3-display-container">

<div class="w3-display-container mySlides">
  <img id="image1" class="w3-animate-fading" src="img/portfolio-1.jpg" style="width:100%">
</div>

<div class="w3-display-container mySlides">
  <img src="img/portfolio-2.jpg" style="width:100%">
</div>

<div class="w3-display-container mySlides">
  <img src="img/portfolio-3.jpg" style="width:100%">
</div>

<button class="w3-button w3-display-left w3-black" onclick="plusDivs(-1)">&#10094;</button>
<button class="w3-button w3-display-right w3-black" onclick="plusDivs(1)">&#10095;</button>

</div>
        </section>

        <script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>
        
        <!--<script>
            var slideIndex = 1;
            showDivs(slideIndex);

            function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1;}    
  if (n < 1) {slideIndex = x.length;}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-red", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-red";
}
</script>
<script>
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
}
</script>-->
        
    </body>
</html>