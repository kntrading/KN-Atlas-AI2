//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| SwingValidator.mqh                                               |
//| Version 2.0.0                                                    |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_SWING_VALIDATOR_MQH__
#define __KN_SWING_VALIDATOR_MQH__

#include "../../Models/SwingDetection.mqh"

class CKNSwingValidator
{
private:

   double m_lastPrice;
   int    m_lastIndex;

public:

   //--------------------------------------------------------
   // Initialize
   //--------------------------------------------------------

   bool Initialize()
   {
      m_lastPrice = 0.0;
      m_lastIndex = -1;

      Print("Swing Validator Online");

      return(true);
   }

   //--------------------------------------------------------
   // Shutdown
   //--------------------------------------------------------

   void Shutdown()
   {
      Print("Swing Validator Offline");
   }

   //--------------------------------------------------------
   // Reset State
   //--------------------------------------------------------

   void Reset()
   {
      m_lastPrice = 0.0;
      m_lastIndex = -1;
   }

   //--------------------------------------------------------
   // Validate Candidate Swing
   //--------------------------------------------------------

   bool Validate(const SSwingDetection &candidate,
                 const double minimumDistance,
                 const int minimumBars)
   {
      if(!candidate.Found)
         return(false);

      //-----------------------------------------------------
      // First confirmed swing
      //-----------------------------------------------------

      if(m_lastIndex < 0)
      {
         m_lastPrice = candidate.Price;
         m_lastIndex = candidate.Index;
         return(true);
      }

      //-----------------------------------------------------
      // Minimum price movement
      //-----------------------------------------------------

      if(MathAbs(candidate.Price - m_lastPrice) < minimumDistance)
         return(false);

      //-----------------------------------------------------
      // Minimum bar separation
      //-----------------------------------------------------

      if(MathAbs(candidate.Index - m_lastIndex) < minimumBars)
         return(false);

      //-----------------------------------------------------
      // Accept swing
      //-----------------------------------------------------

      m_lastPrice = candidate.Price;
      m_lastIndex = candidate.Index;

      return(true);
   }

   //--------------------------------------------------------
   // Accessors
   //--------------------------------------------------------

   double LastPrice() const
   {
      return(m_lastPrice);
   }

   int LastIndex() const
   {
      return(m_lastIndex);
   }

};

#endif