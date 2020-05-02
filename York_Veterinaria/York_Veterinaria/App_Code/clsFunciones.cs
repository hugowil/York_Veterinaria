using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class clsFunciones
{

    public static String getFormatoFecha(String fecha)
    {
        if (fecha.Length > 0)
        {
            return fecha.Substring(6, 4) + fecha.Substring(3, 2) + fecha.Substring(0, 2);
        }
        else
        {
            return fecha;
        }

    }
}
