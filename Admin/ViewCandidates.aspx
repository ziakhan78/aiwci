<%@ Page Title="Candidate List" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ViewCandidates.aspx.cs" Inherits="Admin_ViewCandidates" %>

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
                            <span style="float: right;"><a class="btn btn-success btn-sm" href="Candidates.aspx"><i class="glyphicon glyphicon-plus-sign"></i>&nbsp;Add Candidate</a></span>
                        </div>

                        <div class="box-content">
                            <div style="padding-bottom: 5px;">
                                <asp:DropDownList ID="ddlElectionName" runat="server" width="50%" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlElectionName_SelectedIndexChanged">
                                   
                                </asp:DropDownList>
                            </div>
                        <%--    <div style="padding-bottom: 5px; float: right;">
                                <asp:DropDownList ID="DDLYears" runat="server" Width="200px" CssClass="form-control" AppendDataBoundItems="true" AutoPostBack="True">
                                    <asp:ListItem Value="0" Text="Select Years"></asp:ListItem>
                                </asp:DropDownList>
                            </div>--%>

                            <div class="row">
                                <div class="col-md-12">


                                    <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="false" 
                                        AllowSorting="false" Skin="Bootstrap" OnItemCommand="RadGrid1_ItemCommand" GroupPanelPosition="Top">
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
                                                    <HeaderStyle Font-Underline="false" />
                                                </telerik:GridTemplateColumn>


                                                <telerik:GridBoundColumn DataField="name" HeaderText="Name"
                                                    SortExpression="name" UniqueName="name">
                                                    <ColumnValidationSettings>
                                                        <ModelErrorMessage Text="" />
                                                    </ColumnValidationSettings>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                                </telerik:GridBoundColumn>


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



                                              




                                                <telerik:GridBoundColumn DataField="joining_date" HeaderText="Year of Joining"
                                                    SortExpression="joining_date" UniqueName="joining_date">
                                                    <ColumnValidationSettings>
                                                        <ModelErrorMessage Text="" />
                                                    </ColumnValidationSettings>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" Width="130px" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="130px"></ItemStyle>
                                                </telerik:GridBoundColumn>



                                                <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False">
                                                    <ItemTemplate>
                                                        <a href='Candidates.aspx?id=<%# Eval("id") %>'>
                                                            <img src="images/edit.gif" alt="Edit" border="0" title="Edit" style="height:18px; width:18px"  />
                                                        </a>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" Font-Underline="false"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="40px"></ItemStyle>
                                                </telerik:GridTemplateColumn>

                                                <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="false">
                                                    <ItemTemplate>
                                                        <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Do you want to delete?" TargetControlID="imgDeleteP">
                                                        </cc1:ConfirmButtonExtender>

                                                        <asp:ImageButton ID="imgDeleteP" CommandName="Delete" ToolTip="Delete"
                                                            CommandArgument='<%# Eval("id") %>' runat="Server"
                                                            AlternateText="Delete" ImageUrl="images/delete.gif" Height="18px" Width="18px" />
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" Width="30px" Font-Underline="false" />
                                                    <ItemStyle HorizontalAlign="Center" Width="30px" VerticalAlign="Top" />
                                                </telerik:GridTemplateColumn>
                                            </Columns>
                                        </MasterTableView>
                                        <HeaderStyle Font-Bold="True"  />
                                        <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                        <AlternatingItemStyle CssClass="treeView" />
                                        <ItemStyle CssClass="treeView" />
                                    </telerik:RadGrid>

                                 <%--   <asp:SqlDataSource ID="DSCandidates" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                        SelectCommand="z_GetCandidatesByElectionName" SelectCommandType="StoredProcedure">
                                        <SelectParameters>                                            
                                            <asp:ControlParameter ControlID="ddlElectionName" Name="election_name" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>--%>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

