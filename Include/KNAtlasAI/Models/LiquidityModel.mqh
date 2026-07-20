//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| LiquidityModel.mqh                                               |
//| Version 1.0.0                                                    |
//+------------------------------------------------------------------+
#ifndef __KN_LIQUIDITY_MODEL_MQH__
#define __KN_LIQUIDITY_MODEL_MQH__

struct SLiquidityModel
{
   bool BuySideLiquidity;
   bool SellSideLiquidity;

   bool EqualHighs;
   bool EqualLows;

   bool BuySideSweep;
   bool SellSideSweep;

   double BuyLiquidityPrice;
   double SellLiquidityPrice;

   datetime DetectionTime;

   void Reset()
   {
      BuySideLiquidity = false;
      SellSideLiquidity = false;

      EqualHighs = false;
      EqualLows = false;

      BuySideSweep = false;
      SellSideSweep = false;

      BuyLiquidityPrice = 0.0;
      SellLiquidityPrice = 0.0;

      DetectionTime = 0;
   }
};

#endif