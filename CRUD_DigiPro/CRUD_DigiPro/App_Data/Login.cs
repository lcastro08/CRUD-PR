using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;


namespace CRUD_DigiPro
{
    public class Login
    {
        Conexiones cd = new Conexiones();
        public string[] Autentificacion(string user, string pass)
        {
            string sql;
            SqlCommand comando;
            SqlConnection conexion = new SqlConnection(cd.cadena(1));
            SqlDataAdapter adaptador;
            System.Data.DataTable dt = new System.Data.DataTable();

            conexion.Open();

            using (conexion)
            {
                sql = "Select nombre,usr,pwd from Tbl_Usuarios where usr ='" + user + "' and pwd = '" + pass + "' and bandera='1'";
                comando = new SqlCommand(sql, conexion);
                comando.CommandTimeout = 500000;
                adaptador = new SqlDataAdapter(comando);
                adaptador.Fill(dt);
            }

            conexion.Close();

            String[] valores;
            valores = new String[2];

            if (dt.Rows.Count == 0)
            {
                valores[0] = "";
                valores[1] = "";

            }
            else
            {
                valores[0] = dt.Rows[0][1].ToString();
                valores[1] = dt.Rows[0][2].ToString();
            }

            return valores;
        }

    }
}