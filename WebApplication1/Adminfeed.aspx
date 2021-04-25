<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Adminfeed.aspx.cs" Inherits="WebApplication1.Adminfeed" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
   
      <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
               //"scrollY": "400px",
               //"scrollCollapse": true,
               //"paging": false,
           });;
       });
 
      
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container " style="margin-top:25px; margin-right:10px"> 
        <div class="col-md-10 ">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>  Feedback</h4>
                        </center>
                     </div>
                  </div>
                 
                  <div class="row">
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Tyit_ProjectConnectionString %>" SelectCommand="SELECT [username], [rating], [Feedback], [Car_name] FROM [Car_detail]"></asp:SqlDataSource>
                       <div class="col">
                   <asp:GridView  Class=" table table-dark table-responsive table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                       <Columns>
                           <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                           <asp:BoundField DataField="rating" HeaderText="rating" SortExpression="rating" />
                           <asp:BoundField DataField="Feedback" HeaderText="Feedback" SortExpression="Feedback" />
                           <asp:BoundField DataField="Car_name" HeaderText="Car_name" SortExpression="Car_name" />
                       </Columns>
                      </asp:GridView>
                     </div>
                      </div>
                   </div>
                </div>
               </div>
    </div> 
</asp:Content>
