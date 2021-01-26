<%@ Page Title="View District No." Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ViewVotingResult.aspx.cs" Inherits="Admin_ViewVotingResult" %>

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
                                Voting Result</h2>

                        </div>


                        <div class="box-content">

                            <div style="padding-bottom: 5px;">
                                <asp:DropDownList ID="ddlElectionName" runat="server" Width="50%" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlElectionName_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>



                         
                            <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="false"
                                AllowSorting="false" Skin="Bootstrap" GroupPanelPosition="Top" ShowFooter="true" OnItemDataBound="RadGrid1_ItemDataBound" >
                                <HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

                                <MasterTableView AutoGenerateColumns="False" DataKeyNames="vote_prefrence">
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

                                        <telerik:GridBoundColumn DataField="district_no" HeaderText="District"
                                    SortExpression="district_no" UniqueName="district_no">
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
                                            <FooterStyle Font-Bold="true" />
                                        </telerik:GridBoundColumn>

                                        <%--  <telerik:GridBoundColumn DataField="vote_prefrence" HeaderText="Vote Preference"
                                                    SortExpression="vote_prefrence" UniqueName="vote_prefrence">
                                                    <ColumnValidationSettings>
                                                        <ModelErrorMessage Text="" />
                                                    </ColumnValidationSettings>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                                </telerik:GridBoundColumn>--%>
                                    </Columns>
                                </MasterTableView>
                                <HeaderStyle Font-Bold="True" />
                                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                <AlternatingItemStyle CssClass="treeView" />
                                <ItemStyle CssClass="treeView" />
                            </telerik:RadGrid>

                            <%--   <asp:SqlDataSource ID="Pref1" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                        SelectCommand="z_GetVotingResultByPrefrence1" SelectCommandType="StoredProcedure"></asp:SqlDataSource>--%>
                        </div>

                    </div>

                
                </div>

                <div class="clearfix" style="text-align: center; margin-top: 15px; margin-bottom: 15px;">
                    <div class="col-md-12">
                        <strong style="font-size: 16px;">
                            <asp:Label ID="lblMessage" runat="server" Text="No records to display." ForeColor="Red" Display="Dynamic"></asp:Label></strong>
                    </div>
                               
                </div>

            </div>


        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

