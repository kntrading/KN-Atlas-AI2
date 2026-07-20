//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| SwingAnalyzer.mqh                                                |
//| Version 2.0.0                                                    |
//+------------------------------------------------------------------+
#ifndef __KN_SWING_ANALYZER_MQH__
#define __KN_SWING_ANALYZER_MQH__

#include "../../Models/SwingPoint.mqh"
#include "../../Models/SwingSettings.mqh"
#include "../../Models/MarketContext.mqh"

#include "../../Services/IndicatorService.mqh"

class CKNSwingAnalyzer
{
private:

   enum
   {
      MAX_BARS = 300
   };

   SSwingSettings m_settings;

   CKNIndicatorService m_indicatorService;

   MqlRates m_rates[];

   int m_barCount;

public:

   //--------------------------------------------------------

   bool Initialize()
   {
      ArraySetAsSeries(m_rates,true);

      m_settings.Reset();

      m_barCount=0;

      return(m_indicatorService.Initialize());
   }

   //--------------------------------------------------------

   void Shutdown()
   {
      m_indicatorService.Shutdown();
   }

   //--------------------------------------------------------

   bool Analyze(string symbol,
                ENUM_TIMEFRAMES timeframe,
                SMarketContext &context)
   {
      context.Reset();

      context.ATR=
         m_indicatorService.GetATR(
            symbol,
            timeframe,
            m_settings.ATRPeriod);

      if(context.ATR<=0.0)
         return(false);

      m_barCount=
         CopyRates(
            symbol,
            timeframe,
            0,
            MAX_BARS,
            m_rates);

      if(m_barCount<100)
         return(false);

      context.SwingDistance=
         context.ATR*
         m_settings.ATRMultiplier;

      //--------------------------------------------------
      // Phase 2
      // Swing Detection
      //--------------------------------------------------

      return(true);
   }

};

#endif