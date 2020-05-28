<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewBookings.aspx.cs" Inherits="EventManagment.Forms.ViewBookings" %>

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
        
        #btnLogout:hover{
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
                <asp:Button Text="HOME" ID="CustomerBooking" CssClass="btn btn-warning" runat="server" OnClick="CustomerBooking_Click" />
                <asp:Button Text="LOGOUT" ID="btnLogout" CssClass="btn btn-danger" runat="server" OnClick="btnLogout_Click"   />
            </div>
        </div>
        <hr />

    <div class="container book-cont text-center">

        <div class="container-fluid">
            <asp:GridView id="GVBooking" CssClass="table-striped table-dark  table-responsive-lg w-100" runat="server" AutoGenerateColumns="False" DataKeyNames="BID" DataSourceID="DSBooking">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" >
                <ControlStyle CssClass="btn btn-danger" />
                </asp:CommandField>
                <asp:BoundField DataField="BID" HeaderText="BID" InsertVisible="False" ReadOnly="True" SortExpression="BID" />
                <asp:BoundField DataField="BNAME" HeaderText="BNAME" SortExpression="BNAME" />
                <asp:BoundField DataField="BSERNAME" HeaderText="BSERNAME" SortExpression="BSERNAME" />
                <asp:BoundField DataField="BEVENT" HeaderText="BEVENT" SortExpression="BEVENT" />
                <asp:BoundField DataField="BDATE" HeaderText="BDATE" SortExpression="BDATE" />
                <asp:BoundField DataField="BVENUE" HeaderText="BVENUE" SortExpression="BVENUE" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="DSBooking" runat="server" ConnectionString="<%$ ConnectionStrings:MyConn %>" SelectCommand="SELECT [BID], [BNAME], [BSERNAME], [BEVENT], [BDATE], [BVENUE] FROM [BOOKING] WHERE ([BCID] = @BCID) ORDER BY [BNAME]" DeleteCommand="DELETE FROM [BOOKING] WHERE [BID] = @BID" InsertCommand="INSERT INTO [BOOKING] ([BNAME], [BSERNAME], [BEVENT], [BDATE], [BVENUE]) VALUES (@BNAME, @BSERNAME, @BEVENT, @BDATE, @BVENUE)" UpdateCommand="UPDATE [BOOKING] SET [BNAME] = @BNAME, [BSERNAME] = @BSERNAME, [BEVENT] = @BEVENT, [BDATE] = @BDATE, [BVENUE] = @BVENUE WHERE [BID] = @BID">
            <DeleteParameters>
                <asp:Parameter Name="BID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="BNAME" Type="String" />
                <asp:Parameter Name="BSERNAME" Type="String" />
                <asp:Parameter Name="BEVENT" Type="String" />
                <asp:Parameter DbType="Date" Name="BDATE" />
                <asp:Parameter Name="BVENUE" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="BCID" SessionField="UID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="BNAME" Type="String" />
                <asp:Parameter Name="BSERNAME" Type="String" />
                <asp:Parameter Name="BEVENT" Type="String" />
                <asp:Parameter DbType="Date" Name="BDATE" />
                <asp:Parameter Name="BVENUE" Type="String" />
                <asp:Parameter Name="BID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
      </div>

    </div>
        <br />
        <br />
        <br />
        <div class="footer"><h5 class="copyrt"><i class="far fa-copyright"></i> Copyright Abhi Dabhole</h5></div>
    </form>
</body>
</html>
