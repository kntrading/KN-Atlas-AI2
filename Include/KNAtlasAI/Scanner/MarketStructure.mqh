//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| Market Structure Engine                                          |
//+------------------------------------------------------------------+
#ifndef __MARKETSTRUCTURE_MQH__
#define __MARKETSTRUCTURE_MQH__

#include "SwingEngine.mqh"

enum ENUM_MARKET_STRUCTURE
{
   STRUCTURE_UNKNOWN = 0,
   STRUCTURE_BULLISH,
   STRUCTURE_BEARISH,
   STRUCTURE_RANGE
};

class CKNMarketStructure
{
private:

   bool m_initialized;
   CKNSwingEngine m_swing;

public:

   CKNMarketStructure()
   {
      m_initialized = false;
   }

   bool Initialize()
   {
      m_swing.Initialize();
      m_initialized = true;

      Print("Market Structure Engine Online");

      return(true);
   }

   void Shutdown()
   {
      m_swing.Shutdown();

      m_initialized = false;

      Print("Market Structure Engine Offline");
   }

   ENUM_MARKET_STRUCTURE GetStructure(string symbol,
                                      ENUM_TIMEFRAMES tf)
   {
      if(!m_initialized)
         return(STRUCTURE_UNKNOWN);

      double lastSwingHigh = 0.0;
      double previousSwingHigh = 0.0;

      double lastSwingLow = 0.0;
      double previousSwingLow = 0.0;

      int highsFound = 0;
      int lowsFound = 0;

      for(int i = 5; i < 150; i++)
      {
         if(highsFound < 2 && m_swing.IsSwingHigh(symbol, tf, i))
         {
            if(highsFound == 0)
               lastSwingHigh = iHigh(symbol, tf, i);
            else
               previousSwingHigh = iHigh(symbol, tf, i);

            highsFound++;
         }

         if(lowsFound < 2 && m_swing.IsSwingLow(symbol, tf, i))
         {
            if(lowsFound == 0)
               lastSwingLow = iLow(symbol, tf, i);
            else
               previousSwingLow = iLow(symbol, tf, i);

            lowsFound++;
         }

         if(highsFound >= 2 && lowsFound >= 2)
            break;
      }

      if(lastSwingHigh > previousSwingHigh &&
         lastSwingLow > previousSwingLow)
         return(STRUCTURE_BULLISH);

      if(lastSwingHigh < previousSwingHigh &&
         lastSwingLow < previousSwingLow)
         return(STRUCTURE_BEARISH);

      return(STRUCTURE_RANGE);
   }
};

#endif