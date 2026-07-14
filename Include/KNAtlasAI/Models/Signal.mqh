//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| Signal.mqh                                                       |
//| Version 3.1.0                                                    |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __SIGNAL_MQH__
#define __SIGNAL_MQH__

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
// Signal Status
//---------------------------------------------------------

enum ENUM_SIGNAL_STATUS
{
   SIGNAL_NEW = 0,
   SIGNAL_VALIDATED,
   SIGNAL_FILTERED,
   SIGNAL_APPROVED,
   SIGNAL_REJECTED,
   SIGNAL_EXECUTED
};

//---------------------------------------------------------
// Signal Structure
//---------------------------------------------------------

struct SSignal
{
   //------------------------------------------------------
   // Instrument
   //------------------------------------------------------

   string              Symbol;
   ENUM_TIMEFRAMES     Timeframe;

   //------------------------------------------------------
   // Trade
   //------------------------------------------------------

   ENUM_TRADE_DIRECTION Direction;

   double EntryPrice;
   double StopLoss;
   double TakeProfit;
   double LotSize;

   //------------------------------------------------------
   // Scanner Results
   //------------------------------------------------------

   bool Trend;
   bool Liquidity;
   bool FVG;
   bool OrderBlock;
   bool BOS;
   bool CHOCH;

   //------------------------------------------------------
   // Market Filters
   //------------------------------------------------------

   bool SessionApproved;
   bool TradingDayApproved;
   bool HolidayApproved;
   bool SpreadApproved;
   bool VolatilityApproved;
   bool NewsApproved;

   //------------------------------------------------------
   // Trade Filters
   //------------------------------------------------------

   bool SymbolApproved;
   bool CorrelationApproved;
   bool TimeApproved;

   //------------------------------------------------------
   // Risk Filters
   //------------------------------------------------------

   bool ExposureApproved;
   bool RiskApproved;

   //------------------------------------------------------
   // AI
   //------------------------------------------------------

   double Confidence;
   double Probability;
   double RiskReward;

   string ConfidenceLabel;

   //------------------------------------------------------
   // Strategy
   //------------------------------------------------------

   string StrategyName;
   string RejectReason;

   //------------------------------------------------------
   // Execution
   //------------------------------------------------------

   bool Executed;

   ENUM_SIGNAL_STATUS Status;

   //------------------------------------------------------
   // Statistics
   //------------------------------------------------------

   datetime SignalTime;
   datetime EntryTime;
   datetime ExitTime;

   double Profit;
   double ProfitPips;

   ulong Ticket;

   bool Win;
};

#endif