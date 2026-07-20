//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| MarketContext.mqh                                                |
//| Version 1.1.0                                                    |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_MARKET_CONTEXT_MQH__
#define __KN_MARKET_CONTEXT_MQH__

#include "SwingPoint.mqh"
#include "SwingHistory.mqh"
#include "MarketStructure.mqh"
#include "LiquidityModel.mqh"
#include "OrderFlowModel.mqh"
#include "InstitutionalScore.mqh"

struct SMarketContext
{
   //--------------------------------------------------------
   // Market Structure
   //--------------------------------------------------------

   SMarketStructure Structure;

   //--------------------------------------------------------
   // Latest Confirmed Swings
   //--------------------------------------------------------

   SSwingPoint LastSwingHigh;
   SSwingPoint LastSwingLow;

   //--------------------------------------------------------
   // Swing History
   //--------------------------------------------------------

   SSwingHistory SwingHistory;

   //--------------------------------------------------------
   // Liquidity
   //--------------------------------------------------------

   SLiquidityModel Liquidity;

   //--------------------------------------------------------
   // Order Flow
   //--------------------------------------------------------

   SOrderFlowModel OrderFlow;

   //--------------------------------------------------------
   // Institutional Score
   //--------------------------------------------------------

   SInstitutionalScore Score;

   //--------------------------------------------------------
   // Volatility
   //--------------------------------------------------------

   double ATR;

   double SwingDistance;

   //--------------------------------------------------------
   // Structure State
   //--------------------------------------------------------

   bool HasNewSwing;

   bool BullishStructure;

   bool BearishStructure;

   int SwingCount;

   //--------------------------------------------------------
   // Reset
   //--------------------------------------------------------

   void Reset()
   {
      //-----------------------------------------------------
      // Swings
      //-----------------------------------------------------

      LastSwingHigh.Reset();
      LastSwingLow.Reset();

      SwingHistory.Reset();

      //-----------------------------------------------------
      // Volatility
      //-----------------------------------------------------

      ATR = 0.0;
      SwingDistance = 0.0;

      //-----------------------------------------------------
      // Structure State
      //-----------------------------------------------------

      HasNewSwing = false;

      BullishStructure = false;
      BearishStructure = false;

      SwingCount = 0;
   }
};

#endif