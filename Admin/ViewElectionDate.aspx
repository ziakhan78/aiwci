

<%@ Page Title="Election Dates" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ViewElectionDate.aspx.cs" Inherits="Admin_ViewElectionDate" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <style>
    .RadGrid_Bootstrap .rgRow>td, .RadGrid_Bootstrap .rgAltRow>td, .RadGrid_Bootstrap .rgEditRow>td{
        padding:0px 5px 0px 5px;
        margin:0px 5px 0px 5px;
    }
</style>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="box col-md-12">
                    <div class="box-inner">
                        <div class="box-header well" data-original-title="">
                            <h2><i class="glyphicon glyphicon-star-empty"></i>
                                <asp:Label ID="lblHeading" runat="server"></asp:Label></h2>
                            <span style="float: right;"><a class="btn btn-success btn-sm" href="ElectionDate.aspx"><i class="glyphicon glyphicon-plus-sign"></i>&nbsp;Add Election</a></span>
                        </div>
                        <div class="box-content">
                            <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" DataSourceID="DSElectionDate"
                                AllowSorting="True" Skin="Bootstrap" PageSize="10" OnItemCommand="RadGrid1_ItemCommand" GridLines="None" OnItemDataBound="RadGrid1_ItemDataBound">
                                <HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

                                <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="DSElectionDate">
                                    <RowIndicatorColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>

                                    <ExpandCollapseColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                    <CommandItemSettings ExportToPdfText="Export to Pdf" />
                                    <Columns>

                                        <telerik:GridTemplateColumn HeaderText="Sr.">
                                            <ItemTemplate>
                                                <%# Container.DataSetIndex +1 %>
                                            </ItemTemplate>
                                            <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        </telerik:GridTemplateColumn>


                                      <%--  <telerik:GridBoundColumn DataField="district_no" HeaderText="District No."
                                            SortExpression="district_no" UniqueName="district_no">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridBoundColumn>--%>

                                          <telerik:GridBoundColumn DataField="election_name" HeaderText="Election Name"
                                            SortExpression="election_name" UniqueName="election_name">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="years" HeaderText="Years"
                                            SortExpression="years" UniqueName="years">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridBoundColumn>


                                        <telerik:GridBoundColumn DataField="start_date" HeaderText="Start Date"
                                            SortExpression="start_date" UniqueName="start_date" DataFormatString="{0:dd-MMMM-yyyy}">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="end_date" HeaderText="End Date"
                                            SortExpression="end_date" UniqueName="end_date" DataFormatString="{0:dd-MMMM-yyyy}">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridBoundColumn>


                                        <telerik:GridBoundColumn DataField="voting_days" HeaderText="Voting Days"
                                            SortExpression="voting_days" UniqueName="voting_days">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridBoundColumn>

                                        <%--   <telerik:GridBoundColumn DataField="status" HeaderText="Status"
                                        SortExpression="status" UniqueName="status" >
                                        <ColumnValidationSettings>
                                            <ModelErrorMessage Text="" />
                                        </ColumnValidationSettings>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridBoundColumn>--%>

                                        <telerik:GridTemplateColumn HeaderText="Status">
                                            <ItemTemplate>
                                                <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridTemplateColumn>


                                        <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False">
                                            <ItemTemplate>
                                                <a href='ElectionDate.aspx?id=<%# Eval("id") %>'>
                                                    <img src="images/edit.gif" alt="Edit" border="0" title="Edit" style="height:18px; width:18px" />
                                                </a>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="40px"></ItemStyle>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="false" HeaderStyle-Font-Underline="false">
                                            <ItemTemplate>
                                                <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Do you want to delete?" TargetControlID="imgDeleteP">
                                                </cc1:ConfirmButtonExtender>

                                                <asp:ImageButton ID="imgDeleteP" CommandName="Delete" ToolTip="Delete"
                                                    CommandArgument='<%# Eval("id") %>' runat="Server"
                                                    AlternateText="Delete" ImageUrl="images/delete.gif" Height="18px" Width="18px" />
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" Width="30px" />
                                            <ItemStyle HorizontalAlign="Center" Width="30px" VerticalAlign="Top" />
                                        </telerik:GridTemplateColumn>

                                    </Columns>
                                </MasterTableView>
                                <HeaderStyle Font-Bold="True" />
                                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                <AlternatingItemStyle CssClass="treeView" />
                                <ItemStyle CssClass="treeView" />
                            </telerik:RadGrid>
                            <asp:SqlDataSource ID="DSElectionDate" runat="server"
                                ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                SelectCommand="SELECT * from View_ElectionDates order by start_date"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>



