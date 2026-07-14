//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| ExposureFilter.mqh                                               |
//+------------------------------------------------------------------+
#ifndef __KN_EXPOSURE_FILTER_MQH__
#define __KN_EXPOSURE_FILTER_MQH__

#include "../FilterBase.mqh"

class CKNExposureFilter : public CKNFilterBase
{
public:

   CKNExposureFilter()
   {
      SetName("Exposure Filter");
   }

   bool Initialize()
   {
      Print("Exposure Filter Initialized");
      return(true);
   }

   void Shutdown()
   {
      Print("Exposure Filter Shutdown");
   }

   bool Validate(SSignal &signal) override
   {
      if(!Enabled())
         return(true);

      signal.ExposureApproved = true;

      SetResult(true);

      return(true);
   }
};

#endif