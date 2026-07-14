//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| ConfidenceEngine.mqh                                             |
//| Version 2.0.0                                                    |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_CONFIDENCE_ENGINE_MQH__
#define __KN_CONFIDENCE_ENGINE_MQH__

#include "../Models/Signal.mqh"

//==========================================================
// Confidence Weights
//==========================================================

#define TREND_WEIGHT          20.0
#define LIQUIDITY_WEIGHT      15.0
#define ORDERBLOCK_WEIGHT     15.0
#define FVG_WEIGHT            15.0
#define BOS_WEIGHT            15.0
#define CHOCH_WEIGHT          10.0

#define SESSION_WEIGHT         5.0
#define VOLATILITY_WEIGHT      3.0
#define SPREAD_WEIGHT          2.0

class CKNConfidenceEngine
{
public:

   //--------------------------------------------------------
   // Constructor
   //--------------------------------------------------------

   CKNConfidenceEngine()
   {
   }

   //--------------------------------------------------------
   // Initialize
   //--------------------------------------------------------

   bool Initialize()
   {
      Print("Confidence Engine Online");
      return(true);
   }

   //--------------------------------------------------------
   // Calculate Confidence
   //--------------------------------------------------------

   double Calculate(SSignal &signal)
   {
      signal.Confidence = 0.0;

      //-----------------------------------------------------
      // Scanner Score
      //-----------------------------------------------------

      if(signal.Trend)
         signal.Confidence += TREND_WEIGHT;

      if(signal.Liquidity)
         signal.Confidence += LIQUIDITY_WEIGHT;

      if(signal.OrderBlock)
         signal.Confidence += ORDERBLOCK_WEIGHT;

      if(signal.FVG)
         signal.Confidence += FVG_WEIGHT;

      if(signal.BOS)
         signal.Confidence += BOS_WEIGHT;

      if(signal.CHOCH)
         signal.Confidence += CHOCH_WEIGHT;

      //-----------------------------------------------------
      // Filter Bonus
      //-----------------------------------------------------

      if(signal.SessionApproved)
         signal.Confidence += SESSION_WEIGHT;

      if(signal.VolatilityApproved)
         signal.Confidence += VOLATILITY_WEIGHT;

      if(signal.SpreadApproved)
         signal.Confidence += SPREAD_WEIGHT;

      //-----------------------------------------------------
      // Clamp
      //-----------------------------------------------------

      if(signal.Confidence > 100.0)
         signal.Confidence = 100.0;

      //-----------------------------------------------------
      // Probability
      //-----------------------------------------------------

      signal.Probability = signal.Confidence;

      return(signal.Confidence);
   }

   //--------------------------------------------------------
   // Confidence Rating
   //--------------------------------------------------------

   string GetConfidenceLabel(double confidence)
   {
      if(confidence >= 90.0)
         return("Institutional");

      if(confidence >= 80.0)
         return("Strong");

      if(confidence >= 70.0)
         return("Watch");

      if(confidence >= 50.0)
         return("Weak");

      return("Reject");
   }

   //--------------------------------------------------------
   // Helper Functions
   //--------------------------------------------------------

   bool IsInstitutionalSetup(const SSignal &signal)
   {
      return(signal.Confidence >= 90.0);
   }

   bool IsStrongSetup(const SSignal &signal)
   {
      return(signal.Confidence >= 80.0);
   }

   bool IsWatchSetup(const SSignal &signal)
   {
      return(signal.Confidence >= 70.0);
   }

   bool IsTradable(const SSignal &signal)
   {
      return(signal.Confidence >= 80.0);
   }

   //--------------------------------------------------------
   // Shutdown
   //--------------------------------------------------------

   void Shutdown()
   {
      Print("Confidence Engine Offline");
   }
};

#endif