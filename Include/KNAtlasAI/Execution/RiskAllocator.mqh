//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| RiskAllocator.mqh                                                |
//| Version 1.0.0                                                    |
//+------------------------------------------------------------------+
#ifndef __KN_RISK_ALLOCATOR_MQH__
#define __KN_RISK_ALLOCATOR_MQH__

class CKNRiskAllocator
{
private:

   double m_riskPercent;

public:

   bool Initialize()
   {
      m_riskPercent = 1.0;

      Print("Risk Allocator Online");

      return(true);
   }

   void Shutdown()
   {
      Print("Risk Allocator Offline");
   }

   void SetRisk(double percent)
   {
      m_riskPercent = percent;
   }

   double GetRisk() const
   {
      return(m_riskPercent);
   }

   double CalculateLotSize(double stopLossPips)
   {
      if(stopLossPips <= 0.0)
         return(0.01);

      double equity = AccountInfoDouble(ACCOUNT_EQUITY);

      double riskMoney = equity * (m_riskPercent / 100.0);

      double lot = riskMoney / (stopLossPips * 10.0);

      if(lot < 0.01)
         lot = 0.01;

      return(NormalizeDouble(lot,2));
   }

};

#endif