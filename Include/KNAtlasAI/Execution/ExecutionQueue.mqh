//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| ExecutionQueue.mqh                                               |
//| Version 1.0.0                                                    |
//+------------------------------------------------------------------+
#ifndef __KN_EXECUTION_QUEUE_MQH__
#define __KN_EXECUTION_QUEUE_MQH__

#include "../Models/Signal.mqh"

class CKNExecutionQueue
{
private:

   SSignal m_signal;

   bool m_hasSignal;

public:

   bool Initialize()
   {
      m_hasSignal=false;

      Print("Execution Queue Online");

      return(true);
   }

   void Shutdown()
   {
      Print("Execution Queue Offline");
   }

   bool Push(const SSignal &signal)
   {
      m_signal=signal;

      m_hasSignal=true;

      return(true);
   }

   bool Pop(SSignal &signal)
   {
      if(!m_hasSignal)
         return(false);

      signal=m_signal;

      m_hasSignal=false;

      return(true);
   }

   bool HasSignal() const
   {
      return(m_hasSignal);
   }

   void Clear()
   {
      m_hasSignal=false;
   }

};

#endif