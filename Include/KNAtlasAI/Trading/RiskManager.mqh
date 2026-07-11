//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| RiskManager.mqh                                                  |
//| Version 1.0.3                                                    |
//+------------------------------------------------------------------+
#ifndef __KN_RISK_MANAGER_MQH__
#define __KN_RISK_MANAGER_MQH__

#include "../Models/AccountSnapshot.mqh"
#include "../Models/RiskProfile.mqh"

class CKNRiskManager
{
private:

   SAccountSnapshot m_account;
   SRiskProfile     m_profile;

public:

   // Constructor
   CKNRiskManager()
   {
      m_account.Reset();
      m_profile.Reset();
   }

   // Initialize
   bool Initialize()
   {
      return(true);
   }

   // Set Risk Profile
   void SetRiskProfile(SRiskProfile &profile)
   {
      m_profile = profile;
   }

   // Copy current account snapshot
   void GetAccount(SAccountSnapshot &account)
   {
      account = m_account;
   }

   // Trading permission
   bool IsTradingAllowed()
   {
      return(m_profile.EnableTrading);
   }

   // Validate signal
   bool ValidateSignal()
   {
      if(!m_profile.EnableTrading)
         return(false);

      return(true);
   }
};

#endif // __KN_RISK_MANAGER_MQH__