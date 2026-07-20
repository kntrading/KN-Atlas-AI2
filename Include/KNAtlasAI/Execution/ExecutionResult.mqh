//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| ExecutionResult.mqh                                              |
//| Version 1.0.0                                                    |
//+------------------------------------------------------------------+
#ifndef __KN_EXECUTION_RESULT_MQH__
#define __KN_EXECUTION_RESULT_MQH__

struct SExecutionResult
{
   bool Success;

   ulong Ticket;

   int ErrorCode;

   string ErrorMessage;

   double FillPrice;

   double ExecutedLots;

   datetime ExecutionTime;

   void Reset()
   {
      Success=false;

      Ticket=0;

      ErrorCode=0;

      ErrorMessage="";

      FillPrice=0.0;

      ExecutedLots=0.0;

      ExecutionTime=0;
   }
};

#endif