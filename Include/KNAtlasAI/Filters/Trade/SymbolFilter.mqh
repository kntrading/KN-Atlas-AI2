//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| SymbolFilter.mqh                                                 |
//+------------------------------------------------------------------+
#ifndef __KN_SYMBOL_FILTER_MQH__
#define __KN_SYMBOL_FILTER_MQH__

#include "../FilterBase.mqh"

class CKNSymbolFilter : public CKNFilterBase
{
public:

   CKNSymbolFilter()
   {
      SetName("Symbol Filter");
   }

   bool Initialize()
   {
      Print("Symbol Filter Initialized");
      return(true);
   }

   void Shutdown()
   {
      Print("Symbol Filter Shutdown");
   }

   bool Validate(SSignal &signal) override
   {
      if(!Enabled())
         return(true);

      // Placeholder for allowed symbol validation
      signal.SymbolApproved = true;

      SetResult(true);

      return(true);
   }
};

#endif