<%@ Page Title="Admin User List" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ViewAdminUsers.aspx.cs" Inherits="Admin_ViewAdminUsers" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="box col-md-12">
                    <div class="box-inner">
                        <div class="box-header well" data-original-title="">
                            <h2>Admin User List</h2>
                            <span style="float: right;"><a class="btn btn-success btn-sm" href="AdminUsers.aspx"><i class="glyphicon glyphicon-plus-sign"></i> Add New User</a></span>
                        </div>
                        <div class="box-content">
                            <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" DataSourceID="dsUsers"
                                AllowSorting="True" Skin="Bootstrap" PageSize="10" OnItemCommand="RadGrid1_ItemCommand" GridLines="None">
                                <HeaderContextMenu EnableAutoScroll="True">
                                </HeaderContextMenu>


                                <MasterTableView AutoGenerateColumns="False" CellSpacing="-1" DataSourceID="dsUsers"
                                    DataKeyNames="UID">
                                    <RowIndicatorColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </RowIndicatorColumn>

                                    <ExpandCollapseColumn>
                                        <HeaderStyle Width="20px"></HeaderStyle>
                                    </ExpandCollapseColumn>

                                    <Columns>

                                        <telerik:GridTemplateColumn HeaderText="Sr.">
                                            <ItemTemplate>
                                                <%# Container.DataSetIndex +1 %>
                                            </ItemTemplate>
                                            <ItemStyle Width="20px" VerticalAlign="Top" HorizontalAlign="Left"></ItemStyle>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridBoundColumn DataField="UserName" HeaderText="User Name"
                                            SortExpression="UserName" UniqueName="UserName">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="Password" HeaderText="Password"
                                            SortExpression="Password" UniqueName="Password">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="Email" HeaderText="Email"
                                            SortExpression="Email" UniqueName="Email">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>

                                        <telerik:GridCheckBoxColumn DataField="UView" DataType="System.Boolean" AllowFiltering="false" AllowSorting="false" HeaderStyle-Font-Underline="false"
                                            HeaderText="View Permission" SortExpression="UView" UniqueName="UView">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridCheckBoxColumn>

                                        <telerik:GridCheckBoxColumn DataField="UAdd" DataType="System.Boolean" AllowFiltering="false" AllowSorting="false" HeaderStyle-Font-Underline="false"
                                            HeaderText="Add Permission" SortExpression="UAdd" UniqueName="UAdd">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridCheckBoxColumn>

                                        <telerik:GridCheckBoxColumn DataField="UEdit" DataType="System.Boolean" AllowFiltering="false" AllowSorting="false" HeaderStyle-Font-Underline="false"
                                            HeaderText="Edit Permission" SortExpression="UEdit" UniqueName="UEdit">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridCheckBoxColumn>

                                        <telerik:GridCheckBoxColumn DataField="UDelete" DataType="System.Boolean" AllowFiltering="false" AllowSorting="false" HeaderStyle-Font-Underline="false"
                                            HeaderText="Delete Permission" SortExpression="UDelete" UniqueName="UDelete">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </telerik:GridCheckBoxColumn>



                                        <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False">
                                            <ItemTemplate>



                                                <a href="AdminUsers.aspx?id=<%#Eval("UID") %>">
                                                    <img src="images/edit.gif" alt="Edit" border="0" title="Edit" />
                                                </a>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
                                        </telerik:GridTemplateColumn>


                                        <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="false" HeaderStyle-Font-Underline="false">
                                            <ItemTemplate>
                                                <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Do you want to delete?" TargetControlID="imgDeleteP">
                                                </cc1:ConfirmButtonExtender>
                                                <asp:ImageButton ID="imgDeleteP" CommandName="Delete" ToolTip="Delete"
                                                    CommandArgument='<%# Eval("UID") %>' runat="Server"
                                                    AlternateText="Delete" ImageUrl="images/delete.gif" />
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" Width="30px" />
                                            <ItemStyle HorizontalAlign="Center" Width="30px" VerticalAlign="Top" />
                                        </telerik:GridTemplateColumn>


                                    </Columns>
                                </MasterTableView>

                                <HeaderStyle Font-Bold="True" />
                                <AlternatingItemStyle CssClass="treeView" />
                                <ItemStyle CssClass="treeView" />

                            </telerik:RadGrid>
                            <asp:SqlDataSource ID="dsUsers" runat="server"
                                ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                SelectCommand="SELECT  * FROM [admin_users_tbl] order by UserName"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

