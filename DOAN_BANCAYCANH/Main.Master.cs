using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DOAN_BANCAYCANH
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataReader myDr = new databaseClass().GetRecord("select Matkhau from Nguoidung where Taikhoan='" + tk.Text + "'");
            if (myDr.HasRows)
            {
                myDr.Read();
                string p  = myDr.GetValue(0).ToString();
                if(p == pass.Text)
                {
                    Session["username"] = tk.Text;
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Sai tài khoản hoặc mật khẩu')", true);
                }
            }
        }
    }
}