using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ALP_AD
{
    public partial class Form1 : Form
    {
        public static int cek = 0;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            Login formlogin = new Login();
            SignUp formsign = new SignUp();
            if (cek == 0)
            {
                
                formlogin.FormBorderStyle = FormBorderStyle.None;
                formlogin.TopLevel = false;
                panel1.Controls.Add(formlogin);
                formlogin.Show();
            }
            if (cek == 1)
            {
                formlogin.Close();
                formsign.FormBorderStyle = FormBorderStyle.None;
                formsign.TopLevel = false;
                panel1.Controls.Add(formsign);
                formsign.Show();
            }
        }
    }
}
