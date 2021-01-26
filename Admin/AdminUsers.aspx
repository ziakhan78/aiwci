<%@ Page Title="Add Admin User" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AdminUsers.aspx.cs" Inherits="Admin_AdminUsers" %>

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
                            <span style="float: right;"><a class="btn btn-info btn-sm" href="ViewAdminUsers.aspx"><i class="glyphicon glyphicon-th-list"></i>&nbsp;Admin User List</a></span>
                        </div>

                        <div class="box-content">
                            <div class="row">
                                <div class="col-md-8">
                                    <section id="loginForm">
                                        <div class="form-horizontal">
                                            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">

                                                <h6 style="float: right"><span class="mandSymb">* </span>Denotes required field.</h6>
                                                <br />
                                                <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="False">
                                                    <p class="text-danger">
                                                        <asp:Literal runat="server" ID="FailureText" />
                                                    </p>

                                                </asp:PlaceHolder>



                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtFirstName" CssClass="col-md-3 control-label"><span class="mandSymb">* </span>First Name</asp:Label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox runat="server" ID="txtFirstName" CssClass="form-control" />
                                                        <asp:RequiredFieldValidator ID="rfvName" runat="server"
                                                            ControlToValidate="txtFirstName" CssClass="txt_validation" Display="Dynamic"
                                                            ErrorMessage="Can't be left blank!" ValidationGroup="U"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtLastName" CssClass="col-md-3 control-label"><span class="mandSymb">* </span>Last Name</asp:Label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox runat="server" ID="txtLastName" CssClass="form-control" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                            ControlToValidate="txtLastName" CssClass="txt_validation" Display="Dynamic"
                                                            ErrorMessage="Can't be left blank!" ValidationGroup="U"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>



                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtUsername" CssClass="col-md-3 control-label"><span class="mandSymb">* </span>Username</asp:Label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control" />
                                                        <asp:RequiredFieldValidator ID="rfvUsername" runat="server"
                                                            ControlToValidate="txtUsername" Display="Dynamic" ErrorMessage="Can't be left blank"
                                                            ValidationGroup="U" CssClass="txt_validation"></asp:RequiredFieldValidator>
                                                        <asp:CustomValidator ID="cvUsername" runat="server"
                                                            ControlToValidate="txtUsername" Display="Dynamic"
                                                            ErrorMessage="User name allready exists."
                                                            OnServerValidate="cvuname_ServerValidate" ValidationGroup="U" CssClass="txt_validation"></asp:CustomValidator>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtPassword" CssClass="col-md-3 control-label"><span class="mandSymb">* </span>Password</asp:Label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" MaxLength="15" />

                                                        <cc1:PasswordStrength ID="PasswordTextBox_PasswordStrength" runat="server"
                                                            Enabled="True" TargetControlID="txtPassword">
                                                        </cc1:PasswordStrength>

                                                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                                                            ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Can't be left blank"
                                                            ValidationGroup="U" CssClass="txt_validation"></asp:RequiredFieldValidator>

                                                        <asp:RegularExpressionValidator ID="revPass" runat="server" ControlToValidate="txtPassword" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Password should be 6-15 characters in length." ValidationExpression="^[\s\S]{6,15}$" ValidationGroup="U"></asp:RegularExpressionValidator>

                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtConfirmPassword" CssClass="col-md-3 control-label"><span class="mandSymb">* </span>Confirm Password</asp:Label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" MaxLength="15" />
                                                        <asp:RequiredFieldValidator ID="rfname1" runat="server"
                                                            ControlToValidate="txtConfirmPassword" Display="Dynamic"
                                                            ErrorMessage="Can't be left blank" ValidationGroup="U" CssClass="txt_validation"></asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="CompareValidator1" runat="server"
                                                            ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"
                                                            Display="Dynamic" ErrorMessage="Password doesn't match" ValidationGroup="U" CssClass="txt_validation"></asp:CompareValidator>
                                                    </div>
                                                </div>



                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="UViewCheckBox" CssClass="col-md-3 control-label"><span class="mandSymb">* </span>Permissions</asp:Label>
                                                    <div class="col-md-9">
                                                        <asp:CheckBox ID="UViewCheckBox" runat="server" Checked='True' Text="View" />

                                                        <asp:CheckBox ID="UAddCheckBox" runat="server" Checked='<%# Bind("UAdd") %>' Text="Add" />

                                                        <asp:CheckBox ID="UEditCheckBox" runat="server" Checked='<%# Bind("UEdit") %>' Text="Edit" />

                                                        <asp:CheckBox ID="UDeleteCheckBox" runat="server" Checked='<%# Bind("UDelete") %>' Text="Delete" />
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtDesignation" CssClass="col-md-3 control-label">Designation</asp:Label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox runat="server" ID="txtDesignation" CssClass="form-control" />
                                                    </div>
                                                </div>




                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-md-3 control-label"><span class="mandSymb">* </span>Email</asp:Label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" />
                                                        <asp:RequiredFieldValidator ID="rfemail" runat="server"
                                                            ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Can't be left blank"
                                                            ValidationGroup="U" CssClass="txt_validation"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                                                ID="revemail" runat="server" ControlToValidate="txtEmail" Display="Dynamic"
                                                                ErrorMessage="Invalid email id"
                                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                                ValidationGroup="U" CssClass="txt_validation"></asp:RegularExpressionValidator><asp:CustomValidator
                                                                    ID="cvemail" runat="server"
                                                                    ControlToValidate="txtEmail" Display="Dynamic"
                                                                    ErrorMessage="Emai id allready exists "
                                                                    OnServerValidate="cvemail_ServerValidate" ValidationGroup="U" CssClass="txt_validation"></asp:CustomValidator>
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtMobile" CssClass="col-md-3 control-label">Mobile</asp:Label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox runat="server" ID="txtMobile" CssClass="form-control" />
                                                    </div>
                                                </div>



                                                <div class="form-group">
                                                    <div class="col-md-offset-3 col-md-9">
                                                        <asp:Button ID="btnSubmit" runat="server" OnClick="Submit" Text="Submit" CssClass="btn btn-primary" ValidationGroup="U" />
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
