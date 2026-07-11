//+------------------------------------------------------------------+
//|                                            TradeRequest.mqh      |
//|                        KN Atlas AI                               |
//|                  Copyright 2026 KN Trading                       |
//+------------------------------------------------------------------+
#ifndef __KN_TRADE_REQUEST_MQH__
#define __KN_TRADE_REQUEST_MQH__

//---------------------------------------------------------
// Trade Direction
//---------------------------------------------------------
enum ENUM_TRADE_DIRECTION
{
   TRADE_NONE = 0,
   TRADE_BUY,
   TRADE_SELL
};

//---------------------------------------------------------
// Trade Request Model
//---------------------------------------------------------
struct STradeRequest
{
   // Identification
   string Symbol;
   ENUM_TIMEFRAMES Timeframe;
   ENUM_TRADE_DIRECTION Direction;

   // Prices
   double EntryPrice;
   double StopLoss;
   double TakeProfit;

   // Position Size
   double LotSize;
   double RiskPercent;

   // AI
   double Confidence;

   // Smart Money Confirmation
   bool TrendConfirmed;
   bool StructureConfirmed;
   bool BOSConfirmed;
   bool CHOCHConfirmed;
   bool LiquidityConfirmed;
   bool FVGConfirmed;
   bool OrderBlockConfirmed;

   // Session
   string SessionName;

   // Timestamp
   datetime TimeCreated;

   //------------------------------------------------------
   // Constructor
   //------------------------------------------------------
   void Reset()
   {
      Symbol = "";

      Timeframe = PERIOD_CURRENT;

      Direction = TRADE_NONE;

      EntryPrice = 0.0;
      StopLoss = 0.0;
      TakeProfit = 0.0;

      LotSize = 0.0;
      RiskPercent = 0.0;

      Confidence = 0.0;

      TrendConfirmed = false;
      StructureConfirmed = false;
      BOSConfirmed = false;
      CHOCHConfirmed = false;
      LiquidityConfirmed = false;
      FVGConfirmed = false;
      OrderBlockConfirmed = false;

      SessionName = "";

      TimeCreated = TimeCurrent();
   }
};

#endif