using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

namespace UserDetails1
{
    public partial class userDetails : System.Web.UI.Page
    {
        string query;
        public MySqlCommand cmd;
        private CommanFunctions cf = new CommanFunctions();
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {             
                getdata();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showpanel", "grid();", true);
            }
        }

        //function to fetch user records and fill gridview
        protected void getdata()
        {
            try
            {
                cf.setQuery("select id,name,email,role,status,mobile from userdata");
                dt = cf.QueryEx();

                if (dt.Rows.Count > 0)
                {
                    grd_LeadList.DataSource = dt;
                    grd_LeadList.DataBind();
                    grd_LeadList.Visible = true;
                    divEmpty.Visible = false;
                }
                else
                {
                    grd_LeadList.Visible = false;
                    divEmpty.Visible = true;
                }
            }
            catch(Exception ex)
            {

            }
            
        }

        //event triggered when edit button clicked
        protected void grd_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            try
            {
                int currentRowIndex, id;
                if (e.CommandName == "EditRecord")
                {
                    currentRowIndex = Int32.Parse(e.CommandArgument.ToString());
                    id = int.Parse(grd_LeadList.Rows[currentRowIndex].Cells[0].Text);

                    cf.setQuery("SELECT * FROM userdata where id=" + id +" order by name");
                    dt = cf.QueryEx();

                    if (dt.Rows.Count > 0)
                    {
                        btnAddUser.Text = "Update";
                        btnAddUser.CssClass = "btn btn-info form-control";

                        hidID.Value = id.ToString();
                        txtName.Text = dt.Rows[0]["name"].ToString();
                        txtEmail.Text = dt.Rows[0]["email"].ToString();
                        rblRole.SelectedIndex = rblRole.Items.IndexOf(rblRole.Items.FindByText(dt.Rows[0]["role"].ToString()));
                        ddlStatus.SelectedIndex = ddlStatus.Items.IndexOf(ddlStatus.Items.FindByText(dt.Rows[0]["status"].ToString()));
                        txtMobile.Text = dt.Rows[0]["mobile"].ToString();

                       
                    }
                }
                if (e.CommandName == "DeleteRecord")
                {
                    currentRowIndex = Int32.Parse(e.CommandArgument.ToString());
                    id = int.Parse(grd_LeadList.Rows[currentRowIndex].Cells[0].Text);

                    cf.setQuery("delete from userdata where id = " + id);
                    cf.NonQueryEx();

                    getdata();

                }

            }
            catch (Exception ex)
            {
            }


        }

        //Add User button click event
        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            try
            {
                if (btnAddUser.Text == "Add User")
                {
                    query = "insert into userdata (name,email,role,status,mobile) values (@name,@email,@role,@status,@mobile)";

                    cmd = new MySqlCommand();
                    cmd.Parameters.Add("@name", MySqlDbType.VarChar, 100).Value = hidName.Value.ToString();
                    cmd.Parameters.Add("@email", MySqlDbType.VarChar, 100).Value = hidEmail.Value.ToString();
                    String Role = "";
                    if (hidRole.Value.ToString() == "0")
                    {
                        Role = "Admin";
                    }
                    else if (hidRole.Value.ToString() == "1")
                    {
                        Role = "Customer Executive";
                    }
                    cmd.Parameters.Add("@role", MySqlDbType.VarChar, 45).Value = Role;

                    String status = "";
                    if (hidStatus.Value.ToString() == "1")
                    {
                        status = "Active";
                    }
                    else if (hidStatus.Value.ToString() == "2")
                    {
                        status = "Pending";
                    }
                    else if (hidStatus.Value.ToString() == "3")
                    {
                        status = "Inactive";
                    }
                    cmd.Parameters.Add("@status", MySqlDbType.VarChar, 45).Value = status;
                    cmd.Parameters.Add("@mobile", MySqlDbType.VarChar, 12).Value = hidMobile.Value.ToString();

                    if (cf.ExecuteSQLWithparameter(query, cmd.Parameters) == "OK")
                    {
                        getdata();
                    }
                }
                else if (btnAddUser.Text == "Update")
                {
                    query = "update userdata set name=@name,email=@email,role=@role,status=@status,mobile=@mobile where id = " + int.Parse(hidID.Value.ToString());

                    cmd = new MySqlCommand();

                    cmd.Parameters.Add("@name", MySqlDbType.VarChar, 100).Value = hidName.Value.ToString();
                    cmd.Parameters.Add("@email", MySqlDbType.VarChar, 100).Value = hidEmail.Value.ToString();
                    String Role = "";
                    if (hidRole.Value.ToString() == "0")
                    {
                        Role = "Admin";
                    }
                    else if (hidRole.Value.ToString() == "1")
                    {
                        Role = "Customer Executive";
                    }
                    cmd.Parameters.Add("@role", MySqlDbType.VarChar, 45).Value = Role;

                    String status = "";
                    if (hidStatus.Value.ToString() == "1")
                    {
                        status = "Active";
                    }
                    else if (hidStatus.Value.ToString() == "2")
                    {
                        status = "Pending";
                    }
                    else if (hidStatus.Value.ToString() == "3")
                    {
                        status = "Inactive";
                    }
                    cmd.Parameters.Add("@status", MySqlDbType.VarChar, 45).Value = status;
                    cmd.Parameters.Add("@mobile", MySqlDbType.VarChar, 12).Value = hidMobile.Value.ToString();


                    if (cf.ExecuteSQLWithparameter(query, cmd.Parameters) == "OK")
                    {
                        getdata();                       
                    }
                }
            }
            catch(Exception ex)
            {

            }


        }


    }
}