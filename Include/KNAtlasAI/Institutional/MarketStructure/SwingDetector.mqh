//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| SwingDetector.mqh                                                |
//| Version 3.0.0                                                    |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_SWING_DETECTOR_MQH__
#define __KN_SWING_DETECTOR_MQH__

#include "../../Models/SwingDetection.mqh"
#include "../../Services/MarketDataService.mqh"

class CKNSwingDetector
{
public:

   //--------------------------------------------------------
   // Initialize
   //--------------------------------------------------------

   bool Initialize()
   {
      Print("Swing Detector Online");
      return(true);
   }

   //--------------------------------------------------------
   // Shutdown
   //--------------------------------------------------------

   void Shutdown()
   {
      Print("Swing Detector Offline");
   }

   //--------------------------------------------------------
   // Detect Swing High
   //--------------------------------------------------------

   SSwingDetection DetectHigh(
      CKNMarketDataService &market,
      const int index,
      const int lookback)
   {
      SSwingDetection result;
      result.Reset();

      if(!market.IsValidIndex(index))
         return(result);

      double high = market.High(index);

      for(int i=1; i<=lookback; i++)
      {
         if(!market.IsValidIndex(index-i))
            return(result);

         if(!market.IsValidIndex(index+i))
            return(result);

         if(high <= market.High(index-i))
            return(result);

         if(high <= market.High(index+i))
            return(result);
      }

      result.Found     = true;
      result.Direction = SWING_HIGH;
      result.Index     = index;
      result.Price     = high;
      result.Time      = market.Time(index);

      return(result);
   }

   //--------------------------------------------------------
   // Detect Swing Low
   //--------------------------------------------------------

   SSwingDetection DetectLow(
      CKNMarketDataService &market,
      const int index,
      const int lookback)
   {
      SSwingDetection result;
      result.Reset();

      if(!market.IsValidIndex(index))
         return(result);

      double low = market.Low(index);

      for(int i=1; i<=lookback; i++)
      {
         if(!market.IsValidIndex(index-i))
            return(result);

         if(!market.IsValidIndex(index+i))
            return(result);

         if(low >= market.Low(index-i))
            return(result);

         if(low >= market.Low(index+i))
            return(result);
      }

      result.Found     = true;
      result.Direction = SWING_LOW;
      result.Index     = index;
      result.Price     = low;
      result.Time      = market.Time(index);

      return(result);
   }

};

#endif