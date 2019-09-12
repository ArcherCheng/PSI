using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Ahr.Psi.Domain.Entitys;
using Ahr.Psi.Domain.Interfaces.Repositorys;
using Ahr.Psi.Domain.Base;
using System.Data.Entity;

namespace Ahr.Psi.Dal.Repositorys
{
    public class Procuct2Repository : EntityRepository<Product2>, IProduct2Repository
    {
        public void DeleteInclude(int id)
        {
            throw new NotImplementedException();
        }

        public Product FindByIDIncludePH(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Product2> FindProductsByName(string name)
        {
            var prodcuts = dbSet.Where(p => p.ProductName.Contains(name));
            return prodcuts;
        }

        public IEnumerable<Product> ProductsAdjustment()
        {
            throw new NotImplementedException();
        }
    }
}
