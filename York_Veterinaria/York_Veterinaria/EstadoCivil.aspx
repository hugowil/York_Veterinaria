<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="EstadoCivil.aspx.cs" Inherits="York_Veterinaria.EstadoCivil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentIconoTitulo" runat="server">
    <i class="pe-7s-config icon-gradient bg-night-fade"></i>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentTitulo" runat="server">
    Gestión de Estado Civil
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentSubTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentOpcionesTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentContenido" runat="server">
    <div class="main-card mb-3 card">
        <div class="card-header">
            <i class="header-icon lnr-license icon-gradient bg-plum-plate"></i>Estado Civil                                           
        </div>
        <div class="card-body">
            <div class="was-validated">
                <div class="form-row">

                    <div class="col-md3">
                        <label for="validationTooltip01">Estado Civil</label>
                        <input type="text" class="form-control" id="txtEstadoCivil" required runat="server" placeholder="Estado Civil" />
                        <div class="invalid-feedback">Debe Ingresar el Estado Civil</div>
                    </div>
                </div>
            </div>
            <div class="d-block text-center card-footer">
                <asp:Button ID="btnEnviar" runat="server" Text="Guardar" OnClick="btnEnviar_Click" class="btn btn-primary btn-lg" />
                <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" class="btn btn-primary btn-lg" OnClick="btnActualizar_Click" Visible="false" />
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" class="btn btn-danger btn-lg" OnClick="btnEliminar_Click" Visible="false" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" class="btn btn-dark btn-lg" OnClick="btnCancelar_Click" Visible="false" />
                <asp:HiddenField ID="hfId" runat="server" />
            </div>
            <asp:GridView ID="GridView1" class="table table-striped table-bordered tableDatos" runat="server" AutoGenerateColumns="False" DataKeyNames="idEstadoCivil" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowSorting="True">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" UpdateText="Editar" />
                    <asp:BoundField DataField="idEstadoCivil" HeaderText="idEstadoCivil" InsertVisible="False" ReadOnly="True" SortExpression="idEstadoCivil" Visible="False" />
                    <asp:BoundField DataField="EstadoCivil" HtmlEncode="false" HeaderText="EstadoCivil" SortExpression="EstadoCivil" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbPrincipalConnectionString %>" SelectCommand="SELECT [idEstadoCivil], [EstadoCivil] FROM [estadoCivil]"></asp:SqlDataSource>

        </div>
    </div>

</asp:Content>
