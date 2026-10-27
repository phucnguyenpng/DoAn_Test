using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DOAN_BANCAYCANH
{
    public partial class Web : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ListLoai.TypeName = "DOAN_BANCAYCANH.databaseClass";
            ListLoai.SelectMethod = "GetData";
            Parameter parameter = new Parameter
            {
                Name = "sql",
                DefaultValue = "SELECT * FROM [NhomCay]"

            };
            ListLoai.SelectParameters.Add(parameter);
            ListSP.TypeName = "DOAN_BANCAYCANH.databaseClass";
            ListSP.SelectMethod = "GetData";
            Parameter parameter1 = new Parameter
            {
                Name = "sql",
                DefaultValue = "SELECT [TenCay], [GiaBan], [HinhAnh], [IdSanPham] FROM [CayCanh]"
            };
            ListSP.SelectParameters.Add(parameter1);
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ListBox1.SelectedIndex > -1)
            {
                int idnhom = Convert.ToInt32(ListBox1.SelectedItem.Value);
                string sql = "SELECT [TenCay], [GiaBan], [HinhAnh], [IdSanPham] FROM [CayCanh] where IDNhom="+idnhom;
                ListSP.TypeName = "DOAN_BANCAYCANH.databaseClass";
                ListSP.SelectMethod = "GetData";
                Parameter parameter1 = new Parameter
                {
                    Name = "sql",
                    DefaultValue = sql
                };
                ListSP.SelectParameters.Clear();
                ListSP.SelectParameters.Add(parameter1);
                ListView1.DataBind();

            }
        }
        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "xem")
            {
                int idsanpham = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("viewSanPham.aspx?id=" + idsanpham);
            }
        }
    }
}