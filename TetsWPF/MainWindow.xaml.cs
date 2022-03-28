using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Runtime.InteropServices;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace TetsWPF
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        BackgroundWorker CollectData = new BackgroundWorker();
        BackgroundWorker StatusChange = new BackgroundWorker();
        BackgroundWorker SendTelegramMessage = new BackgroundWorker();
        BackgroundWorker SendWhatsAppMessage = new BackgroundWorker();

        OpenFileDialog openFileDialog = new OpenFileDialog();
        bool is_work = false;
        string url = "";
        string errors = "";
        bool is_tel = false;
        string outp = "";

        string Mes = "";
        string File = "";
        string Im = "";
        string Vid = "";
        public void UrlTextBox_GotMouseCapture(object sender, MouseEventArgs e)
        {
            UrlTextBox.Text = null;
            UrlTextBox.Foreground = Brushes.Gray;
        }
        public MainWindow()
        {
            InitImports();
            CollectData.WorkerReportsProgress = true;
            StatusChange.WorkerReportsProgress = true;
            CollectData.WorkerSupportsCancellation = true;
            StatusChange.WorkerSupportsCancellation = true;
            SendWhatsAppMessage.WorkerSupportsCancellation = true;

            CollectData.DoWork += new System.ComponentModel.DoWorkEventHandler(CollectData_DoWork);
            StatusChange.DoWork += new System.ComponentModel.DoWorkEventHandler(StatusChange_DoWork);
            this.StatusChange.ProgressChanged += new System.ComponentModel.ProgressChangedEventHandler(StatusChanged_ProgressChanged);
            SendTelegramMessage.DoWork += new System.ComponentModel.DoWorkEventHandler(SendTelegramMessage_DoWork);
            SendWhatsAppMessage.DoWork += new System.ComponentModel.DoWorkEventHandler(SendWhatsAppMessage_DoWork);

            InitializeComponent();

        }

        public delegate void MyDelegate(Label myControl);
        public void DelegateMethod(Label label)
        {
            GetDataButton.IsEnabled = true;
            SendButton.IsEnabled = true;
            if (errors != "")
            {
                PickIm.Visibility = Visibility.Hidden;
                BAIm.Visibility = Visibility.Hidden;
                L1.Visibility = Visibility.Hidden;
                L2.Visibility = Visibility.Hidden;
                ErrorLabel.Content = errors;
                Height = 789.2;
            }
            else
            {
                PickIm.Visibility = Visibility.Visible;
                BAIm.Visibility = Visibility.Visible;
                L1.Visibility = Visibility.Visible;
                L2.Visibility = Visibility.Visible;
            }
            StatusLabel.Foreground = Brushes.Green;
            StatusLabel.Content = "Выполнено";
        }

        public void InitImports()
        {
            Boolean is_init = false;
            using (StreamReader reader = new StreamReader("init.conf"))
            {
                string text = reader.ReadToEnd();
                if (text == "")
                {

                    ProcessStartInfo startInfo = new ProcessStartInfo("cmd");

                    string script1 = "python -m pip install --upgrade pip";
                    string script2 = "pip3 install telethon";
                    string script3 = "pip3 install pywhatkit";
                    string script4 = "pip3 install flask";

                    startInfo.UseShellExecute = false;
                    startInfo.CreateNoWindow = false;
                    startInfo.RedirectStandardError = true;
                    startInfo.RedirectStandardInput = true;
                    startInfo.RedirectStandardOutput = false;

                    using (var process = Process.Start(startInfo))
                    {
                        process.StandardInput.WriteLine(script1);
                        process.StandardInput.WriteLine(script2);
                        process.StandardInput.WriteLine(script3);
                        process.StandardInput.WriteLine(script4);
                        process.StandardInput.Close();
                    }
                    is_init = true;
                }
            }
            if (is_init)
            {
                using (StreamWriter writer = new StreamWriter("init.conf", false))
                {
                    writer.Write("1");
                }
            }
        }

        private void GetDataButton_Click(object sender, RoutedEventArgs e)
        {
            //Console.WriteLine("butt");
            url = UrlTextBox.Text;
            is_tel = checkBox1.IsChecked.Value;
            StatusChange.ProgressChanged += new ProgressChangedEventHandler(StatusChanged_ProgressChanged);
            if (CollectData.IsBusy != true)
            {
                CollectData.RunWorkerAsync();
            }
            is_work = true;
            GetDataButton.IsEnabled = false;
            if (StatusChange.IsBusy != true)
            {
                StatusLabel.Foreground = Brushes.Red;
                StatusChange.RunWorkerAsync();
            }
            if (StatusChange.WorkerSupportsCancellation == true)
            {
                StatusChange.CancelAsync();
            }
            if (CollectData.WorkerSupportsCancellation == true)
            {
                CollectData.CancelAsync();
            }
            //if (errors.Contains("FileNotFoundError"))
            //    errors = "";

            //Console.WriteLine("tik");
        }

        private void CollectData_DoWork(object sender, DoWorkEventArgs e)
        {
            Console.WriteLine("work");
            ProcessStartInfo startInfo = new ProcessStartInfo("python");

            string dir = System.IO.Directory.GetCurrentDirectory();
            string script = "Parser.py " + url + " " + is_tel;
            //Console.WriteLine(dir);
            //Console.WriteLine(script);
            startInfo.WorkingDirectory = dir;
            startInfo.Arguments = script;
            startInfo.UseShellExecute = false;
            startInfo.CreateNoWindow = true;
            startInfo.RedirectStandardError = true;
            startInfo.RedirectStandardOutput = true;

            Console.WriteLine("start1");
            using (var process = Process.Start(startInfo))
            {
                Console.WriteLine("start2");
                errors = process.StandardError.ReadToEnd();
                outp = process.StandardOutput.ReadToEnd();
            }
            is_work = false;
            Console.WriteLine("end");
        }

        private void StatusChanged_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            int i = e.ProgressPercentage;
            //Console.WriteLine("pr" + i);
            if (i > 3) i = 0;
            String[] work = { "Обработка", "Обработка.", "Обработка..", "Обработка..." };
            StatusLabel.Content = work[i];
            //label3.Refresh();
            Console.WriteLine("loop");

        }

        private void StatusChange_DoWork(object sender, DoWorkEventArgs e)
        {
            String[] work = { "Обработка", "Обработка.", "Обработка..", "Обработка..." };
            int i = 0;
            while (is_work)
            {
                if (i > 3) i = 0;
                Console.WriteLine("work2");
                StatusChange.ReportProgress(i);
                i++;
                Thread.Sleep(500);
            }
            object[] myArray = new object[1];
            myArray[0] = StatusLabel;
            StatusLabel.Dispatcher.Invoke(new MyDelegate(DelegateMethod), myArray);
        }

        private void SendTelegramMessage_DoWork(object sender, DoWorkEventArgs e)
        {
            ProcessStartInfo startInfo = new ProcessStartInfo("cmd");

            string dir = System.IO.Directory.GetCurrentDirectory();
            // string dir = "D:\\PickAim\\Projects\\ChatParser\\";
            string script = "python " + dir + "\\Sender.py -f \"" + File + "\" -m \"" + Mes + "\" -p \"" + Im + "\" -v \"" + Vid + "\"";
            startInfo.WorkingDirectory = dir;
            //startInfo.Arguments = script;
            startInfo.UseShellExecute = false;
            startInfo.CreateNoWindow = true;
            startInfo.RedirectStandardInput = true;
            startInfo.RedirectStandardError = true;
            startInfo.RedirectStandardOutput = true;

            Console.WriteLine(script);
            using (var process = Process.Start(startInfo))
            {
                process.StandardInput.WriteLine(script);
                process.StandardInput.Close();
                //Console.WriteLine("start2");
                errors = process.StandardError.ReadToEnd();
                outp = process.StandardOutput.ReadToEnd();
            }
            //Console.WriteLine(outp);
            Mes = "";
            File = "";
            Im = "";
            Vid = "";
            is_work = false;
        }

        private void SendWhatsAppMessage_DoWork(object sender, DoWorkEventArgs e)
        {
            ProcessStartInfo startInfo = new ProcessStartInfo("cmd");

            string dir = System.IO.Directory.GetCurrentDirectory();
            // string dir = "D:\\PickAim\\Projects\\ChatParser\\";
            string script = "python " + dir + "\\WhatsSender.py -f \"" + File + "\" -m \"" + Mes + "\"";
            startInfo.WorkingDirectory = dir;
            //startInfo.Arguments = script;
            startInfo.UseShellExecute = false;
            startInfo.CreateNoWindow = true;
            startInfo.RedirectStandardInput = true;
            startInfo.RedirectStandardError = true;
            startInfo.RedirectStandardOutput = true;

            Console.WriteLine(script);
            using (var process = Process.Start(startInfo))
            {
                process.StandardInput.WriteLine(script);
                process.StandardInput.Close();
                //Console.WriteLine("start2");
                errors = process.StandardError.ReadToEnd();
                outp = process.StandardOutput.ReadToEnd();
            }
            //Console.WriteLine(outp);
            Mes = "";
            File = "";
            Im = "";
            Vid = "";
            is_work = false;
        }

        private void FileButton_Click(object sender, RoutedEventArgs e)
        {
            openFileDialog.Filter = "Таблица csv|*.csv";
            if (openFileDialog.ShowDialog().Value /*== DialogResult.Value*/)
            {
                DocTextBox.Text = openFileDialog.FileName;
            }
        }

        private void ImButton_Click(object sender, EventArgs e)
        {
            openFileDialog.Filter = "Изображение|*.jpg; *.png";
            if (openFileDialog.ShowDialog().Value)
            {
                ImageTextBox.Text = openFileDialog.FileName;
            }
        }

        private void VidButton_Click(object sender, RoutedEventArgs e)
        {
            openFileDialog.Filter = "Видео|*.mp4; *.avi; *mkv";
            if (openFileDialog.ShowDialog().Value)
            {
                VidTextBox.Text = openFileDialog.FileName;
            }
        }

        private void SendButton_Click(object sender, RoutedEventArgs e)
        {
            Mes = MessageTextBox.Text;
            //Mes = StringFromRichTextBox(MessageTextBox);
            Mes = Regex.Replace(Mes, @"\r?\n", " ");
            //Mes.Replace(Environment.NewLine, );
            File = DocTextBox.Text;
            Im = ImageTextBox.Text;
            Vid = VidTextBox.Text;
            //Console.WriteLine(Mes);
            //Console.WriteLine(File);
            //Console.WriteLine(Im);
            //Console.WriteLine(Vid);
            if (SendTypeComboBox.SelectedIndex == 0)
            {
                if (SendTelegramMessage.IsBusy != true)
                {
                    SendTelegramMessage.RunWorkerAsync();
                }
                is_work = true;
                SendButton.IsEnabled = false;
                if (StatusChange.IsBusy != true)
                {
                    StatusLabel.Foreground = Brushes.Red;
                    StatusChange.RunWorkerAsync();
                }
                if (StatusChange.WorkerSupportsCancellation == true)
                {
                    StatusChange.CancelAsync();
                }
                if (SendTelegramMessage.WorkerSupportsCancellation == true)
                {
                    SendTelegramMessage.CancelAsync();
                }
            }
            else
            {
                if (SendWhatsAppMessage.IsBusy != true)
                {
                    SendWhatsAppMessage.RunWorkerAsync();
                }
                is_work = true;
                SendButton.IsEnabled = false;
                if (StatusChange.IsBusy != true)
                {
                    StatusLabel.Foreground = Brushes.Red;
                    StatusChange.RunWorkerAsync();
                }
                if (StatusChange.WorkerSupportsCancellation == true)
                {
                    StatusChange.CancelAsync();
                }
                if (SendWhatsAppMessage.WorkerSupportsCancellation == true)
                {
                    SendWhatsAppMessage.CancelAsync();
                }
            }
        }

        private void ToolBar_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            DragMove();
        }

        private void CloseButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void MinimizeButton_Click(object sender, RoutedEventArgs e)
        {
            WindowState = WindowState.Minimized;
        }

        private void SendTypeComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (SendTypeComboBox.SelectedIndex == 0)
            {
                ImageLabel.Visibility = Visibility.Visible;
                ImButton.Visibility = Visibility.Visible;
                ImageTextBox.Visibility = Visibility.Visible;

                VidLabel.Visibility = Visibility.Visible;
                VidButton.Visibility = Visibility.Visible;
                VidTextBox.Visibility = Visibility.Visible;
            }
            else
            {
                ImageLabel.Visibility = Visibility.Hidden;
                ImButton.Visibility = Visibility.Hidden;
                ImageTextBox.Visibility = Visibility.Hidden;

                VidLabel.Visibility = Visibility.Hidden;
                VidButton.Visibility = Visibility.Hidden;
                VidTextBox.Visibility = Visibility.Hidden;
            }
        }
    }
}
