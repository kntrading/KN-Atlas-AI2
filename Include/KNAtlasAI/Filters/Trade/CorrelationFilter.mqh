//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| CorrelationFilter.mqh                                            |
//+------------------------------------------------------------------+
#ifndef __KN_CORRELATION_FILTER_MQH__
#define __KN_CORRELATION_FILTER_MQH__

#include "../FilterBase.mqh"

class CKNCorrelationFilter : public CKNFilterBase
{
public:

   CKNCorrelationFilter()
   {
      SetName("Correlation Filter");
   }

   bool Initialize()
   {
      Print("Correlation Filter Initialized");
      return(true);
   }

   void Shutdown()
   {
      Print("Correlation Filter Shutdown");
   }

   bool Validate(SSignal &signal) override
   {
      if(!Enabled())
         return(true);

      signal.CorrelationApproved = true;

      SetResult(true);

      return(true);
   }
};

#endif