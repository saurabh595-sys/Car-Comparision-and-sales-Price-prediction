<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="enquireformadmin.aspx.cs" Inherits="WebApplication1.enquireformadmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
               "scrollY": "400px",
               "scrollCollapse": true,
               "paging": false,
           });;
       });
 
       function readURL(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader();
 
               reader.onload = function (e) {
                   $('#imgview').attr('src', e.target.result);
               };
 
               reader.readAsDataURL(input.files[0]);
           }
       }
 
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="col-md-7 container " style="margin-top:10%" >
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Enquire Form</h4>
                        </center>
                     </div>
                  </div>
                 
                  <div class="row">
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Tyit_ProjectConnectionString %>" SelectCommand="SELECT * FROM [Enquire]"></asp:SqlDataSource>
                       <div class="col">
                   <asp:GridView  Class=" table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                          <Columns>
                              <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />                   
                              <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                              
    
                           </Columns>
                      </asp:GridView>
                     </div>
                      </div>
                   </div>
                </div>
               </div>
</asp:Content>
