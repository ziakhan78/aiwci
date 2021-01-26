<%@ Page Title="Add Election Date" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ElectionDate.aspx.cs" Inherits="Admin_ElectionDate" %>

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
                            <span style="float: right;"><a class="btn btn-info btn-sm" href="ViewElectionDate.aspx"><i class="glyphicon glyphicon-th-list"></i>&nbsp;View Elections</a></span>
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
                                                    <asp:Label runat="server" AssociatedControlID="txtElecName" CssClass="col-md-3 control-label"><span class="mandSymb">* </span>Election Name</asp:Label>
                                                    <div class="col-md-9">
                                                         <asp:TextBox runat="server" ID="txtElecName" CssClass="form-control" />
                                                        <asp:RequiredFieldValidator ID="txtElcName" runat="server" ControlToValidate="txtElecName" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="D"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="DDLYears" CssClass="col-md-3 control-label"><span class="mandSymb">* </span>Years</asp:Label>
                                                    <div class="col-md-9">
                                                        <asp:DropDownList ID="DDLYears" runat="server" CssClass="form-control" Width="150px" AppendDataBoundItems="true">
                                                            <asp:ListItem>Select</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RFVYear" runat="server" ControlToValidate="DDLYears" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Please select year" InitialValue="Select" ValidationGroup="D"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>





                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="startDate" CssClass="col-md-3 control-label"><span class="mandSymb">* </span>Start Date</asp:Label>
                                                    <div class="col-md-9">
                                                        <telerik:RadDatePicker ID="startDate" runat="server" Skin="Silk" Culture="en-US" AutoPostBack="True" OnSelectedDateChanged="startDate_SelectedDateChanged">
                                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Silk" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                                            </Calendar>
                                                            <DateInput DateFormat="dd-MM-yyyy" DisplayDateFormat="dd-MM-yyyy" LabelWidth="40%" CssClass="date" AutoPostBack="True">
                                                                <EmptyMessageStyle Resize="None" />
                                                                <ReadOnlyStyle Resize="None" />
                                                                <FocusedStyle Resize="None" />
                                                                <DisabledStyle Resize="None" />
                                                                <InvalidStyle Resize="None" />
                                                                <HoveredStyle Resize="None" />
                                                                <EnabledStyle Resize="None" />
                                                            </DateInput>
                                                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                                        </telerik:RadDatePicker>

                                                        <asp:RequiredFieldValidator ID="RFVStartDate" runat="server" ControlToValidate="startDate" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Can't be left blank!" ValidationGroup="D"></asp:RequiredFieldValidator>

                                                    </div>

                                                </div>

                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="endDate" CssClass="col-md-3 control-label"><span class="mandSymb">* </span>End Date</asp:Label>
                                                    <div class="col-md-9">
                                                        <telerik:RadDatePicker ID="endDate" runat="server" Skin="Silk" Culture="en-US" AutoPostBack="True" OnSelectedDateChanged="endDate_SelectedDateChanged">
                                                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" Skin="Silk" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                                            </Calendar>
                                                            <DateInput DateFormat="dd-MM-yyyy" DisplayDateFormat="dd-MM-yyyy" LabelWidth="40%" CssClass="date" AutoPostBack="True">
                                                                <EmptyMessageStyle Resize="None" />
                                                                <ReadOnlyStyle Resize="None" />
                                                                <FocusedStyle Resize="None" />
                                                                <DisabledStyle Resize="None" />
                                                                <InvalidStyle Resize="None" />
                                                                <HoveredStyle Resize="None" />
                                                                <EnabledStyle Resize="None" />
                                                            </DateInput>
                                                            <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                                        </telerik:RadDatePicker>

                                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="startDate" ControlToValidate="endDate" Display="Dynamic" ErrorMessage="End date should be greater than the start date" Operator="GreaterThanEqual" Type="Date" ValidationGroup="D" CssClass="txt_validation"></asp:CompareValidator>

                                                        <h6>
                                                            <asp:Label ID="lblVote" runat="server"></asp:Label>
                                                            Day(s) for voting.</h6>
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <div class="col-md-offset-3 col-md-9">
                                                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Election date already added!" ControlToValidate="endDate" CssClass="txt_validation" Display="Dynamic" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="D"></asp:CustomValidator>
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

