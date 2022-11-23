<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
  
    <title>솔로던트 모임게시판-상세글</title>


  
    <!-- =======================================================
    * Template Name: Impact - v1.1.1
    * Template URL: https://bootstrapmade.com/impact-bootstrap-business-website-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
</head>

<body>
	<jsp:include page="../home/menubar.jsp"/>
  

  

  <main id="main">

    <!-- =====목차 ==== -->
    <div class="breadcrumbs">
      <nav>
        <div class="container">
          <ol>
            <li><a href="index.html">모임</a></li>
            <li>상세글보기</li>
          </ol>
        </div>
      </nav>
    </div>
    
    <!-- ======= Blog Details Section ======= -->
    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up">

        <div class="row g-5">

          <div class="col-lg-12">


            <article class="blog-details">
              <div class="row">
                <div class="col-10"><h2 class="title">${moim.boardTitle}</h2></div>
                <div class="col-2 d-flex align-items-center justify-content-center">
                  <a href=""> <!-- 글쓴이의 경우: 수정 / 삭제 // 보는 사람의 경우 : 신고-->
                    <i class="bi lg bi-three-dots" style="font-size: 2rem; color:darkgray;"></i>
                  </a>
                </div>
              </div>

              
              <div class="meta-top">
                  <ul>
                    <li class="align-items-center"><i class="bi bi-person"></i>${moim.userId}</li>
                    <li class="align-items-center"><i class="bi bi-clock"></i> <time datetime="2020-01-01">${moim.createDate}</time></li>
                    <li class="align-items-center"><i class="bi bi-chat-dots"></i> <a href="#comments">댓글수</a></li><!--누르면댓글로이동-->
  
                    <!--누르면 하트 채움 / 추천 수 나타냄-->
                    <li class="align-items-center"><i class="bi bi-heart"></i>좋아요 수</li> 
                    <li class="align-items-center"><i class="bi bi-heart-fill"></i>좋아요 수</li> 
                    
                    <li class="align-items-center"> | </li>
  
                    <!-- 여기부터 모임만 해당-->
					<c:if test="${moim.local eq '전체 전체'}">
	                    <li class="align-items-center"><i class="bi bi-geo-alt"></i> <a href="blog-details.html">전체</a></li><!--누르면 지역으로 검색-->
					</c:if>

					<c:if test="${moim.local ne '전체 전체'}">
	                    <li class="align-items-center"><i class="bi bi-geo-alt"></i> <a href="blog-details.html">${moim.local}</a></li><!--누르면 지역으로 검색-->
					</c:if>
                    <li class="align-items-center"><i class="bi bi-people-fill"></i> <a href="blog-details.html">${moim.moimCategory}</a></li><!--누르면 모임형태로 검색-->
                    
  
                    <!--모집중인지, 마감인지 여부에 따라-->
                    <c:if test="${moim.moimStatus eq Y}">
	                    <li class="align-items-center"><i class="bi bi-patch-check-fill"></i>모집중</li>
                    </c:if>
                    <c:if test="${moim.moimStatus eq N}">
	                    <li class="align-items-center"><i class="bi bi-x-circle-fill"></i>모집마감</li>
                    </c:if>
                  </ul>
              </div><!-- End meta top -->

              <div class="content">
                <p>${moim.boardContent}</p>
   
				<c:forEach items="${list}" var="att">
