﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="especie.aspx.cs" Inherits="York_Veterinaria.especie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentIconoTitulo" runat="server">
     <i class="pe-7s-config icon-gradient bg-night-fade">
                                        </i>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentTitulo" runat="server">
    Gestión de Especies
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentSubTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentOpcionesTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentContenido" runat="server">
   
      <div class="main-card mb-3 card">
        <div class="card-header">
            <i class="header-icon lnr-license icon-gradient bg-plum-plate"></i>Especie                                           
        </div>
        <div class="card-body">
            <div class="was-validated">
            <div class="form-row">
                
                <div class="col-md3">
                    <label for="validationTooltip01">Especie</label>
                   <input type="text" class="form-control" id="txtAnimal" required runat="server" placeholder="Ingrese la Especie" />
                    <div class="invalid-feedback">Debe Ingresar la Especie</div>
                </div>
            </div>
                </div>
            <div class="d-block text-center card-footer">
                    <asp:Button ID="btnEnviar" runat="server" Text="Guardar"  class="btn btn-primary btn-lg" OnClick="btnEnviar_Click" />

                </div>
            <asp:GridView ID="GridView1" class="table table-striped table-bordered tableDatos" runat="server" AutoGenerateColumns="False" DataKeyNames="idAnimal" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="idAnimal" HeaderText="idAnimal" InsertVisible="False" ReadOnly="True" SortExpression="idAnimal" Visible="False" />
                    <asp:BoundField DataField="Animal" HeaderText="Especie" SortExpression="Animal" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbPrincipalConnectionString %>" SelectCommand="SELECT [idAnimal], [Animal] FROM [Animal]"></asp:SqlDataSource>
       
        </div>
    </div>
</asp:Content>
