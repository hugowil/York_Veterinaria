using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace York_Veterinaria
{
    public partial class especie : System.Web.UI.Page
    {
        clsTablasGenerales obj = new clsTablasGenerales();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            obj.InsertarAnimal(txtAnimal.Value);
            limpiar();
        }

        /// <summary>
        /// Metodo Para Limpiar y actualizar controles cuando se inserta actualiza o elimina
        /// </summary>
        public void limpiar()
        {
            GridView1.DataBind();
            txtAnimal.Value = "";
            btnActualizar.Visible = false;
            btnCancelar.Visible = false;
            btnEliminar.Visible = false;
            btnEnviar.Visible = true;
            lblMensaje.Text = "";
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            if (obj.UpdateAnimal(hfId.Value, txtAnimal.Value))
            {
                limpiar();
            }
        }
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (obj.DeleteAnimal(hfId.Value))
            {
                limpiar();
            }
            else
            {
                lblMensaje.Text = "No se puede eliminar este Registro";
            }
        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            limpiar();
        }
        /// <summary>
        /// Con clik en editar, guarda ID del elemento seleccionado, asigna en la caja de texto el valor guardado del campo 2
        /// y cambia los estados de visibilidad de los botones
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            hfId.Value = GridView1.DataKeys[GridView1.SelectedIndex].Value.ToString();
            GridViewRow row = GridView1.SelectedRow;

            txtAnimal.Value = row.Cells[2].Text;
            btnActualizar.Visible = true;
            btnCancelar.Visible = true;
            btnEliminar.Visible = true;
            btnEnviar.Visible = false;
        }
    }
}
