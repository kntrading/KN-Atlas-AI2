//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| FilterManager.mqh                                                |
//| Version 1.0.0                                                    |
//+------------------------------------------------------------------+
#ifndef __KN_FILTER_MANAGER_MQH__
#define __KN_FILTER_MANAGER_MQH__

#include "../Models/Signal.mqh"

#include "Market/SessionFilter.mqh"
#include "Market/SpreadFilter.mqh"
#include "Market/VolatilityFilter.mqh"
#include "Market/NewsFilter.mqh"

#include "Trade/SymbolFilter.mqh"
#include "Trade/CorrelationFilter.mqh"

#include "Risk/ExposureFilter.mqh"
#include "Risk/DailyLossFilter.mqh"
#include "Risk/DrawdownFilter.mqh"

#include "TradingDayFilter.mqh"
#include "HolidayFilter.mqh"

class CKNFilterManager
{
private:

   CKNSessionFilter      m_session;
   CKNSpreadFilter       m_spread;
   CKNVolatilityFilter   m_volatility;
   CKNNewsFilter         m_news;

   CKNSymbolFilter       m_symbol;
   CKNCorrelationFilter  m_correlation;

   CKNExposureFilter     m_exposure;
   CKNDailyLossFilter    m_dailyLoss;
   CKNDrawdownFilter     m_drawdown;

   CKNTradingDayFilter   m_tradingDay;
   CKNHolidayFilter      m_holiday;

public:

   bool Initialize()
   {
      Print("Filter Manager Online");
      return(true);
   }

   void Shutdown()
   {
      Print("Filter Manager Offline");
   }

   bool Validate(SSignal &signal)
   {
      signal.SessionApproved      = true;
      signal.SpreadApproved       = true;
      signal.VolatilityApproved   = true;
      signal.NewsApproved         = true;
      signal.HolidayApproved      = true;
      signal.CorrelationApproved  = true;
      signal.ExposureApproved     = true;
      signal.RiskApproved         = true;

      //---------------------------------------------------
      // Session
      //---------------------------------------------------

      if(!m_session.Validate(signal))
         return(false);

      //---------------------------------------------------
      // Trading Day
      //---------------------------------------------------

      if(!m_tradingDay.Validate(signal))
         return(false);

      //---------------------------------------------------
      // Holiday
      //---------------------------------------------------

      if(!m_holiday.Validate(signal))
         return(false);

      //---------------------------------------------------
      // Spread
      //---------------------------------------------------

      if(!m_spread.Validate(signal))
         return(false);

      //---------------------------------------------------
      // Volatility
      //---------------------------------------------------

      if(!m_volatility.Validate(signal))
         return(false);

      //---------------------------------------------------
      // News
      //---------------------------------------------------

      if(!m_news.Validate(signal))
         return(false);

      //---------------------------------------------------
      // Symbol
      //---------------------------------------------------

      if(!m_symbol.Validate(signal))
         return(false);

      //---------------------------------------------------
      // Correlation
      //---------------------------------------------------

      if(!m_correlation.Validate(signal))
         return(false);

      //---------------------------------------------------
      // Exposure
      //---------------------------------------------------

      if(!m_exposure.Validate(signal))
         return(false);

      //---------------------------------------------------
      // Daily Loss
      //---------------------------------------------------

      if(!m_dailyLoss.Validate(signal))
         return(false);

      //---------------------------------------------------
      // Drawdown
      //---------------------------------------------------

      if(!m_drawdown.Validate(signal))
         return(false);

      return(true);
   }
};

#endifS