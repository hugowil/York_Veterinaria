<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Especie.aspx.cs" Inherits="York_Veterinaria.Especie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentIconoTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentTitulo" runat="server">
    Configuración de Especies
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentSubTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentOpcionesTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentContenido" runat="server">
     <div class="main-card mb-3 card">
        <div class="card-header">
            <i class="header-icon lnr-license icon-gradient bg-plum-plate"></i>Animal                                           
        </div>
        <div class="card-body">
            <div class="was-validated">
            <div class="form-row">
                
                <div class="col-md3">
                    <label for="validationTooltip01">Animal</label>
                   <input type="text" class="form-control" id="txtAnimal" required runat="server" placeholder="Animal" />
                    <div class="invalid-feedback">Debe Ingresar el Animal</div>
                </div>
            </div>
                </div>
            <div class="d-block text-center card-footer">
                    <asp:Button ID="btnEnviar" runat="server" Text="Guardar" OnClick="btnEnviar_Click" class="btn btn-primary btn-lg" />

                </div>
            <asp:GridView ID="GridView1" class="table table-striped table-bordered tableDatos" runat="server" AutoGenerateColumns="False" DataKeyNames="idAnimal" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="idAnimal" HeaderText="idAnimal" InsertVisible="False" ReadOnly="True" SortExpression="idAnimal" />
                    <asp:BoundField DataField="Animal" HeaderText="Animal" SortExpression="Animal" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbPrincipalConnectionString %>" SelectCommand="SELECT [idAnimal], [Animal] FROM [Animal]"></asp:SqlDataSource>
       
        </div>
    </div>
</asp:Content>

