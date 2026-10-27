<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="viewSanPham.aspx.cs" Inherits="DOAN_BANCAYCANH.viewSanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <h style="font-weight: bold; font-size: 25px;">Chi tiết sản phẩm</h>
    <style type="text/css">
        .auto-style1 {
            width: 115px;
        }
        .auto-style3 {
            height: 27px;
        }
        .auto-style4 {
            height: 72px;
        }
        .auto-style6 {
            height: 70px;
        }
        .auto-style7 {
            height: 28px;
        }
        .auto-style9 {
            width: 100%;
        }
        .auto-style10 {
            height: 35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style9">
        <tr>
            <td class="auto-style1" rowspan="5">
                <asp:Image ID="Image1" runat="server" Height="250px" Width="200px" />
            </td>
            <td class="auto-style3">
                <asp:Label ID="lblTen" runat="server" Font-Bold="True" Font-Size="Larger" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">Mô tả:
                <asp:Label ID="lblmoTa" runat="server" Text="Lable"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Đơn giá:
                <asp:Label ID="lbldonGia" runat="server" Font-Bold="True" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">Số lượng:<asp:TextBox ID="TextBox1" runat="server">1</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Button ID="Button2" runat="server" BackColor="#28A745" BorderColor="White" ForeColor="White" OnClick="Button2_Click" Text="Mua hàng" />
                <asp:Button ID="Button3" runat="server" BackColor="#28A745" BorderColor="White" ForeColor="White" OnClick="Button3_Click" Text="Thêm vào giỏ hàng" />
                <asp:Button ID="btnGioHang" runat="server" BackColor="#28A745" BorderColor="White" ForeColor="White" OnClick="btnGioHang_Click" Text="Giỏ hàng" />
            </td>
        </tr>
    </table>
    <asp:Panel ID="pnThanhToan" runat="server" Visible="False" CssClass="popup">
    <h3>Chọn hình thức thanh toán:</h3>
    <asp:RadioButtonList ID="rblPhuongThuc" runat="server">
        <asp:ListItem Text="Tiền mặt" Value="tienmat" />
        <asp:ListItem Text="Thẻ ngân hàng" Value="thenh" />
    </asp:RadioButtonList>
        <asp:Label ID="tblDiaChi" runat="server" Text="Địa chỉ nhận hàng:"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <br />
    <asp:Button ID="btnXacNhanThanhToan" runat="server" Text="Xác nhận" OnClick="btnXacNhanThanhToan_Click" BackColor="#28A745" BorderColor="White" ForeColor="White" />
    </asp:Panel>
</asp:Content>
