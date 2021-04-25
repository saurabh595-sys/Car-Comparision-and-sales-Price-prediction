using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
namespace WebApplication1
{
    public partial class admin_home : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.DataBind();
        }

        bool checkIfCarExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Car_detail where Car_id='" + Car_ID.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void addcar()
        {
            

            try
            {
                string filepath = "~/Img/Add.png";
                string filename = Path.GetFileName(Car_img.PostedFile.FileName);
                if (filename == "" || filename == null)
                {
                    filepath = global_filepath;

                }
                else
                {
                    Car_img.SaveAs(Server.MapPath("Img/" + filename));
                    filepath = "~/Car_Image/" + filename;
                }


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("insert into Car_detail(Car_id,Car_name,Std,Lux,EngineType,MaxPower,Maxtorque,Cylinder,Transmission,gearbox,Fuel_type,milage,Fuel_capicity,Front_Suspension,Rear_suspension,shock_absorben_type, Steering_Type,Front_Brake_Type,Rear_Brake_Type,Tyre_Size,Tyre_Type,Wheel_Size,Car_Length,Car_width,Car_Height,Power_Windows_Front,Power_Windows_Rear,Anti_Lock_Braking_System,Brake_Assist,Central_Locking,Power_Door_Locks,Car_img)values(@Car_ID,@Car_Name,@std,@Lux,@Engine_type,@MaxPower,@Maxtorque,@Cylinder,@transmisinon,@gearbox,@Fuel_Type,@Milage,@Capicity,@Front_Suspension,@Rear_Suspension,@Shock_absorben,@Steering_Type,@Front_Brake_Type,@Rear_Brake_Type,@Tyre_Size,@Tyre_Type,@Wheel_Size,@Car_Length,@Car_width,@Car_height,@Power_Windows_Front,@Power_Windows_Rear,@Anti_Lock_Braking_System,@Brake_Assist,@Central_Locking,@Power_Door_Locks,@Car_img) ", con);
                cmd.Parameters.AddWithValue("@Car_ID", Car_ID.Text.Trim());
                cmd.Parameters.AddWithValue("@Car_Name", Car_Name.Text.Trim());
                cmd.Parameters.AddWithValue("@std", std.Text.Trim());
                cmd.Parameters.AddWithValue("@Lux", Lux.Text.Trim());
                cmd.Parameters.AddWithValue("@Engine_type", Engine_type.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@MaxPower", MaxPower.Text.Trim());
                cmd.Parameters.AddWithValue("@Maxtorque", Maxtorque.Text.Trim());
                cmd.Parameters.AddWithValue("@Cylinder", Cylinder.Text.Trim());
                cmd.Parameters.AddWithValue("@transmisinon", transmisinon.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@gearbox", gearbox.Text.Trim());
                cmd.Parameters.AddWithValue("@Fuel_Type", Fuel_Type.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Milage", Avg_Milage.Text.Trim());
                cmd.Parameters.AddWithValue("@Capicity", Capicity.Text.Trim());
                cmd.Parameters.AddWithValue("@Front_Suspension", Front_Suspension.Text.Trim());
                cmd.Parameters.AddWithValue("@Rear_Suspension", Rear_Suspension.Text.Trim());
                cmd.Parameters.AddWithValue("@Shock_absorben", Shock_absorben.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Steering_Type", Steering_Type.Text.Trim());
                cmd.Parameters.AddWithValue("@Front_Brake_Type", Front_Brake_Type.Text.Trim());
                cmd.Parameters.AddWithValue("@Rear_Brake_Type", Rear_Brake_Type.Text.Trim());
                cmd.Parameters.AddWithValue("@Tyre_Size", Tyre_Size.Text.Trim());
                cmd.Parameters.AddWithValue("@Tyre_Type", Tyre_Type.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Wheel_Size", Wheel_Size.Text.Trim());
                cmd.Parameters.AddWithValue("@Car_Length", Car_Length.Text.Trim());
                cmd.Parameters.AddWithValue("@Car_width", Car_width.Text.Trim());
                cmd.Parameters.AddWithValue("@Car_height", Car_height.Text.Trim());
                cmd.Parameters.AddWithValue("@Power_Windows_Front", Power_Windows_Front.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Power_Windows_Rear", Power_Windows_Rear.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Anti_Lock_Braking_System", Anti_Lock_Braking_System.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Brake_Assist", Brake_Assist.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Central_Locking", Central_Locking.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Power_Door_Locks", Power_Door_Locks.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Car_img", filepath);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Car Added Sucessfull')</script>");


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
        void go()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from Car_detail WHERE Car_id='" + Car_ID.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    Car_Name.Text = dt.Rows[0]["Car_Name"].ToString();
                    std.Text = dt.Rows[0]["Std"].ToString();
                    Lux.Text = dt.Rows[0]["Lux"].ToString();

                    Engine_type.SelectedValue = dt.Rows[0]["EngineType"].ToString().Trim();

                    MaxPower.Text = dt.Rows[0]["MaxPower"].ToString();
                    Maxtorque.Text = dt.Rows[0]["Maxtorque"].ToString();
                    Cylinder.Text = dt.Rows[0]["Cylinder"].ToString();

                    transmisinon.SelectedValue = dt.Rows[0]["Transmission"].ToString().Trim();

                    gearbox.Text = dt.Rows[0]["gearbox"].ToString();

                    Fuel_Type.SelectedValue = dt.Rows[0]["Fuel_type"].ToString().Trim();

                    Avg_Milage.Text = dt.Rows[0]["milage"].ToString();
                    Capicity.Text = dt.Rows[0]["Fuel_capicity"].ToString();
                    Front_Suspension.Text = dt.Rows[0]["Front_Suspension"].ToString();
                    Rear_Suspension.Text = dt.Rows[0]["Rear_suspension"].ToString();


                    Shock_absorben.SelectedValue = dt.Rows[0]["shock_absorben_type"].ToString().Trim();

                    Steering_Type.Text = dt.Rows[0]["Steering_Type"].ToString();
                    Front_Brake_Type.Text = dt.Rows[0]["Front_Brake_Type"].ToString();
                    Rear_Brake_Type.Text = dt.Rows[0]["Rear_Brake_Type"].ToString();
                    Tyre_Size.Text = dt.Rows[0]["Tyre_Size"].ToString();


                    Tyre_Type.SelectedValue = dt.Rows[0]["Tyre_Type"].ToString().Trim();

                    Wheel_Size.Text = dt.Rows[0]["Wheel_Size"].ToString();
                    Car_Length.Text = dt.Rows[0]["Car_Length"].ToString();
                    Car_width.Text = dt.Rows[0]["Car_width"].ToString();
                    Car_height.Text = dt.Rows[0]["Car_Height"].ToString();

                    Power_Windows_Front.SelectedValue = dt.Rows[0]["Power_Windows_Front"].ToString().Trim();

                    Power_Windows_Rear.SelectedValue = dt.Rows[0]["Power_Windows_Rear"].ToString().Trim();

                    Anti_Lock_Braking_System.SelectedValue = dt.Rows[0]["Anti_Lock_Braking_System"].ToString().Trim();

                    Brake_Assist.SelectedValue = dt.Rows[0]["Brake_Assist"].ToString().Trim();

                    Central_Locking.SelectedValue = dt.Rows[0]["Central_Locking"].ToString().Trim();

                    Power_Door_Locks.SelectedValue = dt.Rows[0]["Power_Door_Locks"].ToString().Trim();



                }
                else
                {
                    Response.Write("<script>alert('Invalid Car ID');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }

        void update()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE Car_detail set Car_id= @Car_ID, Car_name=@Car_Name, Std= @std, Lux= @Lux, EngineType= @Engine_type, MaxPower= @MaxPower, Maxtorque= @Maxtorque, Cylinder= @Cylinder, Transmission= @transmisinon, gearbox= @gearbox, Fuel_type= @Fuel_Type, milage= @Milage, Fuel_capicity= @Capicity, Front_Suspension= @Front_Suspension, Rear_suspension= @Rear_Suspension, shock_absorben_type=shock_absorben_type, Steering_Type=Steering_Type, Front_Brake_Type=@Front_Brake_Type, Rear_Brake_Type=@Rear_Brake_Type, Tyre_Size=@Tyre_Size, Tyre_Type=@Tyre_Type, Wheel_Size=@Wheel_Size, Car_Length=@Car_Length, Car_width=@Car_width, Car_Height=@Car_Height, Power_Windows_Front=@Power_Windows_Front, Power_Windows_Rear=@Power_Windows_Rear, Anti_Lock_Braking_System=@Anti_Lock_Braking_System, Brake_Assist=@Brake_Assist, Central_Locking=@Central_Locking, Power_Door_Locks=@Power_Door_Locks where Car_id='" + Car_ID.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@Car_ID", Car_ID.Text.Trim());
                cmd.Parameters.AddWithValue("@Car_Name", Car_Name.Text.Trim());
                cmd.Parameters.AddWithValue("@std", std.Text.Trim());
                cmd.Parameters.AddWithValue("@Lux", Lux.Text.Trim());
                cmd.Parameters.AddWithValue("@Engine_type", Engine_type.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@MaxPower", MaxPower.Text.Trim());
                cmd.Parameters.AddWithValue("@Maxtorque", Maxtorque.Text.Trim());
                cmd.Parameters.AddWithValue("@Cylinder", Cylinder.Text.Trim());
                cmd.Parameters.AddWithValue("@transmisinon", transmisinon.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@gearbox", gearbox.Text.Trim());
                cmd.Parameters.AddWithValue("@Fuel_Type", Fuel_Type.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Milage", Avg_Milage.Text.Trim());
                cmd.Parameters.AddWithValue("@Capicity", Capicity.Text.Trim());
                cmd.Parameters.AddWithValue("@Front_Suspension", Front_Suspension.Text.Trim());
                cmd.Parameters.AddWithValue("@Rear_Suspension", Rear_Suspension.Text.Trim());
                cmd.Parameters.AddWithValue("@Shock_absorben", Shock_absorben.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Steering_Type", Steering_Type.Text.Trim());
                cmd.Parameters.AddWithValue("@Front_Brake_Type", Front_Brake_Type.Text.Trim());
                cmd.Parameters.AddWithValue("@Rear_Brake_Type", Rear_Brake_Type.Text.Trim());
                cmd.Parameters.AddWithValue("@Tyre_Size", Tyre_Size.Text.Trim());
                cmd.Parameters.AddWithValue("@Tyre_Type", Tyre_Type.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Wheel_Size", Wheel_Size.Text.Trim());
                cmd.Parameters.AddWithValue("@Car_Length", Car_Length.Text.Trim());
                cmd.Parameters.AddWithValue("@Car_width", Car_width.Text.Trim());
                cmd.Parameters.AddWithValue("@Car_height", Car_height.Text.Trim());
                cmd.Parameters.AddWithValue("@Power_Windows_Front", Power_Windows_Front.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Power_Windows_Rear", Power_Windows_Rear.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Anti_Lock_Braking_System", Anti_Lock_Braking_System.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Brake_Assist", Brake_Assist.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Central_Locking", Central_Locking.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Power_Door_Locks", Power_Door_Locks.SelectedItem.Value);


                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('Car Data Updated Successfully');</script>");


            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        //gobutton
        protected void Button4_Click(object sender, EventArgs e)
        {
            go();
        }
        //Addbutton
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkIfCarExists())
            {

                Response.Write("<script>alert('Car alredy Exist')</script>");

            }
            else
            {
                addcar();
            }
        }

        //Update
        protected void Button2_Click(object sender, EventArgs e)
        {
            update();
        }
    }
}