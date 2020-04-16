using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace York_Veterinaria
{
    public partial class TipoDocumento : System.Web.UI.Page
    {
        clsTablasGenerales obj = new clsTablasGenerales();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            obj.InsertarTipoDocumento(txtTipoDocumento.Value);
            limpiar();
        }

        public void limpiar()
        {
            GridView1.DataBind();
            txtTipoDocumento.Value = "";
            btnActualizar.Visible = false;
            btnCancelar.Visible = false;
            btnEliminar.Visible = false;
            btnEnviar.Visible = true;
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
                if (obj.UpdateTipoDocumento(hfId.Value, txtTipoDocumento.Value))
                {
                    limpiar();
                }
            }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (obj.DeleteTipoDocumento(hfId.Value))
            {
                limpiar();
            }
        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            limpiar();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            hfId.Value = GridView1.DataKeys[GridView1.SelectedIndex].Value.ToString();
            GridViewRow row = GridView1.SelectedRow;

            txtTipoDocumento.Value = row.Cells[2].Text;
            btnActualizar.Visible = true;
            btnCancelar.Visible = true;
            btnEliminar.Visible = true;
            btnEnviar.Visible = false;
        }

    }
}