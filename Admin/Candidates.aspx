<%@ Page Title="Candidates" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Candidates.aspx.cs" Inherits="Admin_Candidates" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <div class="row">
                <div class="box col-md-12">
                    <div class="box-inner">
                        <div class="box-header well" data-original-title="">
                            <h2><i class="glyphicon glyphicon-star-empty"></i>
                                <asp:Label ID="lblHeading" runat="server"></asp:Label></h2>
                            <span style="float: right;"><a class="btn btn-info btn-sm" href="ViewCandidates.aspx"><i class="glyphicon glyphicon-th-list"></i>&nbsp;Candidate List</a></span>
                        </div>
                        <div class="box-content">
                            <div class="row">
                                <div class="col-md-12">
                                    <section id="loginForm">
                                        <div class="form-horizontal">
                                            <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
                                                

                                                 <div class="form-group">
                                                    <asp:Label runat="server" CssClass="col-md-2 control-label"><span class="mandSymb">* </span><i>Denotes required field.</i></asp:Label>
                                                    <div class="col-md-10">
                                                        
                                                    </div>
                                                </div>



                                                 <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="ddlElectionName" CssClass="col-md-2 control-label"><span class="mandSymb">* </span>Election Name</asp:Label>
                                                    <div class="col-md-10">
                                                        <asp:DropDownList ID="ddlElectionName" runat="server" CssClass="form-control" >
                                                             <asp:ListItem>Select</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                            ControlToValidate="ddlElectionName" CssClass="txt_validation" Display="Dynamic" InitialValue="Select"
                                                            ErrorMessage="Can't be left blank!" ValidationGroup="D"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="ddlDistNo" CssClass="col-md-2 control-label"><span class="mandSymb">* </span>District No.</asp:Label>
                                                    <div class="col-md-10">
                                                        <asp:DropDownList ID="ddlDistNo" runat="server" CssClass="form-control" Width="100px" AutoPostBack="True" OnSelectedIndexChanged="ddlDistNo_SelectedIndexChanged">

                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RFVDistNo" runat="server"
                                                            ControlToValidate="ddlDistNo" CssClass="txt_validation" Display="Dynamic" InitialValue="Select"
                                                            ErrorMessage="Can't be left blank!" ValidationGroup="D"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="ddlDistNo" CssClass="col-md-2 control-label"><span class="mandSymb">* </span>Years</asp:Label>
                                                    <div class="col-md-10">
                                                        <asp:DropDownList ID="DDLYears" runat="server" CssClass="form-control" Width="150px" AppendDataBoundItems="true">
                                                            <asp:ListItem>Select</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RFVYear" runat="server" ControlToValidate="DDLYears" CssClass="txt_validation" Display="Dynamic" ErrorMessage="Please select year" InitialValue="Select" ValidationGroup="D"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="ddlClubName" CssClass="col-md-2 control-label"><span class="mandSymb">* </span>Club Name</asp:Label>
                                                    <div class="col-md-10">
                                                        <asp:DropDownList ID="ddlClubName" runat="server" CssClass="form-control">
                                                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rfvRINo" runat="server"
                                                            ControlToValidate="ddlClubName" CssClass="txt_validation" Display="Dynamic" InitialValue="0"
                                                            ErrorMessage="Can't be left blank!" ValidationGroup="D"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtName" CssClass="col-md-2 control-label"><span class="mandSymb">* </span>Name</asp:Label>
                                                    <div class="col-md-10">
                                                        <asp:TextBox runat="server" ID="txtName" CssClass="form-control" />
                                                        <asp:RequiredFieldValidator ID="rfvName" runat="server"
                                                            ControlToValidate="txtName" CssClass="txt_validation" Display="Dynamic"
                                                            ErrorMessage="Can't be left blank!" ValidationGroup="D"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="joiningDate" CssClass="col-md-2 control-label">Joining Year</asp:Label>
                                                    <div class="col-md-10">                                                        
                                                         <asp:TextBox runat="server" ID="joiningDate" CssClass="form-control" Width="120px" MaxLength="11" />
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtClassification" CssClass="col-md-2 control-label">Classification</asp:Label>
                                                    <div class="col-md-10">
                                                        <asp:TextBox runat="server" ID="txtClassification" CssClass="form-control" />                                                      
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtMemberShipNo" CssClass="col-md-2 control-label">Membership No.</asp:Label>
                                                    <div class="col-md-10">
                                                        <telerik:RadNumericTextBox ID="txtMemberShipNo" runat="server" CssClass="form-control" Skin="Silk" Width="100px" MaxLength="8" Height="38px">
                                                            <NegativeStyle Resize="None" />
                                                            <NumberFormat DecimalDigits="0" GroupSizes="9" ZeroPattern="n" />
                                                            <EmptyMessageStyle Resize="None" />
                                                            <ReadOnlyStyle Resize="None" />
                                                            <FocusedStyle Resize="None" />
                                                            <DisabledStyle Resize="None" />
                                                            <InvalidStyle Resize="None" />
                                                            <HoveredStyle Resize="None" />
                                                            <EnabledStyle Resize="None" />
                                                        </telerik:RadNumericTextBox>
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-md-2 control-label">Email</asp:Label>
                                                    <div class="col-md-10">
                                                        <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" />
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtMobile" CssClass="col-md-2 control-label">Mobile</asp:Label>
                                                    <div class="col-md-10">
                                                        <asp:TextBox runat="server" ID="txtMobile" CssClass="form-control" />
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="txtDesc" CssClass="col-md-2 control-label">Description</asp:Label>
                                                    <div class="col-md-10">
                                                        <telerik:RadEditor runat="server" ID="txtDesc" Width="99%" EditModes="Design" Skin="Silk" Height="250px" NewLineMode="Br">

                                                            <CssFiles>
                                                                <telerik:EditorCssFile Value="../css/editor.css" />
                                                            </CssFiles>

                                                            <Tools>
                                                                <telerik:EditorToolGroup>
                                                                    <telerik:EditorTool Name="Bold"></telerik:EditorTool>
                                                                    <telerik:EditorTool Name="Italic"></telerik:EditorTool>
                                                                    <telerik:EditorTool Name="Underline"></telerik:EditorTool>
                                                                    <telerik:EditorTool Name="LinkManager"></telerik:EditorTool>
                                                                    <telerik:EditorTool Name="Unlink"></telerik:EditorTool>
                                                                    <telerik:EditorTool Name="JustifyFull"></telerik:EditorTool>
                                                                    <telerik:EditorTool Name="JustifyCenter"></telerik:EditorTool>
                                                                    <telerik:EditorTool Name="JustifyLeft"></telerik:EditorTool>
                                                                    <telerik:EditorTool Name="JustifyRight"></telerik:EditorTool>
                                                                    <telerik:EditorTool Name="InsertUnorderedList" />
                                                                    <telerik:EditorTool Name="InsertOrderedList" />
                                                                </telerik:EditorToolGroup>
                                                            </Tools>

                                                        </telerik:RadEditor>
                                                    </div>
                                                </div>



                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="birthday" CssClass="col-md-2 control-label">Birthday</asp:Label>
                                                    <div class="col-md-10">
                                                        <telerik:RadDatePicker ID="birthday" runat="server" Skin="Silk"></telerik:RadDatePicker>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="RadAsyncUpload1" CssClass="col-md-2 control-label">Upload Photo</asp:Label>
                                                    <div class="col-md-10">

                                                        <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" Skin="Silk" AllowedFileExtensions="jpg,jpeg,gif,png" OnFileUploaded="RadAsyncUpload1_FileUploaded"></telerik:RadAsyncUpload>
                                                        <h6>Upload only .jpg, .jpeg, .gif, .png format and maximum file size limit is 400kb.</h6>

                                                        <asp:Image ID="candidateImage" runat="server" Height="100px" Width="100px" />
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <asp:Label runat="server" AssociatedControlID="RadAsyncUpload2" CssClass="col-md-2 control-label">Upload Biodata</asp:Label>
                                                    <div class="col-md-10">

                                                        <telerik:RadAsyncUpload ID="RadAsyncUpload2" runat="server" Skin="Silk" AllowedFileExtensions="pdf" OnFileUploaded="RadAsyncUpload2_FileUploaded"></telerik:RadAsyncUpload>
                                                        <h6>Upload only pdf file and maximum file size limit is 25mb.</h6>
                                                        <a id="cadBio" runat="server" target="_blank">
                                                            <asp:Label ID="lblBiodataLink" runat="server"></asp:Label></a>

                                                    </div>
                                                </div>



                                                <div class="form-group">
                                                    <div class="col-md-offset-3 col-md-10">
                                                        <asp:Button ID="btnSubmit" runat="server" OnClick="Submit" Text="Submit" CssClass="btn btn-primary" ValidationGroup="D" />
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>

                                    </section>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
