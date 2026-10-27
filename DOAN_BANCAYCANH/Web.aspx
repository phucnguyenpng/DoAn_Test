<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Web.aspx.cs" Inherits="DOAN_BANCAYCANH.Web" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="myrow"> 
        <div class="colloai">
            <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="ListLoai" DataTextField="TenNhom" DataValueField="IdNhom" Width="95%" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
            <asp:ObjectDataSource ID="ListLoai" runat="server"></asp:ObjectDataSource>
        </div>
        <div class="colsp">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="ListSP" DataKeyNames="IdSanPham" GroupItemCount="3" OnItemCommand="ListView1_ItemCommand">
                    <AlternatingItemTemplate>
                        <td runat="server" style="background-color: #FFFFFF;color: #284775;">
                            <asp:image ID="HinhAnhLabel" runat="server" imageurl='<%#"~/Images/"+ Eval("HinhAnh") %>' Width="200" Height="250px"/>
                            <br />
                            <asp:Label ID="TenCayLabel" runat="server" Text='<%# Eval("TenCay") %>' Font-Bold="true" />
                            <br />Đơn giá:
                            <asp:Label ID="GiaBanLabel" runat="server" Text='<%# Eval("GiaBan") %>' />
                            <br />
                            <asp:Label ID="IdSanPhamLabel" Visible="false" runat="server" Text='<%# Eval("IdSanPham") %>' />
                            <br />
                            <asp:LinkButton runat="server" ID="chiTiet" Text="Chi tiết" CommandName="xem" CommandArgument='<%# Eval("IdSanPham") %>'/>
                        </td>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <td runat="server" style="background-color: #999999;">TenCay:
                            <asp:TextBox ID="TenCayTextBox" runat="server" Text='<%# Bind("TenCay") %>' />
                            <br />GiaBan:
                            <asp:TextBox ID="GiaBanTextBox" runat="server" Text='<%# Bind("GiaBan") %>' />
                            <br />HinhAnh:
                            <asp:TextBox ID="HinhAnhTextBox" runat="server" Text='<%# Bind("HinhAnh") %>' />
                            <br />IdSanPham:
                            <asp:Label ID="IdSanPhamLabel1" runat="server" Text='<%# Eval("IdSanPham") %>' />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            <br /></td>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
<td runat="server" />
                    </EmptyItemTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <InsertItemTemplate>
                        <td runat="server" style="">TenCay:
                            <asp:TextBox ID="TenCayTextBox" runat="server" Text='<%# Bind("TenCay") %>' />
                            <br />GiaBan:
                            <asp:TextBox ID="GiaBanTextBox" runat="server" Text='<%# Bind("GiaBan") %>' />
                            <br />HinhAnh:
                            <asp:TextBox ID="HinhAnhTextBox" runat="server" Text='<%# Bind("HinhAnh") %>' />
                            <br />IdSanPham:
                            <asp:TextBox ID="IdSanPhamTextBox" runat="server" Text='<%# Bind("IdSanPham") %>' />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                            <br /></td>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <td runat="server" style="background-color: #E0FFFF;color: #333333;">
                            <asp:image ID="HinhAnhLabel" runat="server" imageurl='<%#"~/Images/"+ Eval("HinhAnh") %>' Width="200" Height="250px"/>
                            <br />
                            <asp:Label ID="TenCayLabel" runat="server" Text='<%# Eval("TenCay") %>' Font-Bold="true" />
                            <br />Đơn giá:
                            <asp:Label ID="GiaBanLabel" runat="server" Text='<%# Eval("GiaBan") %>' />
                            <br />                            
                            <asp:Label ID="IdSanPhamLabel" Visible="false" runat="server" Text='<%# Eval("IdSanPham") %>' />
                            <br />
                            <asp:LinkButton runat="server" ID="chiTiet" Text="Chi tiết" CommandName="xem" CommandArgument='<%# Eval("IdSanPham") %>'/>
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF"></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">TenCay:
                            <asp:Label ID="TenCayLabel" runat="server" Text='<%# Eval("TenCay") %>' />
                            <br />GiaBan:
                            <asp:Label ID="GiaBanLabel" runat="server" Text='<%# Eval("GiaBan") %>' />
                            <br />HinhAnh:
                            <asp:Label ID="HinhAnhLabel" runat="server" Text='<%# Eval("HinhAnh") %>' />
                            <br />IdSanPham:
                            <asp:Label ID="IdSanPhamLabel" runat="server" Text='<%# Eval("IdSanPham") %>' />
                            <br />
                        </td>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="ListSP" runat="server"></asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
