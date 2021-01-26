<%@ Page Title="Add District Club" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="DistrictClubs.aspx.cs" Inherits="Admin_DistrictClubs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /*.ChkBoxClass input {
            margin: 3px 3px 0 0;
        }*/
    </style>
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
                            <span style="float: right;"><a class="btn btn-info btn-sm" href="ViewDistrictClubs.aspx"><i class="glyphicon glyphicon-th-list"></i>&nbsp;District Club List</a></span>
                        </div>
                        <div class="box-content">
                            <div class="row">
                                <div class="col-md-8">
                                    <section id="loginForm">
                                        <div class="form-horizontal">
                                            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">

                                               
                                               

                                                 <div class="form-group">
                                                    <asp:Label runat="server" CssClass="col-md-3 control-label"><span class="mandSymb">* </span><i>Denotes required field.</i></asp:Label>
                                                    <div class="col-md-9">
                                                        
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="ddlDistNo" CssClass="col-md-3 control-label"><span class="mandSymb">* </span>IW District No.</asp:Label>
                                                    <div class="col-md-9">
                                                        <asp:DropDownList ID="ddlDistNo" runat="server" CssClass="form-control" Width="100px">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RFVDistNo" runat="server"
                                                            ControlToValidate="ddlDistNo" CssClass="txt_validation" Display="Dynamic" InitialValue="Select"
                                                            ErrorMessage="Can't be left blank!" ValidationGroup="D"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtClubNo" CssClass="col-md-3 control-label"><span class="mandSymb">* </span>IW Club No.</asp:Label>
                                                    <div class="col-md-9">
                                                        <telerik:RadNumericTextBox ID="txtClubNo" runat="server" CssClass="form-control" Skin="Silk" Width="100px" MaxLength="8" Height="38px">
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
                                                        <asp:RequiredFieldValidator ID="rfvRINo" runat="server"
                                                            ControlToValidate="txtClubNo" CssClass="txt_validation" Display="Dynamic"
                                                            ErrorMessage="Can't be left blank!" ValidationGroup="D"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtClubName" CssClass="col-md-3 control-label"><span class="mandSymb">* </span>IW Club Name</asp:Label>
                                                    <div class="col-md-9">
                                                        <asp:TextBox runat="server" ID="txtClubName" CssClass="form-control" />
                                                        <asp:RequiredFieldValidator ID="rfvClubName" runat="server"
                                                            ControlToValidate="txtClubName" CssClass="txt_validation" Display="Dynamic"
                                                            ErrorMessage="Can't be left blank!" ValidationGroup="D"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtActiveMem" CssClass="col-md-3 control-label"><span class="mandSymb">* </span>Members</asp:Label>
                                                    <div class="col-md-9">
                                                        <telerik:RadNumericTextBox ID="txtActiveMem" runat="server" CssClass="form-control" Skin="Silk" Width="100px" MaxLength="8" Height="38px" >
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
                                                        <asp:RequiredFieldValidator ID="rfvActiveMem" runat="server"
                                                            ControlToValidate="txtActiveMem" CssClass="txt_validation" Display="Dynamic"
                                                            ErrorMessage="Can't be left blank!" ValidationGroup="D"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                              <%--  <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtHonoraryMem" CssClass="col-md-3 control-label">Honorary Members</asp:Label>
                                                    <div class="col-md-9">
                                                        <telerik:RadNumericTextBox ID="txtHonoraryMem" runat="server" CssClass="form-control" Skin="Silk" Width="100px" MaxLength="8" Height="38px" AutoPostBack="True" OnTextChanged="txtHonoraryMem_TextChanged">
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
                                                    <asp:Label runat="server" AssociatedControlID="txtHonoraryMem" CssClass="col-md-3 control-label">Total</asp:Label>
                                                    <div class="col-md-9">
                                                        <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtHonoraryMem" CssClass="col-md-3 control-label">Eligible Votes</asp:Label>
                                                    <div class="col-md-9">
                                                        <asp:Label ID="lblEligibleVotes" runat="server"></asp:Label>
                                                    </div>
                                                </div>--%>


                                                <div class="form-group">

                                                    <div class="col-md-3" style="text-align: right"><strong>Voting Eligibility</strong></div>
                                                    <div class="col-md-9">
                                                        <asp:RadioButtonList ID="rbtnVEligibility" runat="server" RepeatDirection="Horizontal" CssClass="ChkBoxClass">
                                                            <asp:ListItem Selected="True" Text="Yes" Value="Yes"></asp:ListItem>
                                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                                        </asp:RadioButtonList>
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

