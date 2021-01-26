<%@ Page Title="View Voted Clubs Report" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ViewNotVotedClubsReport.aspx.cs" Inherits="Admin_ViewNotVotedClubsReport" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row">
        <div class="box col-md-12">
            <div class="box-inner">
                <div class="box-header well" data-original-title="">
                    <h2><i class="glyphicon glyphicon-star-empty"></i>
                        View Not Voted Clubs Report</h2>

                </div>

                <div class="box-content">

                    <div style="padding-bottom: 5px;">
                        

                          <div class="col-md-4 form-group" style="margin-top: 20px;">
                             <label for="ddlElectionName">Election Name/Post:</label>
                                <asp:DropDownList ID="ddlElectionName" runat="server" Width="99%" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlElectionName_SelectedIndexChanged" >                                 
                                </asp:DropDownList>
                            </div>

                         <div class="col-md-4 form-group" style="margin-top: 20px;">
                             <label for="ddlDistNo">District:</label>
                        <asp:DropDownList ID="ddlDistNo" runat="server" CssClass="form-control" Width="200px" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlDistNo_SelectedIndexChanged">
                            <asp:ListItem Value="0" Text="Select"></asp:ListItem> 
                            <asp:ListItem Value="1" Text="All"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    </div>

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

                                <telerik:GridBoundColumn DataField="active_members" HeaderText="Active Members"
                                    SortExpression="active_members" UniqueName="active_members">
                                    <ColumnValidationSettings>
                                        <ModelErrorMessage Text="" />
                                    </ColumnValidationSettings>
                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                </telerik:GridBoundColumn>


                              <%--  <telerik:GridBoundColumn DataField="eligible_votes" HeaderText="Vote(s)"
                                    SortExpression="eligible_votes" UniqueName="eligible_votes">
                                    <ColumnValidationSettings>
                                        <ModelErrorMessage Text="" />
                                    </ColumnValidationSettings>
                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                </telerik:GridBoundColumn>--%>


                                <telerik:GridTemplateColumn HeaderText="President">
                                    <ItemTemplate>
                                        <%# Eval("first_name") %> <%# Eval("last_name") %>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                </telerik:GridTemplateColumn>


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



                            </Columns>
                        </MasterTableView>
                        <HeaderStyle Font-Bold="true" />
                        <ItemStyle HorizontalAlign="Left" />
                    </telerik:RadGrid>

                </div>

                <div class="col-md-8 pull-left">
                    <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false" ForeColor="Red" ></asp:Label>
                </div>
            </div>
            <div>
                <asp:Button ID="btnExporttoExcel" runat="server"
                    OnClick="btnExporttoExcel_Click" Text="Export to Excel" CssClass="btn btn-primary" />

            </div>


        </div>

        <div class="clearfix" style="text-align: center; margin-top: 15px; margin-bottom: 15px;">
            <div class="col-md-12">
                <strong style="font-size: 16px;">
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Display="Dynamic"></asp:Label></strong>

            </div>

        </div>
    </div>


</asp:Content>

