//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| DailyLossFilter.mqh                                              |
//+------------------------------------------------------------------+
#ifndef __KN_DAILYLOSS_FILTER_MQH__
#define __KN_DAILYLOSS_FILTER_MQH__

#include "../FilterBase.mqh"

class CKNDailyLossFilter : public CKNFilterBase
{
public:

   CKNDailyLossFilter()
   {
      SetName("Daily Loss Filter");
   }

   bool Initialize()
   {
      Print("Daily Loss Filter Initialized");
      return(true);
   }

   void Shutdown()
   {
      Print("Daily Loss Filter Shutdown");
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