using System;
using System.Configuration;

namespace Components.Utils.Configuration
{
	/// <summary>
	/// Summary description for ConfigurationManager.
	/// </summary>
	public class ConfigurationManager
	{

        private static readonly string FISH_SECTION_NAME = "GlobalVars";
        private static readonly ConfigurationManager mInstance = new ConfigurationManager();

        /// <summary>
        /// Returns an instance of this
        /// </summary>
        /// <returns>ConfigurationManager</returns>
        public static ConfigurationManager getInstance()
        {
            return mInstance;
        }

        /// <summary>
        ///Constructor: Initializes Microsoft.ApplicationBlocks.ConfigurationManagement.ConfigurationManager
        /// </summary>
        static ConfigurationManager()
        {
            try
            {
                Microsoft.ApplicationBlocks.ConfigurationManagement.ConfigurationManager.Initialize();
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }


        private ConfigurationManager()
        {
        }

        public AppConfig AppConfig
        {
            get
            {
                return (AppConfig) Microsoft.ApplicationBlocks.ConfigurationManagement.ConfigurationManager.Read(FISH_SECTION_NAME);
            }
        }


	}
}
