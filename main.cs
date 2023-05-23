using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI;

namespace clothing_store
{
    public partial class main : Form
    {
        string host = "server=localhost;uid=root;pwd=;database=clothingstore;";
        MySqlConnection conn;
        MySqlDataAdapter adapter;
        MySqlCommand command;
        DataTable dt = new DataTable();
        MySqlDataReader reader;
        string workingDirectory;
        string projectDirectory;
        public main()
        {
            
            InitializeComponent();
        }

        private void login_Click(object sender, EventArgs e)
        {

        }

        private void main_Load(object sender, EventArgs e)
        {
            workingDirectory = Environment.CurrentDirectory;
            projectDirectory = Directory.GetParent(workingDirectory).Parent.Parent.FullName;
            conn = new MySqlConnection(host);
            var query = "select produk_image from produk where produk_id = 'ACC01';";
            try
            {
                conn.Open();
                command = new MySqlCommand(query, conn);
                adapter = new MySqlDataAdapter(command);
                adapter.Fill(dt);
                string full_url = projectDirectory + dt.Rows[0][0];
                Image img = Image.FromFile(full_url);
                pictbox.Image = img;
                MessageBox.Show(full_url);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                conn.Close();
            }

        }
    }
}
