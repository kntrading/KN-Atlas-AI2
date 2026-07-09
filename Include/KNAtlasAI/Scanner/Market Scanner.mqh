#ifndef __MARKETSCANNER_MQH__
#define __MARKETSCANNER_MQH__

class CKNMarketScanner
{
private:

   bool m_initialized;

public:

   CKNMarketScanner()
   {
      m_initialized = false;
   }

   bool Initialize()
   {
      Print("Market Scanner Online");

      m_initialized = true;

      return(true);
   }

   void Shutdown()
   {
      Print("Market Scanner Offline");
   }

   void Scan()
   {
      if(!m_initialized)
         return;

      ScanSymbol("XAUUSD");
      ScanSymbol("XAGUSD");
      ScanSymbol("EURUSD");
      ScanSymbol("GBPUSD");
      ScanSymbol("USDJPY");
      ScanSymbol("GBPJPY");
      ScanSymbol("US30");
      ScanSymbol("NAS100");
   }

private:

   void ScanSymbol(string symbol)
   {
      Print("Scanning ", symbol);
   }
};

#endif