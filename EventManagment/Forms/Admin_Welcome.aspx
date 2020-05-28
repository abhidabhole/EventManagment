`<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Welcome.aspx.cs" Inherits="EventManagment.Forms.Admin_Welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <script src="https://kit.fontawesome.com/d19eeab89f.js" ></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Patua+One&family=Righteous&family=Russo+One&display=swap" rel="stylesheet" />
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

        .form-control{
            padding:7px;
            font-size: 1.2em;
        }
        .form-group{
            margin-bottom:1rem;
        }
        .container h1{
            font-size:7vw;
            text-shadow: 0px 5px 20px steelblue;
            color:white; 
        }
        .book-cont{
            box-shadow:1px 1px 25px grey;
            border-radius:10px;
            margin-top:70px;
            padding-top:70px;
            padding-bottom:70px;
            background: linear-gradient(to left, #26A0F2, #314786);
        }
        .cont-info{
            padding:20px 100px 20px 100px;
        }

        .btn1{
            border-radius: 5px;
            background: linear-gradient(to right, #26A0F2, #314786);
            border: none;
            color: white;
            text-align: center;
            text-transform: uppercase;
            font-size: 22px;
            padding: 12px;
            width: 50%;
            transition: 0.5s;
        }
        .btn1:hover{
            
            box-shadow:1px 1px 20px steelblue;
        }
        #btnLogout:hover{
            box-shadow:1px 1px 20px steelblue;
        }
        #AdminBooking:hover{
            box-shadow:1px 1px 20px steelblue;
        }
        @media (max-width: 750px)  {
            .cmpname{
                text-align:right;
            }
            .cont-info{
                padding: 20px 10px 20px 10px;
            }
            .cmpname h2{
            font-size:2rem;
            }
            .wel, .logout-btn{
                width:50%;
            } 
            .container h1 {
                font-size: 12vw;
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

        <div class="row container-fluid wel-row pt-2">
            <div class="col-lg-6 col-md-6 col-Welcome wel">
                <h3>Welcome <asp:Label Text="" CssClass="text-danger" runat="server" ID="lblUsername" /></h3>
            </div>
            <div class="col-lg-5 col-md-5 col-sm-6 text-right logout-btn">
                <asp:Button Text="BOOKING" ID="AdminBooking" CssClass="btn btn-warning" runat="server" OnClick="AdminBooking_Click" />
                <asp:Button Text="LOGOUT" ID="btnLogout" CssClass="btn btn-danger" runat="server" OnClick="btnLogout_Click"  />
            </div>
        </div>
        <hr />

        <div class="container book-cont text-center">
              
            <h1 class="adminh1">Admin Page</h1>
            
        </div>
        <br />
        <br />
        <br />
         <div class="footer"><h5 class="copyrt"><i class="far fa-copyright"></i> Copyright Abhi Dabhole</h5></div>
    </form>
</body>
</html>
