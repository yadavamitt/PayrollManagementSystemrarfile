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

public partial class Admin_PersonalInfo : System.Web.UI.Page
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
            auto();
            BindProvince();
            txtDateOfJoin.Text = DateTime.Today.ToString("yyyy-MM-dd");
            txtDOB.Text = DateTime.Today.ToString("yyyy-MM-dd");
        }
    }

    private void auto()
    {
        int Num = 0;
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString);
        con.Open();
        string sql = "SELECT MAX(ID+1) FROM EmployeeTable";
        cmd = new SqlCommand(sql);
        cmd.Connection = con;
        if (Convert.IsDBNull(cmd.ExecuteScalar()))
        {
            Num = 1;
            lblEmployeeId.Text = Convert.ToString(Num);
            txtEmployeeId.Text = Convert.ToString("EMP-" + Num);
        }
        else
        {
            Num = (int)(cmd.ExecuteScalar());
            lblEmployeeId.Text = Convert.ToString(Num);
            txtEmployeeId.Text = Convert.ToString("EMP-" + Num);
        }
        cmd.Dispose();
        con.Close();
        con.Dispose();
    }

    private void BindProvince()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("select * from CityTable", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                ddlProvinceID.DataSource = dt;
                ddlProvinceID.DataTextField = "Province";
                ddlProvinceID.DataValueField = "Province";
                ddlProvinceID.DataBind();
                ddlProvinceID.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            else
            {
                ddlProvinceID.Items.Clear();
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlConnection con1 = new SqlConnection(CS);
            con1.Open();
            str = "select count(*)from EmployeeTable where Mail='" + txtEmail.Text + "'";
            com = new SqlCommand(str, con1);
            int count = Convert.ToInt32(com.ExecuteScalar());
            if (count > 0)
            {
                string message = "Mail Id Already Exits";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                txtEmail.Text = "";
                return;
            }
            else
            {
                string strQuery = "insert into EmployeeTable(EmployeeId,Tittle,FirstName,LastName,FathersName,CNIC,AdharCard,PANCard,DateOfBirth,Age,Qualificattion,Mail,MobileNo,Address,DateOfJoin,ProvinceId,Status) values (@EmployeeId,@Tittle,@FirstName,@LastName,@FathersName,@CNIC,@AdharCard,@PANCard,@DateOfBirth,@Age,@Qualificattion,@Mail,@MobileNo,@Address,@DateOfJoin,@ProvinceId,@Status)";
                SqlCommand cmd = new SqlCommand(strQuery);
                cmd.Parameters.Add("@EmployeeId", SqlDbType.VarChar).Value = txtEmployeeId.Text;
                cmd.Parameters.Add("@Tittle", SqlDbType.NVarChar).Value = txtTittle.Text;
                cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar).Value = txtFirstName.Text;
                cmd.Parameters.Add("@LastName", SqlDbType.NVarChar).Value = txtLastName.Text;
                cmd.Parameters.Add("@FathersName", SqlDbType.NVarChar).Value = txtFathersName.Text;
                cmd.Parameters.Add("@CNIC", SqlDbType.NVarChar).Value = txtCNIC.Text;
                cmd.Parameters.Add("@AdharCard", SqlDbType.NVarChar).Value = txtAdharId.Text;
                cmd.Parameters.Add("@PANCard", SqlDbType.NVarChar).Value = txtPANId.Text;
                cmd.Parameters.Add("@DateOfBirth", SqlDbType.Date).Value = txtDOB.Text;
                cmd.Parameters.Add("@Age", SqlDbType.VarChar).Value = txtAge.Text;
                cmd.Parameters.Add("@Qualificattion", SqlDbType.VarChar).Value = txtQualificattion.Text;
                cmd.Parameters.Add("@Mail", SqlDbType.VarChar).Value = txtEmail.Text;
                cmd.Parameters.Add("@MobileNo", SqlDbType.VarChar).Value = txtMobileNo.Text;
                cmd.Parameters.Add("@Address", SqlDbType.NVarChar).Value = txtAddress.Text;
                cmd.Parameters.Add("@DateOfJoin", SqlDbType.Date).Value = txtDateOfJoin.Text;
                cmd.Parameters.Add("@ProvinceId", SqlDbType.NVarChar).Value = ddlProvinceID.Text;
                cmd.Parameters.Add("@Status", SqlDbType.NVarChar).Value = ddlStatus.Text;
                InsertUpdateData(cmd);
                Clear();
                string message = "New Employee added successfully!!";
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
            Clear();
            auto();
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
         txtTittle.Text = "";
         txtQualificattion.Text = "";
         txtPANId.Text = "";
         txtMobileNo.Text = "";
         txtLastName.Text = "";
         txtFirstName.Text = "";
         txtFathersName.Text = "";
         txtEmail.Text = "";
         txtCNIC.Text = "";
         txtAge.Text = "";
         txtAdharId.Text = "";
         txtAddress.Text = "";
         txtDateOfJoin.Text = DateTime.Today.ToString("yyyy-MM-dd");
         txtDOB.Text = DateTime.Today.ToString("yyyy-MM-dd");
     }
}