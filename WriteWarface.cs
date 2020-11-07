/*
/   Скрипт дампера для записи ROM'а на EPROM.
*/

using System.Linq;

namespace com.clusterrr.Warface
{
    class WriteWarface
    {
        void Run(IFamicomDumperConnection dumper)
        {
            var rom = new NesFile("warface.nes");
            const int prgBankSize = 0x4000;
            const int chrBankSize = 0x1000;
            bool problem = false;

            for (var bank = 0; bank < 128 * 1024 / prgBankSize; bank++)
            {
                do
                {
                    problem = false;
                    Console.WriteLine("Writing PRG bank #{0}...", bank);
                    dumper.WriteCpu(0x6000, (byte)bank);
                    var data = new byte[prgBankSize];
                    Array.Copy(rom.PRG, bank * prgBankSize, data, 0, prgBankSize);
                    if (data.Where(b => b != 0xFF).Any())
                        dumper.WriteCpu(0x8000, data);
                    var dataVerify = dumper.ReadCpu(0x8000, prgBankSize);
                    for (var i = 0; i < prgBankSize; i++)
                    {
                        if (data[i] != dataVerify[i])
                        {
                            Console.Write("{0:X2} != {1:X2} @ {2:X4} ", dataVerify[i], data[i], i);
                            problem = true;
                        }
                    }
                    if (problem)
                        Console.WriteLine("Problems @ bank #{0}", bank);
                } while (problem);
            }

            for (var bank = 0; bank < 128 * 1024 / chrBankSize; bank++)
            {
                do
                {
                    problem = false;
                    Console.WriteLine("Writing CHR bank #{0}...", bank);
                    dumper.WriteCpu(0x6001, (byte)bank);
                    var data = new byte[chrBankSize];
                    Array.Copy(rom.CHR, bank * chrBankSize, data, 0, chrBankSize);
                    if (data.Where(b => b != 0xFF).Any())
                        dumper.WritePpu(0x0000, data);
                    var dataVerify = dumper.ReadPpu(0x0000, chrBankSize);
                    for (var i = 0; i < chrBankSize; i++)
                    {
                        if (data[i] != dataVerify[i])
                        {
                            Console.Write("{0:X2} != {1:X2} @ {2:X4} ", dataVerify[i], data[i], i);
                            problem = true;
                        }
                    }
                    if (problem)
                        Console.WriteLine("Problems @ bank #{0}", bank);
                } while (problem);
            }
        }
    }
}
