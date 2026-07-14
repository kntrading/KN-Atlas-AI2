//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| VolatilityFilter.mqh                                             |
//+------------------------------------------------------------------+
#ifndef __KN_VOLATILITY_FILTER_MQH__
#define __KN_VOLATILITY_FILTER_MQH__

#include "../FilterBase.mqh"

class CKNVolatilityFilter : public CKNFilterBase
{
public:

   CKNVolatilityFilter()
   {
      SetName("Volatility Filter");
   }

   bool Initialize()
   {
      Print("Volatility Filter Initialized");
      return(true);
   }

   void Shutdown()
   {
      Print("Volatility Filter Shutdown");
   }

   bool Validate(SSignal &signal) override
   {
      if(!Enabled())
         return(true);

      signal.VolatilityApproved = true;

      SetResult(true);

      return(true);
   }
};

#endif