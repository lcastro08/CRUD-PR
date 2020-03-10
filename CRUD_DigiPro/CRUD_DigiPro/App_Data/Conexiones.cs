using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUD_DigiPro
{
    public class Conexiones
    {
        public String cadena(int valor)
        {
            String str = "";

            if (valor == 1)
            {
                str = @"Data Source=LENOVO-PC\SQLEXPRESS; Initial Catalog=Alumnos_DiPro; Trusted_Connection=True;";
            }

            return str;
        }
    }
}