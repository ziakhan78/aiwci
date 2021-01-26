<%@ Page Title="Club President" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ClubPresidents.aspx.cs" Inherits="Admin_ClubPresidents" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <div class="row">
                <div class="box col-md-12">
                    <div class="box-inner">
                        <div class="box-header well" data-original-title="">
                            <h2><i class="glyphicon glyphicon-star-empty"></i>
                                <asp:Label ID="lblHeading" runat="server"></asp:Label></h2>
                            <span style="float: right;"><a class="btn btn-info btn-sm" href="ViewClubPresidents.aspx"><i class="glyphicon glyphicon-th-list"></i>&nbsp;Club President List</a></span>
                        </div>

                        <div class="box-content">

                            <div class="row">
                                <div class="col-md-8">
                                    <section id="loginForm">
                                        <div class="form-horizontal">
                                            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">

                                               
                                                <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="False">
                                                    <p class="text-danger">
                                                        <asp:Literal runat="server" ID="FailureText" />
                                                    </p>
                                                    <asp:CustomValidator ID="CVCandidate" runat="server"
                                                        ControlToValidate="txtName" CssClass="txt_validation" Display="Dynamic"
                                                        ErrorMessage="Candidate Already Exists!"
                                                        OnServerValidate="CVCandidate_ServerValidate" ValidationGroup="D"></asp:CustomValidator>
                                                </asp:PlaceHolder>

                                                  <div class="form-group">
                                                    <asp:Label runat="server" CssClass="col-md-3 control-label"><span class="mandSymb">* </span><i>Denotes required field.</i></asp:Label>
                                                    <div class="col-md-9">
                                                        
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="ddlDistNo" CssClass="col-md-3 control-label"><span class="mandSymb">* </span>District No.</asp:Label>
                                                    <div class="col-md-9">
                                                        <asp:DropDownList ID="ddlDistNo" runat="server" CssClass="form-control" Width="100px" AutoPostBack="True" OnSelectedIndexChanged="ddlDistNo_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RFVDistNo" runat="server"
                                                            ControlToValidate="ddlDistNo" CssClass="txt_validation" Display="Dynamic" InitialValue="Select"
                                                            ErrorMessage="Can't be left blank!" ValidationGroup="D"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="ddlClubName" CssClass="col-md-3 control-label"><span class="mandSymb">* </span>Club Name</asp:Label>
                                                    <div class="col-md-9">
                                                        <asp:DropDownList ID="ddlClubName" runat="server" CssClass="form-control">
                                                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rfvRINo" runat="server"
                                                            ControlToValidate="ddlClubName" CssClass="txt_validation" Display="Dynamic" InitialValue="0"
                                                            ErrorMessage="Can't be left blank!" ValidationGroup="D"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtFirstName" CssClass="col-md-3 control-label"><span class="mandSymb">* </span>First Name</asp:Label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox runat="server" ID="txtFirstName" CssClass="form-control" />
                                                        <asp:RequiredFieldValidator ID="rfvName" runat="server"
                                                            ControlToValidate="txtFirstName" CssClass="txt_validation" Display="Dynamic"
                                                            ErrorMessage="Can't be left blank!" ValidationGroup="D"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtLastName" CssClass="col-md-3 control-label"><span class="mandSymb">* </span>Last Name</asp:Label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox runat="server" ID="txtLastName" CssClass="form-control" />
                                                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server"
                                                            ControlToValidate="txtLastName" CssClass="txt_validation" Display="Dynamic"
                                                            ErrorMessage="Can't be left blank!" ValidationGroup="D"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>



                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-md-3 control-label"><span class="mandSymb">* </span>Email</asp:Label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" />
                                                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                                                            ControlToValidate="txtEmail" CssClass="txt_validation" Display="Dynamic"
                                                            ErrorMessage="Can't be left blank!" ValidationGroup="D"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" CssClass="txt_validation" ValidationGroup="D" Display="Dynamic" ErrorMessage="Invalid Email Id!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>

                                                 <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtMobile" CssClass="col-md-3 control-label">Mobile No.</asp:Label>
                                                    <div class="col-md-9">
                                                         <asp:TextBox runat="server" ID="txtMobile" CssClass="form-control" MaxLength="10" Width="150" />                                                      
                                                       
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <div class="col-md-offset-3 col-md-9">
                                                        <asp:Button ID="btnSubmit" runat="server" OnClick="Submit" Text="Submit" CssClass="btn btn-primary" ValidationGroup="D" />
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>

                                    </section>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
