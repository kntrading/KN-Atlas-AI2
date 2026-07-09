//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| Configuration Module                                             |
//+------------------------------------------------------------------+
#ifndef __KN_CONFIG_MQH__
#define __KN_CONFIG_MQH__

class CKNConfig
{
private:

   double m_riskPercent;
   int    m_maxSpread;
   bool   m_autoTrading;

public:

   CKNConfig()
   {
      m_riskPercent = 1.0;
      m_maxSpread   = 20;
      m_autoTrading = true;
   }

   double RiskPercent() const
   {
      return m_riskPercent;
   }

   int MaxSpread() const
   {
      return m_maxSpread;
   }

   bool AutoTrading() const
   {
      return m_autoTrading;
   }

   void SetRiskPercent(double value)
   {
      m_riskPercent = value;
   }

   void SetMaxSpread(int value)
   {
      m_maxSpread = value;
   }

   void SetAutoTrading(bool value)
   {
      m_autoTrading = value;
   }
};

#endif