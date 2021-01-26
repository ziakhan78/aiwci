<%@ Page Title="Feedback Enquiry" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ViewFeedback.aspx.cs" Inherits="Admin_ViewFeedback" %>

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
                            <h2><i class="glyphicon glyphicon-star-empty"></i>
                                Feedback Enquiry</h2>

                        </div>

                        <div class="box-content">


                            <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" DataSourceID="dsFeedback"
                                AllowSorting="True" Skin="Bootstrap" PageSize="20" GridLines="None">
                                <HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

                                <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="dsFeedback">
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





                                        <telerik:GridBoundColumn DataField="emailid" HeaderText="Email"
                                            SortExpression="emailid" UniqueName="emailid">
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

                                        <telerik:GridBoundColumn DataField="comments" HeaderText="Comments"
                                            SortExpression="comments" UniqueName="comments">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridBoundColumn>




                                    </Columns>
                                </MasterTableView>
                                <HeaderStyle Font-Bold="True" />
                                <AlternatingItemStyle CssClass="treeView" />
                                <ItemStyle CssClass="treeView" />
                            </telerik:RadGrid>

                            <asp:SqlDataSource ID="dsFeedback" runat="server"
                                ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                SelectCommand="SELECT * FROM [feedback_tbl] order by id desc"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
           
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

