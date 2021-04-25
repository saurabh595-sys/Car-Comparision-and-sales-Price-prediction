<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="admin_home.aspx.cs" Inherits="WebApplication1.admin_home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
               "scrollY": "900px",
               "scrollCollapse": true,
               "paging": false,
           });});
 
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
                           <h4>Car Details</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                      
                     <div class="col">
                        <center>
                           <img id="imgview" Height="200px" Width="400px" src="Car_Image/car.png" />
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
                        <asp:FileUpload onchange="readURL(this);" class="form-control" ID="Car_img" runat="server" />
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Car ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="Car_ID" runat="server" placeholder="Car_ID"></asp:TextBox>
                              <asp:Button class="form-control btn btn-primary" ID="Button4" runat="server" Text="Go" OnClick="Button4_Click"   />
                           </div>
                        </div>
                     </div>
                     <div class="col-md-8">
                        <label>Car Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Car_Name" runat="server" placeholder="Car_Name"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>On Road Price (std)</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="std" runat="server" placeholder="std" ></asp:TextBox>
                        </div>
                        <label>On Road Price (Lux)</label>
                        <div class="form-group">
                         <asp:TextBox CssClass="form-control" ID="Lux" runat="server" placeholder="Lux" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Engine Type</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="Engine_type" runat="server">
                              <asp:ListItem Text="Petrol" Value="Petrol" />
                              <asp:ListItem Text="Deasal" Value="Deasal" />
                           </asp:DropDownList>
                        </div>
                        <label>Max Power</label>
                        <div class="form-group">
                         <asp:TextBox CssClass="form-control" ID="MaxPower" runat="server" placeholder="MaxPower" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                       <label>Max torque</label>
                        <div class="form-group">
                         <asp:TextBox CssClass="form-control" ID="Maxtorque" runat="server" placeholder="Maxtorque" ></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>No Of Cylinder</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Cylinder" runat="server" placeholder="Cylinder"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Transmisinon type</label>
                         <asp:DropDownList class="form-control" ID="transmisinon" runat="server">
                              <asp:ListItem Text="Manual" Value="Manual" />
                              <asp:ListItem Text="Automatic" Value="Automatic" />
                           </asp:DropDownList>
                     </div>
                     <div class="col-md-4">
                        <label>gearbox</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="gearbox" runat="server" placeholder="gearbox" ></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Fuel Type</label>
                        <div class="form-group">
                             <asp:DropDownList class="form-control" ID="Fuel_Type" runat="server">
                              <asp:ListItem Text="Petrol" Value="Petrol" />
                              <asp:ListItem Text="Deasal" Value="Deasal" />
                           </asp:DropDownList>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Avg Milage</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Avg_Milage" runat="server" placeholder="Milage" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>fuel Capicity(liter)</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="Capicity" runat="server" placeholder="Capicity(liter)" ></asp:TextBox>
                        </div>
                     </div>
                  </div>
                                     
                    <div class="row">
                     <div class="col-md-4">
                        <label>Front Suspension</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Front_Suspension" runat="server" placeholder="Front_Suspension" 
