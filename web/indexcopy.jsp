<%-- 
    Document   : index.jsp
    Created on : 20 May, 2017, 6:56:12 PM
    Author     : Parin Patel
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.io.File"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">


        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/stylish-portfolio.css" rel="stylesheet">

        <!-- Custom Fonts -->
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

        <title>IndexCopy - <%=City%></title>

        <style>

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
            input {
                    outline: none;
                }
                input[type=search] {
                    -webkit-appearance: textfield;
                    -webkit-box-sizing: content-box;
                    font-family: inherit;
                    font-size: 100%;
                }
                input[type=find]{
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
                    -webkit-border-radius: 0em;
                    -moz-border-radius: 0em;
                    border-radius: 0em;
                    -webkit-transition: all .3s;
                    -moz-transition: all .3s;
                    transition: all .3s;
                }
                input[type=find]{
                    background:#ededed url("searchicon.png") no-repeat 9px center;
                    margin-top:4px;
                    margin-left:5px;
                    background-size: 20px;
                    border:solid 0px #000;
                    padding:5px 10px 5px 32px;
                    width:55px;
                    -webkit-border-radius: 10em;
                    -moz-border-radius: 10em;
                    border-radius: 10em;
                    -webkit-transition: all .3s;
                    -moz-transition: all .3s;
                    transition: all .3s;
                }
                input[type=search] {
                    background-color: black;
                    width: 20px;
                    float:right;
                    padding-left: 10px;
                    color: transparent;
                    cursor: pointer;
                }
                input[type=find]{
                    background-color: black;
                    width: 20px;
                    padding-left: 10px;
                    color: transparent;
                    cursor: pointer;
                }
                input[type=search]:hover {
                    background-color: black;
                }
                input[type=find]:hover {
                    background-color: black;
                }
                input[type=search]:focus {
                    border:solid 0px black;
                    width: 120px;
                    padding-left: 32px;
                    color: #fff;
                    background-color: teal;
                    cursor: auto;
                }
                input[type=find]:focus {
                    border:solid 0px black;
                    width: 120px;
                    padding-left: 32px;
                    color: #fff;
                    background-color: teal;
                    cursor: auto;
                }
                input:-moz-placeholder {
                    color: transparent;
                }
                input::-webkit-input-placeholder {
                    color: transparent;
                }

            @media screen and(max-width: 450px){
                .ModalMDL{
                    width: 70%;
                    height: 85%;
                }
            }
            #vid {
                max-width: 100%;
                /*max-height:auto;*/
            }
        </Style>


    </head>

    <body>
        <!--<div class="w3-black scroll45 onTopView" >
            <a href="#" class="w3-bar-item w3-button">Orbopedia </a>
            <a href="#" class="w3-bar-item w3-button">Home</a>
            <a href="#" class="w3-bar-item w3-button">Link 1</a>
            <a href="#" class="w3-bar-item w3-button">Link 2</a>
            <a href="#" class="w3-bar-item w3-button">Link 3</a>
            <a href="#" class="w3-bar-item w3-button">Link 3</a>
            <a href="#" class="w3-bar-item w3-button">Link 3</a>
            <a href="#" class="w3-bar-item w3-button">Link 3</a>
            <a href="#" class="w3-bar-item w3-button">Link 3</a>
            <a href="#" class="w3-bar-item w3-button">Link 3</a>
        </div>-->
        <div class="w3-container w3-black w3-padding">
            <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hide-medium">Orbopedia </a>
            <a href="#" class="w3-bar-item w3-button">Home</a>
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
        <div id="block" class="w3-animate-right w3-center w3-bar-block w3-teal w3-hide w3-hide-large">
            <a href="#" class="w3-bar-item w3-button">Orbopedia </a>
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


        <!-- Header -->
        <header id="top" class="header">
            <div class="text-vertical-center">
                <span class="h1"><%=City%></span>
                <h3><%=TagLine%></h3>
                <br>
                <a href="#about" class="btn btn-dark btn-lg">Find Out More</a>
            </div>
        </header>

        <!-- About -->
        <section id="about" class="about">
            <div class="container">
                <div class="row">
                    <div class="w3-black scroll45 onTopView" data-spy="affix" data-offset-top="680">
                        <a href="#" class="w3-bar-item w3-button"><%=City%></a>
                        <input type="find" placeholder="search">
                        <a href="#" class="w3-bar-item w3-button">Link 1</a>
                        <a href="#" class="w3-bar-item w3-button">Link 2</a>
                        <a href="#" class="w3-bar-item w3-button">Link 3</a>
                    </div>
                    <iframe
                        width="100%"
                        height="550px"
                        frameborder="0" style="border:0"
                        src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCon88UTy-mbmgt6rl-gzI6F8JVuYt7eMk 
                        &q=<%=City%>" allowfullscreen>
                    </iframe>
                    <!--div class="col-lg-12 text-center">
                        <h2>Stylish Portfolio is the perfect theme for your next project!</h2>
                        <p class="lead">This theme features some wonderful photography courtesy of <a target="_blank" href="http://join.deathtothestockphoto.com/">Death to the Stock Photo</a>.</p>
                    </div-->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container -->
        </section>

        <!-- Services -->
        <!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
        <section id="services" class="services bg-primary">
            <!--<div class="w3-bar w3-card-4 w3-black" style="padding-bottom:55px">
                <div class="w3-bar-item w3-center">
                    <%

                        /*File path = new File(Location + PID + ".TRP");
                        Scanner aboutUs = new Scanner(path);
                        while (aboutUs.hasNext()) {
                        out.println(aboutUs.next());
                        }*/
                    %>
                </div>
            </div>-->
                &nbsp;&nbsp;&nbsp;
            <div class="w3-content w3-display-container">
                <div class="w3-display-container mySlides">
                    <img src="img/portfolio-1.jpg" style="width:100%">
                </div>
                <div class="w3-display-container mySlides">
                    <img src="img/portfolio-2.jpg" style="width:100%">
                </div>
                <div class="w3-display-container mySlides">
                    <img src="img/portfolio-3.jpg" style="width:100%">
                </div>
                <button class="w3-button w3-display-left w3-black" onclick="plusDivs(-1)">&#10094;</button>
                <button class="w3-button w3-display-right w3-black" onclick="plusDivs(1)">&#10095;</button>

            </div><br/>
            
            <!--<div class="col-6 col-s-9">
                <iframe id="vid" width="1500" height="500px" src="//www.youtube.com/embed/Q8TXgCzxEnw?rel=0" frameborder="0" allowfullscreen></iframe>
            </div>-->
            <div class="w3-center">
                <div class="w3-black scroll45 w3-padding">
                    <iframe class="w3-bar-item w3-button w3-card-4" src="//www.youtube.com/embed/Q8TXgCzxEnw?rel=0" style="width:500px; height: 250px;" allowfullscreen></iframe>
                    <iframe class="w3-bar-item w3-button w3-card-4" src="//www.youtube.com/embed/gud7MD2PvrQ?rel=0" style="width:500px; height: 250px;" allowfullscreen></iframe>
                    <iframe class="w3-bar-item w3-button w3-card-4" src="//www.youtube.com/embed/rrT6v5sOwJg?rel=0" style="width:500px; height: 250px;" allowfullscreen></iframe>
                </div>
            </div>
        </section>
        <!--image script-->
        <script>
            var slideIndex = 1;
            showDivs(slideIndex);

            function plusDivs(n) {
                showDivs(slideIndex += n);
            }

            function showDivs(n) {
                var i;
                var x = document.getElementsByClassName("mySlides");
                if (n > x.length) {slideIndex = 1;}    
                if (n < 1) {slideIndex = x.length;}
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";  
                }
                x[slideIndex-1].style.display = "block";  
            }
        </script>


        <!--i think it's not needed anymore
        <div id="modal01" class="w3-modal" onclick="this.style.display = 'none'">
            <img class="w3-modal-content center-block ModalMDL" id="img01">
        </div>

        <script>
            function onClick(element) {
                document.getElementById("img01").src = element.src;
                document.getElementById("modal01").style.display = "block";
            }
        </script>-->


        <!-- Callout -->
        <aside class="callout">
            <div class="text-vertical-center">
                <h1>Vertically Centered Text</h1>
            </div>
        </aside>

        <!-- Portfolio -->
        <section id="portfolio" class="portfolio">
            <div class="container">
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1 text-center">
                        <h2>Our Work</h2>
                        <hr class="small">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="portfolio-item">
                                    <a href="#">
                                        <img class="img-portfolio img-responsive" src="img/portfolio-1.jpg">
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="portfolio-item">
                                    <a href="#">
                                        <img class="img-portfolio img-responsive" src="img/portfolio-2.jpg">
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="portfolio-item">
                                    <a href="#">
                                        <img class="img-portfolio img-responsive" src="img/portfolio-3.jpg">
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="portfolio-item">
                                    <a href="#">
                                        <img class="img-portfolio img-responsive" src="img/portfolio-4.jpg">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- /.row (nested) -->
                        <a href="#" class="btn btn-dark">View More Items</a>
                    </div>
                    <!-- /.col-lg-10 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container -->
        </section>

        <!-- Call to Action -->
        <aside class="call-to-action bg-primary">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <h3>The buttons below are impossible to resist.</h3>
                        <a href="#" class="btn btn-lg btn-light">Click Me!</a>
                        <a href="#" class="btn btn-lg btn-dark">Look at Me!</a>
                    </div>
                </div>
            </div>
        </aside>

        <!-- Map -->
        <section id="contact" class="map">
            <iframe width="100%" height="100%" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A&amp;output=embed"></iframe>
            <br />
            <small>
                <a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;aq=0&amp;oq=twitter&amp;sll=28.659344,-81.187888&amp;sspn=0.128789,0.264187&amp;ie=UTF8&amp;hq=Twitter,+Inc.,+Market+Street,+San+Francisco,+CA&amp;t=m&amp;z=15&amp;iwloc=A"></a>
            </small>
        </section>

        <!-- Footer -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1 text-center">
                        <h4><strong>Start Bootstrap</strong>
                        </h4>
                        <p>3481 Melrose Place
                            <br>Beverly Hills, CA 90210</p>
                        <ul class="list-unstyled">
                            <li><i class="fa fa-phone fa-fw"></i> (123) 456-7890</li>
                            <li><i class="fa fa-envelope-o fa-fw"></i> <a href="mailto:name@example.com">name@example.com</a>
                            </li>
                        </ul>
                        <br>
                        <ul class="list-inline">
                            <li>
                                <a href="#"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-dribbble fa-fw fa-3x"></i></a>
                            </li>
                        </ul>
                        <hr class="small">
                        <p class="text-muted">Copyright &copy; Your Website 2014</p>
                    </div>
                </div>
            </div>
            <a id="to-top" href="#top" class="btn btn-dark btn-lg"><i class="fa fa-chevron-up fa-fw fa-1x"></i></a>
        </footer>

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script>
            // Closes the sidebar menu
            $("#menu-close").click(function (e) {
                e.preventDefault();
                $("#sidebar-wrapper").toggleClass("active");
            });
            // Opens the sidebar menu
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#sidebar-wrapper").toggleClass("active");
            });
            // Scrolls to the selected menu item on the page
            $(function () {
                $('a[href*=#]:not([href=#],[data-toggle],[data-target],[data-slide])').click(function () {
                    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {
                        var target = $(this.hash);
                        target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                        if (target.length) {
                            $('html,body').animate({
                                scrollTop: target.offset().top
                            }, 1000);
                            return false;
                        }
                    }
                });
            });
            //#to-top button appears after scrolling
            var fixed = false;
            $(document).scroll(function () {
                if ($(this).scrollTop() > 250) {
                    if (!fixed) {
                        fixed = true;
                        // $('#to-top').css({position:'fixed', display:'block'});
                        $('#to-top').show("slow", function () {
                            $('#to-top').css({
                                position: 'fixed',
                                display: 'block'
                            });
                        });
                    }
                } else {
                    if (fixed) {
                        fixed = false;
                        $('#to-top').hide("slow", function () {
                            $('#to-top').css({
                                display: 'none'
                            });
                        });
                    }
                }
            });
            // Disable Google Maps scrolling
            // See http://stackoverflow.com/a/25904582/1607849
            // Disable scroll zooming and bind back the click event
            var onMapMouseleaveHandler = function (event) {
                var that = $(this);
                that.on('click', onMapClickHandler);
                that.off('mouseleave', onMapMouseleaveHandler);
                that.find('iframe').css("pointer-events", "none");
            };
            var onMapClickHandler = function (event) {
                var that = $(this);
                // Disable the click handler until the user leaves the map area
                that.off('click', onMapClickHandler);
                // Enable scrolling zoom
                that.find('iframe').css("pointer-events", "auto");
                // Handle the mouse leave event
                that.on('mouseleave', onMapMouseleaveHandler);
            };
            // Enable map zooming with mouse scroll when the user clicks the map
            $('.map').on('click', onMapClickHandler);
        </script>

    </body>

</html>