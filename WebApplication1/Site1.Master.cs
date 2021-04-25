using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    Admin.Visible = false;
                    Logout.Visible = false;
                    Compare.Visible =false;
                    Price.Visible = false;
                    Accessories.Visible = false;
                }
                else if (Session["role"].Equals("user"))
                {
                    Logout.Visible = true;
                    Signup.Visible = false;
                    Login.Visible = false;
                    Compare.Visible = true;
                    Price.Visible = true;
                    Accessories.Visible = true;
                }
                else if (Session["role"].Equals("Admin"))
                {
                    Logout.Visible = true;
                    Signup.Visible = false;
                    Login.Visible = false;
                    Admin.Visible = true;
                    Compare.Visible = true;
                    Price.Visible = true;
                    Accessories.Visible = true; ;
                }
            }
            catch (Exception ex)
            {
                
            }
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Session["role"] = "";
            Response.Redirect("Home.aspx");
         
        }
    }
}