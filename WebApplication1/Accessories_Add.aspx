<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Accessories_Add.aspx.cs" Inherits="WebApplication1.Accessories_Add" %>
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
  <div class="container-fluid overflow-hidden">
      <div class="row">
     
         <div class="col-md-5 ">
            <div class="card">
               <div class="card-body">
             
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Accessories Details</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                      
                     <div class="col">
                        <center>
                           <img id="imgview" Height="200px" Width="400px" alt="accesspries image" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <asp:FileUpload onchange="readURL(this);" class="form-control" ID="Accessories_img" runat="server" />
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Accessories id</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="Accessories_ID" runat="server" placeholder="Accessories_ID"></asp:TextBox>
                               <asp:Button class="form-control btn btn-primary" ID="Button4" runat="server" Text="Go" OnClick="Button4_Click"    />
                           </div>
                        </div>
                     </div>
                     <div class="col-md-8">
                        <label>Accessories Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Accessories_Name" runat="server" placeholder="Accessories_Name"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                      <div class="col-md-4">
                        <label>Category</label>
                         <asp:DropDownList class="form-control" ID="Category" runat="server">
                              <asp:ListItem Text="Car_Covers" Value="Car_Covers" />
                              <asp:ListItem Text="Booster_Cable" Value="Booster Cable" />
                             <asp:ListItem Text="Cleaning_Equipment" Value="Cleaning_Equipment" />
                             <asp:ListItem Text="Car_Mats" Value="Car_Mats" />
                             <asp:ListItem Text="Sun_Shades" Value="Sun_Shades" />
                             <asp:ListItem Text="Seat_Covers" Value="Seat_Covers" />
                             <asp:ListItem Text="Mobile_Holder" Value="Mobile_Holder" />
                           </asp:DropDownList>
                     </div>
                    
                     <div class="col-md-4">
                          <label>Product Description</label>
                          <div class="form-group ">
                         <asp:TextBox ID="Description" runat="server" TextMode="MultiLine" Width="205px"></asp:TextBox>
                        </div>
                     </div>
                 
                  </div>
                 
                   
                   <div class="row">
                     <div class="col-12">
                        <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success col-10 " runat="server" Text="Add" OnClick="Button1_Click" />
                        <span></span>
                         <asp:Button ID="Button2" class="btn btn-lg btn-block col-10"  BackColor="Yellow" runat="server" Text="Update" OnClick="Button2_Click"   /> 
                     </div>
                     
                  </div>
               </div>
            </div>
            <a href="homepage.aspx"><< Back to Home</a><br>
            <br>
         </div>
             <div class="col-md-7 ">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Accessories  Inventory List</h4>
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
       </div>
</asp:Content>
