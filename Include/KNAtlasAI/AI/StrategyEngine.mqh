//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| StrategyEngine.mqh                                               |
//| Version 3.0.0                                                    |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_STRATEGY_ENGINE_MQH__
#define __KN_STRATEGY_ENGINE_MQH__

#include "../Models/Signal.mqh"

#include "../Scanner/TrendScanner.mqh"
#include "../Scanner/LiquidityScanner.mqh"
#include "../Scanner/FVGScanner.mqh"
#include "../Scanner/OrderBlockScanner.mqh"
#include "../Scanner/BOSScanner.mqh"
#include "../Scanner/CHOCHScanner.mqh"

class CKNStrategyEngine
{
private:

   CKNTrendScanner      m_trend;
   CKNLiquidityScanner  m_liquidity;
   CKNFVGScanner        m_fvg;
   CKNOrderBlockScanner m_orderBlock;
   CKNBOSScanner        m_bos;
   CKNCHOCHScanner      m_choch;

public:

   //-------------------------------------------------------
   // Constructor
   //-------------------------------------------------------

   CKNStrategyEngine()
   {
   }

   //-------------------------------------------------------
   // Initialize
   //-------------------------------------------------------

   bool Initialize()
   {
      m_trend.Initialize();
      m_liquidity.Initialize();
      m_fvg.Initialize();
      m_orderBlock.Initialize();
      m_bos.Initialize();
      m_choch.Initialize();

      Print("Strategy Engine Online");

      return(true);
   }

   //-------------------------------------------------------
   // Shutdown
   //-------------------------------------------------------

   void Shutdown()
   {
      m_trend.Shutdown();
      m_liquidity.Shutdown();
      m_fvg.Shutdown();
      m_orderBlock.Shutdown();
      m_bos.Shutdown();
      m_choch.Shutdown();

      Print("Strategy Engine Offline");
   }

   //-------------------------------------------------------
   // Build Signal
   //-------------------------------------------------------

   SSignal BuildSignal(string symbol,
                       ENUM_TIMEFRAMES timeframe)
   {
      SSignal signal;

      //----------------------------------------------------
      // Basic Information
      //----------------------------------------------------

      signal.Symbol     = symbol;
      signal.Timeframe  = timeframe;

      signal.SignalTime = TimeCurrent();

      signal.StrategyName = "KN Atlas SMC";

      signal.Direction = TRADE_NONE;

      signal.Status = SIGNAL_NEW;

      //----------------------------------------------------
      // Trend
      //----------------------------------------------------

      signal.Trend =
         (m_trend.GetTrend(symbol,timeframe) == 1);

      //----------------------------------------------------
      // Liquidity
      //----------------------------------------------------

      signal.Liquidity =
         m_liquidity.BuySideLiquidity(symbol,timeframe);

      //----------------------------------------------------
      // Fair Value Gap
      //----------------------------------------------------

      signal.FVG =
         m_fvg.BullishFVG(symbol,timeframe);

      //----------------------------------------------------
      // Order Block
      //----------------------------------------------------

      signal.OrderBlock =
         m_orderBlock.BullishOrderBlock(symbol,timeframe);

      //----------------------------------------------------
      // BOS
      //----------------------------------------------------

      signal.BOS =
         m_bos.BullishBOS(symbol,timeframe);

      //----------------------------------------------------
      // CHOCH
      //----------------------------------------------------

      signal.CHOCH =
         m_choch.BullishCHOCH(symbol,timeframe);

      //----------------------------------------------------
      // Default Filter States
      //----------------------------------------------------

      signal.SessionApproved     = true;
      signal.TradingDayApproved  = true;
      signal.HolidayApproved     = true;
      signal.NewsApproved        = true;
      signal.VolatilityApproved  = true;
      signal.SpreadApproved      = true;

      signal.SymbolApproved      = true;
      signal.CorrelationApproved = true;
      signal.TimeApproved        = true;

      signal.ExposureApproved    = true;
      signal.RiskApproved        = true;

      //----------------------------------------------------
      // Trade Direction
      //----------------------------------------------------

      if(signal.Trend &&
         signal.BOS &&
         signal.OrderBlock)
      {
         signal.Direction = TRADE_BUY;
      }
      else
      {
         signal.Direction = TRADE_NONE;
      }

      //----------------------------------------------------
      // Status
      //----------------------------------------------------

      signal.Status = SIGNAL_VALIDATED;

      return(signal);
   }
};

#endif