//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| Module : PositionSnapshot                                        |
//| Version: 1.0.0                                                   |
//| Author : KN Trading                                              |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_POSITION_SNAPSHOT_MQH__
#define __KN_POSITION_SNAPSHOT_MQH__

#include "TradeRequest.mqh"

//---------------------------------------------------------
// Position Snapshot
//---------------------------------------------------------
struct SPositionSnapshot
{
   //======================================================
   // Position Information
   //======================================================

   ulong Ticket;

   string Symbol;

   ENUM_TRADE_DIRECTION Direction;

   ENUM_TIMEFRAMES Timeframe;

   //======================================================
   // Prices
   //======================================================

   double EntryPrice;

   double CurrentPrice;

   double StopLoss;

   double TakeProfit;

   //======================================================
   // Volume
   //======================================================

   double LotSize;

   //======================================================
   // Profit
   //======================================================

   double Profit;

   double ProfitPoints;

   //======================================================
   // Risk
   //======================================================

   double RiskReward;

   double Drawdown;

   //======================================================
   // Status
   //======================================================

   bool BreakEvenActive;

   bool TrailingStopActive;

   bool PartialCloseExecuted;

   bool PositionOpen;

   //======================================================
   // Time
   //======================================================

   datetime OpenTime;

   datetime LastUpdate;

   //======================================================
   // Reset
   //======================================================

   void Reset()
   {
      Ticket = 0;

      Symbol = "";

      Direction = TRADE_NONE;

      Timeframe = PERIOD_CURRENT;

      EntryPrice = 0.0;

      CurrentPrice = 0.0;

      StopLoss = 0.0;

      TakeProfit = 0.0;

      LotSize = 0.0;

      Profit = 0.0;

      ProfitPoints = 0.0;

      RiskReward = 0.0;

      Drawdown = 0.0;

      BreakEvenActive = false;

      TrailingStopActive = false;

      PartialCloseExecuted = false;

      PositionOpen = false;

      OpenTime = 0;

      LastUpdate = TimeCurrent();
   }
};

#endif