<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="Acc.aspx.cs" Inherits="WebApplication1.Acc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
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
.animation-area {
	background: linear-gradient(to left, #8942a8, #ba382f);
	width: 100%;
	height: 100vh;
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
.container{
    top:20%;
    left:10%;
    
    bottom: 50%;
    position:absolute
}
    </style>
        
    <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
               "scrollY": "400px",
               "scrollCollapse": true,
               "paging": false,
           });;
       });
 
      
 
   </script>
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
         <div class="container " style="margin-top:0px;margin-right:10p%"> 
        <div class="col-md-10 ">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Accessories  List</h4>
                        </center>
                     </div>
                  </div>
                 
                  <div class="row">
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Tyit_ProjectConnectionString %>" SelectCommand="SELECT * FROM [Accessories]"></asp:SqlDataSource>
                       <div class="col">
                   <asp:GridView  Class=" table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Accessories_id" DataSourceID="SqlDataSource1">
                          <Columns>
                              <asp:BoundField DataField="Accessories_id" HeaderText="ID" ReadOnly="True" SortExpression="Accessories_id" />                   
                              <asp:TemplateField>
                                  <ItemTemplate>
                                  <div class="container-fluid">
                                      <div class="row">
                                           <div class="col-lg-9">
                                               <div class="row">
                                                   <div class="col-lg-12">
                                                       <asp:Label ID="Label1" runat="server" Text='<%# Eval("Accessories_Name") %>' Font-Bold="True" Font-Size="Large"></asp:Label>
                                                   </div>

                                               </div>
                                                <div class="row">
                                                   <div class="col-lg-12">

                                                       <span  font-family: Roboto, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Category:-<asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("Category") %>'></asp:Label>
                                                       &nbsp;|Description:-
                                                       <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("Product_description") %>'></asp:Label>
                                                       &nbsp;

                                                   </div>

                                               </div>
                                             
                                           </div>
                                           <div class="col-lg-3">
                                               <asp:Image ID="Image1" runat="server" CssClass="img-fluid" ImageUrl='<%# Eval("image") %>' />
                                           </div>
                                      </div>
                                  </div>
                                      </ItemTemplate>
                              </asp:TemplateField>
                              
    
                           </Columns>
                      </asp:GridView>
                     </div>
                      </div>
                   </div>
                </div>
               </div>
    </div> 
</asp:Content>
