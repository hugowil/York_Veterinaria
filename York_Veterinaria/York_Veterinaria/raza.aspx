<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="raza.aspx.cs" Inherits="York_Veterinaria.raza" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentIconoTitulo" runat="server">
     <i class="pe-7s-config icon-gradient bg-night-fade">
                                        </i>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentTitulo" runat="server">
    Gestión de Raza
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentSubTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentOpcionesTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentContenido" runat="server">
    <div class="main-card mb-3 card">
        <div class="card-header">
            <i class="header-icon lnr-license icon-gradient bg-plum-plate"></i>Raza
        </div>
        <div class="card-body">
            <div class="was-validated">
            <div class="form-row">
               
                <div class="col-md-3">
                    <label for="validationTooltip01">Especie</label>
                    <asp:DropDownList ID="ddlAnimal" runat="server" class="standardSelect custom-select" DataSourceID="SqlDataSource2" DataTextField="Animal" DataValueField="idAnimal"></asp:DropDownList>
                    
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbPrincipalConnectionString %>" SelectCommand="SELECT [idAnimal], [Animal] FROM [Animal]"></asp:SqlDataSource>
                    
                </div>

                <div class="col-md-3">
                    <label for="validationTooltip01">Raza</label>
                   <input type="text" class="form-control" id="txtRaza" required runat="server" placeholder="Raza" />
                    <div class="invalid-feedback">Debe Ingresar la Raza</div>
                </div>
            </div>
                </div>
            <div class="d-block text-center card-footer">
                    <asp:Button ID="btnEnviar" runat="server" Text="Guardar" OnClick="btnEnviar_Click" class="btn btn-primary btn-lg" />

                </div>
            <asp:GridView ID="GridView1" class="table table-striped table-bordered tableDatos" runat="server" AutoGenerateColumns="False" DataKeyNames="idRaza" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="idRaza" HeaderText="idRaza" InsertVisible="False" ReadOnly="True" SortExpression="idRaza" Visible="False" />
                    <asp:BoundField DataField="Animal" HeaderText="Especie" SortExpression="Animal" />
                    <asp:BoundField DataField="Raza" HeaderText="Raza" SortExpression="Raza" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbPrincipalConnectionString %>" SelectCommand="SELECT Raza.idRaza, Animal.Animal, Raza.Raza FROM Animal INNER JOIN Raza ON Animal.idAnimal = Raza.idAnimal"></asp:SqlDataSource>
       
        </div>
    </div>
</asp:Content>
