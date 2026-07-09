#ifndef __FVGSCANNER_MQH__
#define __FVGSCANNER_MQH__

class CKNFVGScanner
{
private:

   bool m_initialized;

public:

   CKNFVGScanner()
   {
      m_initialized = false;
   }

   bool Initialize()
   {
      Print("FVG Scanner Online");
      m_initialized = true;
      return(true);
   }

   void Shutdown()
   {
      Print("FVG Scanner Offline");
   }

   bool BullishFVG(string symbol, ENUM_TIMEFRAMES tf)
   {
      if(!m_initialized)
         return(false);

      double high2 = iHigh(symbol, tf, 2);
      double low0  = iLow(symbol, tf, 0);

      return(low0 > high2);
   }

   bool BearishFVG(string symbol, ENUM_TIMEFRAMES tf)
   {
      if(!m_initialized)
         return(false);

      double low2  = iLow(symbol, tf, 2);
      double high0 = iHigh(symbol, tf, 0);

      return(high0 < low2);
   }
};

#endif