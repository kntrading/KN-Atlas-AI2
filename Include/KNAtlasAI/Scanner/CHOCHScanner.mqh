#ifndef __CHOCHSCANNER_MQH__
#define __CHOCHSCANNER_MQH__

class CKNCHOCHScanner
{
private:

   bool m_initialized;

public:

   CKNCHOCHScanner()
   {
      m_initialized = false;
   }

   bool Initialize()
   {
      Print("CHOCH Scanner Online");
      m_initialized = true;
      return(true);
   }

   void Shutdown()
   {
      Print("CHOCH Scanner Offline");
   }

   bool BullishCHOCH(string symbol, ENUM_TIMEFRAMES tf)
   {
      if(!m_initialized)
         return(false);

      double currentHigh = iHigh(symbol, tf, 0);
      double previousHigh = iHigh(symbol, tf, 1);
      double previousLow = iLow(symbol, tf, 1);

      return(currentHigh > previousHigh &&
             iClose(symbol, tf, 0) > previousLow);
   }

   bool BearishCHOCH(string symbol, ENUM_TIMEFRAMES tf)
   {
      if(!m_initialized)
         return(false);

      double currentLow = iLow(symbol, tf, 0);
      double previousLow = iLow(symbol, tf, 1);
      double previousHigh = iHigh(symbol, tf, 1);

      return(currentLow < previousLow &&
             iClose(symbol, tf, 0) < previousHigh);
   }
};

#endif