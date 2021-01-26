<%@ Page Title="District No." Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="DistrictNo.aspx.cs" Inherits="Admin_DistrictNo" %>

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
                            <span style="float: right;"><a class="btn btn-info btn-sm" href="ViewDistrictNo.aspx"><i class="glyphicon glyphicon-th-list"></i>&nbsp;District No. List</a></span>
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
                                                    <asp:Label runat="server" AssociatedControlID="txtDistNo" CssClass="col-md-3 control-label"><span class="mandSymb">* </span>District No.</asp:Label>
                                                    <div class="col-md-9">
                                                        <telerik:RadNumericTextBox ID="txtDistNo" runat="server" CssClass="form-control" Skin="Silk" Width="100px" MaxLength="8" Height="38px">
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
                                                        <asp:RequiredFieldValidator ID="RFVDistNo" runat="server"
                                                            ControlToValidate="txtDistNo" CssClass="txt_validation" Display="Dynamic"
                                                            ErrorMessage="Can't be left blank!" ValidationGroup="D"></asp:RequiredFieldValidator>
                                                        <asp:CustomValidator ID="CVDistNo" runat="server"
                                                            ControlToValidate="txtDistNo" CssClass="txt_validation" Display="Dynamic"
                                                            ErrorMessage="* Already Exists."
                                                            OnServerValidate="CVDistNo_ServerValidate" ValidationGroup="D"></asp:CustomValidator>
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


