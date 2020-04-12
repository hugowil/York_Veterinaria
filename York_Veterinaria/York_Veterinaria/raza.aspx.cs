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
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            clsTablasGenerales obj = new clsTablasGenerales();
            obj.InsertarRaza(txtRaza.Value);
            GridView1.DataBind();
            txtAnimal.Value = "";
        }


    }
}