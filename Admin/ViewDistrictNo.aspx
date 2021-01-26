<%@ Page Title="District No. List" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ViewDistrictNo.aspx.cs" Inherits="Admin_ViewDistrictNo" %>

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
                            <span style="float: right;"><a class="btn btn-success btn-sm" href="DistrictNo.aspx"><i class="glyphicon glyphicon-plus-sign"></i>&nbsp;Add District No.</a></span>
                        </div>

                        <div class="box-content">

                            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="FailureText" />
                                </p>
                            </asp:PlaceHolder>

                          

                                    <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" DataSourceID="DSDistNo"
                                        AllowSorting="True" Skin="Bootstrap" PageSize="50" OnItemCommand="RadGrid1_ItemCommand" GridLines="None">
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
                                                </telerik:GridTemplateColumn>

                                                <telerik:GridBoundColumn DataField="district_no" HeaderText="District No."
                                                    SortExpression="district_no" UniqueName="district_no">
                                                    <ColumnValidationSettings>
                                                        <ModelErrorMessage Text="" />
                                                    </ColumnValidationSettings>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                                </telerik:GridBoundColumn>

                                                <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False" >
                                                    <ItemTemplate>
                                                        <a href='DistrictNo.aspx?id=<%# Eval("id") %>'>
                                                            <img src="images/edit.gif" alt="Edit" border="0" title="Edit" style="height:18px; width:18px"  />
                                                        </a>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" ></HeaderStyle>
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
                                        <AlternatingItemStyle CssClass="treeView" />
                                        <ItemStyle CssClass="treeView" />
                                    </telerik:RadGrid>

                                    <asp:SqlDataSource ID="DSDistNo" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                        SelectCommand="SELECT * FROM [district_no_tbl] order by district_no"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
              

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

