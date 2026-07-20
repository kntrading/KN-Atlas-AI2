//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| ExecutionEngine.mqh                                              |
//| Version 2.0.0                                                    |
//+------------------------------------------------------------------+
#ifndef __KN_EXECUTION_ENGINE_MQH__
#define __KN_EXECUTION_ENGINE_MQH__

#include "../Models/Signal.mqh"

#include "ExecutionQueue.mqh"
#include "ExecutionResult.mqh"
#include "OrderValidator.mqh"
#include "RiskAllocator.mqh"
#include "SlippageManager.mqh"
#include "TradeExecutor.mqh"
#include "PositionManager.mqh"
#include "TradeJournal.mqh"

class CKNExecutionEngine
{
private:

   CKNExecutionQueue     m_queue;
   CKNOrderValidator     m_validator;
   CKNRiskAllocator      m_risk;
   CKNSlippageManager    m_slippage;
   CKNTradeExecutor      m_executor;
   CKNPositionManager    m_positions;
   CKNTradeJournal       m_journal;

public:

   //--------------------------------------------------------
   // Initialize
   //--------------------------------------------------------

   bool Initialize()
   {
      m_queue.Initialize();
      m_validator.Initialize();
      m_risk.Initialize();
      m_slippage.Initialize();
      m_executor.Initialize();
      m_positions.Initialize();
      m_journal.Initialize();

      Print("Execution Engine Online");

      return(true);
   }

   //--------------------------------------------------------
   // Shutdown
   //--------------------------------------------------------

   void Shutdown()
   {
      m_queue.Shutdown();
      m_validator.Shutdown();
      m_risk.Shutdown();
      m_slippage.Shutdown();
      m_executor.Shutdown();
      m_positions.Shutdown();
      m_journal.Shutdown();

      Print("Execution Engine Offline");
   }

   //--------------------------------------------------------
   // Queue Signal
   //--------------------------------------------------------

   bool QueueSignal(const SSignal &signal)
   {
      return(m_queue.Push(signal));
   }

   //--------------------------------------------------------
   // Process Queue
   //--------------------------------------------------------

   bool Process()
   {
      SSignal signal;

      if(!m_queue.Pop(signal))
         return(false);

      if(!m_validator.Validate(signal))
      {
         Print("Signal rejected by validator.");
         return(false);
      }

      if(!m_slippage.SpreadAllowed(signal.Symbol))
      {
         Print("Spread too high.");
         return(false);
      }

      signal.LotSize = m_risk.CalculateLotSize(50.0);

      Print("Calculated Lots: ",
            DoubleToString(signal.LotSize,2));

      m_journal.Log(signal);

      return(true);
   }

   //--------------------------------------------------------
   // Position Updates
   //--------------------------------------------------------

   void Update()
   {
      m_positions.Update();
   }

};

#endif