//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| TimeFilter.mqh                                                   |
//+------------------------------------------------------------------+
#ifndef __KN_TIME_FILTER_MQH__
#define __KN_TIME_FILTER_MQH__

#include "../FilterBase.mqh"

class CKNTimeFilter : public CKNFilterBase
{
public:

   CKNTimeFilter()
   {
      SetName("Time Filter");
   }

   bool Initialize()
   {
      Print("Time Filter Initialized");
      return(true);
   }

   void Shutdown()
   {
      Print("Time Filter Shutdown");
   }

   bool Validate(SSignal &signal) override
   {
      if(!Enabled())
         return(true);

      signal.TimeApproved = true;

      SetResult(true);

      return(true);
   }
};

#endif