<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="GuardianAngel.Homepage" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <title>GuardianAngel首頁</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
   
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'/>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <link href="css/all.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/agency.min.css" rel="stylesheet"/>

     

    <script>
        function signOut() {
            alert("您已成功登出!");
        }  
    </script>

</head>

<body class="page-top">
    <form id="form1" runat="server">     
    <!-- Navigation導覽列 -->
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">Guardian Angel</a>
         <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="hintindex.aspx">溫馨小語</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="respondindexV3.aspx">
                  <asp:UpdatePanel ID="UpdatePanel1" runat="server" style=" display:inline; ">
                      <ContentTemplate>
                          <asp:Timer ID="Timer1" runat="server" Enabled="true" Interval="5000" OnTick="Timer1_Tick"></asp:Timer>
                          <asp:Label ID="lblBell" runat="server" CssClass="fas fa-bell" style=" color:crimson; background-image:url(../img/bell.gif)" ></asp:Label>
                      </ContentTemplate>
                  </asp:UpdatePanel>
                  異常紀錄</a>
            </li>
            <li class="nav-item nav-item dropdown">
              <a class="nav-link dropdown-toggle"  href="GaCare.aspx" id="navbarDropdownMenuLink1"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">照護對象</a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" >
                       <a class="dropdown-item" href="GaCare.aspx" style=" color:#131314; font-weight: bolder; font-family:'微軟正黑體';" >被照護者列表</a>
                      <a class="dropdown-item" href="OldMedicineRemind_List.aspx" style=" color:#131314; font-weight: bolder; font-family:'微軟正黑體';" >用藥提醒</a>
                      
                  </div>
            </li>
            <li class="nav-item nav-item dropdown">
              <a class="nav-link dropdown-toggle"  href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%Response.Write(Session["Uname"]);  %>您好</a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" >
                      <a class="dropdown-item" href="MemberArea.aspx" style=" color:#131314; font-weight: bolder; font-family:'微軟正黑體';" >會員資料</a>
                      <a class="dropdown-item" href="MemPasUpd01.aspx" style=" color:#131314; font-weight: bolder; font-family:'微軟正黑體';">更改密碼</a>
                      <a class="dropdown-item" href="index.aspx" onclick="signOut()" style=" color:#131314; font-weight: bolder; font-family:'微軟正黑體';">登出</a>
                  </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Header -->
    <header class="masthead">
      <div class="container">
        <div class="intro-text">
          <div class="intro-lead-in">歡迎使用Guardian Angel</div>
          <div class="intro-heading text-uppercase">Welcome to use</div>
          <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#services">Tell me more</a>
        </div>
      </div>
    </header>
    <!-- Services -->
    <section id="services">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">功 能 介 紹</h2>
            <h3 class="section-subheading text-muted">Function introduce</h3>
          </div>
        </div>
        <div class="row text-center">
            <div class="col-md-4">
                <span class="fa-stack fa-4x">
                    <i class="fas fa-circle fa-stack-2x text-primary"></i> 
                    <i class="fas  fa-vector-square fa-stack-1x fa-inverse"></i>                                               
                </span>
                <h4 class="service-heading">劃定安全區域</h4>
                <p class="text-muted">您可以劃定被照顧者的安全區域，輸入的地址為中心，以及拉取您所需的矩形範圍，我們將為您偵測是否離開安全區。</p>
              </div>
            <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <i class="fas fa-map-marked-alt fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">GPS定位偵測通知</h4>
            <p class="text-muted">利用Google GPS服務，當被照護者離開區域，我們將發出手機、mail等訊息通知，以及當下的GPS定位給使用者，降低失智老人走失機率。</p>
          </div>
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <i class="fas fa-exclamation-triangle fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">跌倒偵測及回報</h4>
            <p class="text-muted">陀螺儀的G力測量，判斷被照顧者是否發生跌倒事件，並於事件發生時30秒後自動撥打電話及傳送訊息予緊急連絡人。</p>
          </div>
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <!--<i class='fas fa-capsules' style='font-size:48px;color:black'></i>-->
              <i class="fas fa-capsules fa-stack-1x fa-inverse" style="color:"></i>
            </span>
            <h4 class="service-heading">用藥提醒</h4>
            <p class="text-muted">用藥包的形式，打包在同一時段必須吃的藥品，於吃藥時間，我們將送出該藥包之所有藥品的照片及數量來提醒吃藥者。
            </p>
          </div>
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <i class="fas fa-hand-holding-heart fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">貼心小語</h4>
            <p class="text-muted">不再讓年長者感到科技冷漠，用最簡單的操作讓長輩也能輕鬆看到家人的照片、感受來自家人關心的話語，讓空虛寂寞的心溫暖起來。</p>
          </div>
            <div class="col-md-4">
            <span class="fa-stack fa-4x">
            <i class="fas fa-circle fa-stack-2x text-primary"></i>
            
            <i class="fas fa-hospital fa-stack-1x fa-inverse" style="color:"></i>
            </span>
            <h4 class="service-heading">結合長照</h4>
            <p class="text-muted">除了個人使用者，也提供長照單位的使用，讓照顧長者更便利。
            </p>
            </div>
        </div>
        </div>
      </div>
    </section>
  <!-- Portfolio Grid -->
    <section  id="portfolio" class="bg-light">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">功能畫面</h2>
            <h3 class="section-subheading text-muted">About us</h3>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4 col-sm-6 portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal1">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  <i class="fas fa-search fa-3x"></i>
                </div>
              </div>
                <div style="text-align:center">
              <img class="img-fluid" src="img/Care.JPG" alt=""  />
            </div></a>
            <div class="portfolio-caption">
              <h4>守護對象</h4>
              <p class="text-muted">Illustration</p>
            </div>
          </div>
          <div class="col-md-4 col-sm-6 portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal2">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  <i class="fas fa-search fa-3x"></i>
                </div>
              </div>
              <img class="img-fluid" src="img/Gps.JPG" alt=""/>
            </a>
            <div class="portfolio-caption">
              <h4>GPS</h4>
              <p class="text-muted">Graphic Design</p>
            </div>
          </div>
          <div class="col-md-4 col-sm-6 portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal3">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  <i class="fas fa-search fa-3x"></i>
                </div>
              </div>
              <img class="img-fluid" src="img/Emerg.JPG" alt=""/>
            </a>
            <div class="portfolio-caption">
              <h4>異常處理</h4>
              <p class="text-muted">Identity</p>
            </div>
          </div>
          
        </div>
      </div>
    </section>
          <!-- Modal 1 -->
    <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="close-modal" data-dismiss="modal">
            <div class="lr">
              <div class="rl"></div>
            </div>
          </div>
          <div class="container">
            <div class="row">
              <div class="col-lg-8 mx-auto">
                <div class="modal-body">
                  <!-- Project Details Go Here -->
                  <h2 class="text-uppercase">守護對象</h2>
                  <p class="item-intro text-muted">olderman</p>
                  <img class="img-fluid d-block mx-auto" src="img/Care.JPG" alt="" />
                  <button class="btn btn-primary" data-dismiss="modal" type="button">
                    <i class="fas fa-times"></i>
                   關閉</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
       <!-- Modal 1 -->
    <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="close-modal" data-dismiss="modal">
            <div class="lr">
              <div class="rl"></div>
            </div>
          </div>
          <div class="container">
            <div class="row">
              <div class="col-lg-8 mx-auto">
                <div class="modal-body">
                  <!-- Project Details Go Here -->
                  <h2 class="text-uppercase">守護對象</h2>
                  <p class="item-intro text-muted">olderman</p>
                  <img class="img-fluid d-block mx-auto" src="img/Gps.JPG" alt="" />
                  <button class="btn btn-primary" data-dismiss="modal" type="button">
                    <i class="fas fa-times"></i>
                   關閉</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
       <!-- Modal 1 -->
    <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="close-modal" data-dismiss="modal">
            <div class="lr">
              <div class="rl"></div>
            </div>
          </div>
          <div class="container">
            <div class="row">
              <div class="col-lg-8 mx-auto">
                <div class="modal-body">
                  <!-- Project Details Go Here -->
                  <h2 class="text-uppercase">守護對象</h2>
                  <p class="item-intro text-muted">olderman</p>
                  <img class="img-fluid d-block mx-auto" src="Emerg.JPG" alt="" />
                  <button class="btn btn-primary" data-dismiss="modal" type="button">
                    <i class="fas fa-times"></i>
                   關閉</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Contact -->
    <section id="contact">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">聯絡我們</h2>
            <h3 class="section-subheading text-muted">contact us</h3>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input class="form-control" id="name" type="text" placeholder="Your Name *" required="required" data-validation-required-message="Please enter your name."/>
                    <p class="help-block text-danger"></p>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="email" type="email" placeholder="Your Email *" required="required" data-validation-required-message="Please enter your email address."/>
                    <p class="help-block text-danger"></p>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="phone" type="tel" placeholder="Your Phone *" required="required" data-validation-required-message="Please enter your phone number."/>
                    <p class="help-block text-danger"></p>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <textarea class="form-control" id="message" placeholder="Your Message *" required="required" data-validation-required-message="Please enter a message."></textarea>
                    <p class="help-block text-danger"></p>
                  </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-lg-12 text-center">
                  <div id="success"></div>
                  <button id="sendMessageButton" class="btn btn-primary btn-xl text-uppercase" type="submit">Send Message</button>
                </div>
              </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Footer -->
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <span class="copyright">Copyright &copy; 2018 Guardian Angel</span>
          </div>
          <div class="col-md-4">
            <ul class="list-inline social-buttons">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-facebook-f"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-linkedin-in"></i>
                </a>
              </li>
            </ul>
          </div>
          <div class="col-md-4">
            <ul class="list-inline quicklinks">
              <li class="service list-inline-item ">
                 服務電話 : 07-351-2345 (10AM-6PM)
              </li>               
            </ul>
          </div>
        </div>
      </div>
    </footer>
      <!-- Bootstrap core JavaScript -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>
    <!-- Contact form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>
    <!-- Custom scripts for this template -->
    <script src="js/agency.min.js"></script>

    
    </form>
</body>
</html>
