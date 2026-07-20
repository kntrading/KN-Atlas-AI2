//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| StrategyPipeline.mqh                                             |
//| Version 1.0.0                                                    |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_STRATEGY_PIPELINE_MQH__
#define __KN_STRATEGY_PIPELINE_MQH__

#include "../Models/Signal.mqh"

#include "../AI/StrategyEngine.mqh"
#include "../AI/ConfidenceEngine.mqh"
#include "../Core/DecisionEngine.mqh"

class CKNStrategyPipeline
{
private:

   CKNStrategyEngine     m_strategy;
   CKNConfidenceEngine   m_confidence;
   CKNDecisionEngine     m_decision;

public:

   //--------------------------------------------------------
   // Initialize
   //--------------------------------------------------------

   bool Initialize()
   {
      m_strategy.Initialize();
      m_confidence.Initialize();
      m_decision.Initialize();

      Print("Strategy Pipeline Online");

      return(true);
   }

   //--------------------------------------------------------
   // Shutdown
   //--------------------------------------------------------

   void Shutdown()
   {
      m_strategy.Shutdown();
      m_confidence.Shutdown();

      Print("Strategy Pipeline Offline");
   }

   //--------------------------------------------------------
   // Execute Pipeline
   //--------------------------------------------------------

   SSignal Analyze(string symbol,
                   ENUM_TIMEFRAMES timeframe)
   {
      // Step 1
      SSignal signal =
         m_strategy.BuildSignal(symbol,timeframe);

      // Step 2
      m_confidence.Calculate(signal);

      // Step 3
      m_decision.Execute(signal);

      return(signal);
   }

   //--------------------------------------------------------
   // Validate
   //--------------------------------------------------------

   bool Approved(const SSignal &signal)
   {
      return(signal.Status == SIGNAL_APPROVED);
   }

};

#endif