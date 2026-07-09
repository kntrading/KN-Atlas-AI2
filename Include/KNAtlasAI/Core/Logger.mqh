//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| Logger Module                                                    |
//+------------------------------------------------------------------+
#ifndef __KN_LOGGER_MQH__
#define __KN_LOGGER_MQH__

class CKNLogger
{
private:

   bool m_enabled;

public:

   CKNLogger()
   {
      m_enabled = true;
   }

   void Initialize()
   {
      Print("========================================");
      Print(" KN Atlas AI Logger Started");
      Print("========================================");
   }

   void Shutdown()
   {
      Print("========================================");
      Print(" KN Atlas AI Logger Stopped");
      Print("========================================");
   }

   void Enable(bool enabled)
   {
      m_enabled = enabled;
   }

   void Info(string message)
   {
      if(m_enabled)
         Print("[INFO] ", message);
   }

   void Warning(string message)
   {
      if(m_enabled)
         Print("[WARNING] ", message);
   }

   void Error(string message)
   {
      if(m_enabled)
         Print("[ERROR] ", message);
   }

   void Success(string message)
   {
      if(m_enabled)
         Print("[SUCCESS] ", message);
   }
};

#endif