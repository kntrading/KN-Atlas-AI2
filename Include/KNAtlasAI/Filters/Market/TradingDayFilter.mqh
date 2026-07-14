//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| TradingDayFilter.mqh                                             |
//+------------------------------------------------------------------+
#ifndef __KN_TRADINGDAY_FILTER_MQH__
#define __KN_TRADINGDAY_FILTER_MQH__

#include "../FilterBase.mqh"

class CKNTradingDayFilter : public CKNFilterBase
{
public:

   CKNTradingDayFilter()
   {
      SetName("Trading Day Filter");
   }

   bool Initialize()
   {
      Print("Trading Day Filter Initialized");
      return(true);
   }

   void Shutdown()
   {
      Print("Trading Day Filter Shutdown");
   }

   bool Validate(SSignal &signal) override
   {
      if(!Enabled())
         return(true);

      signal.TradingDayApproved = true;

      SetResult(true);

      return(true);
   }
};

#endif