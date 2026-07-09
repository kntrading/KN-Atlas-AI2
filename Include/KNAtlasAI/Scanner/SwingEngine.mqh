//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| Swing Engine                                                     |
//+------------------------------------------------------------------+
#ifndef __SWINGENGINE_MQH__
#define __SWINGENGINE_MQH__

class CKNSwingEngine
{
private:

   bool m_initialized;
   int  m_swingLength;

public:

   CKNSwingEngine()
   {
      m_initialized = false;
      m_swingLength = 3;
   }

   bool Initialize()
   {
      Print("Swing Engine Online");
      m_initialized = true;
      return(true);
   }

   void Shutdown()
   {
      Print("Swing Engine Offline");
      m_initialized = false;
   }

   void SetSwingLength(int length)
   {
      if(length >= 2)
         m_swingLength = length;
   }

   bool IsSwingHigh(string symbol,
                    ENUM_TIMEFRAMES timeframe,
                    int shift)
   {
      if(!m_initialized)
         return(false);

      double currentHigh = iHigh(symbol,timeframe,shift);

      for(int i=1;i<=m_swingLength;i++)
      {
         if(currentHigh <= iHigh(symbol,timeframe,shift-i))
            return(false);

         if(currentHigh <= iHigh(symbol,timeframe,shift+i))
            return(false);
      }

      return(true);
   }

   bool IsSwingLow(string symbol,
                   ENUM_TIMEFRAMES timeframe,
                   int shift)
   {
      if(!m_initialized)
         return(false);

      double currentLow = iLow(symbol,timeframe,shift);

      for(int i=1;i<=m_swingLength;i++)
      {
         if(currentLow >= iLow(symbol,timeframe,shift-i))
            return(false);

         if(currentLow >= iLow(symbol,timeframe,shift+i))
            return(false);
      }

      return(true);
   }
};

#endif