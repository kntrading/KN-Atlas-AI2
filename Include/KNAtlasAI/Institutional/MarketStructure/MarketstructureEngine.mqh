//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| MarketStructureEngine.mqh                                        |
//| Version 2.0.0                                                    |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_MARKET_STRUCTURE_ENGINE_MQH__
#define __KN_MARKET_STRUCTURE_ENGINE_MQH__

#include "../../Models/MarketContext.mqh"

#include "SwingAnalyzer.mqh"
#include "TrendAnalyzer.mqh"
#include "BOSAnalyzer.mqh"
#include "CHOCHAnalyzer.mqh"
#include "StructureStrengthAnalyzer.mqh"

class CKNMarketStructureEngine
{
private:

   CKNSwingAnalyzer                m_swing;
   CKNTrendAnalyzer                m_trend;
   CKNBOSAnalyzer                  m_bos;
   CKNCHOCHAnalyzer                m_choch;
   CKNStructureStrengthAnalyzer    m_strength;

public:

   //--------------------------------------------------------
   // Initialize
   //--------------------------------------------------------

   bool Initialize()
   {
      if(!m_swing.Initialize())
         return(false);

      if(!m_trend.Initialize())
         return(false);

      if(!m_bos.Initialize())
         return(false);

      if(!m_choch.Initialize())
         return(false);

      if(!m_strength.Initialize())
         return(false);

      Print("Market Structure Engine Online");

      return(true);
   }

   //--------------------------------------------------------
   // Shutdown
   //--------------------------------------------------------

   void Shutdown()
   {
      m_strength.Shutdown();
      m_choch.Shutdown();
      m_bos.Shutdown();
      m_trend.Shutdown();
      m_swing.Shutdown();

      Print("Market Structure Engine Offline");
   }

   //--------------------------------------------------------
   // Analyze
   //--------------------------------------------------------

   bool Analyze(string symbol,
                ENUM_TIMEFRAMES timeframe,
                SMarketContext &context)
   {
      if(!m_swing.Analyze(symbol,timeframe,context))
         return(false);

      if(!m_trend.Analyze(symbol,timeframe,context))
         return(false);

      if(!m_bos.Analyze(symbol,timeframe,context))
         return(false);

      if(!m_choch.Analyze(symbol,timeframe,context))
         return(false);

      if(!m_strength.Analyze(symbol,timeframe,context))
         return(false);

      return(true);
   }

};

#endif