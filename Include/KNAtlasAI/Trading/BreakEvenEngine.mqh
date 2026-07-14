//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| BreakEvenEngine.mqh                                              |
//| Version 2.0.0                                                    |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_BREAK_EVEN_ENGINE_MQH__
#define __KN_BREAK_EVEN_ENGINE_MQH__

#include <Trade/Trade.mqh>

class CKNBreakEvenEngine
{
private:

   CTrade m_trade;

   double m_triggerPoints;
   double m_lockPoints;

public:

   //--------------------------------------------------------
   // Constructor
   //--------------------------------------------------------

   CKNBreakEvenEngine()
   {
      m_triggerPoints = 200.0;
      m_lockPoints    = 20.0;
   }

   //--------------------------------------------------------
   // Initialize
   //--------------------------------------------------------

   bool Initialize()
   {
      Print("Break Even Engine Online");
      return(true);
   }

   //--------------------------------------------------------
   // Shutdown
   //--------------------------------------------------------

   void Shutdown()
   {
      Print("Break Even Engine Offline");
   }

   //--------------------------------------------------------
   // Settings
   //--------------------------------------------------------

   void SetTriggerPoints(double points)
   {
      m_triggerPoints = points;
   }

   void SetLockPoints(double points)
   {
      m_lockPoints = points;
   }

   //--------------------------------------------------------
   // Move Stop Loss To Break Even
   //--------------------------------------------------------

   bool Update(ulong ticket)
   {
      if(!PositionSelectByTicket(ticket))
         return(false);

      string symbol = PositionGetString(POSITION_SYMBOL);

      ENUM_POSITION_TYPE type =
         (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);

      double openPrice =
         PositionGetDouble(POSITION_PRICE_OPEN);

      double stopLoss =
         PositionGetDouble(POSITION_SL);

      double takeProfit =
         PositionGetDouble(POSITION_TP);

      double bid =
         SymbolInfoDouble(symbol,SYMBOL_BID);

      double ask =
         SymbolInfoDouble(symbol,SYMBOL_ASK);

      //-----------------------------------------------------
      // BUY Position
      //-----------------------------------------------------

      if(type == POSITION_TYPE_BUY)
      {
         double profitPoints =
            (bid-openPrice)/_Point;

         if(profitPoints >= m_triggerPoints)
         {
            double newSL =
               openPrice + (m_lockPoints*_Point);

            if(stopLoss < newSL)
            {
               if(m_trade.PositionModify(ticket,
                                         newSL,
                                         takeProfit))
               {
                  Print("BUY moved to Break Even.");

                  return(true);
               }
            }
         }
      }

      //-----------------------------------------------------
      // SELL Position
      //-----------------------------------------------------

      if(type == POSITION_TYPE_SELL)
      {
         double profitPoints =
            (openPrice-ask)/_Point;

         if(profitPoints >= m_triggerPoints)
         {
            double newSL =
               openPrice - (m_lockPoints*_Point);

            if(stopLoss == 0 || stopLoss > newSL)
            {
               if(m_trade.PositionModify(ticket,
                                         newSL,
                                         takeProfit))
               {
                  Print("SELL moved to Break Even.");

                  return(true);
               }
            }
         }
      }

      return(false);
   }

};

#endif