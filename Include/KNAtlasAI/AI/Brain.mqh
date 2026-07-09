#ifndef __BRAIN_MQH__
#define __BRAIN_MQH__

#include "Signal.mqh"
#include "DecisionEngine.mqh"

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

   void Shutdown()
   {
      m_trend.Shutdown();
      m_liquidity.Shutdown();
      m_fvg.Shutdown();
      m_orderBlock.Shutdown();
      m_bos.Shutdown();
      m_choch.Shutdown();
   }

   SSignal Analyze(string symbol,ENUM_TIMEFRAMES tf)
   {
      SSignal signal;

      signal.Symbol=symbol;
      signal.Timeframe=tf;

      signal.Trend=
      (m_trend.GetTrend(symbol,tf)==1);

      signal.Liquidity=
      m_liquidity.BuySideLiquidity(symbol,tf);

      signal.FVG=
      m_fvg.BullishFVG(symbol,tf);

      signal.OrderBlock=
      m_orderBlock.BullishOrderBlock(symbol,tf);

      signal.BOS=
      m_bos.BullishBOS(symbol,tf);

      signal.CHOCH=
      m_choch.BullishCHOCH(symbol,tf);

      signal.Confidence=
      m_decision.CalculateConfidence(signal);

      if(m_decision.IsTradeValid(signal))
         signal.Direction=SIGNAL_BUY;
      else
         signal.Direction=SIGNAL_NONE;

      return(signal);
   }
};

#endif