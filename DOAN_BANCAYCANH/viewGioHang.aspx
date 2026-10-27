<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="viewGioHang.aspx.cs" Inherits="DOAN_BANCAYCANH.viewGioHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Giỏ hàng</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Giỏ hàng của bạn</h2>
    <asp:GridView ID="gvGioHang" runat="server" AutoGenerateColumns="False" OnRowDeleting="gvGioHang_RowDeleting">
        <Columns>
            <asp:BoundField DataField="TenCay" HeaderText="Tên cây" />
            <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />
            <asp:BoundField DataField="DonGia" HeaderText="Đơn giá" DataFormatString="{0:N0}" />
            <asp:BoundField DataField="ThanhTien" HeaderText="Thành tiền" DataFormatString="{0:N0}" />
            <asp:CommandField ShowDeleteButton="True" DeleteText="Xóa" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:Label ID="lblTongTien" runat="server" Font-Bold="true"></asp:Label>
    <br /><br />
    <asp:Button ID="btnThanhToan" runat="server" Text="Tiến hành thanh toán" OnClick="btnThanhToan_Click" />
</asp:Content>
