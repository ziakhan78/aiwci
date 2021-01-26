<%@ Page Title="District Club List" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ViewDistrictClubs.aspx.cs" Inherits="Admin_ViewDistrictClubs" %>

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
                            <span style="float: right;"><a class="btn btn-success btn-sm" href="DistrictClubs.aspx"><i class="glyphicon glyphicon-plus-sign"></i>&nbsp;Add District Club</a></span>
                        </div>

                        <div class="box-content">
                            <div style="padding-bottom:5px;">
                                 <asp:RadioButtonList ID="rbtnType" runat="server" RepeatDirection="Horizontal" CssClass="ChkBoxClass" AutoPostBack="true" OnSelectedIndexChanged="rbtnType_SelectedIndexChanged">
                                                           
                                                            <asp:ListItem Selected="True" Text="Active" Value="0"></asp:ListItem>
                                                                                           <asp:ListItem  Text="Inactive" Value="1"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                <asp:DropDownList ID="ddlDistNo" runat="server" CssClass="form-control" Width="200px" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlDistNo_SelectedIndexChanged" >
                                    <asp:ListItem Value="0" Text="Select District No."></asp:ListItem>
                                    <asp:ListItem Value="1" Text="All"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="false" AllowSorting="false" Skin="Bootstrap" PageSize="50" OnItemCommand="RadGrid1_ItemCommand" GridLines="None">
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

                                       

                                        <telerik:GridBoundColumn DataField="voting_eligibility" HeaderText="Voting Eligibility"
                                            SortExpression="voting_eligibility" UniqueName="voting_eligibility">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridBoundColumn>



                                        <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False">
                                            <ItemTemplate>
                                                <a href='DistrictClubs.aspx?id=<%# Eval("id") %>'>
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
                                <HeaderStyle Font-Bold="True" Font-Underline="true" />
                                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                <AlternatingItemStyle CssClass="treeView" />
                                <ItemStyle CssClass="treeView" />
                            </telerik:RadGrid>

                          <%--  <asp:SqlDataSource ID="DSDistNo" runat="server"
                                ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                SelectCommand="z_GetClubByDistNo" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlDistNo" Name="district_no" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>--%>
                        </div>
                           <div class="col-md-8 pull-left">
                    <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false" ForeColor="Red" ></asp:Label>
                </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

