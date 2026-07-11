//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| Module : RiskProfile                                             |
//| Version: 1.0.0                                                   |
//| Author : KN Trading                                              |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_RISK_PROFILE_MQH__
#define __KN_RISK_PROFILE_MQH__

//---------------------------------------------------------
// Risk Profile
//---------------------------------------------------------
struct SRiskProfile
{
   //======================================================
   // Risk Configuration
   //======================================================

   double RiskPerTrade;

   double MaxDailyLoss;

   double MaxWeeklyLoss;

   double MaxMonthlyLoss;

   double MaxDrawdown;

   double MaxRiskExposure;

   //======================================================
   // Position Limits
   //======================================================

   int MaxOpenPositions;

   int MaxPendingOrders;

   int MaxTradesPerDay;

   int MaxConsecutiveLosses;

   //======================================================
   // Trading Controls
   //======================================================

   bool EnableTrading;

   bool AllowBuy;

   bool AllowSell;

   bool AllowScaling;

   bool AllowHedging;

   //======================================================
   // Lot Size Controls
   //======================================================

   double MinimumLot;

   double MaximumLot;

   double DefaultLot;

   //======================================================
   // Spread Protection
   //======================================================

   double MaximumSpread;

   //======================================================
   // Time Controls
   //======================================================

   bool TradeAsianSession;

   bool TradeLondonSession;

   bool TradeNewYorkSession;

   //======================================================
   // Reset
   //======================================================

   void Reset()
   {
      RiskPerTrade = 1.0;

      MaxDailyLoss = 3.0;

      MaxWeeklyLoss = 10.0;

      MaxMonthlyLoss = 20.0;

      MaxDrawdown = 15.0;

      MaxRiskExposure = 5.0;

      MaxOpenPositions = 3;

      MaxPendingOrders = 5;

      MaxTradesPerDay = 10;

      MaxConsecutiveLosses = 3;

      EnableTrading = true;

      AllowBuy = true;

      AllowSell = true;

      AllowScaling = false;

      AllowHedging = false;

      MinimumLot = 0.01;

      MaximumLot = 100.0;

      DefaultLot = 0.01;

      MaximumSpread = 30.0;

      TradeAsianSession = false;

      TradeLondonSession = true;

      TradeNewYorkSession = true;
   }
};

#endif