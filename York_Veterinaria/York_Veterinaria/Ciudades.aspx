<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Ciudades.aspx.cs" Inherits="York_Veterinaria.Ciudades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentIconoTitulo" runat="server">
         <i class="pe-7s-config icon-gradient bg-night-fade">
                                        </i>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentTitulo" runat="server">
            Gestión de Ciudades
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentSubTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentOpcionesTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentContenido" runat="server">
              <div class="main-card mb-3 card">
        <div class="card-header">
            <i class="header-icon lnr-license icon-gradient bg-plum-plate"></i>Ciudades                                         
        </div>
        <div class="card-body">
            <div class="was-validated">
            <div class="form-row">
                
                <div class="col-md3">
                    <label for="validationTooltip01">Ciudades</label>
                   <input type="text" class="form-control" id="txtCiudad" required runat="server" placeholder="Ingrese la Ciudad" />
                    <div class="invalid-feedback">Debe Ingresar la Ciudad</div>
                </div>
            </div>
                </div>
            <div class="d-block text-center card-footer">
                    <asp:Button ID="btnEnviar" runat="server" Text="Guardar"  class="btn btn-primary btn-lg" OnClick="btnEnviar_Click" />

                </div>
            <asp:GridView ID="GridView1" class="table table-striped table-bordered tableDatos" runat="server" AutoGenerateColumns="False" DataKeyNames="idCiudad" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="idCiudad" HeaderText="idCiudad" InsertVisible="False" ReadOnly="True" SortExpression="idCiudad" Visible="False" />
                    <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" SortExpression="Ciudad" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbPrincipalConnectionString %>" SelectCommand="SELECT [idCiudad], [Ciudad] FROM [Ciudad]"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
