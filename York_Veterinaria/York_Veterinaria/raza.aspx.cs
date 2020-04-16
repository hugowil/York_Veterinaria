using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace York_Veterinaria
{
    public partial class raza : System.Web.UI.Page
    {
        clsTablasGenerales obj = new clsTablasGenerales();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            obj.InsertarRaza(txtRaza.Value,ddlAnimal.SelectedValue);
            limpiar();
        }

        public void limpiar()
        {
            GridView1.DataBind();
            txtRaza.Value = "";
            btnActualizar.Visible = false;
            btnCancelar.Visible = false;
            btnEliminar.Visible = false;
            btnEnviar.Visible = true;
            ddlAnimal.Visible = true;
            GridView1.Columns[2].Visible = true;
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            if (obj.UpdateRaza(hfId.Value, txtRaza.Value))
            {
                limpiar();
            }
        }
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (obj.DeleteRaza(hfId.Value))
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

            txtRaza.Value = row.Cells[3].Text;
            btnActualizar.Visible = true;
            btnCancelar.Visible = true;
            btnEliminar.Visible = true;
            btnEnviar.Visible = false;
            ddlAnimal.Visible = false;
            GridView1.Columns[2].Visible = false; 
        }
    }
}