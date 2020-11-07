using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace TextConverter
{
    class Program
    {
        static int Main(string[] args)
        {
            const int LINE_LENGTH = 30;

            try
            {
                if (args.Length < 2)
                {
                    Console.WriteLine("Usage: TextConverter.exe <input.txt> <output.bin>");
                }
                string symbolsFile = Path.Combine(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), @"symbols.json");
                var symbolsJson = File.ReadAllText(symbolsFile);
                var symbols = JsonConvert.DeserializeObject<Dictionary<char, byte>>(symbolsJson);

                var result = new List<byte>();
                var lines = File.ReadAllLines(args[0]);
                bool boldMode = false;
                foreach (var line in lines)
                {
                    int pos = 0;
                    var words = line.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
                    foreach (var word in words)
                    {
                        if (pos + word.Replace("*", "").Length > LINE_LENGTH)
                        {
                            result.Add(0xFF);
                            pos = 0;
                        }
                        foreach (var ch in word)
                        {
                            if (ch == '*')
                            {
                                boldMode = !boldMode;
                            }
                            else
                            {
                                if (!symbols.ContainsKey(ch) && !symbols.ContainsKey(ch.ToString().ToUpper()[0]))
                                    throw new KeyNotFoundException($"Unknown character: {ch}");
                                var code = symbols.ContainsKey(ch)
                                    ? symbols[ch]
                                    : symbols[ch.ToString().ToUpper()[0]];
                                result.Add((byte)(!boldMode ? code : code + 114));
                                pos++;
                            }
                        }
                        result.Add(symbols[' ']);
                        pos++;
                    }
                    result.Add(0xFF);
                }
                result.Add(0);

                File.WriteAllBytes(args[1], result.ToArray());
                return 0;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error {ex.GetType()}: " + ex.Message + ex.StackTrace);
                return 1;
            }
        }
    }
}
