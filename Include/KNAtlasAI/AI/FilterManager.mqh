//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| FilterManager.mqh                                                |
//| Version 2.0.0                                                    |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_FILTER_MANAGER_MQH__
#define __KN_FILTER_MANAGER_MQH__

#include "../Models/Signal.mqh"

#include "../Filters/Market/SessionFilter.mqh"
#include "../Filters/Market/TradingDayFilter.mqh"
#include "../Filters/Market/HolidayFilter.mqh"
#include "../Filters/Market/SpreadFilter.mqh"
#include "../Filters/Market/VolatilityFilter.mqh"
#include "../Filters/Market/NewsFilter.mqh"

#include "../Filters/Trade/SymbolFilter.mqh"
#include "../Filters/Trade/CorrelationFilter.mqh"
#include "../Filters/Trade/TimeFilter.mqh"

#include "../Filters/Risk/ExposureFilter.mqh"
#include "../Filters/Risk/DailyLossFilter.mqh"
#include "../Filters/Risk/DrawdownFilter.mqh"

class CKNFilterManager
{
private:

   CKNSessionFilter      m_session;
   CKNTradingDayFilter   m_tradingDay;
   CKNHolidayFilter      m_holiday;
   CKNSpreadFilter       m_spread;
   CKNVolatilityFilter   m_volatility;
   CKNNewsFilter         m_news;

   CKNSymbolFilter       m_symbol;
   CKNCorrelationFilter  m_correlation;
   CKNTimeFilter         m_time;

   CKNExposureFilter     m_exposure;
   CKNDailyLossFilter    m_dailyLoss;
   CKNDrawdownFilter     m_drawdown;

public:

   //--------------------------------------------------------
   // Initialize
   //--------------------------------------------------------

   bool Initialize()
   {
      m_session.Initialize();
      m_tradingDay.Initialize();
      m_holiday.Initialize();
      m_spread.Initialize();
      m_volatility.Initialize();
      m_news.Initialize();

      m_symbol.Initialize();
      m_correlation.Initialize();
      m_time.Initialize();

      m_exposure.Initialize();
      m_dailyLoss.Initialize();
      m_drawdown.Initialize();

      Print("Filter Manager Online");

      return(true);
   }

   //--------------------------------------------------------
   // Shutdown
   //--------------------------------------------------------

   void Shutdown()
   {
      m_session.Shutdown();
      m_tradingDay.Shutdown();
      m_holiday.Shutdown();
      m_spread.Shutdown();
      m_volatility.Shutdown();
      m_news.Shutdown();

      m_symbol.Shutdown();
      m_correlation.Shutdown();
      m_time.Shutdown();

      m_exposure.Shutdown();
      m_dailyLoss.Shutdown();
      m_drawdown.Shutdown();

      Print("Filter Manager Offline");
   }

   //--------------------------------------------------------
   // Validate Signal
   //--------------------------------------------------------

   bool Validate(SSignal &signal)
   {
      if(!m_session.Validate(signal))
         return(false);

      if(!m_tradingDay.Validate(signal))
         return(false);

      if(!m_holiday.Validate(signal))
         return(false);

      if(!m_spread.Validate(signal))
         return(false);

      if(!m_volatility.Validate(signal))
         return(false);

      if(!m_news.Validate(signal))
         return(false);

      if(!m_symbol.Validate(signal))
         return(false);

      if(!m_correlation.Validate(signal))
         return(false);

      if(!m_time.Validate(signal))
         return(false);

      if(!m_exposure.Validate(signal))
         return(false);

      if(!m_dailyLoss.Validate(signal))
         return(false);

      if(!m_drawdown.Validate(signal))
         return(false);

      signal.Status = SIGNAL_FILTERED;

      return(true);
   }
};

#endif