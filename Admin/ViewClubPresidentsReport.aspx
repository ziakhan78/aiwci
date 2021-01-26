<%@ Page Title="Club President List" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ViewClubPresidentsReport.aspx.cs" Inherits="Admin_ViewClubPresidentsReport" %>

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
    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>

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
                                                                                      <asp:RadioButtonList ID="rbtnType" runat="server" RepeatDirection="Horizontal" CssClass="ChkBoxClass" AutoPostBack="true" OnSelectedIndexChanged="rbtnType_SelectedIndexChanged">
                                                           
                                                            <asp:ListItem Selected="True" Text="District Wise" Value="0"></asp:ListItem>
                                                                                           <asp:ListItem  Text="All" Value="1"></asp:ListItem>
                                                        </asp:RadioButtonList>
                            </div>

                            <div style="padding-bottom:5px;">
                                <asp:DropDownList ID="ddlDistNo" Width="200" runat="server" CssClass="form-control" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlDistNo_SelectedIndexChanged">
                                    <asp:ListItem Value="0" Text="Select District No."></asp:ListItem>
                                </asp:DropDownList>
                            </div>



                                    <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="false" OnExcelMLWorkBookCreated="RadGrid1_ExcelMLWorkBookCreated" OnItemDataBound="RadGrid1_ItemDataBound"
                                        AllowSorting="false" Skin="Bootstrap" GroupPanelPosition="Top" ShowFooter="true">
                                        <HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

                                        <MasterTableView AutoGenerateColumns="False" >
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
                                                     <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                                </telerik:GridTemplateColumn>                                               

                                                                                                <telerik:GridBoundColumn DataField="district_no" HeaderText="District No."
                                                    SortExpression="district_no" UniqueName="district_no">
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


                                                 <telerik:GridBoundColumn DataField="club_no" HeaderText="Charter No."
                                                    SortExpression="club_no" UniqueName="club_no">
                                                    <ColumnValidationSettings>
                                                        <ModelErrorMessage Text="" />
                                                    </ColumnValidationSettings>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                                </telerik:GridBoundColumn>


                                                 <telerik:GridBoundColumn DataField="active_members" HeaderText="No. of Members"
                                                    SortExpression="active_members" UniqueName="active_members">
                                                    <ColumnValidationSettings>
                                                        <ModelErrorMessage Text="" />
                                                    </ColumnValidationSettings>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                                </telerik:GridBoundColumn>


                                                <telerik:GridBoundColumn DataField="first_name" HeaderText="First Name"
                                                    SortExpression="first_name" UniqueName="first_name">
                                                    <ColumnValidationSettings>
                                                        <ModelErrorMessage Text="" />
                                                    </ColumnValidationSettings>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="last_name" HeaderText="Last Name"
                                                    SortExpression="last_name" UniqueName="last_name">
                                                    <ColumnValidationSettings>
                                                        <ModelErrorMessage Text="" />
                                                    </ColumnValidationSettings>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                                </telerik:GridBoundColumn>


                                               


                                                <telerik:GridBoundColumn DataField="email" HeaderText="Email"
                                                    SortExpression="email" UniqueName="email">
                                                    <ColumnValidationSettings>
                                                        <ModelErrorMessage Text="" />
                                                    </ColumnValidationSettings>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                                </telerik:GridBoundColumn>

                                                 <telerik:GridBoundColumn DataField="mobile" HeaderText="Mobile"
                                                    SortExpression="mobile" UniqueName="mobile">
                                                    <ColumnValidationSettings>
                                                        <ModelErrorMessage Text="" />
                                                    </ColumnValidationSettings>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                                </telerik:GridBoundColumn>

                                                 <telerik:GridBoundColumn DataField="password" HeaderText="Password"
                                            SortExpression="password" UniqueName="password">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridBoundColumn>

                                               
                                            </Columns>
                                        </MasterTableView>
                                        <HeaderStyle Font-Bold="True" />
                                        <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                        <AlternatingItemStyle CssClass="treeView" />
                                        <ItemStyle CssClass="treeView" />
                                    </telerik:RadGrid>

                                  <%--  <asp:SqlDataSource ID="DSPresidents" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                        SelectCommand="z_GetPresidentsByDistNo" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlDistNo" Name="district_no" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>--%>
                             

                        </div>

                         
                    </div>
                </div>
            </div>

     <%--   </ContentTemplate>
    </asp:UpdatePanel>--%>

</asp:Content>

