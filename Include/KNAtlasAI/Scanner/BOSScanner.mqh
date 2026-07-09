#ifndef __BOSSCANNER_MQH__
#define __BOSSCANNER_MQH__

class CKNBOSScanner
{
private:

   bool m_initialized;

public:

   CKNBOSScanner()
   {
      m_initialized = false;
   }

   bool Initialize()
   {
      Print("BOS Scanner Online");
      m_initialized = true;
      return(true);
   }

   void Shutdown()
   {
      Print("BOS Scanner Offline");
   }

   bool BullishBOS(string symbol, ENUM_TIMEFRAMES tf)
   {
      if(!m_initialized)
         return(false);

      double previousHigh = iHigh(symbol, tf, 1);
      double currentClose = iClose(symbol, tf, 0);

      return(currentClose > previousHigh);
   }

   bool BearishBOS(string symbol, ENUM_TIMEFRAMES tf)
   {
      if(!m_initialized)
         return(false);

      double previousLow = iLow(symbol, tf, 1);
      double currentClose = iClose(symbol, tf, 0);

      return(currentClose < previousLow);
   }
};

#endif