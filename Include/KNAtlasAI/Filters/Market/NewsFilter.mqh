//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| NewsFilter.mqh                                                   |
//+------------------------------------------------------------------+
#ifndef __KN_NEWS_FILTER_MQH__
#define __KN_NEWS_FILTER_MQH__

#include "../FilterBase.mqh"

class CKNNewsFilter : public CKNFilterBase
{
public:

   CKNNewsFilter()
   {
      SetName("News Filter");
   }

   bool Initialize()
   {
      Print("News Filter Initialized");
      return(true);
   }

   void Shutdown()
   {
      Print("News Filter Shutdown");
   }

   bool Validate(SSignal &signal) override
   {
      if(!Enabled())
         return(true);

      signal.NewsApproved = true;

      SetResult(true);

      return(true);
   }
};

#endif