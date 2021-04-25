using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using System.Net;
using System.Net.Mail;
using iTextSharp.text;
using iTextSharp.text.pdf;

using System.IO;
using System.Web.Services;

namespace WebApplication1
{
    public partial class Carcompare : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
    
   

        protected void Page_Load(object sender, EventArgs e)
        {
         
            comparereport.Visible = false;
        }
        //email
        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            try { 
            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);
            carcomparereport.RenderControl(htmlTextWriter);
            StringReader stringReader = new StringReader(stringWriter.ToString());
            Document Doc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(Doc);


            using (MemoryStream memoryStream = new MemoryStream())
            {
                PdfWriter writer = PdfWriter.GetInstance(Doc, memoryStream);
                Doc.Open();
                htmlparser.Parse(stringReader);
                Doc.Close();
                byte[] bytes = memoryStream.ToArray();
                memoryStream.Close();

                MailMessage mm = new MailMessage("email", email.Text.Trim());
                mm.Subject = "compare report PDF";
                mm.Body = "compare report of your two selected car";
                mm.Attachments.Add(new Attachment(new MemoryStream(bytes), "iTextSharpPDF.pdf"));
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential();
                NetworkCred.UserName = "email";
                NetworkCred.Password = "pass";
               
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
                    Response.Write("<script>alert('Mailed Successfully');</script>");
                }
            }
            catch(Exception ex)
            {
                Response.Write(ex);
            }
        }
        public override void VerifyRenderingInServerForm(Control control) { }
        //compare
        protected void Compare_Click(object sender, EventArgs e)
        {
            try
            {
          
                compare();
            
            }
            catch(Exception ex)
            {
                Response.Write(ex);
            }
           
        }


                  
      



        void compare(){
            comparereport.Visible = true;
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Car_detail where Car_Name IN('" + car1.Text.Trim() + "','" + car2.Text.Trim() + "')", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    Carname1.Text = dt.Rows[0]["Car_Name"].ToString();
               

                    Std.Text = dt.Rows[0]["Std"].ToString();
                 

                    lux.Text = dt.Rows[0]["Lux"].ToString();
                   

                    EngineType.Text= dt.Rows[0]["EngineType"].ToString();
                  

                    MaxPower.Text = dt.Rows[0]["MaxPower"].ToString();
               

                    Maxtorque.Text = dt.Rows[0]["Maxtorque"].ToString();
                   

                    Cylinder.Text = dt.Rows[0]["Cylinder"].ToString();
                   

                    Transmission.Text = dt.Rows[0]["Transmission"].ToString();
                   

                    gearbox.Text = dt.Rows[0]["gearbox"].ToString();
                   

                    Fuel_type.Text = dt.Rows[0]["Fuel_type"].ToString();
                   

                    milage.Text = dt.Rows[0]["milage"].ToString();
                  


                    Fuel_capicity.Text = dt.Rows[0]["Fuel_capicity"].ToString();
                   

                    Front_Suspension.Text = dt.Rows[0]["Front_Suspension"].ToString();
                

                   Rear_suspension.Text = dt.Rows[0]["Rear_suspension"].ToString();
                   


                    shock_absorben_type.Text = dt.Rows[0]["shock_absorben_type"].ToString();
                 


                       
                     Steering_Type.Text = dt.Rows[0]["Steering_Type"].ToString();
                    

                    Front_Brake_Type.Text = dt.Rows[0]["Front_Brake_Type"].ToString();
                   

                    Rear_Brake_Type.Text = dt.Rows[0]["Rear_Brake_Type"].ToString();
                

                    Tyre_Size.Text = dt.Rows[0]["Tyre_Size"].ToString();
            


                    Tyre_Type.Text = dt.Rows[0]["Tyre_Type"].ToString().Trim();
                

                    Wheel_Size.Text = dt.Rows[0]["Wheel_Size"].ToString();

                    Car_Length.Text = dt.Rows[0]["Car_Length"].ToString();
                   

                    Car_width.Text = dt.Rows[0]["Car_width"].ToString();
            

                    Car_Height.Text = dt.Rows[0]["Car_Height"].ToString();
                  

                    Power_Windows_Front.Text = dt.Rows[0]["Power_Windows_Front"].ToString();
                    

                    Power_Windows_Rear.Text = dt.Rows[0]["Power_Windows_Rear"].ToString();
                   

                    Anti_Lock_Braking_System.Text = dt.Rows[0]["Anti_Lock_Braking_System"].ToString();
                    

                    Brake_Assist.Text = dt.Rows[0]["Brake_Assist"].ToString();
                   
                    Central_Locking.Text = dt.Rows[0]["Central_Locking"].ToString();
  

                    Power_Door_Locks.Text = dt.Rows[0]["Power_Door_Locks"].ToString();
            
                    
                          Feedback.Text = dt.Rows[0]["Feedback"].ToString();
                   

                    rating.Text = dt.Rows[0]["rating"].ToString();

                    Carname2.Text = dt.Rows[1]["Car_Name"].ToString();


                    std2.Text = dt.Rows[1]["Std"].ToString();


                    lux2.Text = dt.Rows[1]["Lux"].ToString();


                    EngineType1.Text = dt.Rows[1]["EngineType"].ToString();


                    MaxPower1.Text = dt.Rows[1]["MaxPower"].ToString();


                    Maxtorque1.Text = dt.Rows[1]["Maxtorque"].ToString();


                    Cylinder1.Text = dt.Rows[1]["Cylinder"].ToString();


                    Transmission1.Text = dt.Rows[1]["Transmission"].ToString();


                    gearbox1.Text = dt.Rows[1]["gearbox"].ToString();


                    Fuel_type1.Text = dt.Rows[1]["Fuel_type"].ToString();


                    milage1.Text = dt.Rows[1]["milage"].ToString();


                    Fuel_capicity1.Text = dt.Rows[1]["Fuel_capicity"].ToString();

                    Front_Suspension1.Text = dt.Rows[1]["Front_Suspension"].ToString();

                    Rear_suspension1.Text = dt.Rows[1]["Rear_suspension"].ToString();

                    shock_absorben_type1.Text = dt.Rows[1]["shock_absorben_type"].ToString();


                    Steering_Type1.Text = dt.Rows[1]["Steering_Type"].ToString();

                    Front_Brake_Type1.Text = dt.Rows[1]["Front_Brake_Type"].ToString();

                    Rear_Brake_Type1.Text = dt.Rows[1]["Rear_Brake_Type"].ToString();

                    Tyre_Size1.Text = dt.Rows[1]["Tyre_Size"].ToString();


                    Tyre_Type1.Text = dt.Rows[1]["Tyre_Type"].ToString().Trim();

                    Wheel_Size1.Text = dt.Rows[1]["Wheel_Size"].ToString();

                    Car_Length1.Text = dt.Rows[1]["Car_Length"].ToString();

                    Car_width1.Text = dt.Rows[1]["Car_width"].ToString();

                    Car_Height1.Text = dt.Rows[1]["Car_Height"].ToString();

                    Power_Windows_Front1.Text = dt.Rows[1]["Power_Windows_Front"].ToString();

                    Power_Windows_Rear1.Text = dt.Rows[1]["Power_Windows_Rear"].ToString();

                    Anti_Lock_Braking_System1.Text = dt.Rows[1]["Anti_Lock_Braking_System"].ToString();

                    Brake_Assist1.Text = dt.Rows[1]["Brake_Assist"].ToString();

                    Central_Locking1.Text = dt.Rows[1]["Central_Locking"].ToString();

                    Power_Door_Locks1.Text = dt.Rows[1]["Power_Door_Locks"].ToString();


                    Feedback1.Text = dt.Rows[1]["Feedback"].ToString();

                    rating1.Text = dt.Rows[1]["rating"].ToString();


                }
                else
                {
                    
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
       


    }
}