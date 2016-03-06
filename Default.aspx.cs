using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Console.WriteLine("asdfasdfasdfsdaf");
        Response.Write("test");

        String sql = "Select * from Users";

        MySqlConnection conn = SqlHelper.Connect();
        MySqlCommand command = new MySqlCommand(sql, conn);
        MySqlDataReader reader = command.ExecuteReader();

        while(reader.Read())
        {
            if (reader.HasRows)
            {
                Response.Write("/" + reader.GetString(0) + "/" + reader.GetString(1));
            }
        }

        reader.Close();
        conn.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Lable1.Text = "ahhhaa";
    }
}