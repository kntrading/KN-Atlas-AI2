//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| IndicatorService.mqh                                             |
//| Version 1.0.0                                                    |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_INDICATOR_SERVICE_MQH__
#define __KN_INDICATOR_SERVICE_MQH__

class CKNIndicatorService
{
private:

   //--------------------------------------------------------
   // ATR Handle
   //--------------------------------------------------------

   int m_atrHandle;

public:

   //--------------------------------------------------------
   // Constructor
   //--------------------------------------------------------

   CKNIndicatorService()
   {
      m_atrHandle = INVALID_HANDLE;
   }

   //--------------------------------------------------------
   // Initialize
   //--------------------------------------------------------

   bool Initialize()
   {
      Print("Indicator Service Online");

      return(true);
   }

   //--------------------------------------------------------
   // Shutdown
   //--------------------------------------------------------

   void Shutdown()
   {
      if(m_atrHandle != INVALID_HANDLE)
      {
         IndicatorRelease(m_atrHandle);
         m_atrHandle = INVALID_HANDLE;
      }

      Print("Indicator Service Offline");
   }

   //--------------------------------------------------------
   // ATR
   //--------------------------------------------------------

   double GetATR(string symbol,
                 ENUM_TIMEFRAMES timeframe,
                 int period,
                 int shift = 0)
   {
      //-----------------------------------------------------
      // Create Handle
      //-----------------------------------------------------

      if(m_atrHandle == INVALID_HANDLE)
      {
         m_atrHandle = iATR(symbol,timeframe,period);

         if(m_atrHandle == INVALID_HANDLE)
            return(0.0);
      }

      //-----------------------------------------------------
      // Read Buffer
      //-----------------------------------------------------

      double buffer[];

      if(CopyBuffer(m_atrHandle,
                    0,
                    shift,
                    1,
                    buffer) <= 0)
      {
         return(0.0);
      }

      return(buffer[0]);
   }

};

#endif