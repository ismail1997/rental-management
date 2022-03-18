<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel='stylesheet' href="style//css//bootstrap.min.css">
        <link rel='stylesheet' href="style//css//bootstrap.css">

        <script type="text/javascript" src="style//js//jquery.min.js" ></script>
        <script type="text/javascript" src="style//js//bootstrap.min.js" ></script>
    </head>

    <body>
        <jsp:include page="commonpages/navbar.jsp"></jsp:include>
        <style>
            #section-home{
                height: 669px;
            }
            #tot{
                
                 position: absolute;
                left: 900px;
                top: 400px;
                background-image: linear-gradient(to top, #e6b980 0%, #eacda3 100%);
                width:403px;
                height:200px;
                opacity: 0.6;
                
            }
            #tot2{
                font-family: time-new-roman;
                 position: absolute;
                left: 900px;
                top: 420px;
                color:#2a5298;
                font-size: 50px;
            }
            #tot3{
                font-family: time-new-roman;
                 position: absolute;
                left: 950px;
                top: 500px;
                color:#2a5298;
                font-size: 18px;
            }
            #tot4{
                width:130px;
                position: absolute;
                left: 1030px;
                top: 550px;
                height: 50px;
            }
            .crop{
                width:597px;
                height:400px;
                overflow: hidden;
                margin-left: 40px;
                border:2px solid white;
                border-radius: 15px;
                box-shadow:  2px 1px 10px rgba(0,0,0,0.6); 
            }
            #im1{
                position:absolute;
                left:540px;
                top:900px;
                z-index: 3;
            }
            #im2{
                position: absolute;
                left:620px;
                top:850px;
                z-index: 2;
            }
            #im3{
                position: absolute;
                left:700px;
                top:820px;
                z-index:1 ;
            }
            
        </style>
     <section  style="background-image: url(images/appartement3.jpg)" id="section-home">
          <div id="tot"></div>
          <div id='tot2' >The location heaven</div>
          <div id='tot3' >Choose a location and make your reservation</div>
          <div id="tot4"><a href="#section-contact"  class="btn btn-primary btn-md">Start reservation</a></div>
      
    </section>
    <!-- END section -->
    
    <br><br><br><br><br><br><br><br>
    <section class="pb_section pb_section_v1" data-section="about" id="section-about">
      <div class="container">
        <div class="row">
          <div class="col-lg-5 pr-md-5 pr-sm-0">
            <h2 class="mt-0 heading-border-top mb-3 font-weight-normal">C'EST QUOI MYHOME ?</h2>
            <p>C’est un endroit où vous trouverez l’endroit qui vous mettra à l’aise et à des prix convenables.</p>
            <p>C’est le paradis du logement, des maisons et appartements de luxe, des piscines et des jardins prestigieux. Vous trouverez ici tout ce dont vous avez besoin.</p>
          </div>
          <div class="">
            
              <img class="crop" id='im1' src="images/villa1.jpg" alt="free Template by uicookies.com">
              <img class="crop" id='im2' src="images/appartemet6.jpg" alt="free Template by uicookies.com">
              <img class="crop"  id='im3' src="images/house1.jpg" alt="free Template by uicookies.com">
            
          </div>
          
        </div>
      </div>  
    </section>
    <!-- END section -->
    <br><br><br><br><br><br><br><br><br>
    
    <section class="pb_section bg-light">
      <div class="container">
        <div class="row">
          <div class="col-md">
            <div class="media pb_media_v2 d-block text-center mb-3">
              <div class="icon border border-gray rounded-circle d-block mr-3 display-4 mx-auto mb-4"><i class="flaticon text-secondary flaticon-jury"></i></div>
              <div class="media-body">
                <h3 class="mt-0 pb_font-20">Group of Lawyers</h3>
                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              </div>
            </div>
          </div>
          <div class="col-md">
            <div class="media pb_media_v2 d-block text-center  mb-3">
              <div class="icon border border-gray rounded-circle d-flex mr-3 display-4 mx-auto mb-4"><i class="flaticon text-secondary flaticon-law"></i></div>
              <div class="media-body">
                <h3 class="mt-0 pb_font-20">No One is Above The Law</h3>
                <p>Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
              </div>
            </div>
          </div>
          <div class="col-md">
            <div class="media pb_media_v2 d-block text-center  mb-3">
              <div class="icon border border-gray rounded-circle d-flex mr-3 display-4 mx-auto mb-4"><i class="flaticon text-secondary flaticon-courthouse"></i></div>
              <div class="media-body">
                <h3 class="mt-0 pb_font-20">Hall of Justice</h3>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- END section -->
      
    <section class="pb_sm_py_cover text-center cover-bg-black cover-bg-opacity-4" style="background-image: url(assets/images/1900x1200_img_3.jpg)">
      <div class="container">

        <div class="row align-items-center">
          <div class="col-md-12">
            <h2 class="heading mb-3">Free Consultation</h2>
            <p class="sub-heading mb-5 pb_color-light-opacity-8">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
            <p><a href="#section-contact" role="button" class="btn smoothscroll pb_outline-light p-3 rounded-0 pb_font-13 pb_letter-spacing-2">Get Started</a></p>
          </div>  
        </div>

      </div>
    </section>
    <!-- END section -->

    <section class="pb_section" data-section="why-us" id="section-why-us">
      <div class="container">
        <div class="row justify-content-md-center text-center mb-5">
          <div class="col-lg-7">
            <h2 class="mt-0 heading-border-top font-weight-normal">Why Us</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-7">
            <div class="images right">
              <img class="img1 img-fluid" src="images/appartement1.jpg" alt="free Template by uicookies.com">
              <img class="img2" src="assets/images/800x500_img_1.jpg" alt="free Template by uicookies.com">
            </div>
          </div>
          <div class="col-lg-5 pl-md-5 pl-sm-0">
            <div id="exampleAccordion" class="pb_accordion" data-children=".item">
              <div class="item">
                <a data-toggle="collapse" data-parent="#exampleAccordion" href="#exampleAccordion1" aria-expanded="true" aria-controls="exampleAccordion1" class="pb_font-18">Property &amp; Business Law</a>
                <div id="exampleAccordion1" class="collapse show" role="tabpanel">
                  <p>Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                  <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                </div>
              </div>
              <div class="item">
                <a data-toggle="collapse" data-parent="#exampleAccordion" href="#exampleAccordion2" aria-expanded="false" aria-controls="exampleAccordion2" class="pb_font-18">Famimly Law</a>
                <div id="exampleAccordion2" class="collapse" role="tabpanel">
                  <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                </div>
              </div>
              <div class="item">
                <a data-toggle="collapse" data-parent="#exampleAccordion" href="#exampleAccordion3" aria-expanded="false" aria-controls="exampleAccordion3" class="pb_font-18">Commercial Litigation</a>
                <div id="exampleAccordion3" class="collapse" role="tabpanel">
                  <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                </div>
              </div>
              <div class="item">
                <a data-toggle="collapse" data-parent="#exampleAccordion" href="#exampleAccordion4" aria-expanded="false" aria-controls="exampleAccordion4" class="pb_font-18">Injury Compensation</a>
                <div id="exampleAccordion4" class="collapse" role="tabpanel">
                  <p>The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn’t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.</p>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </section>
    <!-- END section -->
 
    <script type="text/javascript">
	$(function () {
                $("#im3").on('hover',function () {
                            $('#im3').css('zIndex', 9999);
                            $('#im1').css('zIndex', 8888);
                            $('#im2').css('zIndex', 1111);
		});
                $("#im2").on('hover',function () {
                            $('#im2').css('zIndex', 9999);
                            $('#im3').css('zIndex', 8888);
                            $('#im1').css('zIndex', 1111);
		});
                $("#im1").on('hover',function () {
                            $('#im1').css('zIndex', 9999);
                            $('#im2').css('zIndex', 8888);
                            $('#im3').css('zIndex', 1111);
		});
});	
    </script>
        
    </body>
</html>
