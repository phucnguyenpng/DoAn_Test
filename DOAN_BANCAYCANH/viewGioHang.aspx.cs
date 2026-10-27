using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DOAN_BANCAYCANH
{
    public partial class viewGioHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["GioHang"] != null)
                {
                    gvGioHang.DataSource = (DataTable)Session["GioHang"];
                    gvGioHang.DataBind();

                    decimal tongTien = 0;
                    foreach (DataRow row in ((DataTable)Session["GioHang"]).Rows)
                    {
                        tongTien += Convert.ToDecimal(row["ThanhTien"]);
                    }
                    lblTongTien.Text = "Tổng tiền: " + tongTien.ToString("N0") + " VNĐ";
                }
            }
        }

        protected void gvGioHang_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = (DataTable)Session["GioHang"];
            dt.Rows.RemoveAt(e.RowIndex);
            Session["GioHang"] = dt;
            Response.Redirect("gioHang.aspx");
        }
        protected void btnThanhToan_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Bạn đã thanh toán')", true);
        }
    }
}