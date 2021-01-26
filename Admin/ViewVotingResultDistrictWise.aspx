<%@ Page Title="View District No." Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ViewVotingResultDistrictWise.aspx.cs" Inherits="Admin_ViewVotingResultDistrictWise" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .chk {
            text-indent: 2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
            <div class="row">
                <div class="box col-md-12">
                    <div class="box-inner">
                        <div class="box-header well" data-original-title="">
                            <h2><i class="glyphicon glyphicon-star-empty"></i>
                                Voting Result District Wise</h2>

                        </div>

                        <div class="box-content">

                            <div style="padding-bottom: 5px;">
                                <asp:DropDownList ID="ddlElectionName" runat="server" Width="50%" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlElectionName_SelectedIndexChanged"  >
                                </asp:DropDownList>
                            </div>

                            
                            <asp:DropDownList ID="ddlDistNo" runat="server" CssClass="form-control" Width="200px" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlDistNo_SelectedIndexChanged">
                            <asp:ListItem Value="0" Text="Select District No."></asp:ListItem>
                            <asp:ListItem Value="1" Text="All"></asp:ListItem>
                        </asp:DropDownList>

                         
                            <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="false"
                                AllowSorting="false" Skin="Bootstrap" GroupPanelPosition="Top" ShowFooter="true" OnItemDataBound="RadGrid1_ItemDataBound" >
                                <HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

                                <MasterTableView AutoGenerateColumns="False" DataKeyNames="CandidateName">
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

                                        

                                        

                                       

                                     <telerik:GridBoundColumn DataField="CandidateName" HeaderText="Candidate Name"
                                            SortExpression="CandidateName" UniqueName="CandidateName">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridBoundColumn>

                                         <telerik:GridBoundColumn DataField="CandidateClubName" HeaderText="Candidate Club Name"
                                            SortExpression="CandidateClubName" UniqueName="CandidateClubName">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn DataField="district_no" HeaderText="Candidate District"
                                            SortExpression="district_no" UniqueName="district_no">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridBoundColumn>

                                         <telerik:GridBoundColumn DataField="voter_district_no" HeaderText="District"
                                            SortExpression="voter_district_no" UniqueName="voter_district_no">
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
                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Display="Dynamic"></asp:Label></strong>
                    </div>
                               
                </div>

            </div>


     

</asp:Content>

