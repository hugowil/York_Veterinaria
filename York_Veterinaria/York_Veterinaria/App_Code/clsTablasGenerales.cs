using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    public class clsTablasGenerales
    {
        clsDbPrincipal obj = new clsDbPrincipal();
        public bool InsertarEstadoCivil(String EstadoCivil)
        {
            String sql = "insert into estadocivil(estadoCivil)values(" +
                "'" + EstadoCivil + "'" +
                ")";
            return obj.ejecutar(sql);

        }
        public bool InsertarAnimal(String Animal)
        {
            String sql = "insert into Animal(Animal)values(" +
                "'" + Animal + "'" +
                ")";
            return obj.ejecutar(sql);

        }
        public bool InsertarRaza(String Raza, String IdAnimal)
        {
            String sql = "insert into  Raza(IdAnimal,Raza)values(" +
                "'" + IdAnimal + "'," +
                "'" + Raza + "'" +
                ")";

            return obj.ejecutar(sql);

        }
    public bool InsertarTipoDocumento(String TipoDocumento)
    {
        String sql = "insert into TipoDocumento(TipoDocumento)values(" +
            "'" + TipoDocumento + "'" +
            ")";
        return obj.ejecutar(sql);

    }
    public bool InsertarCiudad(String Ciudad)
    {
        String sql = "insert into Ciudad(Ciudad)values(" +
            "'" + Ciudad + "'" +
            ")";
        return obj.ejecutar(sql);

    }


}
