using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;
using System.IO;
using System.Net.Mail;
using System.Net;

namespace UserDetails1
{
    public class CommanFunctions
    {
        private MySqlConnection con;
        public MySqlCommand cmd;
        private MySqlDataAdapter da;
        private MySqlDataReader dr;
        DataTable dt;
        public static string user_id, id, date;

        public CommanFunctions()
        {
            try
            {
                string strcon = ConfigurationManager.ConnectionStrings["userdetails"].ConnectionString;
                con = new MySqlConnection(strcon);
            }
            catch
            { }
        }

        public void setQuery(string query)
        {
            try
            {
                cmd = new MySqlCommand(query, con);
            }
            catch
            { }
        }

        public DataTable QueryEx()
        {
            try
            {
                con.Open();
                da = new MySqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                con.Close();
                return dt;
            }
            catch
            {
                con.Close();
                return null;
            }
        }

        public void NonQueryEx()
        {
            try
            {
                con.Open();
                cmd.CommandTimeout = 0;
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch
            {
                con.Close();
            }
        }
        public MySqlDataReader readerExecute()
        {
            try
            {
                con.Open();
                dr = cmd.ExecuteReader();
                con.Close();
                return dr;
            }
            catch
            {
                con.Close();
                return null;
            }
        }
      
   
        public string ExecuteSQLWithparameter(string SQL, MySqlParameterCollection @params)
        {

            cmd = new MySqlCommand(SQL, con);
            con.Open();
            id = "OK";
            try
            {
                for (int i = 0; i <= @params.Count - 1; i++)
                {
                    if ((@params[i].Value != null))
                    {
                        if (!CheckSpecialCharacters(@params[i].Value.ToString()))
                        {
                            return null;
                        }
                    }
                    else
                    {
                        @params[i].Value = string.Empty;
                    }
                    cmd.Parameters.Add(@params[i].ParameterName, @params[i].MySqlDbType, @params[i].Size).Value = @params[i].Value;

                }

                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                con.Close();
                return ex.Message.ToString();
            }
            con.Close();
            return id;
        }
       
        public static bool CheckSQLQuery(string sql)
        {
            //If sql.ToLower.Contains("ansi_warnings") Or sql.ToLower.Contains("declare") Or sql.ToLower.Contains("waitfor") Or sql.ToLower.Contains("delay") Then
            //Dim path As String = HttpContext.Current.Server.MapPath(HttpContext.Current.Request.ApplicationPath)
            try
            {
                string path = HttpContext.Current.Server.MapPath("~/SQLErrorLogs/");
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                string hostname = HttpContext.Current.Request.UserHostName;
                string ip = "";
                //HttpContext.Current.Request.UrlReferrer.Host.Trim()
                string filename = String.Format("{0:yyyyMMddHHmmss}", System.DateTime.Now);
                path = path + filename + ".txt";
                StreamWriter sw = File.CreateText(path);
                sw.WriteLine(sql.ToString() + " " + hostname + "  " + ip + "  " + String.Format("{dd/MM/yyyy HH:mm:ss}", System.DateTime.Now));
                sw.Flush();
                sw.Close();
            }
            catch (Exception ex)
            {
            }
            return true;
        }
        public static bool CheckSpecialCharacters(string input, string Extra = "")
        {
            if (input.Contains("'"))
            {
                input.Replace("'", "\'");
                //CheckSQLQuery(input);
                //return false;
            }
            if (input.Contains("\""))
            {
                input.Replace("\"", "\"");
                //CheckSQLQuery(input);
                //return false;
            }
            //else if (input.Contains(";"))
            //{
            //    input.Replace(";", "");
            //    CheckSQLQuery(input);
            //    return false;
            //}
            //else if (input.Contains("(") & !(Extra.ToLower() == "flight"))
            //{
            //    input.Replace("(", "");
            //    CheckSQLQuery(input);
            //    return false;
            //}
            //else if (input.Contains(")") & !(Extra.ToLower() == "flight"))
            //{
            //    input.Replace(")", "");
            //    CheckSQLQuery(input);
            //    return false;
            //}
            //else if (input.Contains("|"))
            //{
            //    input.Replace("|", "");
            //    CheckSQLQuery(input);
            //    return false;
            //}
            //else if (input.ToLower().Contains("ansi_warnings"))
            //{
            //    input.Replace("ansi_warnings", "");
            //    CheckSQLQuery(input);
            //    return false;
            //}
            //else if (input.ToLower().Contains("declare"))
            //{
            //    input.Replace("declare", "");
            //    CheckSQLQuery(input);
            //    return false;
            //}
            //else if (input.ToLower().Contains("waitfor"))
            //{
            //    input.Replace("waitfor", "");
            //    CheckSQLQuery(input);
            //    return false;
            //}
            //else if (input.ToLower().Contains("delay"))
            //{
            //    input.Replace("delay", "");
            //    CheckSQLQuery(input);
            //    return false;
            //}
            //else if (input.ToLower().Contains("union"))
            //{
            //    input.Replace("union", "");
            //    CheckSQLQuery(input);
            //    return false;
            //}
            //else if (input.ToLower().Contains("merge"))
            //{
            //    input.Replace("merge", "");
            //    CheckSQLQuery(input);
            //    return false;
            //}
            //else if (input.ToLower().Contains("intersect"))
            //{
            //    input.Replace("intersect", "");
            //    CheckSQLQuery(input);
            //    return false;
            //}
            //else if (input.ToLower().Contains("except"))
            //{
            //    input.Replace("except", "");
            //    CheckSQLQuery(input);
            //    return false;
            //}
            //else if (input.ToLower().Contains("clause"))
            //{
            //    input.Replace("clause", "");
            //    CheckSQLQuery(input);
            //    return false;
            //}
            //else if (input.ToLower().Contains("drop"))
            //{
            //    input.Replace("drop", "");
            //    CheckSQLQuery(input);
            //    return false;
            //}
            //else if (input.ToLower().Contains("alter"))
            //{
            //    input.Replace("alter", "");
            //    CheckSQLQuery(input);
            //    return false;
            //}
            //else if (input.ToLower().Contains("delete"))
            //{
            //    input.Replace("delete", "");
            //    CheckSQLQuery(input);
            //    return false;
            //}
            //else if (input.ToLower().Contains("truncate"))
            //{
            //    input.Replace("truncate", "");
            //    CheckSQLQuery(input);
            //    return false;
            //}
            //else if (input.ToLower().Contains("dump"))
            //{
            //    input.Replace("dump", "");
            //    CheckSQLQuery(input);
            //    return false;
            //}
            //else if (input.ToLower().Contains("sp_depends"))
            //{
            //    input.Replace("sp_depends", "");
            //    CheckSQLQuery(input);
            //    return false;
            //}
            //else if (input.ToLower().Contains("sp_spaceused"))
            //{
            //    input.Replace("sp_spaceused", "");
            //    CheckSQLQuery(input);
            //    return false;
            //}
            //else if (input.ToLower().Contains("sp_help"))
            //{
            //    input.Replace("sp_help", "");
            //    CheckSQLQuery(input);
            //    return false;
            //}
            return true;
        }

        public DataTable FillDropDownList(DropDownList dropdown, string query, string valueField, string textField)
        {
            try
            {
                setQuery(query);
                dt = QueryEx();
                dropdown.ClearSelection();
                dropdown.DataSource = dt;
                dropdown.DataValueField = valueField;
                dropdown.DataTextField = textField;
                dropdown.DataBind();
                con.Close();

            }
            catch { }
            return dt;
        }

        public DataTable FillDropDownList1(ListBox dropdown, string query, string valueField, string textField)
        {
            try
            {
                setQuery(query);
                dt = QueryEx();
                dropdown.ClearSelection();
                dropdown.DataSource = dt;
                dropdown.DataValueField = valueField;
                dropdown.DataTextField = textField;
                dropdown.DataBind();
                con.Close();

            }
            catch { }
            return dt;
        }
    }
}