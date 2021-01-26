<%@ Page Title="District Club List" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ViewDistrictClubsReport.aspx.cs" Inherits="Admin_ViewDistrictClubsReport" %>

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
   

            <div class="row">
                <div class="box col-md-12">
                    <div class="box-inner">
                        <div class="box-header well" data-original-title="">
                            <h2><i class="glyphicon glyphicon-star-empty"></i>
                                <asp:Label ID="lblHeading" runat="server"></asp:Label></h2>
                            <span style="float: right;">
                                <asp:Button ID="btnExporttoExcel" runat="server"
                            OnClick="btnExporttoExcel_Click" Text="Export to Excel" CssClass="btn btn-success" />
                            </span>
                        </div>

                        <div class="box-content">
                            <div style="padding-bottom:5px;">
                                <asp:DropDownList ID="ddlDistNo" runat="server" CssClass="form-control" Width="200px" AutoPostBack="true" AppendDataBoundItems="true">
                                   
                                    <asp:ListItem Value="0" Text="Select District No."></asp:ListItem>
                           <asp:ListItem Value="1" Text="All"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="false" DataSourceID="DSDistNo" OnExcelMLWorkBookCreated="RadGrid1_ExcelMLWorkBookCreated"
                                AllowSorting="True" Skin="Bootstrap"  OnItemCommand="RadGrid1_ItemCommand" GridLines="None">
                                <HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

                                <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="DSDistNo">
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
                                            <HeaderStyle Font-Underline="false" />
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridBoundColumn DataField="club_name" HeaderText="IW Club Name"
                                            SortExpression="club_name" UniqueName="club_name">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="district_no" HeaderText="IW District No."
                                            SortExpression="district_no" UniqueName="district_no">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="club_no" HeaderText="IW Club No."
                                            SortExpression="club_no" UniqueName="club_no">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="active_members" HeaderText="Members"
                                            SortExpression="active_members" UniqueName="active_members">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridBoundColumn>

                                       

                                    <%--    <telerik:GridBoundColumn DataField="voting_eligibility" HeaderText="Voting Eligibility"
                                            SortExpression="voting_eligibility" UniqueName="voting_eligibility">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridBoundColumn>--%>
                                                                               
                                      
                                    </Columns>
                                </MasterTableView>
                                <HeaderStyle Font-Bold="True" Font-Underline="true" />
                                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                <AlternatingItemStyle CssClass="treeView" />
                                <ItemStyle CssClass="treeView" />
                            </telerik:RadGrid>

                            <asp:SqlDataSource ID="DSDistNo" runat="server"
                                ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                SelectCommand="z_GetClubByDistNo" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlDistNo" Name="district_no" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>

       

</asp:Content>

