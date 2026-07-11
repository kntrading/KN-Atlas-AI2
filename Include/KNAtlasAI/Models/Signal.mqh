//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| Module : Signal                                                  |
//| Version: 2.0.0                                                   |
//| Author : KN Trading                                              |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_SIGNAL_MQH__
#define __KN_SIGNAL_MQH__

#include "TradeRequest.mqh"

//---------------------------------------------------------
// Signal Status
//---------------------------------------------------------
enum ENUM_SIGNAL_STATUS
{
   SIGNAL_INVALID = 0,
   SIGNAL_VALID,
   SIGNAL_CONFIRMED,
   SIGNAL_EXECUTED,
   SIGNAL_REJECTED
};

//---------------------------------------------------------
// AI Signal Model
//---------------------------------------------------------
struct SSignal
{
   //======================================================
   // Identification
   //======================================================

   string Symbol;

   ENUM_TIMEFRAMES Timeframe;

   ENUM_TRADE_DIRECTION Direction;

   //======================================================
   // AI Status
   //======================================================

   ENUM_SIGNAL_STATUS Status;

   double Confidence;

   //======================================================
   // Prices
   //======================================================

   double EntryPrice;

   double StopLoss;

   double TakeProfit;

   //======================================================
   // Smart Money Confirmation
   //======================================================

   bool Trend;

   bool Structure;

   bool Liquidity;

   bool BOS;

   bool CHOCH;

   bool FVG;

   bool OrderBlock;

   //======================================================
   // Session
   //======================================================

   string Session;

   //======================================================
   // Execution
   //======================================================

   bool TradeApproved;

   bool RiskApproved;

   bool Executed;

   //======================================================
   // Timestamp
   //======================================================

   datetime TimeCreated;

   //======================================================
   // Reset
   //======================================================

   void Reset()
   {
      Symbol = "";

      Timeframe = PERIOD_CURRENT;

      Direction = TRADE_NONE;

      Status = SIGNAL_INVALID;

      Confidence = 0.0;

      EntryPrice = 0.0;

      StopLoss = 0.0;

      TakeProfit = 0.0;

      Trend = false;

      Structure = false;

      Liquidity = false;

      BOS = false;

      CHOCH = false;

      FVG = false;

      OrderBlock = false;

      Session = "";

      TradeApproved = false;

      RiskApproved = false;

      Executed = false;

      TimeCreated = TimeCurrent();
   }
};

#endif