using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DOAN_BANCAYCANH
{
    public partial class viewSanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblTen.Text = "";
            lblmoTa.Text = "";
            lbldonGia.Text = "";
            string param = Request.QueryString["id"];
            if (int.TryParse(param, out int spID))
            {
                // Nếu chuyển đổi thành công (param là số)
                // Thực hiện truy vấn hoặc các xử lý khác
            }
            else
            {
                // Nếu param không phải là số hoặc null -> xử lý lỗi
                Response.Redirect("Web.aspx"); // hoặc hiển thị thông báo tùy ý
            }
            if (spID > 0)
            {
                SqlDataReader myDr = new databaseClass().GetRecord("select HinhAnh, TenCay, moTa, GiaBan from CayCanh where IdSanPham=" + spID);
                if (myDr.HasRows)
                {
                    myDr.Read();
                    Image1.ImageUrl = "~/Images/" + myDr.GetValue(0).ToString();
                    lblTen.Text = myDr.GetValue(1).ToString();
                    lblmoTa.Text = myDr.GetValue(2).ToString();
                    decimal dg = Convert.ToDecimal(myDr.GetValue(3).ToString());
                    lbldonGia.Text = dg.ToString("### ###");
                }
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string param = Request.QueryString["id"];
            int spID = int.Parse(param);
            int soLuong = int.Parse(TextBox1.Text);

            DataTable gioHang;

            // Nếu giỏ hàng chưa có thì khởi tạo
            if (Session["GioHang"] == null)
            {
                gioHang = new DataTable();
                gioHang.Columns.Add("IdSanPham", typeof(int));
                gioHang.Columns.Add("TenCay", typeof(string));
                gioHang.Columns.Add("SoLuong", typeof(int));
                gioHang.Columns.Add("DonGia", typeof(decimal));
                gioHang.Columns.Add("ThanhTien", typeof(decimal));
            }
            else
            {
                gioHang = (DataTable)Session["GioHang"];
            }

            // Lấy thông tin sản phẩm từ CSDL (gợi ý)
            string chuoiketnoi = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(chuoiketnoi))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT TenCay, GiaBan FROM CayCanh WHERE IdSanPham = @id", conn);
                cmd.Parameters.AddWithValue("@id", spID);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    string ten = reader["TenCay"].ToString();
                    decimal gia = Convert.ToDecimal(reader["GiaBan"]);
                    decimal thanhTien = gia * soLuong;

                    // Thêm vào DataTable
                    gioHang.Rows.Add(spID, ten, soLuong, gia, thanhTien);
                }
            }

            // Gán lại giỏ hàng vào Session
            Session["GioHang"] = gioHang;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Bạn đã thêm vào giỏ hàng')", true);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string user = (string)Session["username"];
            if (string.IsNullOrEmpty(user) == true)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Bạn chưa đăng nhập')", true);
                return;
            }          
            if (int.TryParse(TextBox1.Text, out int soluong))
            {
                if (soluong > 100)
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Số lượng mua quá nhiều shop không thể đáp ứng')", true);
                else
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Bạn có thể mua hàng')", true);
                    pnThanhToan.Visible = true;
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Bạn nhập sai giá trị số')", true);
            }
        }

        protected void btnXacNhanThanhToan_Click(object sender, EventArgs e)
        {
            string phuongThuc = rblPhuongThuc.SelectedValue;

            if (phuongThuc == "tienmat")
            {
                
                Response.Write("<script>alert('Bạn đã chọn thanh toán tiền mặt');</script>");
            }
            else if (phuongThuc == "thenh")
            {
              
                Response.Write("<script>alert('Bạn đã chọn thanh toán bằng thẻ ngân hàng');</script>");
            }

            pnThanhToan.Visible = false;
        }

        protected void btnGioHang_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Đang load giỏ hàng')", true);
        }
    }
}