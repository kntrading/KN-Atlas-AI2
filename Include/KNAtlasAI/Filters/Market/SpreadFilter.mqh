//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| SpreadFilter.mqh                                                 |
//+------------------------------------------------------------------+
#ifndef __KN_SPREAD_FILTER_MQH__
#define __KN_SPREAD_FILTER_MQH__

#include "../FilterBase.mqh"

class CKNSpreadFilter : public CKNFilterBase
{
public:

   CKNSpreadFilter()
   {
      SetName("Spread Filter");
   }

   bool Initialize()
   {
      Print("Spread Filter Initialized");
      return(true);
   }

   void Shutdown()
   {
      Print("Spread Filter Shutdown");
   }

   bool Validate(SSignal &signal) override
   {
      if(!Enabled())
         return(true);

      signal.SpreadApproved = true;

      SetResult(true);

      return(true);
   }
};

#endif