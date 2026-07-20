//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| SwingDetection.mqh                                               |
//| Version 1.0.0                                                    |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_SWING_DETECTION_MQH__
#define __KN_SWING_DETECTION_MQH__

#include "SwingPoint.mqh"

struct SSwingDetection
{
   bool Found;

   ENUM_SWING_DIRECTION Direction;

   int Index;

   double Price;

   datetime Time;

   //--------------------------------------------------------

   void Reset()
   {
      Found=false;

      Direction=SWING_NONE;

      Index=-1;

      Price=0.0;

      Time=0;
   }

};

#endif