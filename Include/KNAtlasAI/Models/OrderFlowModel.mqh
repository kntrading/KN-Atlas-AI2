//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| OrderFlowModel.mqh                                               |
//| Version 1.0.0                                                    |
//+------------------------------------------------------------------+
#ifndef __KN_ORDERFLOW_MODEL_MQH__
#define __KN_ORDERFLOW_MODEL_MQH__

struct SOrderFlowModel
{
   bool FairValueGap;
   bool OrderBlock;
   bool MitigationBlock;
   bool BreakerBlock;
   bool RejectionBlock;

   double EntryPrice;
   double StopLoss;
   double TakeProfit;

   double FairValueGapHigh;
   double FairValueGapLow;

   datetime DetectionTime;

   void Reset()
   {
      FairValueGap=false;
      OrderBlock=false;
      MitigationBlock=false;
      BreakerBlock=false;
      RejectionBlock=false;

      EntryPrice=0.0;
      StopLoss=0.0;
      TakeProfit=0.0;

      FairValueGapHigh=0.0;
      FairValueGapLow=0.0;

      DetectionTime=0;
   }
};

#endif