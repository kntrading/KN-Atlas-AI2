//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| SlippageManager.mqh                                              |
//| Version 1.0.0                                                    |
//+------------------------------------------------------------------+
#ifndef __KN_SLIPPAGE_MANAGER_MQH__
#define __KN_SLIPPAGE_MANAGER_MQH__

class CKNSlippageManager
{
private:

   int m_maxSpread;
   int m_maxSlippage;

public:

   bool Initialize()
   {
      m_maxSpread=20;
      m_maxSlippage=10;

      Print("Slippage Manager Online");

      return(true);
   }

   void Shutdown()
   {
      Print("Slippage Manager Offline");
   }

   void SetMaximumSpread(int points)
   {
      m_maxSpread=points;
   }

   void SetMaximumSlippage(int points)
   {
      m_maxSlippage=points;
   }

   bool SpreadAllowed(string symbol)
   {
      double spread=(SymbolInfoDouble(symbol,SYMBOL_ASK)-
                     SymbolInfoDouble(symbol,SYMBOL_BID))
                     /_Point;

      return(spread<=m_maxSpread);
   }

   int MaximumSlippage() const
   {
      return(m_maxSlippage);
   }

};

#endif