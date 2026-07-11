//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| Brain.mqh                                                        |
//| Version 2.0.0                                                    |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __BRAIN_MQH__
#define __BRAIN_MQH__

#include "../Models/Signal.mqh"
#include "../Core/DecisionEngine.mqh"

#include "../Scanner/TrendScanner.mqh"
#include "../Scanner/LiquidityScanner.mqh"
#include "../Scanner/FVGScanner.mqh"
#include "../Scanner/OrderBlockScanner.mqh"
#include "../Scanner/BOSScanner.mqh"
#include "../Scanner/CHOCHScanner.mqh"

class CKNBrain
{
private:

   CKNDecisionEngine     m_decision;

   CKNTrendScanner       m_trend;
   CKNLiquidityScanner   m_liquidity;
   CKNFVGScanner         m_fvg;
   CKNOrderBlockScanner  m_orderBlock;
   CKNBOSScanner         m_bos;
   CKNCHOCHScanner       m_choch;

public:

   //--------------------------------------------------------
   // Constructor
   //--------------------------------------------------------

   CKNBrain()
   {
   }

   //--------------------------------------------------------
   // Initialize
   //--------------------------------------------------------

   bool Initialize()
   {
      m_trend.Initialize();
      m_liquidity.Initialize();
      m_fvg.Initialize();
      m_orderBlock.Initialize();
      m_bos.Initialize();
      m_choch.Initialize();

           Print("KN Atlas AI Brain Online");

      return(true);
   }

   //--------------------------------------------------------
   // Shutdown
   //--------------------------------------------------------

   void Shutdown()
   {
      m_trend.Shutdown();
      m_liquidity.Shutdown();
      m_fvg.Shutdown();
      m_orderBlock.Shutdown();
      m_bos.Shutdown();
      m_choch.Shutdown();
   }

   //--------------------------------------------------------
   // Analyze Market
   //--------------------------------------------------------

   SSignal Analyze(string symbol, ENUM_TIMEFRAMES timeframe)
   {
      SSignal signal;

      ZeroMemory(signal);

      signal.Symbol = symbol;
      signal.Timeframe = timeframe;

      //-----------------------------------------------------
      // Scanner Results
      //-----------------------------------------------------

      signal.Trend =
         (m_trend.GetTrend(symbol,timeframe) == 1);

      signal.Liquidity =
         m_liquidity.BuySideLiquidity(symbol,timeframe);

      signal.FVG =
         m_fvg.BullishFVG(symbol,timeframe);

      signal.OrderBlock =
         m_orderBlock.BullishOrderBlock(symbol,timeframe);

      signal.BOS =
         m_bos.BullishBOS(symbol,timeframe);

      signal.CHOCH =
         m_choch.BullishCHOCH(symbol,timeframe);

      //-----------------------------------------------------
      // Confidence Score
      //-----------------------------------------------------

      signal.Confidence = 0.0;

      if(signal.Trend)       signal.Confidence += 20.0;
      if(signal.Liquidity)   signal.Confidence += 15.0;
      if(signal.FVG)         signal.Confidence += 15.0;
      if(signal.OrderBlock)  signal.Confidence += 15.0;
      if(signal.BOS)         signal.Confidence += 15.0;
      if(signal.CHOCH)       signal.Confidence += 20.0;

      //-----------------------------------------------------
      // Trade Direction
      //-----------------------------------------------------

      if(signal.Confidence >= 70.0)
         signal.Direction = TRADE_BUY;
      else
         signal.Direction = TRADE_NONE;

      //-----------------------------------------------------
      // Decision Engine
      //-----------------------------------------------------

      m_decision.EvaluateSignal(signal);

      return(signal);
   }

};

#endif