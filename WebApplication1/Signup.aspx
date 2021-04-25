<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="WebApplication1.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

      <style>
    
.animation-area {
	background: linear-gradient(to left, #8942a8, #ba382f);
	width: 100%;
	height: 100vh;
}
.banner-text {
	top:0%;
   width:100%;
	position: absolute;
	z-index: 1;
   bottom:0%;
}
.box-area {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}
.box-area li {
	position: absolute;
	display: block;
	list-style: none;
	width: 25px;
	height: 25px;
	background: rgba(255, 255, 255, 0.2);
	animation: animate 20s linear infinite;
	bottom: -150px;
}
.box-area li:nth-child(1) {
	left: 86%;
	width: 80px;
	height: 80px;
	animation-delay: 0s;
}
.box-area li:nth-child(2) {
	left: 12%;
	width: 30px;
	height: 30px;
	animation-delay: 1.5s;
	animation-duration: 10s;
}
.box-area li:nth-child(3) {
	left: 70%;
	width: 100px;
	height: 100px;
	animation-delay: 5.5s;
}
.box-area li:nth-child(4) {
	left: 42%;
	width: 150px;
	height: 150px;
	animation-delay: 0s;
	animation-duration: 15s;
}
.box-area li:nth-child(5) {
	left: 65%;
	width: 40px;
	height: 40px;
	animation-delay: 0s;
}
.box-area li:nth-child(6) {
	left: 15%;
	width: 110px;
	height: 110px;
	animation-delay: 3.5s;
}
@keyframes animate {
	0% {
		transform: translateY(0) rotate(0deg);
		opacity: 1;
	}
	100% {
		transform: translateY(-800px) rotate(360deg);
		opacity: 0;
	}
}
@keyframes move {
	0% {
		transform: translate3d(-200%, 0, 0)
	}
	60% {
		transform: translate3d(100%, 0, 0)
	}
	100% {
		transform: translate3d(100%, 0, 0)
	}
}
   </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="animation-area">
		<ul class="box-area">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
  <div class="banner-text">
       <div class="container " style="padding-top:10%; padding-bottom:0%">
    <div class="row">
       <div class="col-md-6 mx-auto">
         <div class="card">
                <div class="card-body">
                    <div class="row">
                    <div class="col">
                        <center>
                        <img width="90px" src="Img/generaluser.png" />
                        </center>
                       </div>
                      </div>

                    <div class="row">
                    <div class="col">
                        <center>
                       <B>Signup</B>
                        </center>
                    </div>
                        </div>

                    <div class="row">
                    <div class="col">
                       <hr />
                    </div>
                        </div>

                    <div class="row">
                    <div class="col">
                        <label>Username</label>
                        <div class="form-group">
                          <asp:TextBox CssClass="form-control"  ID="USERNAME" runat="server" placeholder="USERNAME"></asp:TextBox>
                            <p><asp:RequiredFieldValidator  ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username Required" ForeColor="Red" ControlToValidate="USERNAME"></asp:RequiredFieldValidator></p>
                         </div>
                        <label>Password</label>
                        <div class="form-group">
                          <asp:TextBox CssClass="form-control"  ID="Password" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                            
                      </div>
                        

                        <label>Conform Password</label>
                        <div class="form-group">
                          <asp:TextBox CssClass="form-control"  ID="Password1" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Enter Same password as above " ForeColor="Red" ControlToCompare="Password" ControlToValidate="Password1"></asp:CompareValidator>
                      </div>
                       
                         <div class="form-group" >
                          <asp:Button  Class="btn btn-primary col-12" ID="Button1" runat="server" Text="Signup" OnClick="Button1_Click" />
                      </div>

                  </div>
                  </div>

                </div>
           
        </div>
          <a href="Home.aspx"><b>Back To Home</b></a>
      </div>
    </div>

</div>
      </div>
</asp:Content>
