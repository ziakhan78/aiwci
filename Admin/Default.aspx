<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" EnableEventValidation="false" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <meta charset="utf-8" />
    <title>Association of Inner Wheel Clubs in India E-Voting - Admin Panel</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="Zia-9967123398" />

     <link rel="shortcut icon" href="../favicon.png" />
    <!-- The styles -->
    <link href="css/bootstrap-cerulean.min.css" rel="stylesheet" />
    <link href="css/charisma-app.css" rel="stylesheet" />   
    <style>
        .chk{text-indent:2px;}

        	.heading h1{ font-size: 30px; font-weight: 600; margin-top: 10px; color:#333;}
	.heading h1 span{ font-size: 24px;display: block; font-weight: 400; color:#333;}
        .border-bottom { border-bottom:2px solid #ffd800;
        }

       
    </style>
</head>
<body style="background-image:url(img/main_bg.jpg)">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    	

    <div class="container-fluid ">

        <div class="row border-bottom ">
		<div class="col-md-12  col-sm-12 text-center heading ">
			<h1>Association of Inner Wheel Clubs in India
			<span>E-Voting 2020 - 2021</span>
  </h1>
			</div>	
			


	</div>


    <div class="row" style="padding-top:40px;">
        <div class="well col-md-5 center login-box" >
            <div class="alert alert-info">
                <h4>Please login with your Username and Password.</h4>
            </div>
            <div class="form-horizontal" >
                   <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
                <fieldset>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>                        
                        <asp:TextBox ID="txtUsername" runat="server" class="form-control" placeholder="Username"></asp:TextBox>
                    </div>
                    <div class="clearfix"></div><br>

                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>                        
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="form-control" placeholder="Password"></asp:TextBox>
                    </div>
                    <div class="clearfix"></div>

                    <div class="input-prepend">
                        <asp:CheckBox ID="ckremember" runat="server" Text="Remember me" CssClass="chk" />                        
                         <h5>DO NOT check this on public systems (e.g., libraries, internet cafes)</h5>
                    </div>
                    <div class="clearfix"></div>

                    <p class="center col-md-5">                       
                        <asp:Button ID="btnSubmit" runat="server" Text="Login" CssClass="btn btn-primary" ValidationGroup="L" OnClick="btnSubmit_Click" />
                        
                    </p>
                </fieldset>
                       </asp:Panel>
            </div>
        </div>
        <!--/span-->
    </div><!--/row-->


    </div>
    </form>
</body>
</html>
