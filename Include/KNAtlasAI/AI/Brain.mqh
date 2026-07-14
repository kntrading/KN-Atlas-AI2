//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| Brain.mqh                                                        |
//| Version 3.2.0                                                    |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_BRAIN_MQH__
#define __KN_BRAIN_MQH__

#include "../Models/Signal.mqh"

#include "StrategyEngine.mqh"
#include "ConfidenceEngine.mqh"

#include "../Filters/FilterManager.mqh"
#include "../Core/DecisionEngine.mqh"

class CKNBrain
{
private:

   CKNStrategyEngine    m_strategy;
   CKNFilterManager     m_filters;
   CKNConfidenceEngine  m_confidence;
   CKNDecisionEngine    m_decision;

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
      m_filters.Initialize();
      m_confidence.Initialize();
      m_decision.Initialize();

      Print("KN Atlas AI Brain Online");

      return(true);
   }

   //--------------------------------------------------------
   // Shutdown
   //--------------------------------------------------------

   void Shutdown()
   {
      m_strategy.Shutdown();
      m_filters.Shutdown();
      m_confidence.Shutdown();

      Print("KN Atlas AI Brain Offline");
   }

   //--------------------------------------------------------
   // Analyze Market
   //--------------------------------------------------------

   SSignal Analyze(string symbol,
                   ENUM_TIMEFRAMES timeframe)
   {
      //-----------------------------------------------------
      // Step 1 - Build Strategy Signal
      //-----------------------------------------------------

      SSignal signal =
         m_strategy.BuildSignal(symbol,timeframe);

      //-----------------------------------------------------
      // Step 2 - Run Filter Pipeline
      //-----------------------------------------------------

      if(!m_filters.Validate(signal))
      {
         signal.Status = SIGNAL_REJECTED;
         return(signal);
      }

      //-----------------------------------------------------
      // Step 3 - Calculate Confidence
      //-----------------------------------------------------

      m_confidence.Calculate(signal);

      //-----------------------------------------------------
      // Step 4 - Decision Engine
      //-----------------------------------------------------

      m_decision.Execute(signal);

      //-----------------------------------------------------
      // Step 5 - Return Signal
      //-----------------------------------------------------

      return(signal);
   }

   //--------------------------------------------------------
   // Helper Functions
   //--------------------------------------------------------

   bool IsTradeApproved(const SSignal &signal)
   {
      return(signal.Status == SIGNAL_APPROVED);
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