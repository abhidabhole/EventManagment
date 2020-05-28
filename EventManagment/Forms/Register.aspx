<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EventManagment.Forms.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://kit.fontawesome.com/d19eeab89f.js" ></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Patua+One&family=Righteous&family=Russo+One&display=swap" rel="stylesheet"/>
    <title></title>
    <style>
        *{
            font-family: 'Righteous', cursive;
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
            background-image:url(Images/Hall1.jpeg);
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
            
            background-position:right center;
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
                    <h1>REGISTER</h1>
                    <br />
                    <div class="form-group">
                        <asp:TextBox runat="server" ID="txtName" Placeholder="Name"  CssClass="form-control" AutoCompleteType="Disabled"/>
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" ID="txtPassword" Placeholder="Password" TextMode="Password" CssClass="form-control"/>
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" ID="txtCPassword" Placeholder="Confirm Password" TextMode="Password" CssClass="form-control"/>
                    </div>
                    <div class="form-group">
                        <asp:TextBox runat="server" ID="txtMob" Placeholder="Mobile No." TextMode="Phone"  CssClass="form-control" AutoCompleteType="Disabled"/>
                    </div>
                    <div class="form-group ">
                        <asp:TextBox runat="server" ID="txtAddress" Placeholder="Address" TextMode="MultiLine" CssClass="form-control" AutoCompleteType="Disabled"/>
                    </div>
                    <div class="form-group">
                        <asp:Label Text="" ID="lblMsg" runat="server" CssClass="col-form-label" />
                    </div>
                    <div class="form-group">
                        <asp:Button Text="Register" ID="btnRegister" runat="server" CssClass="btn1" OnClick="btnRegister_Click" OnClientClick="return validation()" />
                    </div>
                    <asp:HyperLink NavigateUrl="~/Forms/Login.aspx" Text="I Have Account" ID="hlLogin" CssClass="page-link" runat="server" />
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
       
        function validation() {
            var mob = document.getElementById("txtMob").value;
            var name = document.getElementById("txtName").value;
            var pass1 = document.getElementById("txtPassword").value;
            var pass2 = document.getElementById("txtCPassword").value;
           
            if (pass1 != pass2) {
                window.alert("Password & Confirm Password Can not Matched");
                return false;
            }
            else if (pass1 == "" || pass2 == "") {
                alert("Password may not be Empty");
                return false;
            }
            
            if (name == "") {
                alert("UserName may not be Empty");
                return false;
            }
            
            if (mob == "") {
                alert("Mobile Number may not be Empty");
                return false;
            }
            else if (mob.length != 10) {
                alert("Mobile Number should be 10 digit");
                return false;
            }

            return true;
            
        }
    </script>
    

</body>
</html>
