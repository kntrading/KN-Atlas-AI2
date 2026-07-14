//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| TradeExecutor.mqh                                                |
//| Version 2.0.0                                                    |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_TRADE_EXECUTOR_MQH__
#define __KN_TRADE_EXECUTOR_MQH__

#include <Trade/Trade.mqh>

#include "../Models/Signal.mqh"
#include "../Models/TradeResult.mqh"
#include "../Risk/PositionSizer.mqh"

class CKNTradeExecutor
{
private:

   CTrade            m_trade;
   CKNPositionSizer  m_positionSizer;

public:

   //--------------------------------------------------------
   // Constructor
   //--------------------------------------------------------

   CKNTradeExecutor()
   {
   }

   //--------------------------------------------------------
   // Initialize
   //--------------------------------------------------------

   bool Initialize()
   {
      m_positionSizer.Initialize();

      Print("Trade Executor Online");

      return(true);
   }

   //--------------------------------------------------------
   // Shutdown
   //--------------------------------------------------------

   void Shutdown()
   {
      m_positionSizer.Shutdown();

      Print("Trade Executor Offline");
   }

   //--------------------------------------------------------
   // Execute Trade
   //--------------------------------------------------------

   bool ExecuteTrade(SSignal &signal)
   {
      if(!signal.TradeApproved)
      {
         Print("Trade rejected by Decision Engine.");
         return(false);
      }

      double stopLossPoints =
         MathAbs(signal.EntryPrice - signal.StopLoss) / _Point;

      double volume =
         m_positionSizer.CalculateLotSize(signal.Symbol,
                                          stopLossPoints);

      if(volume <= 0.0)
      {
         Print("Invalid trade volume.");
         return(false);
      }

      bool result = false;

      switch(signal.Direction)
      {
         case TRADE_BUY:

            result = m_trade.Buy(
                        volume,
                        signal.Symbol,
                        0.0,
                        signal.StopLoss,
                        signal.TakeProfit,
                        "KN Atlas AI BUY");

            break;

         case TRADE_SELL:

            result = m_trade.Sell(
                        volume,
                        signal.Symbol,
                        0.0,
                        signal.StopLoss,
                        signal.TakeProfit,
                        "KN Atlas AI SELL");

            break;

         default:

            return(false);
      }

      if(result)
      {
         signal.Executed = true;

         signal.Status = SIGNAL_EXECUTED;

         Print("Trade executed successfully.");

         return(true);
      }

      Print("Trade execution failed.");

      return(false);
   }

};

#endif