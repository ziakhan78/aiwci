<%@ Page Title="Executive Committee List" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ViewExecutiveCommittee.aspx.cs" Inherits="Admin_ViewExecutiveCommittee" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/JavaScript">
<!--
    function MM_openBrWindow(theURL, winName, features) { //v2.0
        window.open(theURL, winName, features);
    }
    //-->
    </script>

    <script type="text/javascript">
        function SelectAllCheckboxes(spanChk) {

            // Added as ASPX uses SPAN for checkbox
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;

            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    //elm[i].click();
                    if (elm[i].checked != xState)
                        elm[i].click();
                    //elm[i].checked=xState;
                }
        }
    </script>

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
                            <span style="float: right;"><a class="btn btn-success btn-sm" href="ExecutiveCommittee.aspx"><i class="glyphicon glyphicon-plus-sign"></i>&nbsp;Add Executive Committee</a></span>
                        </div>

                        <div class="box-content">

                            <div style="padding-bottom:5px;">
                                <asp:DropDownList ID="ddlDistNo" Width="200" runat="server" CssClass="form-control" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlDistNo_SelectedIndexChanged">
                                    <asp:ListItem Value="0" Text="Select District No."></asp:ListItem>
                                    <asp:ListItem Value="1" Text="All"></asp:ListItem>
                                </asp:DropDownList>
                            </div>



                                    <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" 
                                        AllowSorting="True" Skin="Bootstrap" PageSize="50" OnItemCommand="RadGrid1_ItemCommand" GroupPanelPosition="Top">
                                        <HeaderContextMenu EnableAutoScroll="True"></HeaderContextMenu>

                                        <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="DSPresidents">
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

                                                <%--                                    <telerik:GridTemplateColumn HeaderText="Select" FilterControlToolTip="Select for sending mail" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="30px" ItemStyle-Width="30px">

                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="false"
                                                onclick="javascript:SelectAllCheckboxes(this);" TextAlign="Left"
                                                ToolTip="Select/Deselect All" />
                                        </HeaderTemplate>


                                        <ItemTemplate>
                                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("email") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblMemId" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                            <asp:CheckBox ID="chkActive" runat="server" TextAlign="Left"></asp:CheckBox>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                    </telerik:GridTemplateColumn>--%>
                                                  <telerik:GridBoundColumn DataField="club_name" HeaderText="Club Name"
                                                    SortExpression="club_name" UniqueName="club_name">
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

                                            <%--     <telerik:GridBoundColumn DataField="password" HeaderText="Password"
                                            SortExpression="password" UniqueName="password">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />
                                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top"></ItemStyle>
                                        </telerik:GridBoundColumn>--%>



                                                <telerik:GridTemplateColumn HeaderText="Action" AllowFiltering="False">
                                                    <ItemTemplate>
                                                        <a href='ExecutiveCommittee.aspx?id=<%# Eval("id") %>'>
                                                            <img src="images/edit.gif" alt="Edit" border="0" title="Edit" style="height:18px; width:18px" />
                                                        </a>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
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
                                        <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                        <AlternatingItemStyle CssClass="treeView" />
                                        <ItemStyle CssClass="treeView" />
                                    </telerik:RadGrid>

                                  <%--  <asp:SqlDataSource ID="DSPresidents" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:ConnString %>"
                                        SelectCommand="z_GetDistCommitteeByDistNo" SelectCommandType="StoredProcedure">
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

