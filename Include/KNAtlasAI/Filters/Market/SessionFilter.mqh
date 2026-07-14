//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| SessionFilter.mqh                                                |
//+------------------------------------------------------------------+
#ifndef __KN_SESSION_FILTER_MQH__
#define __KN_SESSION_FILTER_MQH__

#include "../FilterBase.mqh"

class CKNSessionFilter : public CKNFilterBase
{
public:

   CKNSessionFilter()
   {
      SetName("Session Filter");
   }

   bool Initialize()
   {
      Print("Session Filter Initialized");
      return(true);
   }

   void Shutdown()
   {
      Print("Session Filter Shutdown");
   }

   bool Validate(SSignal &signal) override
   {
      if(!Enabled())
         return(true);

      signal.SessionApproved = true;

      SetResult(true);

      return(true);
   }
};

#endif