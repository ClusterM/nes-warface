using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImageSplitter
{
    class Program
    {
        static int Main(string[] args)
        {
            try
            {
                if (args.Length < 5)
                {
                    Console.WriteLine("ImageSplitter.exe <input> <output1> <output2> <output3> <output4>");
                    return 1;
                }

                var inputImage = Image.FromFile(args[0]);

                var output1 = new Bitmap(256, 64, System.Drawing.Imaging.PixelFormat.Format32bppArgb);
                var output2 = new Bitmap(256, 64, System.Drawing.Imaging.PixelFormat.Format32bppArgb);
                var output3 = new Bitmap(256, 64, System.Drawing.Imaging.PixelFormat.Format32bppArgb);
                var output4 = new Bitmap(256, 48, System.Drawing.Imaging.PixelFormat.Format32bppArgb);

                var gr1 = Graphics.FromImage(output1);
                var gr2 = Graphics.FromImage(output2);
                var gr3 = Graphics.FromImage(output3);
                var gr4 = Graphics.FromImage(output4);

                gr1.DrawImageUnscaled(inputImage, 0, 0);
                gr2.DrawImageUnscaled(inputImage, 0, -64);
                gr3.DrawImageUnscaled(inputImage, 0, -128);
                gr4.DrawImageUnscaled(inputImage, 0, -192);

                gr1.Flush();
                gr2.Flush();
                gr3.Flush();
                gr4.Flush();

                output1.Save(args[1], ImageFormat.Png);
                output2.Save(args[2], ImageFormat.Png);
                output3.Save(args[3], ImageFormat.Png);
                output4.Save(args[4], ImageFormat.Png);

                return 0;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error {ex.GetType()}: {ex.Message}{ex.StackTrace}");
                return 1;
            }
        }
    }
}
