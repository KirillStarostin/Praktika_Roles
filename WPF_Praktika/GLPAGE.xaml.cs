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
using System.Windows.Media.Converters;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Shapes;

namespace WPF_Praktika
{
    /// <summary>
    /// Логика взаимодействия для GLPAGE.xaml
    /// </summary>
    public partial class GLPAGE : Window
    {
        public GLPAGE()
        {
            InitializeComponent();
            this.WindowStartupLocation = System.Windows.WindowStartupLocation.CenterScreen;
        }

        private void blind_MouseEnter(object sender, MouseEventArgs e)
        {
            var buttonAnimation = new DoubleAnimation();

            buttonAnimation.From = blind.ActualWidth;
            buttonAnimation.To = 250;
            buttonAnimation.Duration = TimeSpan.FromSeconds(0.5);
            blind.BeginAnimation(Button.WidthProperty, buttonAnimation);

            buttonAnimation.From = Btn1.ActualWidth;
            buttonAnimation.To = 200;
            buttonAnimation.Duration = TimeSpan.FromSeconds(1);
            Btn1.BeginAnimation(Button.WidthProperty, buttonAnimation);

            buttonAnimation.From = Btn2.ActualWidth;
            buttonAnimation.To = 200;
            buttonAnimation.Duration = TimeSpan.FromSeconds(1);
            Btn2.BeginAnimation(Button.WidthProperty, buttonAnimation);

            buttonAnimation.From = Btn3.ActualWidth;
            buttonAnimation.To = 200;
            buttonAnimation.Duration = TimeSpan.FromSeconds(1);
            Btn3.BeginAnimation(Button.WidthProperty, buttonAnimation);

            buttonAnimation.From = Btn4.ActualWidth;
            buttonAnimation.To = 200;
            buttonAnimation.Duration = TimeSpan.FromSeconds(1);
            Btn4.BeginAnimation(Button.WidthProperty, buttonAnimation);
        }

        private void blind_MouseLeave(object sender, MouseEventArgs e)
        {
            DoubleAnimation buttonAnimation = new DoubleAnimation();
            buttonAnimation.From = blind.ActualWidth;
            buttonAnimation.To = 125;
            buttonAnimation.Duration = TimeSpan.FromSeconds(0.5);
            blind.BeginAnimation(Button.WidthProperty, buttonAnimation);

            buttonAnimation.From = Btn1.ActualWidth;
            buttonAnimation.To = 65;
            buttonAnimation.Duration = TimeSpan.FromSeconds(0.4);
            Btn1.BeginAnimation(Button.WidthProperty, buttonAnimation);

            buttonAnimation.From = Btn2.ActualWidth;
            buttonAnimation.To = 65;
            buttonAnimation.Duration = TimeSpan.FromSeconds(0.4);
            Btn2.BeginAnimation(Button.WidthProperty, buttonAnimation);

            buttonAnimation.From = Btn3.ActualWidth;
            buttonAnimation.To = 65;
            buttonAnimation.Duration = TimeSpan.FromSeconds(0.4);
            Btn3.BeginAnimation(Button.WidthProperty, buttonAnimation);

            buttonAnimation.From = Btn4.ActualWidth;
            buttonAnimation.To = 65;
            buttonAnimation.Duration = TimeSpan.FromSeconds(0.4);
            Btn4.BeginAnimation(Button.WidthProperty, buttonAnimation);
        }

        private void Grid_MouseEnter(object sender, MouseEventArgs e)
        {

        }
    }
}
