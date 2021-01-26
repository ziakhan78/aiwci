<%@ Page Title="Eligible Voters" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="EligibleVoters.aspx.cs" Inherits="Admin_EligibleVoters" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            
            <div id="content" class="col-lg-12 col-sm-10">
                <!-- content starts -->
                <div>
                    <ul class="breadcrumb">
                       
                        <li>
                            <a href="EligibleVoters.aspx">Eligible Voters</a>
                        </li>
                    </ul>
                </div>
            <div class="row">
                <div class="col-md-8">
                    <section id="loginForm">
                        <div class="form-horizontal">
                            <h4>
                                <asp:Label ID="lblHeading" runat="server"></asp:Label></h4>
                            <hr />
                            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="FailureText" />
                                </p>
                            </asp:PlaceHolder>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="ddlDistNo" CssClass="col-md-3 control-label">District No.</asp:Label>
                                <div class="col-md-9">
                                    <asp:DropDownList ID="ddlDistNo" runat="server" AppendDataBoundItems="true" CssClass="form-control" Width="100px">
                                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RFVDistNo" runat="server"
                                        ControlToValidate="ddlDistNo" CssClass="txt_validation" Display="Dynamic"
                                        ErrorMessage="Can't be left blank!" ValidationGroup="D"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="ddlClubName" CssClass="col-md-3 control-label">Club Name</asp:Label>
                                <div class="col-md-9">
                                     <asp:DropDownList ID="ddlClubName" runat="server" AppendDataBoundItems="true" CssClass="form-control">
                                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvRINo" runat="server"
                                        ControlToValidate="ddlClubName" CssClass="txt_validation" Display="Dynamic"
                                        ErrorMessage="Can't be left blank!" ValidationGroup="D"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                               <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtMemberShipNo" CssClass="col-md-3 control-label">Membership No.</asp:Label>
                                <div class="col-md-9">                                   
                                    <telerik:RadNumericTextBox ID="txtMemberShipNo" runat="server" CssClass="form-control" Skin="Silk" Width="100px" MaxLength="8" Height="38px">
                                        <NegativeStyle Resize="None" />
                                        <NumberFormat DecimalDigits="0" GroupSizes="9" ZeroPattern="n" />
                                        <EmptyMessageStyle Resize="None" />
                                        <ReadOnlyStyle Resize="None" />
                                        <FocusedStyle Resize="None" />
                                        <DisabledStyle Resize="None" />
                                        <InvalidStyle Resize="None" />
                                        <HoveredStyle Resize="None" />
                                        <EnabledStyle Resize="None" />
                                    </telerik:RadNumericTextBox>
                                </div>
                            </div>


                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtName" CssClass="col-md-3 control-label">Member Name</asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="txtName" CssClass="form-control" />
                                </div>
                            </div>

                            


                              <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-md-3 control-label">Email</asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" />
                                </div>
                            </div>


                           



                            <div class="form-group">
                                <div class="col-md-offset-3 col-md-9">
                                    <asp:Button runat="server" OnClick="Submit" Text="Submit" CssClass="btn btn-primary" ValidationGroup="D" />
                                </div>
                            </div>
                        </div>

                    </section>
                </div>


            </div>
                </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

