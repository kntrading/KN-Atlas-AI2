//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| TradeJournal.mqh                                                 |
//| Version 1.0.0                                                    |
//+------------------------------------------------------------------+
#ifndef __KN_TRADE_JOURNAL_MQH__
#define __KN_TRADE_JOURNAL_MQH__

#include "../Models/Signal.mqh"

class CKNTradeJournal
{
public:

   bool Initialize()
   {
      Print("Trade Journal Online");
      return(true);
   }

   void Shutdown()
   {
      Print("Trade Journal Offline");
   }

   void Log(const SSignal &signal)
   {
      Print("Trade Logged: ",
            signal.Symbol,
            " Confidence=",
            DoubleToString(signal.Confidence,1),
            " Status=",
            IntegerToString(signal.Status));
   }

};

#endif