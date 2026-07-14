//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| DrawdownFilter.mqh                                               |
//+------------------------------------------------------------------+
#ifndef __KN_DRAWDOWN_FILTER_MQH__
#define __KN_DRAWDOWN_FILTER_MQH__

#include "../FilterBase.mqh"

class CKNDrawdownFilter : public CKNFilterBase
{
public:

   CKNDrawdownFilter()
   {
      SetName("Drawdown Filter");
   }

   bool Initialize()
   {
      Print("Drawdown Filter Initialized");
      return(true);
   }

   void Shutdown()
   {
      Print("Drawdown Filter Shutdown");
   }

   bool Validate(SSignal &signal) override
   {
      if(!Enabled())
         return(true);

      signal.RiskApproved = true;

      SetResult(true);

      return(true);
   }
};

#endif