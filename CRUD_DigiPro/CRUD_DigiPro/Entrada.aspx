<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Entrada.aspx.cs" Inherits="CRUD_DigiPro.Entrada" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
                    <a>CRUD Alumnos</a>
                    <asp:Image ID="Image1" runat="server" Height="92px" 
                        ImageUrl="~/imagenes/logo.png" Width="113px"></asp:Image>
				
                            <asp:LoginView ID="HeadLoginView" runat="server" EnableViewState="false">
                                <AnonymousTemplate>
                                    [<a href="entrada.aspx" ID="HeadLoginStatus" runat="server">Iniciar sesión</a>]
                                </AnonymousTemplate>
                                    <LoggedInTemplate>
                                        Usuario: <span class="bold"><asp:LoginName ID="HeadLoginName" runat="server" /></span>!
                                       <asp:LoginStatus ID="HeadLoginStatus" runat="server" LogoutAction="Redirect" LogoutText="Cerrar sesión" LogoutPageUrl="~/"/> 
                                    </LoggedInTemplate>
                            </asp:LoginView>
                        
                                <asp:Login ID="Login1" runat="server" onauthenticate="Login1_Authenticate" 
                                           FailureText="Verifique sus credenciales. Inténtelo de nuevo.">
                                        <LayoutTemplate>
                                    <table border="0" style="border-collapse:collapse;">
                                        <tr>
                                            <td>
                                                <table border="0">
                                                    <tr>
                                                        <td colspan="2" 
                                                            style="color:White;background-color:#58ACFA;font-weight:bold; font-size:medium">
                                                            Iniciar sesión
                                                        </td>
                                                    </tr>
                                        <tr>
                                                <td align="right">
                                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" 
                                                        Font-Size="10pt" ForeColor="#336699">Nombre de usuario:  </asp:Label>
                                                </td>
                                                <td class="style3">
                                                    <asp:TextBox ID="UserName" runat="server" Font-Size="11pt" BackColor="Black" 
                                                        Width="80px" Height="20px" Font-Bold="True" ForeColor="White"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                        ControlToValidate="UserName" 
                                                        ErrorMessage="El nombre de usuario es obligatorio." 
                                                        ToolTip="El nombre de usuario es obligatorio." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" 
                                                        Font-Size="10pt" ForeColor="#00CC99">Contraseña:  </asp:Label>
                                                </td>
                                                <td class="style3">
                                                    <asp:TextBox ID="Password" runat="server" Font-Size="11pt" TextMode="Password" 
                                                        BackColor="Black" Width="80px"  
                                                        Height="20px" Font-Bold="True" ForeColor="White"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                        ControlToValidate="Password" ErrorMessage="La contraseña es obligatoria." 
                                                        ToolTip="La contraseña es obligatoria." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
           
                                            <tr>
                                                <td colspan="2" style="color:Red; font-size:small">
                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <p class="wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.1s">
                                                        <asp:Button ID="Button1" runat="server" BackColor="Black" 
                                                          BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" 
                                                          Font-Names="Verdana" Font-Size="10pt" ForeColor="White" 
                                                          Text="Iniciar Sesión" ValidationGroup="Login1" OnClick="Button1_Click"/>

                                                    </p>
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                     </asp:Login>                        
</asp:Content>
