using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class LoginPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("select * from UserTable where EmployeeId='" + txtEmployeeId.Text + "' and Password='" + txtPassword.Text + "'", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                Session["EMPID"] = dt.Rows[0]["EmployeeId"].ToString();
                Session["USERNAME"] = dt.Rows[0]["FirstName"].ToString();

                string Ulevel;
                Ulevel = dt.Rows[0][5].ToString().Trim();

                if (Ulevel == "Admin")
                {
                    Session["EMPID"] = txtEmployeeId.Text;
                    Response.Redirect("~/Admin/DashboardPage.aspx");
                }

            }
            else
            {
                string message = "Invalid Employee Id or Password !";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
            }
        }
    }
}