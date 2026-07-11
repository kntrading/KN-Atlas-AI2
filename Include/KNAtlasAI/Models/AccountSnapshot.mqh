//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| Module : AccountSnapshot                                         |
//| Version: 1.0.0                                                   |
//| Author : KN Trading                                              |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_ACCOUNT_SNAPSHOT_MQH__
#define __KN_ACCOUNT_SNAPSHOT_MQH__

//---------------------------------------------------------
// Account Snapshot Model
//---------------------------------------------------------
struct SAccountSnapshot
{
   //======================================================
   // Account Information
   //======================================================

   long     Login;
   string   Name;
   string   Server;
   string   Currency;
   int      Leverage;

   //======================================================
   // Account Financials
   //======================================================

   double   Balance;
   double   Equity;
   double   Credit;

   double   Margin;
   double   FreeMargin;
   double   MarginLevel;

   //======================================================
   // Profit Information
   //======================================================

   double   FloatingProfit;

   double   DailyProfit;

   double   WeeklyProfit;

   double   MonthlyProfit;

   //======================================================
   // Risk Information
   //======================================================

   double   DrawdownPercent;

   double   RiskExposure;

   //======================================================
   // Trading Information
   //======================================================

   int      OpenPositions;

   int      PendingOrders;

   bool     TradingAllowed;

   //======================================================
   // Time
   //======================================================

   datetime SnapshotTime;

   //======================================================
   // Reset
   //======================================================

   void Reset()
   {
      Login = 0;

      Name = "";

      Server = "";

      Currency = "";

      Leverage = 0;

      Balance = 0.0;

      Equity = 0.0;

      Credit = 0.0;

      Margin = 0.0;

      FreeMargin = 0.0;

      MarginLevel = 0.0;

      FloatingProfit = 0.0;

      DailyProfit = 0.0;

      WeeklyProfit = 0.0;

      MonthlyProfit = 0.0;

      DrawdownPercent = 0.0;

      RiskExposure = 0.0;

      OpenPositions = 0;

      PendingOrders = 0;

      TradingAllowed = false;

      SnapshotTime = TimeCurrent();
   }
};

#endif