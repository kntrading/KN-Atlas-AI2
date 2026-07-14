//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| HolidayFilter.mqh                                                |
//+------------------------------------------------------------------+
#ifndef __KN_HOLIDAY_FILTER_MQH__
#define __KN_HOLIDAY_FILTER_MQH__

#include "../FilterBase.mqh"

class CKNHolidayFilter : public CKNFilterBase
{
public:

   CKNHolidayFilter()
   {
      SetName("Holiday Filter");
   }

   bool Initialize()
   {
      Print("Holiday Filter Initialized");
      return(true);
   }

   void Shutdown()
   {
      Print("Holiday Filter Shutdown");
   }

   bool Validate(SSignal &signal) override
   {
      if(!Enabled())
         return(true);

      signal.HolidayApproved = true;

      SetResult(true);

      return(true);
   }
};

#endif