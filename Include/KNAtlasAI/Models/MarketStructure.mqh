//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| MarketStructure.mqh                                              |
//| Version 1.0.0                                                    |
//+------------------------------------------------------------------+
#ifndef __KN_MARKET_STRUCTURE_MQH__
#define __KN_MARKET_STRUCTURE_MQH__

enum ENUM_MARKET_TREND
{
   TREND_UNKNOWN = 0,
   TREND_BULLISH,
   TREND_BEARISH,
   TREND_RANGING
};

struct SMarketStructure
{
   ENUM_MARKET_TREND Trend;

   bool BOS;
   bool CHOCH;

   double LastSwingHigh;
   double LastSwingLow;

   datetime SwingHighTime;
   datetime SwingLowTime;

   int BullishBOSCount;
   int BearishBOSCount;

   int BullishCHOCHCount;
   int BearishCHOCHCount;

   void Reset()
   {
      Trend = TREND_UNKNOWN;

      BOS = false;
      CHOCH = false;

      LastSwingHigh = 0.0;
      LastSwingLow = 0.0;

      SwingHighTime = 0;
      SwingLowTime = 0;

      BullishBOSCount = 0;
      BearishBOSCount = 0;

      BullishCHOCHCount = 0;
      BearishCHOCHCount = 0;
   }
};

#endif