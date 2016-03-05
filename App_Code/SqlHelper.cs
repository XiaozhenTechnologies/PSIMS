using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

/// <summary>
/// Summary description for SqlHelper
/// </summary>
public class SqlHelper
{
    private static MySqlConnection conn;

    public static MySqlConnection Connect()
    {
        MySqlConnection myConn = new MySqlConnection("server=112.74.125.245;user id=manager;password=manager123;database=psims;CharSet=utf8;");
        String connectionString = myConn.ConnectionString;

        if(conn == null)
        {
            conn = new MySqlConnection(connectionString);
        }
        else if(conn.State == System.Data.ConnectionState.Closed)
        {
            conn.Open();
        }
        else if(conn.State == System.Data.ConnectionState.Broken)
        {
            conn.Close();
            conn.Open();
        }

        return conn;
    }
}