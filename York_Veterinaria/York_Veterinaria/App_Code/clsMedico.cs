using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    public class clsMedico
    {
        clsDbPrincipal obj = new clsDbPrincipal();
        
    /// <summary>
    /// Metodo para mostrar los medicos registrados en la plataforma
    /// funcion para administracion
    /// </summary>
    /// <returns></returns>
        public String getMedicosTabla()
        {
            String sql = "select idusuario" +
                        ",Nombre" +
                        ",Apellido" +
                        ",Email" +
                        ",Celular" +
                        ",case when idestado=0 then 'Inactivo' else 'Activo' end as Estado" +
                        " from usuario where IdRol=2";

            String Result = "";
            String[,] resul = obj.RetornarMatriz(sql);
            for (int i = 0; i < resul.GetLength(0); i++)
            {
                int n = resul.GetLength(1);
                Result += "<tr onclick=\"window.location.href='gestionarMedico.aspx?detalle=" + resul[i, 0] + "&tipo=editar&isnew=false' \">";

                for (int j = 1; j < n; j++)
                {

                    Result += "<td>" + resul[i, j] + "</td>";
                }

                Result += "</tr>";
            }
            return Result;
        }
    /// <summary>
    /// Metodo para obtener los datos guardados del un medico especifico
    /// </summary>
    /// <param name="medico"></param>
    /// <returns></returns>
    public String[]GetDatosMedico(String medico)
    {
        String sql= "select idUsuario" +
"      ,IdRol" +
"      ,Nombre" +
"      ,Apellido" +
"      ,Email" +
"      ,Celular" +
"      ,Fijo" +
"      ,convert(varchar,FechaNacimiento,103)" +
"      ,IdEstadoCivil" +
"      ,EPS" +
"      ,AFP" +
"      ,ARL" +
"      ,IdTipoDocumento" +
"      ,NumeroDocumento" +
"      ,idEstado from usuario where idusuario="+medico;
        return obj.returnVector(sql);
    }
        
    /// <summary>
    /// Metodo para Insertar un medico en el sistema
    /// </summary>
    /// <param name="nombre"></param>
    /// <param name="apellido"></param>
    /// <param name="tipoDocumento"></param>
    /// <param name="numeroDocmento"></param>
    /// <param name="FechaNacimiento"></param>
    /// <param name="EstadoCivil"></param>
    /// <param name="email"></param>
    /// <param name="numeroCelular"></param>
    /// <param name="Fijo"></param>
    /// <param name="Eps"></param>
    /// <param name="Afp"></param>
    /// <param name="Arl"></param>
    /// <param name="estado"></param>
    /// <returns></returns>
    public String insertarMedico(String nombre,String apellido,String tipoDocumento
        ,String numeroDocmento,String FechaNacimiento,String EstadoCivil
        ,String email,String numeroCelular,String Fijo
        ,String Eps,String Afp,String Arl,String estado)
    {
        String sql = "insert into usuario(IdRol" +
                        "           ,Nombre" +
                        "           ,Apellido" +
                        "           ,Email" +
                        "           ,Celular" +
                        "           ,Fijo" +
                        "           ,FechaNacimiento" +
                        "           ,IdEstadoCivil" +
                        "           ,EPS" +
                        "           ,AFP" +
                        "           ,ARL" +
                        "           " +
                        "           ,IdTipoDocumento" +
                        "           ,NumeroDocumento" +
                        "           ,idEstado"+
                        ")values(" +
                        "2," +
                        "'"+nombre+"'," +
                        "'"+apellido+"'," +
            "'"+email+"'," +
            "'"+numeroCelular+"'," +
            "'"+Fijo+"'," +
            "'"+FechaNacimiento+"'," +
            "'"+EstadoCivil+"'," +
            "'"+Eps+"'," +
            "'"+Afp+"'," +
            "'"+Arl+"'," +
            "'"+tipoDocumento+"'," +
            "'"+numeroDocmento+"'," +
            "'"+estado+"'" +
                        ")";
        if (obj.ejecutar(sql))
        {
            sql = "select max(idusuario) from usuario";
            return obj.returnVector(sql)[0];
        }
        else
        {
            return "error";
        }
    }
    /// <summary>
    /// Metodo para Actualizar los medicos
    /// </summary>
    /// <param name="idMedico"></param>
    /// <param name="nombre"></param>
    /// <param name="apellido"></param>
    /// <param name="tipoDocumento"></param>
    /// <param name="numeroDocmento"></param>
    /// <param name="FechaNacimiento"></param>
    /// <param name="EstadoCivil"></param>
    /// <param name="email"></param>
    /// <param name="numeroCelular"></param>
    /// <param name="Fijo"></param>
    /// <param name="Eps"></param>
    /// <param name="Afp"></param>
    /// <param name="Arl"></param>
    /// <param name="estado"></param>
    /// <returns></returns>
    public bool updateMedico(String idMedico,String nombre, String apellido, String tipoDocumento
        , String numeroDocmento, String FechaNacimiento, String EstadoCivil
        , String email, String numeroCelular, String Fijo
        , String Eps, String Afp, String Arl, String estado)
    {
        String sql = "UPDATE [dbo].[Usuario]" +
        "   SET [Nombre] = '"+nombre+"'" +
        "      ,[Apellido] = '"+apellido+"'" +
        "      ,[Email] = '"+email+"'" +
        "      ,[Celular] = '"+numeroCelular+"'" +
        "      ,[Fijo] = '"+Fijo+"'" +
        "      ,[FechaNacimiento] = '"+FechaNacimiento+"'" +
        "      ,[IdEstadoCivil] = '"+EstadoCivil+"'" +
        "      ,[EPS] = '"+Eps+"'" +
        "      ,[AFP] = '"+Afp+"'" +
        "      ,[ARL] = '"+Arl+"'" +
        "      ,[IdTipoDocumento] = '"+tipoDocumento+"'" +
        "      ,[NumeroDocumento] = '"+numeroDocmento+"'" +
        "      ,[idEstado] = '"+estado+"'" +
        " WHERE idUsuario="+idMedico;
        return obj.ejecutar(sql);
    }
    /// <summary>
    /// Metodo para agregar los vehiculos de los medicos
    /// </summary>
    /// <param name="vehiculo"></param>
    /// <param name="tipo"></param>
    /// <param name="medico"></param>
    /// <returns></returns>
    public bool InsertarVehiculo(String vehiculo,String tipo,String medico)
    {
        String sql = "insert into vehiculo(vehiculo,idtipovehiculo,idusuario)values(" +
            "'"+ vehiculo + "'," +
            "'"+tipo+"'," +
            "'"+medico+"'" +
            ")";
        return obj.ejecutar(sql);
    }

    /// <summary>
    /// metodo para eliminar vehiculos del medico
    /// </summary>
    /// <param name="vehiculo"></param>
    /// <returns></returns>
    public bool EliminarVehiculo(String vehiculo)
    {
        String sql = "delete from vehiculo where idvehiculo="+vehiculo;
        return obj.ejecutar(sql);
    }


    /// <summary>
    /// Metodo para Insertar Hijos del Medico
    /// </summary>
    /// <param name="nombre"></param>
    /// <param name="apellido"></param>
    /// <param name="tipoDocumento"></param>
    /// <param name="numeroDocmento"></param>
    /// <param name="FechaNacimiento"></param>
    /// <param name="email"></param>
    /// <param name="numeroCelular"></param>
    /// <param name="Medico"></param>
    /// <returns></returns>
    public bool insertarHijo(String nombre, String apellido, String tipoDocumento
        , String numeroDocmento, String FechaNacimiento
        , String email, String numeroCelular,String Medico
        )
    {
        String sql = "insert into hijo(" +
                        "           Nombre" +
                        "           ,Apellido" +
                        "           ,Email" +
                        "           ,Celular" +
                        "           ,FechaNacimiento" +
                        "           ,IdTipoDocumento" +
                        "           ,NumeroDocumento" +
                        ")values(" +
                        "'" + nombre + "'," +
                        "'" + apellido + "'," +
            "'" + email + "'," +
            "'" + numeroCelular + "'," +
            "'" + FechaNacimiento + "'," +
            "'" + tipoDocumento + "'," +
            "'" + numeroDocmento + "'" +
                        ")";
        if (obj.ejecutar(sql))
        {
            sql = "select max(idHijo) from Hijo";
            String hijo= obj.returnVector(sql)[0];
            sql = "insert into UsuarioHijo(IdUsuario,IdHijo)values(" +
                "'"+Medico+"'," +
                "'"+hijo+"'" +
                ")";
            return obj.ejecutar(sql);
        }
        else
        {
            return false;
        }
    }

  







}
