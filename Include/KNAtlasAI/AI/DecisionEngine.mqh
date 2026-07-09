//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| Decision Engine                                                  |
//+------------------------------------------------------------------+
#ifndef __DECISIONENGINE_MQH__
#define __DECISIONENGINE_MQH__

#include "Signal.mqh"

class CKNDecisionEngine
{
public:

   double CalculateConfidence(SSignal &signal)
   {
      double score = 0.0;

      if(signal.Trend)
         score += 20.0;

      if(signal.Liquidity)
         score += 15.0;

      if(signal.FVG)
         score += 15.0;

      if(signal.OrderBlock)
         score += 15.0;

      if(signal.BOS)
         score += 15.0;

      if(signal.CHOCH)
         score += 10.0;

      signal.Confidence = score;

      return(score);
   }

   bool IsTradeValid(SSignal &signal)
   {
      return(CalculateConfidence(signal) >= 75.0);
   }
};

#endif