using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Drawing.Imaging;
using System.Drawing;

public partial class Admin_UserPage : System.Web.UI.Page
{
    SqlCommand com;
    string str;
    SqlCommand cmd;
    SqlConnection con;
    String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
    SqlDataReader rdr;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindEmployee();
        }
    }

    private void BindEmployee()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("Select EmployeeId from EmployeeTable", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                ddlEmployeeId.DataSource = dt;
                ddlEmployeeId.DataTextField = "EmployeeId";
                ddlEmployeeId.DataValueField = "EmployeeId";
                ddlEmployeeId.DataBind();
                ddlEmployeeId.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            else
            {
                ddlEmployeeId.Items.Clear();
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
         String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
         using (SqlConnection con = new SqlConnection(CS))
         {
             SqlConnection con2 = new SqlConnection(CS);
             con2.Open();
             str = "select count(*) from UserTable where EmployeeId='" + ddlEmployeeId.Text + "'";
             com = new SqlCommand(str, con2);
             int count1 = Convert.ToInt32(com.ExecuteScalar());
             if (count1 > 0)
             {
                 string message = "EmployeeId Already Exist";
                 System.Text.StringBuilder sb = new System.Text.StringBuilder();
                 sb.Append("<script type = 'text/javascript'>");
                 sb.Append("window.onload=function(){");
                 sb.Append("alert('");
                 sb.Append(message);
                 sb.Append("')};");
                 sb.Append("</script>");
                 ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                 return;
             }
             else
             {
                 string strQuery = "insert into UserTable(EmployeeId,FirstName,LastName,Password,UserRole) values (@EmployeeId,@FirstName,@LastName,@Password,@UserRole)";
                 SqlCommand cmd = new SqlCommand(strQuery);
                 cmd.Parameters.Add("@EmployeeId", SqlDbType.VarChar).Value = ddlEmployeeId.Text;
                 cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar).Value = txtFirstName.Text;
                 cmd.Parameters.Add("@LastName", SqlDbType.NVarChar).Value = txtLastName.Text;
                 cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = txtPassword.Text;
                 cmd.Parameters.Add("@UserRole", SqlDbType.NVarChar).Value = ddlUserRole.Text;
                 InsertUpdateData(cmd);
                 Clear();
                 string message = "Register Successfully!!";
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

    private Boolean InsertUpdateData(SqlCommand cmd)
    {
        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            BindEmployee();
            return true;
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            return false;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }

    private void Clear()
    {
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtPassword.Text = "";
    }

    protected void ddlEmployeeId_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sql = "select * from EmployeeTable Where EmployeeId = '" + ddlEmployeeId.Text + "'";
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        SqlDataAdapter adpt = new SqlDataAdapter(sql, con.ConnectionString);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        txtFirstName.Text =  dt.Rows[0]["FirstName"].ToString();
        txtLastName.Text = dt.Rows[0]["LastName"].ToString();
    }
}