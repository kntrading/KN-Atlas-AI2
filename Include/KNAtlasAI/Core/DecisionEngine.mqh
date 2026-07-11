//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| DecisionEngine.mqh                                               |
//| Version 2.0.0                                                    |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_DECISION_ENGINE_MQH__
#define __KN_DECISION_ENGINE_MQH__

#include "../Models/Signal.mqh"
#include "../Risk/RiskManager.mqh"

class CKNDecisionEngine
{
private:

   CKNRiskManager m_riskManager;

public:

   //--------------------------------------------------------
   // Constructor
   //--------------------------------------------------------

   CKNDecisionEngine()
   {
   }

   //--------------------------------------------------------
   // Initialize
   //--------------------------------------------------------

   bool Initialize()
   {
      return(true);
   }

   //--------------------------------------------------------
   // Set Risk Manager
   //--------------------------------------------------------

   void SetRiskManager(const CKNRiskManager &riskManager)
   {
      m_riskManager = riskManager;
   }

   //--------------------------------------------------------
   // Evaluate Signal
   //--------------------------------------------------------

   bool EvaluateSignal(SSignal &signal)
   {
      // Trading disabled
      if(!m_riskManager.IsTradingAllowed())
      {
         signal.RiskApproved = false;
         signal.TradeApproved = false;
         signal.Status = SIGNAL_REJECTED;
         return(false);
      }

      // Basic Risk Validation
      if(!m_riskManager.ValidateSignal())
      {
         signal.RiskApproved = false;
         signal.TradeApproved = false;
         signal.Status = SIGNAL_REJECTED;
         return(false);
      }

      // Risk Approved
      signal.RiskApproved = true;

      // Confidence Check
      if(signal.Confidence >= 70.0)
      {
         signal.TradeApproved = true;
         signal.Status = SIGNAL_CONFIRMED;
      }
      else
      {
         signal.TradeApproved = false;
         signal.Status = SIGNAL_VALID;
      }

      return(signal.TradeApproved);
   }

   //--------------------------------------------------------
   // Execute
   //--------------------------------------------------------

   bool Execute(SSignal &signal)
   {
      return(EvaluateSignal(signal));
   }
};

#endif // __KN_DECISION_ENGINE_MQH__