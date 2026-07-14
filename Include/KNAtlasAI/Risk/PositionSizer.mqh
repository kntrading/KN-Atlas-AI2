//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| PositionSizer.mqh                                                |
//| Version 2.0.0                                                    |
//+------------------------------------------------------------------+
#ifndef __POSITION_SIZER_MQH__
#define __POSITION_SIZER_MQH__

class CKNPositionSizer
{
private:

   double m_defaultRiskPercent;

public:

   //--------------------------------------------------------
   // Constructor
   //--------------------------------------------------------

   CKNPositionSizer()
   {
      m_defaultRiskPercent = 1.0;
   }

   //--------------------------------------------------------
   // Initialize
   //--------------------------------------------------------

   bool Initialize()
   {
      Print("Position Sizer Online");
      return(true);
   }

   //--------------------------------------------------------
   // Shutdown
   //--------------------------------------------------------

   void Shutdown()
   {
      Print("Position Sizer Offline");
   }

   //--------------------------------------------------------
   // Set Default Risk
   //--------------------------------------------------------

   void SetRiskPercent(double risk)
   {
      m_defaultRiskPercent = risk;
   }

   //--------------------------------------------------------
   // Get Default Risk
   //--------------------------------------------------------

   double GetRiskPercent() const
   {
      return(m_defaultRiskPercent);
   }

   //--------------------------------------------------------
   // Calculate Risk Amount
   //--------------------------------------------------------

   double GetRiskAmount()
   {
      return(AccountInfoDouble(ACCOUNT_BALANCE) *
             (m_defaultRiskPercent / 100.0));
   }

   //--------------------------------------------------------
   // Normalize Lot Size
   //--------------------------------------------------------

   double NormalizeLot(double lots,string symbol)
   {
      double minLot =
         SymbolInfoDouble(symbol,SYMBOL_VOLUME_MIN);

      double maxLot =
         SymbolInfoDouble(symbol,SYMBOL_VOLUME_MAX);

      double step =
         SymbolInfoDouble(symbol,SYMBOL_VOLUME_STEP);

      lots = MathMax(minLot,lots);
      lots = MathMin(maxLot,lots);

      lots = MathFloor(lots/step)*step;

      return(NormalizeDouble(lots,2));
   }

   //--------------------------------------------------------
   // Calculate Lot Size
   //--------------------------------------------------------

   double CalculateLotSize(string symbol,double stopLossPoints)
   {
      if(stopLossPoints <= 0.0)
         return(0.0);

      double riskMoney = GetRiskAmount();

      double tickValue =
         SymbolInfoDouble(symbol,SYMBOL_TRADE_TICK_VALUE);

      double tickSize =
         SymbolInfoDouble(symbol,SYMBOL_TRADE_TICK_SIZE);

      if(tickValue <= 0.0 || tickSize <= 0.0)
         return(0.0);

      double valuePerPoint = tickValue / tickSize;

      double lots =
         riskMoney /
         (stopLossPoints * valuePerPoint);

      return(NormalizeLot(lots,symbol));
   }

};

#endif