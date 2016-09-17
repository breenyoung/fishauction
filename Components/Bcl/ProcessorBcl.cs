using System;
using System.Collections;

using Components.Entities;
using Components.Dal;

namespace Components.Bcl
{
	/// <summary>
	/// Summary description for ProcessorBcl.
	/// </summary>
	public class ProcessorBcl
	{
        private static ProcessorBcl myInstance = null;

        public static ProcessorBcl GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new ProcessorBcl();
            }

            return myInstance;

        }

        private ProcessorBcl()
        {
        }

        public Processor GetProcessorById(int id) 
        {
            Processor proc = ProcessorDal.GetInstance().GetById(id);
            return proc;
        }

        public ArrayList GetAllProcessors() 
        {
            ArrayList all = ProcessorDal.GetInstance().GetAll();
            return all;
        }
    }
}
