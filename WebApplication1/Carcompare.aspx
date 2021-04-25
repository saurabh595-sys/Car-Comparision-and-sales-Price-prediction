<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeFile="Carcompare.aspx.cs" Inherits="WebApplication1.Carcompare" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
          <style>
   body{
       background: linear-gradient(to left, #8942a8, #ba382f);
   }
    </style>
  
  
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
         <div class="container " style="margin-top:10%"> 
             <div class="card " >
                 <div class="card-header">
                     <h2>Compare two Car</h2>
                 </div>
                 <div class="card-body">
                     <div class="row">
                         <div class="col-6">
                              <div class="form-group">
                                   <asp:TextBox ID="car1" CssClass="form-control autosuggest" runat="server"></asp:TextBox>
                
                                  </div>
                             </div>
                           <div class="col-6">
                                <div class="form-group">
                  <asp:TextBox   CssClass="form-control "  ID="car2" runat="server"  ></asp:TextBox>
                                    </div>
                             </div>
                 </div>
                     </div>
                 <div class="card-footer">
                     <asp:Button  runat="server" ID="Compare"  Text=" Compare" CssClass="btn btn-outline-success col-12" OnClick="Compare_Click" />
                        
                 </div>
             </div>
              
        <div class="card" runat=server id="comparereport">
            <div class="card-header">
                <h1>
                    Compare Report
                </h1>
            </div>
            <div class="card-body">
              <table class="table table-strip" runat="server" id="carcomparereport">
                  <tr>
                  <th> <asp:label runat="server" id="Compare_element"  text="Compare Report"></asp:label></th>
                  <th> <asp:label runat="server" id="Carname1"  text="Car1"></asp:label></th> 
                  <th><asp:label runat="server" id="Carname2"  text="Car2"></asp:label></th>
                  </tr>
                  <tr>
                         <td>Car ON road price Standard Edition</td>
                         <td><asp:label runat="server" id="Std"  text="Std"></asp:label></td>
                         <td><asp:label runat="server" id="std2"  text="Std"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Car ON road price Luxuri Edition</td>
                         <td><asp:label runat="server" id="lux"  text="lux"></asp:label></td>
                         <td><asp:label runat="server" id="lux2"  text="lux"></asp:label></td>
                  </tr>
                   <tr>
                         <td>EngineType</td>
                         <td><asp:label runat="server" id="EngineType"  text="EngineType"></asp:label></td>
                         <td><asp:label runat="server" id="EngineType1"  text="EngineType"></asp:label></td>
                  </tr>
                   <tr>
                         <td>MaxPower</td>
                         <td><asp:label runat="server" id="MaxPower"  text="MaxPower"></asp:label></td>
                         <td><asp:label runat="server" id="MaxPower1"  text="MaxPower"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Maxtorque</td>
                         <td><asp:label runat="server" id="Maxtorque"  text="Maxtorque"></asp:label></td>
                         <td><asp:label runat="server" id="Maxtorque1"  text="Maxtorque"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Cylinder</td>
                         <td><asp:label runat="server" id="Cylinder"  text="Cylinder"></asp:label></td>
                         <td><asp:label runat="server" id="Cylinder1"  text="Cylinder"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Transmission</td>
                         <td><asp:label runat="server" id="Transmission"  text="Transmission"></asp:label></td>
                         <td><asp:label runat="server" id="Transmission1"  text="Transmission"></asp:label></td>
                  </tr>
                   <tr>
                         <td>gearbox</td>
                         <td><asp:label runat="server" id="gearbox"  text="gearbox"></asp:label></td>
                         <td><asp:label runat="server" id="gearbox1"  text="gearbox"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Fuel_type</td>
                         <td><asp:label runat="server" id="Fuel_type"  text="Fuel_type"></asp:label></td>
                         <td><asp:label runat="server" id="Fuel_type1"  text="Fuel_type"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Milage</td>
                         <td><asp:label runat="server" id="milage"  text="milage"></asp:label></td>
                         <td><asp:label runat="server" id="milage1"  text="milage"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Fuel_capicity</td>
                         <td><asp:label runat="server" id="Fuel_capicity"  text="Fuel_capicity"></asp:label></td>
                         <td><asp:label runat="server" id="Fuel_capicity1"  text="Fuel_capicity"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Front_Suspension</td>
                         <td><asp:label runat="server" id="Front_Suspension"  text="Front_Suspension"></asp:label></td>
                         <td><asp:label runat="server" id="Front_Suspension1"  text="Front_Suspension"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Rear_suspension</td>
                         <td><asp:label runat="server" id="Rear_suspension"  text="Rear_suspension"></asp:label></td>
                         <td><asp:label runat="server" id="Rear_suspension1"  text="Rear_suspension"></asp:label></td>
                  </tr>
                   <tr>
                         <td>shock_absorben_type</td>
                         <td><asp:label runat="server" id="shock_absorben_type"  text="shock_absorben_type"></asp:label></td>
                         <td><asp:label runat="server" id="shock_absorben_type1"  text="shock_absorben_type"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Steering_Type</td>
                         <td><asp:label runat="server" id="Steering_Type"  text="Steering_Type"></asp:label></td>
                         <td><asp:label runat="server" id="Steering_Type1"  text="Steering_Type"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Front_Brake_Type</td>
                         <td><asp:label runat="server" id="Front_Brake_Type"  text="Front_Brake_Type"></asp:label></td>
                         <td><asp:label runat="server" id="Front_Brake_Type1"  text="Front_Brake_Type"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Rear_Brake_Type</td>
                         <td><asp:label runat="server" id="Rear_Brake_Type"  text="Rear_Brake_Type"></asp:label></td>
                         <td><asp:label runat="server" id="Rear_Brake_Type1"  text="Rear_Brake_Type"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Tyre_Size</td>
                         <td><asp:label runat="server" id="Tyre_Size"  text="Tyre_Size"></asp:label></td>
                         <td><asp:label runat="server" id="Tyre_Size1"  text="Tyre_Size"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Tyre_Type</td>
                         <td><asp:label runat="server" id="Tyre_Type"  text="Tyre_Type"></asp:label></td>
                         <td><asp:label runat="server" id="Tyre_Type1"  text="Tyre_Type"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Wheel_Size</td>
                         <td><asp:label runat="server" id="Wheel_Size"  text="Wheel_Size"></asp:label></td>
                         <td><asp:label runat="server" id="Wheel_Size1"  text="Wheel_Size"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Car_Length</td>
                         <td><asp:label runat="server" id="Car_Length"  text="Car_Length"></asp:label></td>
                         <td><asp:label runat="server" id="Car_Length1"  text="Car_Length"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Car_width</td>
                         <td><asp:label runat="server" id="Car_width"  text="Car_width"></asp:label></td>
                         <td><asp:label runat="server" id="Car_width1"  text="Car_width"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Car_Height</td>
                         <td><asp:label runat="server" id="Car_Height"  text="Car_Height"></asp:label></td>
                         <td><asp:label runat="server" id="Car_Height1"  text="Car_Height"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Power_Windows_Front</td>
                         <td><asp:label runat="server" id="Power_Windows_Front"  text="Power_Windows_Front"></asp:label></td>
                         <td><asp:label runat="server" id="Power_Windows_Front1"  text="Power_Windows_Front"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Power_Windows_Rear</td>
                         <td><asp:label runat="server" id="Power_Windows_Rear"  text="Power_Windows_Rear"></asp:label></td>
                         <td><asp:label runat="server" id="Power_Windows_Rear1"  text="Power_Windows_Rear"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Anti_Lock_Braking_System</td>
                         <td><asp:label runat="server" id="Anti_Lock_Braking_System"  text="Anti_Lock_Braking_System"></asp:label></td>
                         <td><asp:label runat="server" id="Anti_Lock_Braking_System1"  text="Anti_Lock_Braking_System"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Brake_Assist</td>
                         <td><asp:label runat="server" id="Brake_Assist"  text="Brake_Assist"></asp:label></td>
                         <td><asp:label runat="server" id="Brake_Assist1"  text="Brake_Assist"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Central_Locking</td>
                         <td><asp:label runat="server" id="Central_Locking"  text="Central_Locking"></asp:label></td>
                         <td><asp:label runat="server" id="Central_Locking1"  text="Central_Locking"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Power_Door_Locks</td>
                         <td><asp:label runat="server" id="Power_Door_Locks"  text="Power_Door_Locks"></asp:label></td>
                         <td><asp:label runat="server" id="Power_Door_Locks1"  text="Power_Door_Locks"></asp:label></td>
                  </tr>
                   <tr>
                         <td>Feedback</td>
                         <td><asp:label runat="server" id="Feedback"  text="Feedback"></asp:label></td>
                         <td><asp:label runat="server" id="Feedback1"  text="Feedback"></asp:label></td>
                  </tr>
                  
                   <tr>
                         <td>rating</td>
                         <td><asp:label runat="server" id="rating"  text="rating"></asp:label></td>
                         <td><asp:label runat="server" id="rating1"  text="rating"></asp:label></td>
                  </tr>
            
              </table>
            </div>
            <div class="card-footer">
                <h6 class="display-6">Enter Email to get comparison report</h6>
                <label for="email">Email</label>
                <asp:TextBox runat="server" placeholder="Email"  CssClass="form-control" ID="email" TextMode="Email"></asp:TextBox><br />
                <asp:Button runat="server" CssClass="btn btn-success" text="Submit" OnClick="Unnamed1_Click" />
            </div>
        </div>
    </div>

   

</asp:Content>
