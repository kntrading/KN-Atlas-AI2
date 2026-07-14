//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| RiskManager.mqh                                                  |
//| Version 2.0.0                                                    |
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

   //--------------------------------------------------------
   // Constructor
   //--------------------------------------------------------

   CKNRiskManager()
   {
      m_account.Reset();
      m_profile.Reset();
   }

   //--------------------------------------------------------
   // Initialize
   //--------------------------------------------------------

   bool Initialize()
   {
      return(true);
   }

   //--------------------------------------------------------
   // Set Risk Profile
   //--------------------------------------------------------

   void SetRiskProfile(const SRiskProfile &profile)
   {
      m_profile = profile;
   }

   //--------------------------------------------------------
   // Set Account Snapshot
   //--------------------------------------------------------

   void SetAccount(const SAccountSnapshot &account)
   {
      m_account = account;
   }

   //--------------------------------------------------------
   // Get Account
   //--------------------------------------------------------

   SAccountSnapshot GetAccount() const
   {
      return(m_account);
   }

   //--------------------------------------------------------
   // Trading Permission
   //--------------------------------------------------------

   bool IsTradingAllowed() const
   {
      return(m_profile.EnableTrading);
   }

   //--------------------------------------------------------
   // Validate Signal
   //--------------------------------------------------------

   bool ValidateSignal() const
   {
      if(!m_profile.EnableTrading)
         return(false);

      return(true);
   }
};

#endif