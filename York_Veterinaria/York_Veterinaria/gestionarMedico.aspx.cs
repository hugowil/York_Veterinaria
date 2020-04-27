using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace York_Veterinaria
{
    public partial class gestionarMedico : System.Web.UI.Page
    {
        clsMedico objMedico = new clsMedico();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (Request.Params["isnew"].ToString().Equals("true"))
                    {
                        ScriptManager.RegisterStartupScript(this, typeof(string), "SweetOkErrorRevision", "swal('Exitoso', 'Registrado Exitosamente', 'success');", true);
                    }
                }
                catch
                {

                }
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.Params["tipo"].ToString().Equals("nuevo"))
                {
                    String resultado = objMedico.insertarMedico(txtNombres.Value, txtApellido.Value, ddlTipoDocumento.SelectedValue
                        , txtNumeroDocumento.Value, clsFunciones.getFormatoFecha(txtFechaNacimiento.Value), ddlEstadoCivil.SelectedValue
                        , txtEmail.Value, txtCelular.Value, txtFijo.Value, txtEps.Value
                        , txtAfp.Value, txtArl.Value, ddlEstado.SelectedValue);
                    if (!resultado.Equals("error"))
                    {
                        Response.Redirect("gestionarMedico.aspx?tipo=editar&detalle="+resultado+"&isnew=true");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, typeof(string), "SweetOkErrorDOC", "swal('Oops!', 'Error al Procesar!', 'error');", true);
                    }
                }
                else
                {
                    
                    if (objMedico.updateMedico(Request.Params["detalle"].ToString(),txtNombres.Value, txtApellido.Value, ddlTipoDocumento.SelectedValue
                        , txtNumeroDocumento.Value, clsFunciones.getFormatoFecha(txtFechaNacimiento.Value), ddlEstadoCivil.SelectedValue
                        , txtEmail.Value, txtCelular.Value, txtFijo.Value, txtEps.Value
                        , txtAfp.Value, txtArl.Value, ddlEstado.SelectedValue))
                    {
                        ScriptManager.RegisterStartupScript(this, typeof(string), "SweetOkErrorRevision", "swal('Exitoso', 'Actualizado Exitosamente', 'success');", true);

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, typeof(string), "SweetOkErrorDOC", "swal('Oops!', 'Error al Procesar!', 'error');", true);
                    }
                }
            }
            catch(Exception ext)
            {
                ScriptManager.RegisterStartupScript(this, typeof(string), "SweetOkErrorDOC", "swal('Oops!', 'Error al Procesar!', 'error');", true);
            }
        }

        protected void ddlEstadoCivil_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void ddlEstadoCivil_DataBound(object sender, EventArgs e)
        {
            if (Request.Params["tipo"].ToString().Equals("editar"))
            {
                String[] datos = objMedico.GetDatosMedico(Request.Params["detalle"].ToString());
                txtNombres.Value = datos[2];
                txtApellido.Value = datos[3];
                txtEmail.Value = datos[4];
                txtCelular.Value = datos[5];
                txtFijo.Value = datos[6];
                txtFechaNacimiento.Value = datos[7];
                ddlEstadoCivil.SelectedValue= datos[8];
                txtEps.Value = datos[9];
                txtAfp.Value = datos[10];
                txtArl.Value = datos[11];
                ddlTipoDocumento.SelectedValue = datos[12];
                txtNumeroDocumento.Value = datos[13];
                ddlEstadoCivil.SelectedValue = datos[14];

            }
        }

        protected void btnGuardarHijo_Click(object sender, EventArgs e)
        {
            if(objMedico.insertarHijo(txtNombreHijo.Value,txtApellidoHijo.Value,ddlTipoDocumentoHijo.SelectedValue
                , txtDocumentoHijo.Value,clsFunciones.getFormatoFecha(txtFechaNacimientoHijo.Value)
                ,txtEmailHijo.Value,txtCelularHijo.Value, Request.Params["detalle"].ToString()))
            {
                ScriptManager.RegisterStartupScript(this.updatePanelHijo, typeof(string), "SweetOkErrorRevision", "swal('Exitoso', 'Hijo Agregado', 'success');", true);
                gridHijos.DataBind();
                txtNombreHijo.Value = "";
                txtApellidoHijo.Value = "";
                txtDocumentoHijo.Value = "";
                txtFechaNacimientoHijo.Value = "";
                txtEmailHijo.Value = "";
                txtCelularHijo.Value = "";
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.updatePanelHijo, typeof(string), "SweetOkErrorDOC", "swal('Oops!', 'Error al Procesar!', 'error');", true);
            }
        }

        protected void btnvehiculo_Click(object sender, EventArgs e)
        {
            if(objMedico.InsertarVehiculo(txtPlaca.Value,ddlTipoVehiculo.SelectedValue, Request.Params["detalle"].ToString()))
            {
                gridVehiculo.DataBind();
                txtPlaca.Value = "";
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.updatePanelHijo, typeof(string), "SweetOkErrorDOC", "swal('Oops!', 'Error al Procesar!', 'error');", true); 
            }
        }

        protected void gridVehiculo_SelectedIndexChanged(object sender, EventArgs e)
        {
            String vehiculo=gridVehiculo.DataKeys[gridVehiculo.SelectedIndex].Value.ToString();
            if (objMedico.EliminarVehiculo(vehiculo))
            {
                gridVehiculo.DataBind();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.updatePanelHijo, typeof(string), "SweetOkErrorDOC", "swal('Oops!', 'Error al Procesar!', 'error');", true);
            }
        }
    }
}