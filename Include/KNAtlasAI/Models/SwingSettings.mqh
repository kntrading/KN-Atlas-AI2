//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| SwingSettings.mqh                                                |
//| Version 1.0.0                                                    |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_SWING_SETTINGS_MQH__
#define __KN_SWING_SETTINGS_MQH__

struct SSwingSettings
{
   //--------------------------------------------------------
   // ATR Settings
   //--------------------------------------------------------

   int ATRPeriod;

   double ATRMultiplier;

   //--------------------------------------------------------
   // Swing Detection
   //--------------------------------------------------------

   int MinimumLookback;

   int MaximumLookback;

   //--------------------------------------------------------
   // Behaviour
   //--------------------------------------------------------

   bool AdaptiveSensitivity;

   //--------------------------------------------------------
   // Constructor
   //--------------------------------------------------------

   void Reset()
   {
      ATRPeriod = 14;

      ATRMultiplier = 2.0;

      MinimumLookback = 2;

      MaximumLookback = 8;

      AdaptiveSensitivity = true;
   }
};

#endif