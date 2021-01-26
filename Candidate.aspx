<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Candidate.aspx.cs" Inherits="Candidate" %>

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
                <div class="col-md-12  pt-2 pb-2">

                    <ul class="breadcrumb  pull-right">
                        <li class="breadcrumb-item "><a href="Default.aspx"><i class="fa fa-home"></i></a></li>
                        <li class="breadcrumb-item active">Candidates</li>
                    </ul>

                    <h2>Candidates</h2>
                </div>
            </div>
        </div>



    </div>



    <div class="container">
        <div class="row">

                 <div class="col-md-12 col-lg-12" >
                     	<div class="d-flex justify-content-end mt-3">

                    <asp:Button ID="btnElection" runat="server" CssClass="btn btn-success" OnClick="btnElection_Click" />

                </div></div>


        </div>
    </div>

    <section id="candidate">


        <div class="container">
            <div class="row">

                <div class="col-md-12 pt-4 mb-3"><strong><asp:Label ID="lblElecTitle" runat="server"></asp:Label></strong></div>


                <div class="clearfix"></div>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-6  ">
                            <div class="card flex-row flex-wrap  d-flex align-items-center mb-3">
                                <div class="card-header border-0">
                                    <img src="CandidatesImage/<%# Eval("photo") %>" alt="">
                                </div>
                                <div class="card-block px-2">
                                    <p class="ml-2 p-0 mb-1"><strong class="">Name: </strong><%# Eval("name") %> </p>
                                    <p class="ml-2 mb-1"><strong class="">Club: </strong><%# Eval("club_name") %> </p>
                                    <p class="ml-2 mb-1"><strong class="">District: </strong><%# Eval("district_no") %></p>
                                    <a href="CandidatesBiodata/<%# Eval("biodata") %>" class="btn btn-primary ml-2 mt-2 mb-2" target="_blank">View Bio Data</a>

                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>


    </section>


</asp:Content>

