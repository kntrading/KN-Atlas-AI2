//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| FilterBase.mqh                                                   |
//| Version 1.1.0                                                    |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_FILTER_BASE_MQH__
#define __KN_FILTER_BASE_MQH__

#include "../Models/Signal.mqh"

class CKNFilterBase
{
protected:

   string m_name;
   bool   m_enabled;
   bool   m_lastResult;

public:

   //--------------------------------------------------------
   // Constructor
   //--------------------------------------------------------

   CKNFilterBase()
   {
      m_name       = "Filter";
      m_enabled    = true;
      m_lastResult = true;
   }

   //--------------------------------------------------------
   // Initialize
   //--------------------------------------------------------

   virtual bool Initialize()
   {
      Print(m_name + " Online");
      return(true);
   }

   //--------------------------------------------------------
   // Shutdown
   //--------------------------------------------------------

   virtual void Shutdown()
   {
      Print(m_name + " Offline");
   }

   //--------------------------------------------------------
   // Validation
   //--------------------------------------------------------

   virtual bool Validate(SSignal &signal)
   {
      m_lastResult = true;
      return(true);
   }

   //--------------------------------------------------------
   // Enable / Disable
   //--------------------------------------------------------

   void Enable()
   {
      m_enabled = true;
   }

   void Disable()
   {
      m_enabled = false;
   }

   bool Enabled() const
   {
      return(m_enabled);
   }

   //--------------------------------------------------------
   // Name
   //--------------------------------------------------------

   string Name() const
   {
      return(m_name);
   }

   void SetName(const string name)
   {
      m_name = name;
   }

   //--------------------------------------------------------
   // Last Validation Result
   //--------------------------------------------------------

   bool LastResult() const
   {
      return(m_lastResult);
   }

   void SetResult(const bool value)
   {
      m_lastResult = value;
   }

};

#endif