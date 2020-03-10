using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace CRUD_DigiPro
{
    public partial class Inicio : System.Web.UI.Page
    {
        Conexiones cd = new Conexiones();

        string sql;
        SqlCommand comando;
        SqlDataAdapter adaptador;
        System.Data.DataTable dt = new System.Data.DataTable();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                Btn_Eliminar.Enabled = false;
                LlenaGridView();
            }
        }

        protected void Btn_Limpiar_Click(object sender, EventArgs e)
        {
            clear();
        }

        public void clear()
        {
            ID_alumno_.Value = "";
            txt_nombre.Text = txt_apellidos.Text = txt_mail.Text = "";
            txt_edad.Text = "";
            txt_tel.Text = "";
            txt_matricula.Text = "";
            Dlist.SelectedValue.Equals(0);
            Lb_completado.Text = Lb_error.Text = "";
            Btn_guardar.Text = "Guardar";
            Btn_Eliminar.Enabled = false;
        }

        protected void Btn_guardar_Click(object sender, EventArgs e)
        {
            SqlConnection conexion = new SqlConnection(cd.cadena(1));
            conexion.Open();

            using (conexion)
            {
                sql = "AlumnoCrearActualizar";
                comando = new SqlCommand(sql, conexion);
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@ID_alumno",(ID_alumno_.Value==""?0:Convert.ToInt32(ID_alumno_.Value)));
                comando.Parameters.AddWithValue("@Nombre",txt_nombre.Text.Trim());
                comando.Parameters.AddWithValue("@Apellidos", txt_apellidos.Text.Trim());
                comando.Parameters.AddWithValue("@Edad", txt_edad.Text.Trim());
                comando.Parameters.AddWithValue("@Nivel", Dlist.SelectedValue.Trim());
                comando.Parameters.AddWithValue("@Mail", txt_mail.Text.Trim());
                comando.Parameters.AddWithValue("@Stat", txt_stat.Text.Trim());
                comando.Parameters.AddWithValue("@Matricula", txt_matricula.Text.Trim());
                comando.ExecuteNonQuery();
                conexion.Close();
                string AlumnoID = ID_alumno_.Value;
                clear();
  
                if (AlumnoID == "")
                    Lb_completado.Text = "Guardado Correcto!";
                else
                    Lb_completado.Text = "Actualizado Correcto!";
                LlenaGridView();
            }
            
         
        }

        public void LlenaGridView()
        {
            SqlConnection conexion = new SqlConnection(cd.cadena(1));
            conexion.Open();

            if (conexion.State == ConnectionState.Closed)
                conexion.Open();
            adaptador = new SqlDataAdapter("VistaAlumnos", conexion);
            adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
            dt = new DataTable();
            adaptador.Fill(dt);
            conexion.Close();
            Gv_Contact.DataSource = dt;
            Gv_Contact.DataBind();
        }

        protected void Lnk_clic(object sender, EventArgs e)
        {
            SqlConnection conexion = new SqlConnection(cd.cadena(1));
            conexion.Open();

            int ID_alumno = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (conexion.State == ConnectionState.Closed)
                conexion.Open();
            adaptador = new SqlDataAdapter("VistaPorId", conexion);
            adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
            adaptador.SelectCommand.Parameters.AddWithValue("@ID_alumno", ID_alumno);
            dt = new DataTable();
            adaptador.Fill(dt);
            conexion.Close();
            ID_alumno_.Value = ID_alumno.ToString();
            txt_nombre.Text = dt.Rows[0]["Nombre"].ToString();
            txt_apellidos.Text = dt.Rows[0]["Apellidos"].ToString();
            txt_mail.Text = dt.Rows[0]["Mail"].ToString();
            txt_edad.Text = dt.Rows[0]["Edad"].ToString();
            Dlist.SelectedValue = dt.Rows[0]["Nivel"].ToString();
            txt_matricula.Text = dt.Rows[0]["Matricula"].ToString();
            txt_stat.Text = dt.Rows[0]["Stat"].ToString();
            Btn_guardar.Text = "Actualizar";
            Btn_Eliminar.Enabled = true;
        }

   

        protected void Btn_Eliminar_Click(object sender, EventArgs e)
        {
            SqlConnection conexion = new SqlConnection(cd.cadena(1));
            conexion.Open();
            if (conexion.State == ConnectionState.Closed)
                conexion.Open();
            comando = new SqlCommand("EliminarPorId",conexion);
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@ID_alumno",Convert.ToInt32(ID_alumno_.Value));
            comando.ExecuteNonQuery();
            conexion.Close();
            clear();
            LlenaGridView();
            Lb_completado.Text = "Eliminado Correcto!";
        }
    }
}