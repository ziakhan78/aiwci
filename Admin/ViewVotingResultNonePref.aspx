<%@ Page Title="View District No." Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ViewVotingResultNonePref.aspx.cs" Inherits="Admin_ViewVotingResultNonePref" %>

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
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div id="content" class="col-lg-12 col-sm-10">
                <!-- content starts -->
                <div>
                    <ul class="breadcrumb">
                        <li>
                            <h4>Voting Result - None Preference Voting by Clubs</h4>
                        </li>
                    </ul>
                </div>

                <div class="row">
                    <div class="col-md-10">

                        <div class="col-md-6 ">

                            <div class="col-md-6">
                                <asp:DropDownList ID="ddlDistNo" runat="server" CssClass="form-control" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlDistNo_SelectedIndexChanged">
                                    <asp:ListItem Value="0" Text="Select District No."></asp:ListItem>
                                </asp:DropDownList>

                            </div>

                            <div class="col-md-6 ">
                                <asp:DropDownList ID="DDLYears" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="DDLYears_SelectedIndexChanged">
                                    <asp:ListItem Value="0" Text="Select Years"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                        </div>


                    </div>
                </div>


                <div class="row">
                    <div class="col-md-12">
                        <div class="form-horizontal">

                            <div class="form-group">
                                <div class="col-md-12">
                                    <h4>
                                        <asp:Label ID="lblPref2Head" runat="server" Text="No Voting for Preference-2"></asp:Label></h4>

                                    <telerik:RadGrid ID="RadGrid1" runat="server" PageSize="20" Skin="Bootstrap" GroupPanelPosition="Top">
                                        <HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

                                        <MasterTableView AutoGenerateColumns="False" DataKeyNames="id">
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

                                                <telerik:GridBoundColumn DataField="VoterClubName" HeaderText="Voter Club Name"
                                                    SortExpression="VoterClubName" UniqueName="VoterClubName">
                                                    <ColumnValidationSettings>
                                                        <ModelErrorMessage Text="" />
                                                    </ColumnValidationSettings>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="VoterName" HeaderText="Voter Name"
                                                    SortExpression="VoterName" UniqueName="VoterName">
                                                    <ColumnValidationSettings>
                                                        <ModelErrorMessage Text="" />
                                                    </ColumnValidationSettings>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                                </telerik:GridBoundColumn>

                                                <%--  <telerik:GridBoundColumn DataField="eligible_votes" HeaderText="Eligible Votes"
                                                    SortExpression="eligible_votes" UniqueName="eligible_votes">
                                                    <ColumnValidationSettings>
                                                        <ModelErrorMessage Text="" />
                                                    </ColumnValidationSettings>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                                </telerik:GridBoundColumn>

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

                                                 <telerik:GridBoundColumn DataField="vote_prefrence" HeaderText="Vote Preference"
                                                    SortExpression="vote_prefrence" UniqueName="vote_prefrence">
                                                    <ColumnValidationSettings>
                                                        <ModelErrorMessage Text="" />
                                                    </ColumnValidationSettings>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                                </telerik:GridBoundColumn>--%>

                                                <telerik:GridBoundColumn DataField="added_date" HeaderText="Date & Time"
                                                    SortExpression="added_date" UniqueName="added_date" DataFormatString="{0:dd MMMM yyyy hh:mm tt}">
                                                    <ColumnValidationSettings>
                                                        <ModelErrorMessage Text="" />
                                                    </ColumnValidationSettings>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="ipaddress" HeaderText="IP Address"
                                                    SortExpression="ipaddress" UniqueName="ipaddress">
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
                                </div>


                                <div class="col-md-12">

                                    <h4>
                                        <asp:Label ID="lblPref3Head" runat="server" Text="No Voting for Preference-3"></asp:Label></h4>
                                    <telerik:RadGrid ID="RadGrid2" runat="server" PageSize="20" Skin="Bootstrap" GroupPanelPosition="Top">
                                        <HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

                                        <MasterTableView AutoGenerateColumns="False" DataKeyNames="id">
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

                                                <telerik:GridBoundColumn DataField="VoterClubName" HeaderText="Voter Club Name"
                                                    SortExpression="VoterClubName" UniqueName="VoterClubName">
                                                    <ColumnValidationSettings>
                                                        <ModelErrorMessage Text="" />
                                                    </ColumnValidationSettings>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="VoterName" HeaderText="Voter Name"
                                                    SortExpression="VoterName" UniqueName="VoterName">
                                                    <ColumnValidationSettings>
                                                        <ModelErrorMessage Text="" />
                                                    </ColumnValidationSettings>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                                </telerik:GridBoundColumn>

                                                <%--  <telerik:GridBoundColumn DataField="eligible_votes" HeaderText="Eligible Votes"
                                                    SortExpression="eligible_votes" UniqueName="eligible_votes">
                                                    <ColumnValidationSettings>
                                                        <ModelErrorMessage Text="" />
                                                    </ColumnValidationSettings>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                                </telerik:GridBoundColumn>

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

                                                 <telerik:GridBoundColumn DataField="vote_prefrence" HeaderText="Vote Preference"
                                                    SortExpression="vote_prefrence" UniqueName="vote_prefrence">
                                                    <ColumnValidationSettings>
                                                        <ModelErrorMessage Text="" />
                                                    </ColumnValidationSettings>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                                </telerik:GridBoundColumn>--%>

                                                <telerik:GridBoundColumn DataField="added_date" HeaderText="Date & Time"
                                                    SortExpression="added_date" UniqueName="added_date" DataFormatString="{0:dd MMMM yyyy hh:mm tt}">
                                                    <ColumnValidationSettings>
                                                        <ModelErrorMessage Text="" />
                                                    </ColumnValidationSettings>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn DataField="ipaddress" HeaderText="IP Address"
                                                    SortExpression="ipaddress" UniqueName="ipaddress">
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

                                    <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                        SelectCommand="select id, VoterName, VoterClubName, ipaddress, added_date from View_VotingResultClubwise where preference=3 and vote_prefrence='0' order by VoterClubName"></asp:SqlDataSource>
                                    --%>
                                </div>

                                <div>
                                    <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false" CssClass="txt_validation"></asp:Label>
                                </div>


                                <div class="clearfix" style="text-align: center; margin-top: 15px; margin-bottom: 15px;">
                                    <div class="col-md-12">
                                        <strong style="font-size: 16px;">
                                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Display="Dynamic"></asp:Label></strong>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

