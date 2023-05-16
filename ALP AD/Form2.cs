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
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }

        private void lbl_signup_Click(object sender, EventArgs e)
        {
            Form1.cek = 1;
            MessageBox.Show("Weleh");
        }
    }
}
