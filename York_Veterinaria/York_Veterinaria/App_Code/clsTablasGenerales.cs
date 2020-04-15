﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    public class clsTablasGenerales
    {
        clsDbPrincipal obj = new clsDbPrincipal();
    /// <summary>
    /// Metodo para Insertar el Estado Civil 
    /// </summary>
    /// <param name="EstadoCivil"></param>
    /// <returns></returns>
        public bool InsertarEstadoCivil(String EstadoCivil)
        {
            String sql = "insert into estadocivil(estadoCivil)values(" +
                "'" + EstadoCivil + "'" +
                ")";
            return obj.ejecutar(sql);

        }
    /// <summary>
    /// Metodo para agregar los Animales o Especies
    /// </summary>
    /// <param name="Animal"></param>
    /// <returns></returns>
        public bool InsertarAnimal(String Animal)
        {
            String sql = "insert into Animal(Animal)values(" +
                "'" + Animal + "'" +
                ")";
            return obj.ejecutar(sql);
        }

    /// <summary>
    /// Metodo para actualizar el Animal o Especie
    /// </summary>
    /// <param name="idAnimal"></param>
    /// <param name="Animal"></param>
    /// <returns></returns>
    public bool UpdateAnimal(String idAnimal, String Animal)
    {
        String sql = "update Animal set Animal=" +
            "'" + Animal + "'" +
            " where idAnimal=" + idAnimal;
        return obj.ejecutar(sql);
    }

    /// <summary>
    /// Metodo para Eliminar un Animal o Especie
    /// </summary>
    /// <param name="idAnimal"></param>
    /// <returns></returns>
    public bool DeleteAnimal(String idAnimal)
    {
        String sql = "delete from Animal where idAnimal=" + idAnimal;
        return obj.ejecutar(sql);
    }

    /// <summary>
    /// Metodo para Insertar la raza del animal
    /// </summary>
    /// <param name="Raza"></param>
    /// <param name="IdAnimal"></param>
    /// <returns></returns>
    public bool InsertarRaza(String Raza, String IdAnimal)
        {
            String sql = "insert into  Raza(IdAnimal,Raza)values(" +
                "'" + IdAnimal + "'," +
                "'" + Raza + "'" +
                ")";

            return obj.ejecutar(sql);
        }

    /// <summary>
    /// Metodo para insertar el tipo de documento
    /// </summary>
    /// <param name="TipoDocumento"></param>
    /// <returns></returns>
    public bool InsertarTipoDocumento(String TipoDocumento)
    {
        String sql = "insert into TipoDocumento(TipoDocumento)values(" +
            "'" + TipoDocumento + "'" +
            ")";
        return obj.ejecutar(sql);
    }

    /// <summary>
    /// Metodo para actualizar Tipo de Documento
    /// </summary>
    /// <param name="idDocumento"></param>
    /// <param name="TipoDocumento"></param>
    /// <returns></returns>
    public bool UpdateTipoDocumento(String idDocumento,String TipoDocumento)
    {
        return true;
    }

    /// <summary>
    /// Metodo para registrar las ciudades en donde tendra participacion
    /// </summary>
    /// <param name="Ciudad"></param>
    /// <returns></returns>
    public bool InsertarCiudad(String Ciudad)
    {
        String sql = "insert into Ciudad(Ciudad)values(" +
            "'" + Ciudad + "'" +
            ")";
        return obj.ejecutar(sql);

    }

    /// <summary>
    /// Metodo para actualizar la ciudad segun su llave
    /// </summary>
    /// <param name="idCiudad"></param>
    /// <param name="Ciudad"></param>
    /// <returns></returns>
    public bool UpdateCiudad(String idCiudad,String Ciudad)
    {
        String sql = "update Ciudad set Ciudad=" +
            "'" + Ciudad + "'" +
            " where idciudad="+idCiudad;
        return obj.ejecutar(sql);
    }

    /// <summary>
    /// Metodo para Eliminar una ciudad segun id
    /// </summary>
    /// <param name="idCiudad"></param>
    /// <returns></returns>
    public bool DeleteCiudad(String idCiudad)
    {
        String sql = "delete from Ciudad where idciudad=" + idCiudad;
        return obj.ejecutar(sql);
    }


}
