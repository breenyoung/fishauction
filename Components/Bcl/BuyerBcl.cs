using System;
using System.Collections;

using Components.Dal;
using Components.Entities;

namespace Components.Bcl
{
    /// <summary>
    /// Summary description for BuyerBcl.
    /// </summary>
    public class BuyerBcl
    {


        private static BuyerBcl myInstance = null;

        public static BuyerBcl GetInstance() 
        {
            if(myInstance == null) 
            {
                myInstance = new BuyerBcl();
            }

            return myInstance;

        }

        private BuyerBcl()
        {
        }

        public Buyer GetUserById(long id) 
        {
            Buyer oneBuyer = BuyerDal.GetInstance().GetById(id);
            return oneBuyer;
        }

        public Buyer GetBuyerByUsername(string username) 
        {
            Buyer oneBuyer = BuyerDal.GetInstance().GetByUsername(username);
            return oneBuyer;
        }

        public ArrayList GetSpeciesForBuyer(long buyerId) 
        {
            ArrayList species 
                = BuyerDal.GetInstance().GetSpeciesForBuyer(buyerId);

            return species;
        }

        public void CreateBuyer(Buyer buyer) 
        {
            BuyerDal.GetInstance().Create(buyer);
        }

        public void UpdateBuyer(Buyer buyer) 
        {
            BuyerDal.GetInstance().Update(buyer);
        }

        public void DeleteBuyer(long buyerId) 
        {
            BuyerDal.GetInstance().Delete(buyerId);
        }

        public void CreateBuyerSpecies(BuyerSpecies buyerSpecies) 
        {
            BuyerDal.GetInstance().CreateBuyerSpecies(buyerSpecies);
        }

        public void DeleteBuyerSpecies(long buyerId, int speciesId) 
        {
            BuyerDal.GetInstance().DeleteBuyerSpecies(buyerId, speciesId);
        }

    }
}
