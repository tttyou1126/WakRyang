<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>

<link href="/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/contact/contact_base.css?ver=3"/>
<link rel="stylesheet" href="/css/contact/contact_main.css?ver=3"/>  

<style>

</style>


</head>
<body>
<div class="homemenu1" style="position: relative; z-index: 2;">
<%@ include file="/WEB-INF/jsp/home/homeMenu.jsp"%>
</div>
<div class="contact1" style="position: relative; z-index: 1;">


<!-- contact
   ================================================== -->
   <section id="contact">
<div  align="center">

<div class="row contact-content">
   		<div class="col-twelve">

   		<font color="white">	<h1>Contact</h1> </font>

   			<p class="lead"></p>
   		</div> 
 </div>

   	<div class="row contact-content">

   		<div class="col-seven tab-full animate-this">

   			<h5>문의</h5>

            <!-- form --> <!-- 210512 Contact화면 메일 전송 기능 추가 -->
            <form action="${path}/home/mailSending.do" name="contactForm" id="contactForm" method="post">     			

               <div class="form-field">
 					   <input name="contactName" type="text" id="contactName" placeholder="Name" value="" minlength="2" required="">
               </div>

               <div class="row">
                 	<div class="col-six tab-full">
                 		<div class="form-field">
                 			<input name="contactEmail" type="email" id="contactEmail" placeholder="Email" value="" required="">
                 		</div>		      			   
		            </div>
	            	<div class="col-six tab-full">	            
	            		<div class="form-field">
	            			<input name="contactSubject" type="text" id="contactSubject" placeholder="Subject" value="">
	                  </div>		     				   
		            </div>
               </div>
                                         
               <div class="form-field">
	              	<textarea name="contactMessage" id="contactMessage" placeholder="message" rows="10" cols="50" required=""></textarea>
	            </div> 

               <div class="form-field">
                  <button class="submitform">Submit</button>

                  <div id="submit-loader">
                     <div class="text-loader">Sending...</div>                             
       			      <div class="s-loader">
							  	<div class="bounce1"></div>
							  	<div class="bounce2"></div>
							  	<div class="bounce3"></div>
							</div>
						</div>
               </div>
      		</form> <!-- end form -->

            <!-- contact-warning -->
            <div id="message-warning"></div> 

            <!-- contact-success -->
      		<div id="message-success">
               <i class="fa fa-check"></i>Your message was sent, thank you!<br>
      		</div>

         </div> <!-- end col-seven --> 

         <div class="col-four tab-full contact-info end animate-this">

         	<h5>Contact Information</h5>

	   		<div class="cinfo">
	   			<h6>Email</h6>
	   			<p>
	   				tttyou1126@naver.com
				 </p>
	   		</div> <!-- end cinfo -->

	   		<div class="cinfo">
	   			<h6>Call</h6>
	   			<p>
	   				Phone: 010-2279-6552
				   </p>
	   		</div>

         </div> <!-- end cinfo --> 

   	</div> <!-- end row contact-content -->
		</div>
	</section> <!-- end contact -->
</div>

</body>
</html>

