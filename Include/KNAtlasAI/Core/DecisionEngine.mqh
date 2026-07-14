//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| DecisionEngine.mqh                                               |
//| Version 3.0.0                                                    |
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
      //-----------------------------------------------------
      // Risk Checks
      //-----------------------------------------------------

      if(!m_riskManager.IsTradingAllowed())
      {
         signal.RiskApproved = false;
         signal.Status = SIGNAL_REJECTED;
         signal.RejectReason = "Trading Disabled";

         return(false);
      }

      if(!m_riskManager.ValidateSignal())
      {
         signal.RiskApproved = false;
         signal.Status = SIGNAL_REJECTED;
         signal.RejectReason = "Risk Manager Rejected";

         return(false);
      }

      signal.RiskApproved = true;

      //-----------------------------------------------------
      // Confidence Decision
      //-----------------------------------------------------

      if(signal.Confidence >= 80.0)
      {
         signal.Status = SIGNAL_APPROVED;
         return(true);
      }

      signal.Status = SIGNAL_REJECTED;
      signal.RejectReason = "Confidence Too Low";

      return(false);
   }

   //--------------------------------------------------------
   // Execute
   //--------------------------------------------------------

   bool Execute(SSignal &signal)
   {
      return(EvaluateSignal(signal));
   }
};

#endif