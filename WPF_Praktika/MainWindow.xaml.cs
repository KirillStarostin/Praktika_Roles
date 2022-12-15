using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data;
using System.Data.SqlClient;

namespace WPF_Praktika
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public bool Chek1 = false;
        public bool Chek2 = false;
        public bool Chek3 = false;
        GLPAGE GL = new GLPAGE();

        public DataTable Select(string selectSQL) 
        {
            DataTable dataTable = new DataTable("ПрактикаПДД");
            SqlConnection sqlConnection = new SqlConnection("server=1-212-CLS-07;Trusted_Connection=No;DataBase=ПрактикаПДД;User=sa;PWD=123");
            sqlConnection.Open();                                           
            SqlCommand sqlCommand = sqlConnection.CreateCommand();          
            sqlCommand.CommandText = selectSQL;                             
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(dataTable);                                 
            return dataTable;
        }
        public MainWindow()
        {
            InitializeComponent();
            this.WindowStartupLocation = System.Windows.WindowStartupLocation.CenterScreen;

        }
        private void TB1_TextChanged(object sender, TextChangedEventArgs e)
        {
            L1.Visibility = Visibility.Hidden;
            if (TB1.Text == "")
            {
                L1.Visibility = Visibility.Visible;
            }
        }

        private void TB2_TextChanged(object sender, TextChangedEventArgs e)
        {
            L2.Visibility = Visibility.Hidden;
            if (TB2.Text == "")
            {
                L2.Visibility = Visibility.Visible;
            }

        }

        private void PB1_PasswordChanged(object sender, RoutedEventArgs e)
        {
            L3.Visibility = Visibility.Hidden;
            if (PB1.Password == "")
            {
                L3.Visibility = Visibility.Visible;
            }
        }

        private void Btn1_Click(object sender, RoutedEventArgs e)
        {
            
                if (TB1.Text != "")
                {
                    Chek1 = true;

                    Star1.Opacity = 0;
                    User1.Opacity = 0;
                }
                else
                {
                    User2.Visibility = Visibility.Hidden;
                    User1.Visibility = Visibility.Visible;

                    var animation1 = new DoubleAnimation();

                    animation1.From = Star1.Opacity = 0;
                    animation1.AccelerationRatio = 1;
                    animation1.To = 100;
                    animation1.Duration = TimeSpan.FromSeconds(3);
                    animation1.AutoReverse = true;
                    Star1.BeginAnimation(OpacityProperty, animation1);

                    animation1.From = User1.Opacity = 0;
                    animation1.AccelerationRatio = 1;
                    animation1.To = 100;
                    animation1.Duration = TimeSpan.FromSeconds(3);
                    animation1.AutoReverse = true;
                    User1.BeginAnimation(OpacityProperty, animation1);
                }
                if (TB2.Text != "")
                {
                    Chek2 = true;

                    Star2.Opacity = 0;
                    EMail1.Opacity = 0;
                }
                else
                {
                    EMail1.Visibility = Visibility.Visible;
                    EMail2.Visibility = Visibility.Hidden;
                    EMail3.Visibility = Visibility.Hidden;

                    var animation = new DoubleAnimation();

                    animation.From = Star2.Opacity = 0;
                    animation.AccelerationRatio = 1;
                    animation.To = 100;
                    animation.Duration = TimeSpan.FromSeconds(3);
                    animation.AutoReverse = true;
                    Star2.BeginAnimation(OpacityProperty, animation);

                    animation.From = EMail1.Opacity = 0;
                    animation.AccelerationRatio = 1;
                    animation.To = 100;
                    animation.Duration = TimeSpan.FromSeconds(3);
                    animation.AutoReverse = true;
                    EMail1.BeginAnimation(OpacityProperty, animation);
                }

                if (PB1.Password.Length > 5)
                {
                    Chek3 = true;

                    Star3.Opacity = 0;
                    Pass1.Opacity = 0;
                    Pass2.Opacity = 0;
                }
                else
                {
                    Pass1.Visibility = Visibility.Hidden;
                    Pass2.Visibility = Visibility.Visible;

                    var animation = new DoubleAnimation();

                    animation.From = Star3.Opacity = 0;
                    animation.AccelerationRatio = 1;
                    animation.To = 100;
                    animation.Duration = TimeSpan.FromSeconds(3);
                    animation.AutoReverse = true;
                    Star3.BeginAnimation(OpacityProperty, animation);

                    animation.From = Pass2.Opacity = 0;
                    animation.AccelerationRatio = 1;
                    animation.To = 100;
                    animation.Duration = TimeSpan.FromSeconds(3);
                    animation.AutoReverse = true;
                    Pass2.BeginAnimation(OpacityProperty, animation);
                }
            if (Chek1 == true && Chek2 == true && Chek3 == true)
            {
                this.Close();
                GL.Show();
            }
        }
        private void Btn2_Click(object sender, RoutedEventArgs e)
        {
            if (TB1.Text != "")
            {
                
                DataTable dt_user = Select("SELECT * FROM [dbo].[Обучающиеся] WHERE [username] = '" + TB1.Text + "' AND [EMail] = '" + TB2.Text + "' AND [passwords] = '" + PB1.Password + "'");
                if (dt_user.Rows.Count > 0) // если такая запись существует       
                {
                    MessageBox.Show("Пользователь авторизовался"); // говорим, что авторизовался         
                }
                Chek1 = true;

                    Star1.Opacity = 0;
                    User2.Opacity = 0;
                
            }
            else
            {
                User2.Visibility = Visibility.Visible;
                User1.Visibility = Visibility.Hidden;
                
                var animation = new DoubleAnimation();
                
                animation.From = Star1.Opacity = 0;
                animation.AccelerationRatio = 1;
                animation.To = 100;
                animation.Duration = TimeSpan.FromSeconds(3);
                animation.AutoReverse = true;
                Star1.BeginAnimation(OpacityProperty, animation);

                animation.From = User2.Opacity = 0;
                animation.AccelerationRatio = 1;
                animation.To = 100;
                animation.Duration = TimeSpan.FromSeconds(3);
                animation.AutoReverse = true;
                User2.BeginAnimation(OpacityProperty, animation);
            }

            string str = TB2.Text;
            if (str.Contains('.') && str.Contains('@'))
            {
                if (TB2.Text != "")
                {
                    Chek2 = true;

                    Star2.Opacity = 0;
                }
                else
                {
                    EMail1.Visibility = Visibility.Hidden;
                    EMail2.Visibility = Visibility.Visible;
                    EMail3.Visibility = Visibility.Hidden;

                    var animation = new DoubleAnimation();

                    animation.From = Star2.Opacity = 0;
                    animation.AccelerationRatio = 1;
                    animation.To = 100;
                    animation.Duration = TimeSpan.FromSeconds(3);
                    animation.AutoReverse = true;
                    Star2.BeginAnimation(OpacityProperty, animation);

                    animation.From = EMail2.Opacity = 0;
                    animation.AccelerationRatio = 1;
                    animation.To = 100;
                    animation.Duration = TimeSpan.FromSeconds(3);
                    animation.AutoReverse = true;
                    EMail2.BeginAnimation(OpacityProperty, animation);
                }
            }
            else
            {
                EMail1.Visibility = Visibility.Hidden;
                EMail2.Visibility = Visibility.Hidden;
                EMail3.Visibility = Visibility.Visible;

                var animation = new DoubleAnimation();

                animation.From = EMail3.Opacity = 0;
                animation.AccelerationRatio = 1;
                animation.To = 100;
                animation.Duration = TimeSpan.FromSeconds(3);
                animation.AutoReverse = true;
                EMail3.BeginAnimation(OpacityProperty, animation);
            }

            if (PB1.Password.Length > 5)
            {
                Chek3 = true;

                Pass1.Opacity = 0;
                Star3.Opacity = 0;
            }
            else
            {
                Pass1.Visibility = Visibility.Visible;
                Pass2.Visibility = Visibility.Hidden;
                
                var animation = new DoubleAnimation();
                
                animation.From = Star3.Opacity = 0;
                animation.AccelerationRatio = 1;
                animation.To = 100;
                animation.Duration = TimeSpan.FromSeconds(3);
                animation.AutoReverse = true;
                Star3.BeginAnimation(OpacityProperty, animation);

                animation.From = Pass1.Opacity = 0;
                animation.AccelerationRatio = 1;
                animation.To = 100;
                animation.Duration = TimeSpan.FromSeconds(3);
                animation.AutoReverse = true;
                Pass1.BeginAnimation(OpacityProperty, animation);
            }
            if (Chek1 == true && Chek2 == true && Chek3 == true)
            {
                MessageBox.Show("Вы успешно зарегестрировались, теперь нажмите Sing in", "Congratilation",MessageBoxButton.OK ,MessageBoxImage.Error);
            }
        }
    }
}
