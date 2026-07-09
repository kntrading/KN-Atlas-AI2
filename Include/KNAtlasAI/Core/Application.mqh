//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| Core - Application                                               |
//+------------------------------------------------------------------+
#ifndef __KN_APPLICATION_MQH__
#define __KN_APPLICATION_MQH__

#include "Version.mqh"
#include "Logger.mqh"
#include "Config.mqh"

enum ENUM_APP_STATE
{
   APP_STARTING = 0,
   APP_READY,
   APP_RUNNING,
   APP_STOPPED
};

class CKNApplication
{
private:

   ENUM_APP_STATE m_state;
   CKNLogger      m_logger;
   CKNConfig      m_config;

public:

   CKNApplication()
   {
      m_state = APP_STARTING;
   }

   bool Initialize()
   {
      m_logger.Initialize();

      m_logger.Info("KN Atlas AI Initializing...");

      m_state = APP_READY;

      m_logger.Success("Initialization Complete");

      return(true);
   }

   void Run()
   {
      if(m_state == APP_READY)
      {
         m_state = APP_RUNNING;
      }

      Comment(
         "=====================================\n"
         "          KN ATLAS AI\n"
         "=====================================\n\n"
         "Status : RUNNING\n"
         "Broker : ", AccountInfoString(ACCOUNT_COMPANY), "\n"
         "Account: ", AccountInfoInteger(ACCOUNT_LOGIN), "\n\n"
         "Balance: ", DoubleToString(AccountInfoDouble(ACCOUNT_BALANCE),2), "\n"
         "Equity : ", DoubleToString(AccountInfoDouble(ACCOUNT_EQUITY),2), "\n"
         "Spread : ", SymbolInfoInteger(_Symbol,SYMBOL_SPREAD), "\n"
      );
   }

   void Shutdown()
   {
      m_logger.Info("KN Atlas AI Shutdown");

      m_logger.Shutdown();

      Comment("");

      m_state = APP_STOPPED;
   }
};

#endif