<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUP.aspx.cs" Inherits="GuardianAngel.SignUP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
<meta name="description" content=""/>
<meta name="author" content=""/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>GuardianAngel註冊</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'/> <!--標題字-->
    <!--icon-->
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'/>
    <link href="css/navgater.min.css" rel="stylesheet"/>
    <link href="css/main.css" rel="stylesheet" media="all"/>
    <link rel="stylesheet" type="text/css" href="css/registered.css"/>
</head>
<body>
    <!-- Navigation> -->
   <nav class="navbar navbar-expand-lg  fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand " href="index.aspx">Guardian Angel</a>
          <a href ="index.aspx">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-home"></i>
            </button>
          </a>
        <div class="collapse  navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav  ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="index.aspx">回首頁</a>
            </li>
          </ul>
        </div>
      </div>
    </nav> 
     <section>
        <div class="container">    
            <div class="wrapper wrapper--w780">
                <div class="card-3">
                    <div class="card-body">
                        <h2 class="title">註冊您的帳號</h2>
                        <form id="form1" runat="server" method="post">
                            <div class="field-wrap" style="margin-bottom: 0px;">
                                <label>
                                    Set Name : <span class="req">*</span>
                                </label><br/><br/> 
                            </div>
                            <div class="row" style="margin-left: 0px;"> 
                                <div class="input-group" style="width:45%">
                                    <asp:TextBox ID="txtLname" CssClass="input--style-3" placeholder="姓" name="Lastname" required="true" runat="server"/>                           
                                </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <div class="input-group " style="width:45%">
                                    <asp:TextBox ID="txtFname" CssClass="input--style-3" placeholder="名" name="Firstname" required="true" runat="server"/>
                                </div>
                            </div>  
                            <div class="field-wrap">
                                <label>
                                    Set Account : <span class="req">*</span>
                                </label><br/><br/>              
                                <div class="input-group">
                                    <asp:TextBox ID="txtEmail" CssClass="input--style-3" TextMode="Email" placeholder="帳號" name="email" required="true" runat="server"/>
                                </div>
                            </div> 
                            <div class="field-wrap">
                                <label>
                                    Set Password : <span class="req">*</span>
                                </label><br/><br/>                      
                                <div class="input-group">
                                    <asp:TextBox ID="txtPassword" CssClass="input--style-3" TextMode="Password" placeholder="密碼" name="password" required="true" runat="server"/>
                                </div>
                            </div>                           
                            <div class="field-wrap">
                                <label>
                                    Set Phone Number : <span class="req">*</span>
                                </label><br/><br/>
                                <div class="input-group">
                                    <asp:TextBox ID="txtPhone" CssClass="input--style-3" placeholder="電話" name="phone" required="true" runat="server"/>
                                </div>
                            </div>
                            <div class="field-wrap">
                              <label>
                                    Set Organization :
                                </label><br/><br/>
                                <div class="input-group">
                                    <asp:TextBox ID="txtOrg" CssClass="input--style-3"  placeholder="服務機構" name="password"  runat="server"/>
                                </div>
                            </div>

                            <div class="field-wrap">
                              <label>
                                    Set Address :
                                </label><br/><br/>
                                <div class="input-group">
                                    <asp:TextBox ID="TextBox1" CssClass="input--style-3"  placeholder="住址"   runat="server"/>
                                </div>
                            </div>
                            <div class="p-t-10">
                                <asp:Button ID="btnSignUP" CssClass="btn btn--pill btn--green"  runat="server" Text="註冊" OnClick="btnSignUP_Click" />
                            </div>
                        </form>
                        <br/>
                        <p class="linked">已經擁有帳號了? &nbsp;<a href="Login.aspx">登入</a></p>
                    </div>
                </div>
            </div>
        </div>
     </section>
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
</body>
</html>
