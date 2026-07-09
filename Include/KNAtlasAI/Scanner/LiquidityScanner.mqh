#ifndef __LIQUIDITYSCANNER_MQH__
#define __LIQUIDITYSCANNER_MQH__

class CKNLiquidityScanner
{
private:

   bool m_initialized;

public:

   CKNLiquidityScanner()
   {
      m_initialized = false;
   }

   bool Initialize()
   {
      Print("Liquidity Scanner Online");
      m_initialized = true;
      return(true);
   }

   void Shutdown()
   {
      Print("Liquidity Scanner Offline");
   }

   bool BuySideLiquidity(string symbol, ENUM_TIMEFRAMES tf)
   {
      if(!m_initialized)
         return(false);

      double high1 = iHigh(symbol, tf, 1);
      double high2 = iHigh(symbol, tf, 2);

      return(MathAbs(high1-high2) <= (_Point*10));
   }

   bool SellSideLiquidity(string symbol, ENUM_TIMEFRAMES tf)
   {
      if(!m_initialized)
         return(false);

      double low1 = iLow(symbol, tf, 1);
      double low2 = iLow(symbol, tf, 2);

      return(MathAbs(low1-low2) <= (_Point*10));
   }

   bool LiquiditySweep(string symbol, ENUM_TIMEFRAMES tf)
   {
      if(!m_initialized)
         return(false);

      double high0 = iHigh(symbol, tf, 0);
      double high1 = iHigh(symbol, tf, 1);
      double close0 = iClose(symbol, tf, 0);

      if(high0 > high1 && close0 < high1)
         return(true);

      return(false);
   }
};

#endif