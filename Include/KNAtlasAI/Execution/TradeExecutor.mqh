//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| TradeExecutor.mqh                                                |
//| Version 1.0.0                                                    |
//+------------------------------------------------------------------+
#ifndef __KN_TRADE_EXECUTOR_MQH__
#define __KN_TRADE_EXECUTOR_MQH__

#include <Trade/Trade.mqh>

class CKNTradeExecutor
{
private:

   CTrade m_trade;

public:

   bool Initialize()
   {
      Print("Trade Executor Online");

      return(true);
   }

   void Shutdown()
   {
      Print("Trade Executor Offline");
   }

   bool Buy(string symbol,
            double volume,
            double sl,
            double tp,
            string comment="")
   {
      return(m_trade.Buy(volume,
                         symbol,
                         0.0,
                         sl,
                         tp,
                         comment));
   }

   bool Sell(string symbol,
             double volume,
             double sl,
             double tp,
             string comment="")
   {
      return(m_trade.Sell(volume,
                          symbol,
                          0.0,
                          sl,
                          tp,
                          comment));
   }

   bool Close(ulong ticket)
   {
      return(m_trade.PositionClose(ticket));
   }

};

#endif