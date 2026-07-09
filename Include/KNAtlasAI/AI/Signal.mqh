#ifndef __SIGNAL_MQH__
#define __SIGNAL_MQH__

enum ENUM_SIGNAL_DIRECTION
{
   SIGNAL_NONE = 0,
   SIGNAL_BUY,
   SIGNAL_SELL
};

struct SSignal
{
   string Symbol;

   ENUM_TIMEFRAMES Timeframe;

   ENUM_SIGNAL_DIRECTION Direction;

   double Confidence;

   bool Trend;

   bool Liquidity;

   bool FVG;

   bool OrderBlock;

   bool BOS;

   bool CHOCH;
};

#endif