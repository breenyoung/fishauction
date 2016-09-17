using System;
using System.Collections;

using Components.Entities;
using Components.Dal;

namespace Components.Bcl
{
	/// <summary>
	/// Summary description for SpeciesBcl.
	/// </summary>
	public class SpeciesBcl
	{
        private static SpeciesBcl myInstance = null;

        public static SpeciesBcl GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new SpeciesBcl();
            }

            return myInstance;

        }

		private SpeciesBcl()
		{
		}

        public Species GetSpeciesById(int id) 
        {
            Species species = SpeciesDal.GetInstance().GetById(id);
            return species;
        }

        public ArrayList GetAllSpecies() 
        {
            ArrayList all = SpeciesDal.GetInstance().GetAll();
            return all;
        }


	}
}
