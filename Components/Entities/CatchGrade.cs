using System;

namespace Components.Entities
{
	/// <summary>
	/// Summary description for CatchGrade.
	/// </summary>
	public class CatchGrade
	{

        #region Private Variables
        private long catchId;
        private int gradeId;
        private int cvalue;
        #endregion

        #region Getters/Setters
        public long CatchId
        {
            get { return catchId; }
            set { catchId = value; }
        }

        public int GradeId
        {
            get { return gradeId; }
            set { gradeId = value; }
        }

        public int Value
        {
            get { return cvalue; }
            set { cvalue = value; }
        }
        #endregion

		public CatchGrade()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
