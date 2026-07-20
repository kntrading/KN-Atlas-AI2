//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| Brain.mqh                                                        |
//| Version 4.0.0                                                    |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_BRAIN_MQH__
#define __KN_BRAIN_MQH__

#include "../Models/Signal.mqh"

#include "../Pipelines/StrategyPipeline.mqh"

class CKNBrain
{
private:

   CKNStrategyPipeline m_strategy;

public:

   //--------------------------------------------------------
   // Constructor
   //--------------------------------------------------------

   CKNBrain()
   {
   }

   //--------------------------------------------------------
   // Initialize
   //--------------------------------------------------------

   bool Initialize()
   {
      m_strategy.Initialize();

      Print("KN Atlas AI Brain Online");

      return(true);
   }

   //--------------------------------------------------------
   // Shutdown
   //--------------------------------------------------------

   void Shutdown()
   {
      m_strategy.Shutdown();

      Print("KN Atlas AI Brain Offline");
   }

   //--------------------------------------------------------
   // Analyze Market
   //--------------------------------------------------------

   SSignal Analyze(string symbol,
                   ENUM_TIMEFRAMES timeframe)
   {
      return(m_strategy.Analyze(symbol,timeframe));
   }

   //--------------------------------------------------------
   // Helpers
   //--------------------------------------------------------

   bool IsTradeApproved(const SSignal &signal)
   {
      return(m_strategy.Approved(signal));
   }

   double GetConfidence(const SSignal &signal)
   {
      return(signal.Confidence);
   }

   string GetConfidenceLabel(const SSignal &signal)
   {
      return(signal.ConfidenceLabel);
   }

};

#endif