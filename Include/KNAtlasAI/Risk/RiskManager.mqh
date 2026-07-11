//+------------------------------------------------------------------+
//|                                                  RiskManager.mqh |
//|                       KN Atlas AI Trading Engine                 |
//|                       Copyright 2026 KN Trading                 |
//+------------------------------------------------------------------+
#pragma once

class CRiskManager
{
private:

   double m_riskPerTrade;
   double m_maxDailyLoss;
   double m_maxWeeklyLoss;
   double m_maxDrawdown;

   int    m_maxOpenTrades;

   bool   m_tradingEnabled;

public:

   //=========================================================
   // Constructor
   //=========================================================

   CRiskManager()
   {
      m_riskPerTrade   = 1.0;

      m_maxDailyLoss   = 3.0;

      m_maxWeeklyLoss  = 10.0;

      m_maxDrawdown    = 15.0;

      m_maxOpenTrades  = 3;

      m_tradingEnabled = true;
   }

   //=========================================================
   // Destructor
   //=========================================================

   ~CRiskManager()
   {

   }

   //=========================================================
   // Trading Permission
   //=========================================================

   bool CanTrade()
   {
      if(!m_tradingEnabled)
         return(false);

      if(DailyLossExceeded())
         return(false);

      if(WeeklyLossExceeded())
         return(false);

      if(DrawdownExceeded())
         return(false);

      if(MaxTradesExceeded())
         return(false);

      return(true);
   }

   //=========================================================
   // Daily Loss Check
   //=========================================================

   bool DailyLossExceeded()
   {
      // Placeholder
      // Live account calculations will be added later.

      return(false);
   }

   //=========================================================
   // Weekly Loss Check
   //=========================================================

   bool WeeklyLossExceeded()
   {
      return(false);
   }

   //=========================================================
   // Drawdown Check
   //=========================================================

   bool DrawdownExceeded()
   {
      return(false);
   }

   //=========================================================
   // Open Trade Limit
   //=========================================================

   bool MaxTradesExceeded()
   {
      return(false);
   }

   //=========================================================
   // Getters
   //=========================================================

   double GetRiskPerTrade()
   {
      return(m_riskPerTrade);
   }

   double GetMaxDailyLoss()
   {
      return(m_maxDailyLoss);
   }

   double GetMaxWeeklyLoss()
   {
      return(m_maxWeeklyLoss);
   }

   double GetMaxDrawdown()
   {
      return(m_maxDrawdown);
   }

   int GetMaxOpenTrades()
   {
      return(m_maxOpenTrades);
   }

   bool TradingEnabled()
   {
      return(m_tradingEnabled);
   }

   //=========================================================
   // Setters
   //=========================================================

   void SetRiskPerTrade(double value)
   {
      m_riskPerTrade = value;
   }

   void SetMaxDailyLoss(double value)
   {
      m_maxDailyLoss = value;
   }

   void SetMaxWeeklyLoss(double value)
   {
      m_maxWeeklyLoss = value;
   }

   void SetMaxDrawdown(double value)
   {
      m_maxDrawdown = value;
   }

   void SetMaxOpenTrades(int value)
   {
      m_maxOpenTrades = value;
   }

   void EnableTrading()
   {
      m_tradingEnabled = true;
   }

   void DisableTrading()
   {
      m_tradingEnabled = false;
   }

};
//+------------------------------------------------------------------+