></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Rear suspension</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Rear_Suspension" runat="server" placeholder="Rear_Suspension" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>shock absorben type </label>
                         <asp:DropDownList class="form-control" ID="Shock_absorben" runat="server">
                              <asp:ListItem Text="Twin-tube" Value="Twin-tube" />
                              <asp:ListItem Text="Mono-tube" Value="Mono-tube" />
                             <asp:ListItem Text="Gas-filled mono-tube" Value="Gas-filled mono-tube" />
                             <asp:ListItem Text="External reservoir" Value="External reservoir" />
                           </asp:DropDownList>
                     </div>
                  </div>
                   
 <div class="row">
                     <div class="col-md-4">
                        <label>Steering Type</label>
                        <div class="form-group">
                         <asp:TextBox CssClass="form-control" ID="Steering_Type" runat="server" placeholder="Steering_Type" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Front Brake Type</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Front_Brake_Type" runat="server" placeholder="Front_Brake_Type" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Rear Brake Type</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="Rear_Brake_Type" runat="server" placeholder="Rear_Brake_Type" ></asp:TextBox>
                        </div>
                     </div>
                  </div>     
                   
                    <div class="row">
                     <div class="col-md-4">
                        <label>Tyre Size</label>
                        <div class="form-group">
                         <asp:TextBox CssClass="form-control" ID="Tyre_Size" runat="server" placeholder="Tyre_Size" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Tyre Type</label>
                         <asp:DropDownList class="form-control" ID="Tyre_Type" runat="server">
                              <asp:ListItem Text="Tubed tyres" Value="Tubed tyres" />
                              <asp:ListItem Text="Tubeless tyres" Value="Tubeless tyres" />
                           </asp:DropDownList>
                     </div>
                     <div class="col-md-4">
                        <label>Wheel Size</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="Wheel_Size" runat="server" placeholder="Wheel_Size" ></asp:TextBox>
                        </div>
                     </div>
                  </div>     
                   
                   <div class="row">
                     <div class="col-md-4">
                        <label>Car Length(mm)</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Car_Length" runat="server" placeholder="Car_Length" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Car width(mm)</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="Car_width" runat="server" placeholder="Car_width" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Car Height (mm)</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="Car_height" runat="server" placeholder=" Car_height" ></asp:TextBox>
                        </div>
                     </div>
                  </div>

                   <div class="row">
                     <div class="col-md-4">
                        <label>Power Windows Front</label>
                         <asp:DropDownList class="form-control" ID="Power_Windows_Front" runat="server">
                              <asp:ListItem Text="Avalible" Value="Avalible" />
                              <asp:ListItem Text="Not-Avalible" Value="Not-Avalible" />
                           </asp:DropDownList>
                     </div>
                     <div class="col-md-4">
                        <label>Power Windows Rear</label>
                        <asp:DropDownList class="form-control" ID="Power_Windows_Rear" runat="server">
                              <asp:ListItem Text="Avalible" Value="Avalible" />
                              <asp:ListItem Text="Not-Avalible" Value="Not-Avalible" />
                           </asp:DropDownList>
                     </div>
                     <div class="col-md-4">
                        <label>Anti Lock Braking System</label>
                           <asp:DropDownList class="form-control" ID="Anti_Lock_Braking_System" runat="server">
                              <asp:ListItem Text="Avalible" Value="Avalible" />
                              <asp:ListItem Text="Not-Avalible" Value="Not-Avalible" />
                           </asp:DropDownList>
                     </div>
                  </div>


                   <div class="row">
                     <div class="col-md-4">
                        <label>Brake Assist</label>
                         <asp:DropDownList class="form-control" ID="Brake_Assist" runat="server">
                              <asp:ListItem Text="Avalible" Value="Avalible" />
                              <asp:ListItem Text="Not-Avalible" Value="Not-Avalible" />
                           </asp:DropDownList>
                     </div>
                     <div class="col-md-4">
                        <label>Central Locking</label>
                        <asp:DropDownList class="form-control" ID="Central_Locking" runat="server">
                              <asp:ListItem Text="Avalible" Value="Avalible" />
                              <asp:ListItem Text="Not-Avalible" Value="Not-Avalible" />
                           </asp:DropDownList>
                     </div>
                     <div class="col-md-4">
                        <label>Power Door Locks</label>
                           <asp:DropDownList class="form-control" ID="Power_Door_Locks" runat="server">
                              <asp:ListItem Text="Avalible" Value="Avalible" />
                              <asp:ListItem Text="Not-Avalible" Value="Not-Avalible" />
                           </asp:DropDownList>
                     </div>
                  </div><br />
                   
                   <div class="row">
                     <div class="col-12">
                        <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success col-10 " runat="server" Text="Add" OnClick="Button1_Click"   />
                        <span></span>
                         <asp:Button ID="Button2" class="btn btn-lg btn-block col-10"  BackColor="Yellow" runat="server" Text="Update" OnClick="Button2_Click"  /> 
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
                           <h4>Car Inventory List</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Tyit_ProjectConnectionString %>" SelectCommand="SELECT * FROM [Car_detail]"></asp:SqlDataSource>
                       <div class="col">
                      <asp:GridView  Class=" table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Car_id" DataSourceID="SqlDataSource1">
                          <Columns>
                              <asp:BoundField DataField="Car_id" HeaderText="ID" ReadOnly="True" SortExpression="Car_id" />                   
                              <asp:TemplateField>
                                  <ItemTemplate>
                                  <div class="container-fluid">
                                      <div class="row">
                                           <div class="col-lg-9">
                                               <div class="row">
                                                   <div class="col-lg-12">
                                                       <asp:Label ID="Label1" runat="server" Text='<%# Eval("Car_name") %>' Font-Bold="True" Font-Size="Large"></asp:Label>
                                                   </div>

                                               </div>
                                                <div class="row">
                                                   <div class="col-lg-12">

                                                       <span  font-family: Roboto, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">On Road Price (std):-<asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("Std") %>'></asp:Label>
                                                       &nbsp;|On Road Price (Lux):-
                                                       <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("Lux") %>'></asp:Label>
                                                       &nbsp;| EngineType:-</span><asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("EngineType") %>'></asp:Label>

                                                   </div>

                                               </div>
                                                <div class="row">
                                                   <div class="col-lg-12">

                                                       <span font-family: Roboto, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Max torque:-<asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("Maxtorque") %>'></asp:Label>
                                                       &nbsp;|Max Power:<asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("MaxPower") %>'></asp:Label>
                                                       |NoOfCylinder:-</span><asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("Cylinder") %>'></asp:Label>

                                                   </div>

                                               </div>
                                                <div class="row">
                                                   <div class="col-lg-12">

                                                       <span  font-family: Roboto, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Transmisinon type:-
                                                       <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("Transmission") %>'></asp:Label>
                                                       |Gearbox:-<asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("gearbox") %>'></asp:Label>
                                                       &nbsp;FuelType:-</span><asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("Fuel_type") %>'></asp:Label>

                                                   </div>

                                               </div>
                                                <div class="row">
                                                   <div class="col-lg-12">

                                                       <span  font-family: Roboto, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Avg Milage:-<asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("milage") %>'></asp:Label>
                                                       &nbsp;|fuel Capicity(liter):<asp:Label ID="Label12" runat="server" Font-Bold="True" Text='<%# Eval("Fuel_capicity") %>'></asp:Label>
                                                       |SteeringType:-</span><asp:Label ID="Label13" runat="server" Font-Bold="True" Text='<%# Eval("Steering_Type") %>'></asp:Label>

                                                   </div>

                                               </div>
                                                <div class="row">
                                                   <div class="col-lg-12">

                                                       <span  font-family: Roboto, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Front Suspension:-<asp:Label ID="Label14" runat="server" Font-Bold="True" Text='<%# Eval("Front_Suspension") %>'></asp:Label>
                                                       &nbsp;|Rear suspension:-<asp:Label ID="Label15" runat="server" Font-Bold="True" Text='<%# Eval("Rear_suspension") %>'></asp:Label>
                                                       &nbsp;|<br /> &nbsp;shock absorben type:-</span><asp:Label ID="Label16" runat="server" Font-Bold="True" Text='<%# Eval("shock_absorben_type") %>'></asp:Label>

                                                   </div>

                                               </div>
                                                <div class="row">
                                                   <div class="col-lg-12">

                                                       <span  font-family: Roboto, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Front Brake Type:-<asp:Label ID="Label17" runat="server" Font-Bold="True" Text='<%# Eval("Front_Brake_Type") %>'></asp:Label>
                                                       &nbsp;| Rear Brake Type:-|<asp:Label ID="Label18" runat="server" Font-Bold="True" Text='<%# Eval("Rear_Brake_Type") %>'></asp:Label>
                                                       <br />
                                                       &nbsp;Tyre Size:-
                                                       <asp:Label ID="Label19" runat="server" Font-Bold="True" Text='<%# Eval("Tyre_Size") %>'></asp:Label>
                                                       | Tyre Type:-<asp:Label ID="Label20" runat="server" Font-Bold="True" Text='<%# Eval("Tyre_Type") %>'></asp:Label>
                                                       &nbsp;| Wheel Size:-</span><asp:Label ID="Label21" runat="server" Font-Bold="True" Text="Label"></asp:Label>

                                                   </div>

                                               </div>
                                                <div class="row">
                                                   <div class="col-lg-12">

                                                       <span font-family: Roboto, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Car Length(mm):-<asp:Label ID="Label22" runat="server" Font-Bold="True" Text='<%# Eval("Car_Length") %>'></asp:Label>
                                                       &nbsp;| Car width(mm):-<asp:Label ID="Label23" runat="server" Font-Bold="True" Text='<%# Eval("Car_width") %>'></asp:Label>
                                                       &nbsp;|<br /> &nbsp;Car Height (mm):-
                                                       <asp:Label ID="Label24" runat="server" Font-Bold="True" Text='<%# Eval("Car_Height") %>'></asp:Label>
                                                       |Power Windows Front:-
                                                       <asp:Label ID="Label25" runat="server" Font-Bold="True" Text='<%# Eval("Power_Windows_Front") %>'></asp:Label>
                                                       | Power Windows Rear:-</span><asp:Label ID="Label26" runat="server" Font-Bold="True" Text='<%# Eval("Power_Windows_Rear") %>'></asp:Label>

                                                   </div>

                                               </div>
                                                <div class="row">
                                                   <div class="col-lg-12">

                                                       <span  font-family: Roboto, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;  text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Anti Lock Braking System:-<asp:Label ID="Label27" runat="server" Font-Bold="True" Text='<%# Eval("Anti_Lock_Braking_System") %>'></asp:Label>
                                                       &nbsp;|Brake Assist:-<asp:Label ID="Label29" runat="server" Font-Bold="True" Text='<%# Eval("Brake_Assist") %>'></asp:Label>
                                                       &nbsp;|Central Locking:-<asp:Label ID="Label28" runat="server" Font-Bold="True" Text='<%# Eval("Central_Locking") %>'></asp:Label>
                                                       &nbsp;|Power Door Locks:-</span><asp:Label ID="Label30" runat="server" Font-Bold="True" Text='<%# Eval("Power_Door_Locks") %>'></asp:Label>

                                                   </div>

                                               </div>
                                           </div>
                                           <div class="col-lg-3">
                                               <asp:Image ID="Image1" runat="server" CssClass="img-fluid" ImageUrl='<%# Eval("Car_img") %>' />
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
