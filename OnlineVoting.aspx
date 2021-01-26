<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="OnlineVoting.aspx.cs" Inherits="OnlineVoting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
        <script src="js/jquery.min.js"></script>

   <script>
    $(document).ready(function () {
        $('#bannerImg')
            .attr('src', 'images/inner-banner.jpg')
           // .width('64px')
            .height('200px');
    });
</script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="heading_strip">
        <div class="container">
            <div class="row">
                <div class="col-md-12 pt-2 pb-2">
                    <ul class="breadcrumb  pull-right">
                        <li class="breadcrumb-item "><a href="Default.aspx"><i class="fa fa-home"></i></a></li>
                        <li class="breadcrumb-item active">Online Voting</li>
                    </ul>
                    <h2>Online Voting</h2>
                </div>
            </div>
        </div>
    </div>


    <section>
        <div style="text-align: center; margin-top: 20px;">
            <div>
                <strong style="font-size: 20px;">
                    <asp:CustomValidator ID="CustomValidator1" runat="server" CssClass="alert alert-danger" Display="Dynamic" ErrorMessage="You have already voted! - You can cast your vote only one time." OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="V"></asp:CustomValidator></strong>
                <asp:Label ID="lblMsg" runat="server" CssClass="alert-success font-weight-bold" Font-Size="20px"></asp:Label>
            </div>
        </div>
        <div class="container">
            <div class="row">      
                <div id="divDtMsg" runat="server" style="text-align: center; margin-bottom: 200px;">
                    <h4>
                        <asp:Label ID="lblDate" runat="server"></asp:Label></h4>
                </div>


                 <div class="col-md-12 col-lg-12" >
                     	<div class="d-flex justify-content-end ">

                    <asp:Button ID="btnElection" runat="server" CssClass="btn btn-success" OnClick="btnElection_Click" />
                </div>   </div>



                <div class="col-md-12 pt-4 mb-3"><strong>
                    <asp:Label ID="lblElecTitle" runat="server"></asp:Label></strong></div>
               
            </div>
        </div>
        <div class="container">
            <div class="row">               


                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-6">
                            <div class="card flex-row flex-wrap  d-flex align-items-center mb-3">
                                <div class="card-header border-0">
                                    <img src="CandidatesImage/<%# Eval("photo") %>" alt="">
                                </div>
                                <div class="card-block px-2">
                                    <asp:Label ID="lblCandidateId" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="lblCandidate" runat="server" Text='<%# Eval("name") %>' Visible="false"></asp:Label>
                                    <p class="ml-2 p-0 mb-1"><strong class="">Name: </strong><%# Eval("name") %> </p>
                                    <p class="ml-2 mb-1"><strong class="">Club: </strong><%# Eval("club_name") %> </p>
                                    <p class="ml-2 mb-1"><strong class="">District: </strong><%# Eval("district_no") %></p>
                                    <asp:LinkButton ID="btnSubmit" OnClick="btnSubmit_Click" CssClass="btn btn-danger ml-2 mt-2  mb-2" runat="server" ValidationGroup="V"><i class="fa fa-hand-pointer-o" aria-hidden="true"></i> VOTE</asp:LinkButton>
                                </div>
                                <div class="w-100"></div>
                                <div class="card-footer w-100 text-muted text-center">
                                    <strong>Click on the Red Button to submit your VOTE</strong>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>


            </div>
        </div>
    </section>
</asp:Content>
