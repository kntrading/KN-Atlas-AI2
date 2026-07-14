//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| PositionManager.mqh                                              |
//| Version 2.0.0                                                    |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_POSITION_MANAGER_MQH__
#define __KN_POSITION_MANAGER_MQH__

#include <Trade/Trade.mqh>

#include "BreakEvenEngine.mqh"

class CKNPositionManager
{
private:

   CKNBreakEvenEngine m_breakEven;

public:

   //--------------------------------------------------------
   // Constructor
   //--------------------------------------------------------

   CKNPositionManager()
   {
   }

   //--------------------------------------------------------
   // Initialize
   //--------------------------------------------------------

   bool Initialize()
   {
      m_breakEven.Initialize();

      Print("Position Manager Online");

      return(true);
   }

   //--------------------------------------------------------
   // Shutdown
   //--------------------------------------------------------

   void Shutdown()
   {
      m_breakEven.Shutdown();

      Print("Position Manager Offline");
   }

   //--------------------------------------------------------
   // Number of Open Positions
   //--------------------------------------------------------

   int PositionCount()
   {
      return(PositionsTotal());
   }

   //--------------------------------------------------------
   // Has Open Positions
   //--------------------------------------------------------

   bool HasOpenPositions()
   {
      return(PositionsTotal() > 0);
   }

   //--------------------------------------------------------
   // Update All Positions
   //--------------------------------------------------------

   void Update()
   {
      int total = PositionsTotal();

      if(total == 0)
         return;

      for(int i = total - 1; i >= 0; i--)
      {
         ulong ticket = PositionGetTicket(i);

         if(ticket == 0)
            continue;

         ManagePosition(ticket);
      }
   }

   //--------------------------------------------------------
   // Manage Single Position
   //--------------------------------------------------------

   void ManagePosition(ulong ticket)
   {
      if(!PositionSelectByTicket(ticket))
         return;

      m_breakEven.Update(ticket);

      // Future Modules
      //
      // StopLossEngine.Update(ticket);
      // TrailingStopEngine.Update(ticket);
      // TakeProfitEngine.Update(ticket);
      // PositionSnapshot.Update(ticket);
   }

};

#endif