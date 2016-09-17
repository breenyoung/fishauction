using System;
using System.Collections;

using Components.Entities;
using Components.Dal;

namespace Components.Bcl
{
	/// <summary>
	/// Summary description for GradeBcl.
	/// </summary>
	public class GradeBcl
	{

        private static GradeBcl myInstance = null;

        public static GradeBcl GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new GradeBcl();
            }

            return myInstance;

        }

		private GradeBcl()
		{
		}

        public Grade GetGradeById(int id) 
        {
            Grade grade = GradeDal.GetInstance().GetById(id);
            return grade;
        }

        public ArrayList GetAllGrades() 
        {
            ArrayList all = GradeDal.GetInstance().GetAll();
            return all;
        }


	}
}
