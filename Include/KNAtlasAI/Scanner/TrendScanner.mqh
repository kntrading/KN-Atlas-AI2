#ifndef __TRENDSCANNER_MQH__
#define __TRENDSCANNER_MQH__

class CKNTrendScanner
{
private:

   bool m_initialized;

public:

   CKNTrendScanner()
   {
      m_initialized=false;
   }

   bool Initialize()
   {
      Print("Trend Scanner Online");
      m_initialized=true;
      return(true);
   }

   void Shutdown()
   {
      Print("Trend Scanner Offline");
   }

   int GetTrend(string symbol, ENUM_TIMEFRAMES timeframe)
   {
      if(!m_initialized)
         return(0);

      double ema50=iMA(symbol,timeframe,50,0,MODE_EMA,PRICE_CLOSE);
      double ema200=iMA(symbol,timeframe,200,0,MODE_EMA,PRICE_CLOSE);

      double price=SymbolInfoDouble(symbol,SYMBOL_BID);

      if(price>ema50 && ema50>ema200)
         return(1);

      if(price<ema50 && ema50<ema200)
         return(-1);

      return(0);
   }
};

#endif