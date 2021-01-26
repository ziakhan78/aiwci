<%@ Page Title="Send Login" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="SendLogin.aspx.cs" Inherits="Admin_SendLogin" %>

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
        .RadGrid_Bootstrap .rgRow > td, .RadGrid_Bootstrap .rgAltRow > td, .RadGrid_Bootstrap .rgEditRow > td {
            padding: 0px 5px 0px 5px;
            margin: 0px 5px 0px 5px;
        }
    </style>

   <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div style="text-align: center;">
                <img src="images/loading.gif" alt="" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="row">
                <div class="box col-md-12">
                    <div class="box-inner">
                        <div class="box-header well" data-original-title="">
                            <h2><i class="glyphicon glyphicon-star-empty"></i>
                                Send Login Details</h2>

                        </div>
                              <div style="padding-bottom: 40px;">
                                <div class="col-md-4" style="margin-top: 5px;">
                                    <asp:Button ID="btnSendTestLoginPass" runat="server" CssClass="btn btn-primary" OnClick="btnSendTestLoginPass_Click" Text="Send Test Email" ValidationGroup="L" />

                                    <asp:Button ID="btnSendLoginPass" runat="server" CssClass="btn btn-primary" OnClick="btnSendLoginPass_Click" Text="Send Login Details" ValidationGroup="L" />
                                </div>

                                  <div class="col-md-4 form-group" style="margin-top: 10px;">
                                       <label for="ddlDesi">Designation:</label>
                                         <asp:DropDownList ID="ddlDesi" runat="server" CssClass="form-control" Width="200px" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlDesi_SelectedIndexChanged">
                                        <asp:ListItem Value="0" Text="Select Designation"></asp:ListItem>
                                         <asp:ListItem Value="1" Text="President"></asp:ListItem>                                         
                                         <asp:ListItem Value="2" Text="Executive Committee"></asp:ListItem>
                                    </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvDesi" runat="server" ControlToValidate="ddlDesi" Display="Dynamic" ErrorMessage="Select Designation" InitialValue="0" ValidationGroup="L" CssClass="txt_validation"></asp:RequiredFieldValidator>
                                       </div>
                                <div class="col-md-4 form-group" style="margin-top: 10px;">

                                    <label for="ddlDistNo">District:</label>
                                    <asp:DropDownList ID="ddlDistNo" runat="server" CssClass="form-control" Width="200px" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlDistNo_SelectedIndexChanged">
                                        <asp:ListItem Value="0" Text="Select District No."></asp:ListItem>
                                    </asp:DropDownList>
                                
                                  
                                    <%-- <asp:RequiredFieldValidator ID="rfvdist" runat="server" ControlToValidate="ddlDistNo" Display="Dynamic" ErrorMessage="Select District" InitialValue="0" ValidationGroup="L" CssClass="txt_validation"></asp:RequiredFieldValidator>
                                    --%>
                                </div>
                                   
                            </div>
 
                        <div class="box-content">                            

                            <%--  <div style="padding-bottom: 5px;">
                                <asp:DropDownList ID="DDLYears" runat="server" CssClass="form-control" Width="200px" AutoPostBack="True" AppendDataBoundItems="true" OnSelectedIndexChanged="DDLYears_SelectedIndexChanged">
                                    <asp:ListItem Value="0" Text="Select Year"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvYears" runat="server" ControlToValidate="DDLYears" Display="Dynamic" ErrorMessage="Select Year!" InitialValue="0" ValidationGroup="L" CssClass="txt_validation"></asp:RequiredFieldValidator>
                            </div>--%>




                            <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True"
                                AllowSorting="True" Skin="Bootstrap" PageSize="15" GroupPanelPosition="Top" OnPageIndexChanged="RadGrid1_PageIndexChanged" OnPageSizeChanged="RadGrid1_PageSizeChanged" OnSortCommand="RadGrid1_SortCommand">
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

                                        <telerik:GridTemplateColumn HeaderText="Select" FilterControlToolTip="Select for sending mail" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="30px" ItemStyle-Width="30px">

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
                                        </telerik:GridTemplateColumn>

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



                                         <telerik:GridBoundColumn DataField="password" HeaderText="Password"
                                            SortExpression="password" UniqueName="password">
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

                            <%--  <asp:SqlDataSource ID="DSPresidents" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnString %>"
                            SelectCommand="z_GetPresidentsByDistNo" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlDistNo" Name="district_no" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>--%>
                        </div>

                        <div>
                            <asp:Label ID="lblMsg" runat="server" Text="No records to display." Visible="false" CssClass="txt_validation"></asp:Label>
                        </div>


                    </div>

                </div>

            </div>




        </ContentTemplate>
    </asp:UpdatePanel>



</asp:Content>

