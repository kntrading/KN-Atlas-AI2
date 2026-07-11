//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| Module : TradeResult                                              |
//| Version: 1.0.0                                                    |
//| Author : KN Trading                                               |
//| Copyright © 2026 KN Trading                                       |
//+------------------------------------------------------------------+
#ifndef __KN_TRADE_RESULT_MQH__
#define __KN_TRADE_RESULT_MQH__

#include "TradeRequest.mqh"

//---------------------------------------------------------
// Trade Result Status
//---------------------------------------------------------
enum ENUM_TRADE_RESULT
{
   RESULT_NONE = 0,
   RESULT_SUCCESS,
   RESULT_FAILED,
   RESULT_REJECTED
};

//---------------------------------------------------------
// Trade Result Model
//---------------------------------------------------------
struct STradeResult
{
   //======================================================
   // Trade Status
   //======================================================

   ENUM_TRADE_RESULT Result;

   //======================================================
   // Identification
   //======================================================

   ulong Ticket;

   string Symbol;

   ENUM_TRADE_DIRECTION Direction;

   //======================================================
   // Prices
   //======================================================

   double EntryPrice;

   double StopLoss;

   double TakeProfit;

   //======================================================
   // Position Information
   //======================================================

   double LotSize;

   //======================================================
   // Costs
   //======================================================

   double Spread;

   double Commission;

   double Swap;

   //======================================================
   // Profit
   //======================================================

   double Profit;

   //======================================================
   // Execution
   //======================================================

   string BrokerMessage;

   datetime TimeExecuted;

   //======================================================
   // Constructor
   //======================================================

   void Reset()
   {
      Result = RESULT_NONE;

      Ticket = 0;

      Symbol = "";

      Direction = TRADE_NONE;

      EntryPrice = 0.0;

      StopLoss = 0.0;

      TakeProfit = 0.0;

      LotSize = 0.0;

      Spread = 0.0;

      Commission = 0.0;

      Swap = 0.0;

      Profit = 0.0;

      BrokerMessage = "";

      TimeExecuted = TimeCurrent();
   }
};

#endif