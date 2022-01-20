﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdminMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            lblUserName.Text = Session["USERNAME"].ToString();
        }
        else
        {
            Response.Redirect("~/Admin/LoginPage.aspx");
        }
    }
}
