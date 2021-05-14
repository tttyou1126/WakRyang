<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <title> Sun </title>
  <link rel="icon" type="image/x-icon" href="/assets/img/favicon.ico" />
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;700&family=Roboto+Mono:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="/fonts/home/icomoon/style.css">

  <link rel="stylesheet" href="/css/home/bootstrap.min.css">
  <link rel="stylesheet" href="/css/home/magnific-popup.css">
  <link rel="stylesheet" href="/css/home/jquery-ui.css">
  <link rel="stylesheet" href="/css/home/owl.carousel.min.css">
  <link rel="stylesheet" href="/css/home/owl.theme.default.min.css">

  <link rel="stylesheet" href="/css/home/lightgallery.min.css">    

  <link rel="stylesheet" href="/css/home/bootstrap-datepicker.css">

  <link rel="stylesheet" href="/fonts/home/flaticon/font/flaticon.css">

  <link rel="stylesheet" href="/css/home/swiper.css">

  <link rel="stylesheet" href="/css/home/aos.css">

  <link rel="stylesheet" href="/css/home/style.css">

</head>
<body>

  <div class="site-wrap">

    <div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
    
    
<%@ include file="/WEB-INF/jsp/home/homeMenu.jsp"%>



    <div class="container-fluid" data-aos="fade" data-aos-delay="500">
      <div class="row">
        <div class="col-lg-4">

          <div class="image-wrap-2">
            <div class="image-info">
              <h2 class="mb-3">이력서</h2>
              <a href="" class="btn btn-outline-white py-2 px-4">바로가기</a>
            </div>
            <img src="/images/home/resume_image.jpg" alt="Image" class="img-fluid">
          </div>

        </div>
        <div class="col-lg-4">
          <div class="image-wrap-2">
            <div class="image-info">
              <h2 class="mb-3">개발자 소개</h2>
              <a href="/direct_jsp/aboutMe.jsp" class="btn btn-outline-white py-2 px-4">바로가기</a>
            </div>
            <img src="/images/home/developer_image.jpg" alt="Image" class="img-fluid">
          </div>
        </div>
        <div class="col-lg-4">
          <div class="image-wrap-2">
            <div class="image-info">
              <h2 class="mb-3">문의하기</h2>
              <a href="${path}/home/contact.do" class="btn btn-outline-white py-2 px-4">바로가기</a>
            </div>
            <img src="/images/home/ask_image.jpg" alt="Image" class="img-fluid">
          </div>
        </div>

        <div class="col-lg-4">
          <div class="image-wrap-2">
            <div class="image-info">
              <h2 class="mb-3">GitHub</h2>
              <a href="https://github.com/tttyou1126" class="btn btn-outline-white py-2 px-4">바로가기</a>
            </div>
            <img src="/images/home/github_image.jpg" alt="Image" class="img-fluid">
          </div>
        </div>

        <div class="col-lg-4">
          <div class="image-wrap-2">
            <div class="image-info">
              <h2 class="mb-3">게시판</h2>
              <a href="${path}/sample/board.do" class="btn btn-outline-white py-2 px-4">바로가기</a>
            </div>
            <img src="/images/home/board_image.jpg" alt="Image" class="img-fluid">
          </div>
        </div>

        <div class="col-lg-4">
          <div class="image-wrap-2">

            <img src="/images/home/coming_image.gif" alt="Image" class="img-fluid">
          </div>
        </div>

        <div class="col-lg-4">
          <div class="image-wrap-2">

            <img src="/images/home/coming_image.gif" alt="Image" class="img-fluid">
          </div>
        </div>

        <div class="col-lg-4">
          <div class="image-wrap-2">

            <img src="/images/home/coming_image.gif" alt="Image" class="img-fluid">
          </div>
        </div>

        <div class="col-lg-4">
          <div class="image-wrap-2">

            <img src="/images/home/coming_image.gif" alt="Image" class="img-fluid">
          </div>
        </div>

      </div>
    </div>

    <div class="footer py-4">
      <div class="container-fluid text-center">
        <p>
          Copyright &copy;<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All rights reserved | by SunJongMin
        </p>
      </div>
    </div>

    

    
    
  </div>

  <script src="/js/home/jquery-3.3.1.min.js"></script>
  <script src="/js/home/jquery-migrate-3.0.1.min.js"></script>
  <script src="/js/home/jquery-ui.js"></script>
  <script src="/js/home/popper.min.js"></script>
  <script src="/js/home/bootstrap.min.js"></script>
  <script src="/js/home/owl.carousel.min.js"></script>
  <script src="/js/home/jquery.stellar.min.js"></script>
  <script src="/js/home/jquery.countdown.min.js"></script>
  <script src="/js/home/jquery.magnific-popup.min.js"></script>
  <script src="/js/home/bootstrap-datepicker.min.js"></script>
  <script src="/js/home/swiper.min.js"></script>
  <script src="/js/home/aos.js"></script>

  <script src="/js/home/picturefill.min.js"></script>
  <script src="/js/home/lightgallery-all.min.js"></script>
  <script src="/js/home/jquery.mousewheel.min.js"></script>

  <script src="/js/home/main.js"></script>
  
  <script>
    $(document).ready(function(){
      $('#lightgallery').lightGallery();
    });
  </script>

</body>
</html>