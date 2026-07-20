//+------------------------------------------------------------------+
//| KN Atlas AI                                                      |
//| InstitutionalScore.mqh                                           |
//| Version 1.0.0                                                    |
//+------------------------------------------------------------------+
#ifndef __KN_INSTITUTIONAL_SCORE_MQH__
#define __KN_INSTITUTIONAL_SCORE_MQH__

struct SInstitutionalScore
{
   double TrendScore;
   double StructureScore;
   double LiquidityScore;
   double OrderFlowScore;
   double RiskScore;

   double TotalScore;

   string Grade;

   bool Approved;

   void Reset()
   {
      TrendScore=0.0;
      StructureScore=0.0;
      LiquidityScore=0.0;
      OrderFlowScore=0.0;
      RiskScore=0.0;

      TotalScore=0.0;

      Grade="F";

      Approved=false;
   }

   void Calculate()
   {
      TotalScore =
         TrendScore +
         StructureScore +
         LiquidityScore +
         OrderFlowScore +
         RiskScore;

      if(TotalScore>=90)
         Grade="A+";
      else if(TotalScore>=80)
         Grade="A";
      else if(TotalScore>=70)
         Grade="B";
      else if(TotalScore>=60)
         Grade="C";
      else
         Grade="F";

      Approved=(TotalScore>=80.0);
   }
};

#endif