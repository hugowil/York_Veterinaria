<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="gestionarMedico.aspx.cs" Inherits="York_Veterinaria.gestionarMedico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentIconoTitulo" runat="server">
    <i class="pe-7s-study icon-gradient bg-night-fade"></i>

    <script>
        function not2() {
            notif({
                msg: "Error al Procesar la Transaccion",
                type: "error",
                position: "center"
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentTitulo" runat="server">
    Gestionar Medico
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentSubTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentOpcionesTitulo" runat="server">
    <ul class="body-tabs body-tabs-layout tabs-animated body-tabs-animated nav">
        <li class="nav-item">
            <a role="tab" class="nav-link active" id="tab-0" data-toggle="tab" href="#tab-content-0">
                <span>Datos Medico</span>
            </a>
        </li>
        <%if (Request.Params["tipo"].ToString().Equals("editar"))
            { %>
        <li class="nav-item">
            <a role="tab" class="nav-link" id="tab-3" data-toggle="tab" href="#tab-content-1">
                <span>Hijos</span>
            </a>
        </li>
        <li class="nav-item">
            <a role="tab" class="nav-link" id="tab-1" data-toggle="tab" href="#tab-content-2">
                <span>Vehiculo</span>
            </a>
        </li>
        <%} %>
    </ul>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentContenido" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True"></asp:ScriptManager>
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endReq);
        function endReq(sender, args) {
            jQuery(".standardSelect").chosen({
                disable_search_threshold: 10,
                no_results_text: "Oops, nothing found!",
                width: "100%"
            });

            var date_input = $('.inputfecha'); //our date input has the name "date"
            var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
            date_input.datepicker({
                format: 'dd/mm/yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true,
            });
        }

    </script>


    <div class="tab-content">
        <div class="tab-pane tabs-animation fade show active" id="tab-content-0" role="tabpanel">
            <div class="main-card mb-3 card">
                <div class="card-body">
                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <label for="validationTooltip01">Nombres</label>
                            <input type="text" class="form-control" id="txtNombres" runat="server" placeholder="">
                            <div class="invalid-feedback">Debe Ingresar el Codigo</div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="validationTooltip01">Apellidos</label>
                            <input type="text" class="form-control" id="txtApellido" runat="server" placeholder="">
                            <div class="invalid-feedback">Debe Ingresar el Nombre del Documento</div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="validationTooltip01">Tipo de Documento</label>
                            <asp:DropDownList ID="ddlTipoDocumento" class="standardSelect custom-select" runat="server" DataSourceID="sqlTipoDocumento" DataTextField="TipoDocumento" DataValueField="idTipoDocumento"></asp:DropDownList>
                            <asp:SqlDataSource ID="sqlTipoDocumento" runat="server" ConnectionString="<%$ ConnectionStrings:dbPrincipalConnectionString %>" SelectCommand="SELECT idTipoDocumento, TipoDocumento FROM TipoDocumento"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="validationTooltip01">Numero Documento</label>
                            <input type="text" class="form-control" id="txtNumeroDocumento" runat="server" placeholder="">
                            <div class="invalid-feedback">Debe Ingresar el Codigo</div>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label for="validationTooltip01">Fecha Nacimiento</label>
                            <input type="text" class="form-control inputfecha" id="txtFechaNacimiento" runat="server" placeholder="dd/mm/yyyy">
                            <div class="invalid-feedback">Debe Ingresar el Codigo</div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="validationTooltip01">Estado Civil</label>
                            <asp:DropDownList ID="ddlEstadoCivil" class="standardSelect custom-select" runat="server" DataSourceID="sqlEstadoCivil" DataTextField="EstadoCivil" DataValueField="idEstadoCivil" OnDataBound="ddlEstadoCivil_DataBound"></asp:DropDownList>
                            <asp:SqlDataSource ID="sqlEstadoCivil" runat="server" ConnectionString="<%$ ConnectionStrings:dbPrincipalConnectionString %>" SelectCommand="SELECT idEstadoCivil, EstadoCivil FROM EstadoCivil"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="validationTooltip01">Email</label>
                            <input type="text" class="form-control" id="txtEmail" runat="server" placeholder="">
                            <div class="invalid-feedback">Debe Ingresar el Codigo</div>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label for="validationTooltip01">Número Celular</label>
                            <input type="text" class="form-control" id="txtCelular" runat="server" placeholder="">
                            <div class="invalid-feedback">Debe Ingresar el Codigo</div>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label for="validationTooltip01">Fijo</label>
                            <input type="text" class="form-control" id="txtFijo" runat="server" placeholder="">
                            <div class="invalid-feedback">Debe Ingresar el Codigo</div>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label for="validationTooltip01">EPS</label>
                            <input type="text" class="form-control" id="txtEps" runat="server" placeholder="">
                            <div class="invalid-feedback">Debe Ingresar el Codigo</div>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label for="validationTooltip01">AFP</label>
                            <input type="text" class="form-control" id="txtAfp" runat="server" placeholder="">
                            <div class="invalid-feedback">Debe Ingresar el Codigo</div>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label for="validationTooltip01">ARL</label>
                            <input type="text" class="form-control" id="txtArl" runat="server" placeholder="">
                            <div class="invalid-feedback">Debe Ingresar el Codigo</div>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label for="validationTooltip01">Estado Usuario</label>
                            <asp:DropDownList ID="ddlEstado" class="standardSelect custom-select" runat="server">
                                <asp:ListItem Value="1">Activo</asp:ListItem>
                                <asp:ListItem Value="0">Inactivo</asp:ListItem>
                            </asp:DropDownList>

                        </div>

                    </div>

                    <div class="d-block text-center card-footer">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" class="btn btn-primary btn-lg" OnClick="btnEnviar_Click" />

                    </div>


                </div>
            </div>
        </div>

        <div class="tab-pane tabs-animation fade" id="tab-content-1" role="tabpanel">
            <asp:UpdatePanel ID="updatePanelHijo" runat="server">
                <ContentTemplate>
                    <div class="main-card mb-3 card">
                        <div class="card-body">
                            <div class="form-row">
                                <div class="col-md-4 mb-3">
                                    <label for="validationTooltip01">Nombres</label>
                                    <input type="text" class="form-control" id="txtNombreHijo" runat="server" placeholder="">
                                    <div class="invalid-feedback">Debe Ingresar el Codigo</div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="validationTooltip01">Apellidos</label>
                                    <input type="text" class="form-control" id="txtApellidoHijo" runat="server" placeholder="">
                                    <div class="invalid-feedback">Debe Ingresar el Nombre del Documento</div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="validationTooltip01">Tipo de Documento</label>
                                    <asp:DropDownList ID="ddlTipoDocumentoHijo" class="standardSelect custom-select" runat="server" DataSourceID="sqlTipoDocumento" DataTextField="TipoDocumento" DataValueField="idTipoDocumento"></asp:DropDownList>

                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="validationTooltip01">Numero Documento</label>
                                    <input type="text" class="form-control" id="txtDocumentoHijo" runat="server" placeholder="">
                                    <div class="invalid-feedback">Debe Ingresar el Codigo</div>
                                </div>

                                <div class="col-md-4 mb-3">
                                    <label for="validationTooltip01">Fecha Nacimiento</label>
                                    <input type="text" class="form-control inputfecha" id="txtFechaNacimientoHijo" runat="server" placeholder="dd/mm/yyyy">
                                    <div class="invalid-feedback">Debe Ingresar el Codigo</div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="validationTooltip01">Email</label>
                                    <input type="text" class="form-control" id="txtEmailHijo" runat="server" placeholder="">
                                    <div class="invalid-feedback">Debe Ingresar el Codigo</div>
                                </div>

                                <div class="col-md-4 mb-3">
                                    <label for="validationTooltip01">Número Celular</label>
                                    <input type="text" class="form-control" id="txtCelularHijo" runat="server" placeholder="">
                                    <div class="invalid-feedback">Debe Ingresar el Codigo</div>
                                </div>
                            </div>
                            <div class="d-block text-center card-footer">
                                <asp:Button ID="btnGuardarHijo" runat="server" Text="Guardar" class="btn btn-primary btn-lg" OnClick="btnGuardarHijo_Click" />
                            </div>


                            <asp:GridView ID="gridHijos" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="IdUsuarioHijo" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="IdUsuarioHijo" HeaderText="IdUsuarioHijo" InsertVisible="False" ReadOnly="True" SortExpression="IdUsuarioHijo" Visible="False" />
                                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                                    <asp:BoundField DataField="TipoDocumento" HeaderText="TipoDocumento" SortExpression="TipoDocumento" />
                                    <asp:BoundField DataField="NumeroDocumento" HeaderText="NumeroDocumento" SortExpression="NumeroDocumento" />
                                    <asp:BoundField DataField="FechaNacimiento" HeaderText="FechaNacimiento" SortExpression="FechaNacimiento" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                    <asp:BoundField DataField="Celular" HeaderText="Celular" SortExpression="Celular" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbPrincipalConnectionString %>" SelectCommand="SELECT UsuarioHijo.IdUsuarioHijo, Hijo.Nombre, Hijo.Apellido, TipoDocumento.TipoDocumento, Hijo.NumeroDocumento, convert(varchar,Hijo.FechaNacimiento,103) as FechaNacimiento, Hijo.Email, Hijo.Celular FROM Hijo INNER JOIN UsuarioHijo ON Hijo.idHijo = UsuarioHijo.IdHijo INNER JOIN TipoDocumento ON Hijo.IdTipoDocumento = TipoDocumento.idTipoDocumento where UsuarioHijo.idusuario=@usuario">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="usuario" QueryStringField="detalle" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div class="tab-pane tabs-animation fade active" id="tab-content-2" role="tabpanel">
            <asp:UpdatePanel ID="UpdatePanelVehiculo" runat="server">
                <ContentTemplate>


                    <div class="main-card mb-3 card">
                        <div class="card-body">
                            <div class="form-row">
                                <div class="col-md-4 mb-3">
                                    <label for="validationTooltip01">Tipo de Vehiculo</label>
                                    <asp:DropDownList ID="ddlTipoVehiculo" class="standardSelect custom-select" runat="server" DataSourceID="sqlTipoVehiculo" DataTextField="tipovehiculo" DataValueField="idtipovehiculo"></asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlTipoVehiculo" runat="server" ConnectionString="<%$ ConnectionStrings:dbPrincipalConnectionString %>" SelectCommand="SELECT idtipovehiculo, tipovehiculo FROM tipovehiculo"></asp:SqlDataSource>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="validationTooltip01">Placa</label>
                                    <input type="text" class="form-control" id="txtPlaca" runat="server" placeholder="">
                                    <div class="invalid-feedback">Debe Ingresar el Nombre del Documento</div>
                                </div>

                            </div>
                            <div class="d-block text-center card-footer">
                                <asp:Button ID="btnvehiculo" runat="server" Text="Guardar Vehiculo" class="btn btn-primary btn-lg" OnClick="btnvehiculo_Click" />
                            </div>

                            <asp:GridView ID="gridVehiculo" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="idVehiculo" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="gridVehiculo_SelectedIndexChanged">
                                <Columns>
                                    <asp:CommandField SelectText="Eliminar" ShowSelectButton="True" />
                                    <asp:BoundField DataField="idVehiculo" HeaderText="idVehiculo" InsertVisible="False" ReadOnly="True" SortExpression="idVehiculo" Visible="False" />
                                    <asp:BoundField DataField="tipoVehiculo" HeaderText="tipoVehiculo" SortExpression="tipoVehiculo" />
                                    <asp:BoundField DataField="Vehiculo" HeaderText="Vehiculo" SortExpression="Vehiculo" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbPrincipalConnectionString %>" SelectCommand="SELECT Vehiculo.idVehiculo, TipoVehiculo.tipoVehiculo, Vehiculo.Vehiculo FROM Vehiculo INNER JOIN TipoVehiculo ON Vehiculo.idTipoVehiculo = TipoVehiculo.idTipoVehiculo"></asp:SqlDataSource>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

    </div>





</asp:Content>
