<%@ Page Title="View District No." Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ViewVotingResultReport.aspx.cs" Inherits="Admin_ViewVotingResultReport" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>

    <div id="content" class="col-lg-12 col-sm-10">
        <!-- content starts -->
        <div>
            <ul class="breadcrumb">
                <li>
                    <h4>Voting Result - Report</h4>
                </li>
            </ul>
        </div>

        <div class="row">
            <div class="col-md-10">

                <div class="col-md-6 ">

                    <div class="col-md-6">
                        <asp:DropDownList ID="ddlDistNo" runat="server" CssClass="form-control" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlDistNo_SelectedIndexChanged">
                            <asp:ListItem Value="0" Text="Select District No."></asp:ListItem>
                        </asp:DropDownList>

                    </div>

                    <div class="col-md-6 ">
                        <asp:DropDownList ID="DDLYears" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="DDLYears_SelectedIndexChanged">
                            <asp:ListItem Value="0" Text="Select Years"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-6">
                </div>


            </div>
        </div>


        <div class="row">
            <div class="col-md-8">
                <div class="form-horizontal">
                    <div class="form-group">
                        <div class="col-md-8">

                            <telerik:RadGrid ID="RadGrid4" runat="server" AllowPaging="false" AllowSorting="false" Skin="Bootstrap" PageSize="100" CssClass="treeView" OnExcelMLWorkBookCreated="RadGrid4_ExcelMLWorkBookCreated">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                <MasterTableView AutoGenerateColumns="False">
                                    <Columns>
                                        <telerik:GridTemplateColumn HeaderText="Sr.">
                                            <ItemTemplate>
                                                <%# Container.DataSetIndex +1 %>
                                            </ItemTemplate>
                                            <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridBoundColumn DataField="name" HeaderText="Name"
                                            SortExpression="name" UniqueName="name">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="club_name" HeaderText="Club Name"
                                            SortExpression="club_name" UniqueName="club_name">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="Vote" HeaderText="Vote"
                                            SortExpression="Vote" UniqueName="Vote">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="preference" HeaderText="Preference"
                                            SortExpression="preference" UniqueName="preference">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridBoundColumn>

                                    </Columns>
                                </MasterTableView>
                                <HeaderStyle Font-Bold="true" />
                                <ItemStyle HorizontalAlign="Left" />
                            </telerik:RadGrid>

                        </div>

                        <div class="col-md-8 pull-left">
                            <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false" CssClass="txt_validation"></asp:Label>
                        </div>
                    </div>
                    <div>
                        <asp:Button ID="btnExporttoExcel" runat="server"
                            OnClick="btnExporttoExcel_Click" Text="Export to Excel" CssClass="btn btn-primary" />
                        <asp:SqlDataSource ID="DSDistClubNo" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnString %>"
                            SelectCommand="SELECT * FROM [clubs_tbl] where district_no='3141' order by club_name asc"></asp:SqlDataSource>
                    </div>


                </div>

                 <div class="clearfix" style="text-align: center; margin-top: 15px; margin-bottom: 15px;">
                    <div class="col-md-12">                        
                        <strong style="font-size: 16px;">
                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Display="Dynamic" ></asp:Label></strong>

                    </div>

                </div>
            </div>
        </div>



    </div>

    <%--  </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

