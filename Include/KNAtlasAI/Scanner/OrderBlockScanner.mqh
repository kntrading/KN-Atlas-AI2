#ifndef __ORDERBLOCKSCANNER_MQH__
#define __ORDERBLOCKSCANNER_MQH__

class CKNOrderBlockScanner
{
private:

   bool m_initialized;

public:

   CKNOrderBlockScanner()
   {
      m_initialized = false;
   }

   bool Initialize()
   {
      Print("Order Block Scanner Online");
      m_initialized = true;
      return(true);
   }

   void Shutdown()
   {
      Print("Order Block Scanner Offline");
   }

   bool BullishOrderBlock(string symbol, ENUM_TIMEFRAMES tf)
   {
      if(!m_initialized)
         return(false);

      double open1  = iOpen(symbol, tf, 1);
      double close1 = iClose(symbol, tf, 1);
      double close0 = iClose(symbol, tf, 0);

      // Previous candle bearish, current closes above previous high
      return(close1 < open1 && close0 > iHigh(symbol, tf, 1));
   }

   bool BearishOrderBlock(string symbol, ENUM_TIMEFRAMES tf)
   {
      if(!m_initialized)
         return(false);

      double open1  = iOpen(symbol, tf, 1);
      double close1 = iClose(symbol, tf, 1);
      double close0 = iClose(symbol, tf, 0);

      // Previous candle bullish, current closes below previous low
      return(close1 > open1 && close0 < iLow(symbol, tf, 1));
   }
};

#endif