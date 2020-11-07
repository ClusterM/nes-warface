/*
/   Скрипт дампера для проверки EPROM на чистоту
*/

namespace com.clusterrr.Warface
{
    class EraseEeprom
    {
        void Run(IFamicomDumperConnection dumper)
        {
            const int prgBankSize = 0x4000;
            const int chrBankSize = 0x1000;
            int problems = 0;
            
            for (var bank = 0; bank < 128 * 1024 / prgBankSize; bank++)
            {
                int minProblems = -1;
                do
                {
                    problems = 0;
                    Console.WriteLine("Reading PRG bank #{0}...", bank);
                    dumper.WriteCpu(0x6000, (byte)bank);
                    var dataVerify = dumper.ReadCpu(0x8000, prgBankSize);
                    for (var i = 0; i < prgBankSize; i++)
                    {
                        if (0xFF != dataVerify[i])
                        {
                            //Console.Write("{0:X2} != {1:X2} @ {2:X4} ", dataVerify[i], 0xFF, i);
                            problems++;
                        }
                    }
                    if (problems > 0)
                        Console.WriteLine("{0} bytes @ PRG bank #{1} are not clean", problems, bank);                    
                    // if (problems < minProblems)
                    //     Console.Beep();
                    if (minProblems < 0 || problems < minProblems)
                        minProblems = problems;
                } while (problems > 0);
            }

            for (var bank = 0; bank < 128 * 1024 / chrBankSize; bank++)
            {
                int minProblems = -1;
                do
                {
                    problems = 0;
                    Console.WriteLine("Reading CHR bank #{0}...", bank);
                    dumper.WriteCpu(0x6001, (byte)bank);
                    var dataVerify = dumper.ReadPpu(0x0000, chrBankSize);
                    for (var i = 0; i < chrBankSize; i++)
                    {
                        if (0xFF != dataVerify[i])
                        {
                            //Console.Write("{0:X2} != {1:X2} @ {2:X4} ", dataVerify[i], 0xFF, i);
                            problems++;
                        }
                    }
                    if (problems > 0)
                        Console.WriteLine("{0} bytes @ CHR bank #{1} are not clean", problems, bank);
                    // if (problems < minProblems)
                    //     Console.Beep();
                    if (minProblems < 0 || problems < minProblems)
                        minProblems = problems;
                } while (problems > 0);
            }
        }
    }
}
