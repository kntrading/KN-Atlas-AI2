//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| MarketDataService.mqh                                            |
//| Version 2.2.0                                                    |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_MARKET_DATA_SERVICE_MQH__
#define __KN_MARKET_DATA_SERVICE_MQH__

class CKNMarketDataService
{
private:

   enum
   {
      MAX_BARS = 500
   };

   MqlRates m_rates[];

   int m_barCount;

public:

   //--------------------------------------------------------
   // Constructor
   //--------------------------------------------------------

   CKNMarketDataService()
   {
      ArraySetAsSeries(m_rates,true);
      m_barCount=0;
   }

   //--------------------------------------------------------
   // Initialize
   //--------------------------------------------------------

   bool Initialize()
   {
      ArraySetAsSeries(m_rates,true);

      m_barCount=0;

      Print("Market Data Service Online");

      return(true);
   }

   //--------------------------------------------------------
   // Shutdown
   //--------------------------------------------------------

   void Shutdown()
   {
      Print("Market Data Service Offline");
   }

   //--------------------------------------------------------
   // Load Rates
   //--------------------------------------------------------

   bool LoadRates(string symbol,
                  ENUM_TIMEFRAMES timeframe,
                  int bars=300)
   {
      if(bars>MAX_BARS)
         bars=MAX_BARS;

      m_barCount=
         CopyRates(
            symbol,
            timeframe,
            0,
            bars,
            m_rates);

      return(m_barCount>0);
   }

   //--------------------------------------------------------
   // Bar Count
   //--------------------------------------------------------

   int BarCount() const
   {
      return(m_barCount);
   }

   //--------------------------------------------------------
   // Validate Index
   //--------------------------------------------------------

   bool IsValidIndex(int index) const
   {
      return(index >= 0 && index < m_barCount);
   }

   //--------------------------------------------------------
   // Get Bar
   //--------------------------------------------------------

   MqlRates GetBar(int index) const
   {
      MqlRates empty={};

      if(!IsValidIndex(index))
         return(empty);

      return(m_rates[index]);
   }

   //--------------------------------------------------------
   // Close
   //--------------------------------------------------------

   double Close(int index=0) const
   {
      if(!IsValidIndex(index))
         return(0.0);

      return(m_rates[index].close);
   }

   //--------------------------------------------------------
   // High
   //--------------------------------------------------------

   double High(int index=0) const
   {
      if(!IsValidIndex(index))
         return(0.0);

      return(m_rates[index].high);
   }

   //--------------------------------------------------------
   // Low
   //--------------------------------------------------------

   double Low(int index=0) const
   {
      if(!IsValidIndex(index))
         return(0.0);

      return(m_rates[index].low);
   }

   //--------------------------------------------------------
   // Open
   //--------------------------------------------------------

   double Open(int index=0) const
   {
      if(!IsValidIndex(index))
         return(0.0);

      return(m_rates[index].open);
   }

   //--------------------------------------------------------
   // Close Time
   //--------------------------------------------------------

   datetime Time(int index=0) const
   {
      if(!IsValidIndex(index))
         return(0);

      return(m_rates[index].time);
   }

};

#endif