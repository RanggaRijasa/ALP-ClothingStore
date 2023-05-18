using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;

namespace ALP_AD
{
    public partial class Form1 : Form
    {
        public static MySqlConnection sqlconnect;
        public static MySqlCommand sqlcommand;
        public static MySqlDataAdapter mySqlDataAdapter;
        public static MySqlDataReader mySqlDataReader;
        public static string connectionString;
        public static string sqlquery;

        public static int cek = 0;
        public Form1()
        {
            InitializeComponent();
            this.WindowState = System.Windows.Forms.FormWindowState.Normal;
        }



        private void Form1_Load(object sender, EventArgs e)
        {
            connectionString = "server=127.0.0.1;uid=root;pwd=rangga123;database=clothingstore"; //ini ganti conection string kalian
            sqlconnect = new MySqlConnection(connectionString);

            

            /*
            Login formlogin = new Login();
            formlogin.FormBorderStyle = FormBorderStyle.None;
            formlogin.TopLevel = false;
            panel1.Controls.Add(formlogin);
            formlogin.Show();
            */
            


        }

        public  void panel1_Paint(object sender, PaintEventArgs e)
        {
            
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void btn_login_Click(object sender, EventArgs e)
        {
            string usernameoremail = tb_username.Text;
            string password = tb_pass.Text;

            DataTable Login = new DataTable();
            Form1.sqlquery = "SELECT COUNT(*) FROM Customer WHERE(Nama_customer = '" + usernameoremail + "' or Email_customer = '" + usernameoremail + "') AND Password_customer = '" + password + "';";
            Form1.sqlcommand = new MySqlCommand(Form1.sqlquery, Form1.sqlconnect);
            Form1.mySqlDataAdapter = new MySqlDataAdapter(Form1.sqlcommand);
            Form1.mySqlDataAdapter.Fill(Login);

            if (Login.Rows[0][0].ToString() == "1")
            {
                //this.Hide();
                //MessageBox.Show("Success");

                this.Visible = false;
                FormKategori kategori = new FormKategori();
                kategori.Show();
            }
            else
            {
                MessageBox.Show("Invalid username or password");
            }
        }

        private void lbl_signup_Click(object sender, EventArgs e)
        {
            
            this.Visible = false;
            SignUp formsign = new SignUp();
            formsign.Show();

        }

        private void lbl_guestmode_Click(object sender, EventArgs e)
        {
            DataTable Guest = new DataTable();
            Form1.sqlquery = "SELECT COUNT(*) FROM Customer WHERE(Nama_customer = 'Guest' or Email_customer = 'guest@gmail.com') AND Password_customer = '000000000';";
            Form1.sqlcommand = new MySqlCommand(Form1.sqlquery, Form1.sqlconnect);
            Form1.mySqlDataAdapter = new MySqlDataAdapter(Form1.sqlcommand);
            Form1.mySqlDataAdapter.Fill(Guest);

            if (Guest.Rows[0][0].ToString() == "1")
            {
                //this.Hide();
                //MessageBox.Show("Success");

                this.Visible = false;
                FormKategori kategori = new FormKategori();
                kategori.Show();
            }
        }
    }
}
