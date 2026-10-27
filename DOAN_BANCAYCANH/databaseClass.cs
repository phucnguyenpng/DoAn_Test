using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DOAN_BANCAYCANH
{
    public class databaseClass
    {
        public DataTable GetData(String sql)
        {
            string conStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(conStr);
            SqlDataAdapter da = new SqlDataAdapter(sql, connection);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds.Tables[0];
        }
        public void RunQuery(String sql)
        {
            SqlConnection connection = null;
            try
            {
                string conStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                connection = new SqlConnection(conStr);
                using (SqlCommand myCom = new SqlCommand(sql, connection))
                {
                    myCom.CommandType = CommandType.Text;
                    myCom.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
            }
            finally
            {
                if (connection != null)
                    connection.Close();
            }
        }
        public SqlDataReader GetRecord(String sql)
        {
            SqlConnection connection = null;
            SqlDataReader sqlData = null;
            try
            {
                string conStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                connection = new SqlConnection(conStr);
                connection.Open();
                using (SqlCommand myCom = new SqlCommand(sql,connection))
                {
                    myCom.CommandType = CommandType.Text;
                    sqlData = myCom.ExecuteReader();
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
            }
            return sqlData;
        }
    }   
}