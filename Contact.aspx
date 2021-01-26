<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>AIWCI E-Voting 2020-2021 - Contact </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
	
<div class="heading_strip">
	<div class="container">
		<div class="row">
			<div class="col-md-12 pt-2 pb-2">
				
							
		<ul class="breadcrumb  pull-right" >
        <li class="breadcrumb-item "><a href="Default.aspx"><i class="fa fa-home"></i></a></li>
        <li class="breadcrumb-item active">Contact</li>
    </ul>	
				
	<h2>Contact</h2>
		</div>
			</div>
	</div>
	</div>	
	
	
	
<section>
	
		<div class="container">
	<div class="row">
		
		
	<div class="col-lg-8 mt-4 mx-auto">
			
<div class="alert alert-primary" role="alert">
 <div class="font-weight-bold ">Feedback Form</div>
</div>
       
			<p class=""><span class="text-danger">*</span>All fields are compulsory</p>		
			
			<hr>
<div>
				
    <div class="form-group">
      <label for="name"><span class="text-danger">*</span>Name:</label>
      <input type="text" class="form-control" id="name" runat="server" placeholder="Enter Name" name="name" >
    </div>
				
				
    <div class="form-group">
      <label for="clubName"><span class="text-danger">*</span>Club Name:</label>
      <input type="text" class="form-control" id="clubName" runat="server" placeholder="Enter Club Name" name="clubName" required="required">
    </div>
				
    <div class="form-group">
      <label for="mobile"><span class="text-danger">*</span>Mobile:</label>
      <input type="text" class="form-control" id="mobile" runat="server" placeholder="Enter Mobile Number" name="mobile" required="required">
    </div>				
				
				
	 <div class="form-group">
      <label for="email"><span class="text-danger">*</span>Email:</label>
      <input type="email" class="form-control" id="email" runat="server" placeholder="Enter Email" name="email" required="required">
    </div>			
				
				
				
    <div class="form-group">
      <label for="message"><span class="text-danger">*</span>Message:</label>
     <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" CssClass="form-control" Height="100px" Width="100%"></asp:TextBox>
    </div>							
				
				                                                        <asp:Button ID="btnSubmit" runat="server" OnClick="Submit" Text="Submit" CssClass="btn btn-primary" />
				
   
  </div>
			
			
			
			
		</div>

		
		<!--end of right box-->
		
		
		
		
		</div>
	</div>
	
	
	
	
	
	
	</section>	
	
	
</asp:Content>

