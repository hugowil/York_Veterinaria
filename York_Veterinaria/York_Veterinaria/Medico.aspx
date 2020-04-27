<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Medico.aspx.cs" Inherits="York_Veterinaria.Medico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
   tr:hover 
       {
           background-color: #007bff !important;
           cursor: pointer;
           color:white;
       }   
   .tdhover:hover{
        background-color: #03a407 !important;
           cursor: zoom-in;         
   }
   .app-page-title {
           padding: 5px;
           margin: -30px -30px 30px;
           position: relative;
       }
   </style>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentIconoTitulo" runat="server">
    <i class="pe-7s-study icon-gradient bg-night-fade"></i>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentTitulo" runat="server">
    Medicos Registrados
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentSubTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentOpcionesTitulo" runat="server">
    <a class="mb-2 mr-2 btn btn-success" href="gestionarMedico.aspx?tipo=nuevo&detalle=0" >Crear Documento</a>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentContenido" runat="server">
      <div class="row">
        <div class="col-md-12">
            <div class="main-card mb-3 card">
                <div class="card-body">
                    <table id="tableDatos" class="table table-striped table-bordered tableDatos" style="width: 100%">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Email</th>
                                <th>Celular</th>
                                <th>Estado</th>
                                
                            </tr>
                        </thead>
                        <tbody id="tdatos" runat="server">
                            
                           
                        </tbody>
                        
                    </table>
                  
                </div>
            </div>
        </div>
    </div>
</asp:Content>
