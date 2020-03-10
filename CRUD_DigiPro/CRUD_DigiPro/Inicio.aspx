<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="CRUD_DigiPro.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
  <div>
      <asp:HiddenField ID="ID_alumno_" runat="server" />
    <table>
        <tr>
            <td>
                <asp:Label ID="Lb_nombre" runat="server" Text="Nombre: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_nombre" runat="server"></asp:TextBox>
            </td>
       </tr>
        <tr>
            <td>
                <asp:Label ID="Lb_apellidos" runat="server" Text="Apellidos: "></asp:Label>
            </td>
            <td>
                 <asp:TextBox ID="txt_apellidos" runat="server"></asp:TextBox>
            </td>
       </tr>
 
        <tr>
            <td>
                <asp:Label ID="Lb_mail" runat="server" Text="Email: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_mail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Lb_edad" runat="server" Text="Edad: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_edad" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Lb_tel" runat="server" Text="Teléfono: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_tel" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Lb_nivel" runat="server" Text="Nivel: "></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="Dlist" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Lb_matricula" runat="server" Text="Matrícula: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_matricula" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Lb_stat" runat="server" Text="Status: "></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_stat" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>

            </td>
            <td colspan ="2">
                <asp:Button ID="Btn_guardar" runat="server" Text="Guardar" OnClick="Btn_guardar_Click" />
                <asp:Button ID="Btn_Eliminar" runat="server" Text="Eliminar" OnClick="Btn_Eliminar_Click" />
                <asp:Button ID="Btn_Limpiar" runat="server" Text="Limpiar" OnClick="Btn_Limpiar_Click" />
            </td>
        </tr>
        <tr>
            <td>

            </td>
            <td colspan ="2">
                <asp:Label ID="Lb_completado" runat="server" Text="" ForeColor="Green"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>

            </td>
            <td colspan ="2">
                <asp:Label ID="Lb_error" runat="server" Text="" ForeColor="Orange"></asp:Label>
            </td>
        </tr>
    </table>
  </div>
    <br />
    <asp:GridView ID="Gv_Contact" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" />
            <asp:BoundField DataField="Edad" HeaderText="Edad" />
            <asp:BoundField DataField="Nivel" HeaderText="Nivel" />
            <asp:BoundField DataField="Mail" HeaderText="E-Mail" />
            <asp:BoundField DataField="Stat" HeaderText="Status" />
            <asp:BoundField DataField="Matricula" HeaderText="Matricula" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("ID_alumno") %>' OnClick="Lnk_clic">Ver</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
