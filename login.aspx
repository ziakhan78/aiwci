<%@ Page Title="Login" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>AIWCI E-Voting 2020-2021 - Login </title>

   <style>
        .chk {
            text-indent: 2px;
        }

        .txt_validation {
            color: red;
            font-style: italic;
        }
        .well {
    min-height: 20px;
    padding: 19px;
    margin-bottom: 20px;
    background-color: #f5f5f5;
    border: 1px solid #e3e3e3;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,0.05);
    box-shadow: inset 0 1px 1px rgba(0,0,0,0.05);
}
    </style>

     <script src="js/jquery.min.js"></script>
   <script>
    $(document).ready(function () {
        $('#bannerImg')
            .attr('src', 'images/inner-banner.jpg')
           // .width('64px')
            .height('200px');
    });
</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--    <div class="heading_strip">

        <div class="container">
            <div class="row">
                <div class="col-md-12  pt-2 pb-2">

                    <ul class="breadcrumb  pull-right">
                        <li class="breadcrumb-item "><a href="Default.aspx"><i class="fa fa-home"></i></a></li>
                        <li class="breadcrumb-item active">Candidates</li>
                    </ul>

                    <h2>Candidates</h2>
                </div>
            </div>
        </div>
    </div>--%>




    <section>
       <div class="container">
            <div class="row ">
                <div class="col-lg-6 mt-4 mx-auto well">
                    <div class="alert alert-info">
                        Please login with your Username and Password.
                    </div>
                    <div class="form-horizontal">
                        <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
                            <fieldset>
                                <div class="input-group input-group-lg">
                                 <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-user" aria-hidden="true"></i></span></div>
                                   <asp:TextBox ID="txtLoginUsername" runat="server" class="form-control" placeholder="Username"></asp:TextBox>
                                  

                                </div>

                              
                                <p>
                                 <asp:RequiredFieldValidator ID="rfvUsername" runat="server"
                                        ControlToValidate="txtLoginUsername" CssClass="txt_validation" Display="Dynamic"
                                        ErrorMessage="Can't be left blank!" ValidationGroup="L"></asp:RequiredFieldValidator>
                                </p>
                                <div class="clearfix"></div>


                                <div class="input-group input-group-lg">
                                       <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-lock" aria-hidden="true"></i></span></div>
                                    <asp:TextBox ID="txtLoginPassword" runat="server" TextMode="Password" class="form-control" placeholder="Password"></asp:TextBox>

                                </div>
                                <p>
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                                        ControlToValidate="txtLoginPassword" CssClass="txt_validation" Display="Dynamic"
                                        ErrorMessage="Can't be left blank!" ValidationGroup="L"></asp:RequiredFieldValidator>
                                </p>
                                <div class="clearfix"></div>
                                <br>


                                <div class="input-group input-group-lg">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Login" CssClass="btn btn-primary" ValidationGroup="L" OnClick="btnSubmit_Click" />

                                </div>
                            </fieldset>
                        </asp:Panel>
                    </div>
                </div>
                <!--/span-->
            </div>
        </div>
    </section>
</asp:Content>


