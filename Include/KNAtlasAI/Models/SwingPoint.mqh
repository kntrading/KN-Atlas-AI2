//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| SwingPoint.mqh                                                   |
//| Version 1.0.0                                                    |
//+------------------------------------------------------------------+
#ifndef __KN_SWING_POINT_MQH__
#define __KN_SWING_POINT_MQH__

enum ENUM_SWING_DIRECTION
{
   SWING_NONE = 0,
   SWING_HIGH,
   SWING_LOW
};

struct SSwingPoint
{
   ENUM_SWING_DIRECTION Type;

   int Index;

   datetime Time;

   double Price;

   bool Confirmed;

   void Reset()
   {
      Type = SWING_NONE;

      Index = -1;

      Time = 0;

      Price = 0.0;

      Confirmed = false;
   }
};

#endif