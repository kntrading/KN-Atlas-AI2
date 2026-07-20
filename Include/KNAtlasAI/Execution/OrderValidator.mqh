//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| OrderValidator.mqh                                               |
//| Version 1.1.0                                                    |
//+------------------------------------------------------------------+
#ifndef __KN_ORDER_VALIDATOR_MQH__
#define __KN_ORDER_VALIDATOR_MQH__

#include "../Models/Signal.mqh"

class CKNOrderValidator
{
public:

   //--------------------------------------------------------
   // Initialize
   //--------------------------------------------------------

   bool Initialize()
   {
      Print("Order Validator Online");
      return(true);
   }

   //--------------------------------------------------------
   // Shutdown
   //--------------------------------------------------------

   void Shutdown()
   {
      Print("Order Validator Offline");
   }

   //--------------------------------------------------------
   // Validate Trade
   //--------------------------------------------------------

   bool Validate(SSignal &signal)
   {
      if(signal.Status != SIGNAL_APPROVED)
         return(false);

      if(!signal.RiskApproved)
         return(false);

      if(!signal.SessionApproved)
         return(false);

      if(!signal.NewsApproved)
         return(false);

      if(!signal.SpreadApproved)
         return(false);

      if(!signal.VolatilityApproved)
         return(false);

      return(true);
   }
};

#endif