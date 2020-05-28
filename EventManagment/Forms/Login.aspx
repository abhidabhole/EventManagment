<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EventManagment.Forms.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://kit.fontawesome.com/d19eeab89f.js" ></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
   <link href="https://fonts.googleapis.com/css2?family=Patua+One&family=Righteous&family=Russo+One&display=swap" rel="stylesheet"/>

    <title></title>
    <style> 
        *{
            font-family: 'Righteous', cursive
        }
        .nav-div{
            position:relative;
            width:100%;
            height:8rem;
            background: linear-gradient(to right, #26A0F2, #314786);
        }
        .footer{
            position:fixed; 
            width:100%;
            height:5rem;
            background: linear-gradient(to right, #26A0F2, #314786);
            text-align:center;
            bottom:0;
        }
        .copyrt{
            position:absolute; 
            width:100%;
            font-size:20px;
            text-align:center;
            bottom:5%;
            color:white;
        }
        .logo-img{
            width: 170px;
            height: 100%;
            padding: 10px 1px 10px 20px;
        }
        .cmpname{
            width: 100%;
            text-align: center;
            top: 35%;
            position: absolute;
            transition:0.5s;
        }
        .cmpname h2{
            text-shadow: 1px 1px 30px black;
            font-family: 'Patua One', cursive;
            font-size: 3rem;
        }
        .main-cont{
            margin:0px;
            text-align:center;
            padding-top:50px;
        }
        .cont1{
            height:600px;
            background-image:url(Images/Hall3.jpeg);
            background-size:cover;
            box-shadow: -5px 5px 20px 0px steelblue;
        }
        .cont2{
            height:600px;
            position:relative;
            box-shadow: 5px 5px 20px 0px steelblue;
        }
        .count2 h1{
            font-family:Courier New, Courier, monospace
        }
        .cont3{
            position:absolute;
            top:50%;
            left:50%;
            transform:translate(-50%,-50%);
            width:60%;
        }
        .cont3 h1{
            font-size: 2.7rem;
            color: #006fcc;
        }
        .btn1{
            border-radius: 4px;
            background: linear-gradient(to right, #26A0F2, #314786);
            border: none;
            color: white;
            text-align: center;
            text-transform: uppercase;
            font-size: 22px;
            padding: 12px;
            width: 100%;
            transition: 0.4s;
        }
        .btn1:hover{
            
            box-shadow:1px 1px 20px steelblue;
        }
        .form-control{
            padding:20px;
            font-size: 1.2em;
        }
        .form-group{
            margin-bottom:0.7rem;
        }
        
        @media (max-width: 750px)  {
            .cmpname{
                text-align:right;
            }
        .cmpname h2{
            font-size:2rem;
            }
        }
        /*@media (max-width: 1120px)  {
            .main-cont{
                padding:100px 50px 100px 50px;
            }
        }
        @media (max-width: 900px)  {
            .main-cont{
                padding:100px 0px 100px 0px;
            }
        }*/
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="nav-div">
            <asp:Image ImageUrl="Images/Tom and Jerry.png" ID="logoimg" CssClass="img-fluid logo-img" runat="server" />
            <div class="cmpname container-fluid text-white "><h2>T & J Managments</h2></div>
        </div>
        <div class="container-fluid main-cont row">
           
            <div class="col-sm-12  offset-lg-2 col-md-6 col-lg-4 cont1">
                
            </div>
            <div class="col-sm-12 col-md-6 col-lg-4 cont2">
                
                <div class="cont3">
                    <h1>LOGIN</h1>
                    <br />
                    <div class="form-group">
                        <asp:TextBox runat="server" ID="txtUsername" placeholder="Username" CssClass="form-control" AutoCompleteType="Disabled"/>
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" ID="txtPassword" placeholder="Password" TextMode="Password" CssClass="form-control"/>
                    </div>
                    <div class="form-group text-left">
                        <asp:CheckBox Text="Remember Me" ID="chkRemember" runat="server" CssClass="form-check p-0" Checked="false" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblMsg" runat="server" CssClass="col-form-label text-danger" />
                    </div>
                    <div class="form-group">
                        <asp:Button Text="Login" ID="btnLogin" runat="server" CssClass="btn1" OnClientClick="return LoginValid()" OnClick="btnLogin_Click" />
                        
                    </div>
                    <asp:HyperLink NavigateUrl="~/Forms/Register.aspx" Text="Create New Account" ID="hlRegister" CssClass="page-link" runat="server" />
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="footer"><h5 class="copyrt"><i class="far fa-copyright"></i> Copyright Abhi Dabhole</h5></div>
    </form>
    
    <script>
        function LoginValid() {
            let uname = document.getElementById("txtUsername").Value;
            let pass = document.getElementById("txtPassword").value;

            if (uname == "" || pass == "" ) {
                alert("Username or Password May Not be Blank");
                return false;
            }
            return true;
        }
    </script>

</body>
</html>
