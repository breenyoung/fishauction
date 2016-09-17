using System;
using System.Collections;

using Components.Dal;
using Components.Entities;

namespace Components.Bcl
{
	/// <summary>
	/// Summary description for CatchBcl.
	/// </summary>
	public class CatchBcl
	{

        private static CatchBcl myInstance = null;

        public static CatchBcl GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new CatchBcl();
            }

            return myInstance;

        }

		private CatchBcl()
		{
		}

        public Catch GetCatchById(long id) 
        {
            Catch oneCatch = CatchDal.GetInstance().GetById(id);
            return oneCatch;
        }

        public Catch GetCatchByTripId(long tripId) 
        {
            Catch oneCatch = CatchDal.GetInstance().GetByTripId(tripId);
            return oneCatch;
        }


        public ArrayList GetCatchSupplies(long catchId) 
        {
            ArrayList supplies 
                = CatchDal.GetInstance().GetCatchSupplies(catchId);

            return supplies;
        }

        public ArrayList GetCatchGrades(long catchId) 
        {
            ArrayList grades 
                = CatchDal.GetInstance().GetCatchGrades(catchId);

            return grades;
        }

        public ArrayList GetCatchBreakdowns(long catchId) 
        {
            ArrayList breakdowns 
                = CatchDal.GetInstance().GetCatchBreakdowns(catchId);

            return breakdowns;
        }


        public void CreateCatch(Catch objCatch) 
        {
            CatchDal.GetInstance().Create(objCatch);
        }

        public void UpdateCatch(Catch objCatch) 
        {
            CatchDal.GetInstance().Update(objCatch);
        }

        public void DeleteCatch(long catchId) 
        {
            CatchDal.GetInstance().Delete(catchId);
        }

        public void CreateCatchSupply(CatchSupply catchSupply) 
        {
            CatchDal.GetInstance().CreateCatchSupply(catchSupply);
        }

        public void UpdateCatchSupply(CatchSupply catchSupply) 
        {
            CatchDal.GetInstance().UpdateCatchSupply(catchSupply);
        }

        public void DeleteCatchSupply(long catchId, short supplyId) 
        {
            CatchDal.GetInstance().DeleteCatchSupply(catchId, supplyId);
        }

        public void CreateCatchGrade(CatchGrade catchGrade) 
        {
            CatchDal.GetInstance().CreateCatchGrade(catchGrade);
        }

        public void UpdateCatchGrade(CatchGrade catchGrade) 
        {
            CatchDal.GetInstance().UpdateCatchGrade(catchGrade);
        }

        public void DeleteCatchGrade(long catchId, int gradeId) 
        {
            CatchDal.GetInstance().DeleteCatchGrade(catchId, gradeId);
        }

        public void CreateCatchBreakdown(CatchBreakdown catchBreakdown) 
        {
            CatchDal.GetInstance().CreateCatchBreakdown(catchBreakdown);
        }

        public void UpdateCatchBreakdown(CatchBreakdown catchBreakdown) 
        {
            CatchDal.GetInstance().UpdateCatchBreakdown(catchBreakdown);
        }

        public void DeleteCatchBreakdown(long catchId, short day) 
        {
            CatchDal.GetInstance().DeleteCatchBreakdown(catchId, day);
        }


	}
}
