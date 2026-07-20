//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| SwingHistory.mqh                                                 |
//| Version 1.0.0                                                    |
//| Copyright © 2026 KN Trading                                      |
//+------------------------------------------------------------------+
#ifndef __KN_SWING_HISTORY_MQH__
#define __KN_SWING_HISTORY_MQH__

#include "SwingPoint.mqh"

#define MAX_SWING_HISTORY 100

struct SSwingHistory
{
   SSwingPoint Swings[MAX_SWING_HISTORY];

   int Count;

   //--------------------------------------------------------
   // Reset
   //--------------------------------------------------------

   void Reset()
   {
      Count = 0;

      for(int i = 0; i < MAX_SWING_HISTORY; i++)
         Swings[i].Reset();
   }

   //--------------------------------------------------------
   // Add Swing
   //--------------------------------------------------------

   void Add(const SSwingPoint &swing)
   {
      if(Count < MAX_SWING_HISTORY)
      {
         Swings[Count] = swing;
         Count++;
         return;
      }

      // Shift history left
      for(int i = 1; i < MAX_SWING_HISTORY; i++)
         Swings[i - 1] = Swings[i];

      Swings[MAX_SWING_HISTORY - 1] = swing;
   }

   //--------------------------------------------------------
   // Latest Swing
   //--------------------------------------------------------

   SSwingPoint Last() const
   {
      if(Count == 0)
      {
         SSwingPoint empty;
         empty.Reset();
         return(empty);
      }

      return(Swings[Count - 1]);
   }

   //--------------------------------------------------------
   // Get Swing
   //--------------------------------------------------------

   SSwingPoint Get(int index) const
   {
      if(index < 0 || index >= Count)
      {
         SSwingPoint empty;
         empty.Reset();
         return(empty);
      }

      return(Swings[index]);
   }
};

#endif