<%-- 					<img src="${contextPath}/resources/uploadFiles/${att.rename}" alt="" class="img-fluid"> --%>
					<img src="${contextPath }/resources/uploadFiles/${att.rename}" alt="" class="img-fluid">
					<br>
				</c:forEach>

              </div><!-- End post content -->

              <div class="meta-bottom">
                <i class="bi bi-folder"></i>
                <ul class="cats">
                  <li><a href="#">Business</a></li>
                </ul>

                <i class="bi bi-tags"></i>
                <ul class="tags">
                  <li><a href="#">Creative</a></li>
                  <li><a href="#">Tips</a></li>
                  <li><a href="#">Marketing</a></li>
                </ul>
              </div><!-- End meta bottom -->

            </article><!-- End blog post -->

            <div class="post-author d-flex align-items-center">
              <img src="assets/img/blog/blog-author.jpg" class="rounded-circle flex-shrink-0" alt="">
              <div>
                <h4>Jane Smith</h4>
                <div class="social-links">
                  <a href="https://twitters.com/#"><i class="bi bi-twitter"></i></a>
                  <a href="https://facebook.com/#"><i class="bi bi-facebook"></i></a>
                  <a href="https://instagram.com/#"><i class="biu bi-instagram"></i></a>
                </div>
                <p>
                  Itaque quidem optio quia voluptatibus dolorem dolor. Modi eum sed possimus accusantium. Quas repellat voluptatem officia numquam sint aspernatur voluptas. Esse et accusantium ut unde voluptas.
                </p>
              </div>
            </div><!-- End post author -->

            <div id="comments" class="comments">

              <h4 class="comments-count">8 개의 댓글</h4>

              <div class="row">
                <div class="col-lg-2"><h5>댓글작성자</h5></div>
                <div class="col-lg-6"><h5>내용</h5></div>
                <div class="col-lg-1"><h5>?</h5></div>
                <div class="col-lg-1"><h5>추천</h5></div>
                <div class="col-lg-2"><h5>작성날짜</h5></div>
              </div>
              
              <div class="row">
                <div class="col-lg-2"><h5>댓글작성자</h5></div>
                <div class="col-lg-6"><h5>내용</h5></div>
                <div class="col-lg-1"><h5>?</h5></div>
                <div class="col-lg-1"><h5>추천</h5></div>
                <div class="col-lg-2"><h5>작성날짜</h5></div>
              </div>

              <div class="reply-form">

                <h4>댓글을 남기세요</h4>

                <form action="">
                  <div class="row">
                    <div class="col-10 form-group">
                      <textarea name="comment" class="form-control" placeholder="Your Comment*"></textarea>
                    </div>
                    <div class="col-2">
                      <button type="submit" class="btn btn-primary">Post Comment</button>
                    </div>
                    
                  </div>

                </form>

              </div>

            </div><!-- End blog comments -->

          </div>

          <div class="col-lg-4">



          </div>
        </div>

      </div>
    </section><!-- End Blog Details Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">

    <div class="container">
      <div class="row gy-4">
        <div class="col-lg-5 col-md-12 footer-info">
          <a href="index.html" class="logo d-flex align-items-center">
            <span>Impact</span>
          </a>
          <p>Cras fermentum odio eu feugiat lide par naso tierra. Justo eget nada terra videa magna derita valies darta donna mare fermentum iaculis eu non diam phasellus.</p>
          <div class="social-links d-flex mt-4">
            <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
            <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
            <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
            <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
          </div>
        </div>

        <div class="col-lg-2 col-6 footer-links">
          <h4>Useful Links</h4>
          <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">About us</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Terms of service</a></li>
            <li><a href="#">Privacy policy</a></li>
          </ul>
        </div>

        <div class="col-lg-2 col-6 footer-links">
          <h4>Our Services</h4>
          <ul>
            <li><a href="#">Web Design</a></li>
            <li><a href="#">Web Development</a></li>
            <li><a href="#">Product Management</a></li>
            <li><a href="#">Marketing</a></li>
            <li><a href="#">Graphic Design</a></li>
          </ul>
        </div>

        <div class="col-lg-3 col-md-12 footer-contact text-center text-md-start">
          <h4>Contact Us</h4>
          <p>
            A108 Adam Street <br>
            New York, NY 535022<br>
            United States <br><br>
            <strong>Phone:</strong> +1 5589 55488 55<br>
            <strong>Email:</strong> info@example.com<br>
          </p>

        </div>

      </div>
    </div>

    <div class="container mt-4">
      <div class="copyright">
        &copy; Copyright <strong><span>Impact</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/impact-bootstrap-business-website-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>

  </footer><!-- End Footer -->
  <!-- End Footer -->

  <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <div id="preloader"></div>

    <!-- Vendor JS Files --> <!--이거 없으면 화면 안 나옴-->
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/vendor/aos/aos.js"></script>
    <script src="resources/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="resources/vendor/purecounter/purecounter_vanilla.js"></script>
    <script src="resources/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="resources/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="resources/js/main.js"></script>

</body>
</html>