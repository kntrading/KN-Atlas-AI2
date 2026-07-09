//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| Copyright 2026 KN Trading                                        |
//+------------------------------------------------------------------+
#property copyright "KN Trading"
#property version   "1.000"
#property strict

#include <KNAtlasAI/Core/Application.mqh>

CKNApplication App;

//+------------------------------------------------------------------+
int OnInit()
{
   if(App.Initialize())
      return(INIT_SUCCEEDED);

   return(INIT_FAILED);
}

//+------------------------------------------------------------------+
void OnTick()
{
   App.Run();
}

//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   App.Shutdown();
}
//+------------------------------------------------------------------+