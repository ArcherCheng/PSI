using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Ahr.Psi.Domain.Base;
using Ahr.Psi.Domain.Entitys;

namespace Ahr.Psi.Domain.Interfaces.Repositorys
{
    public interface IProduct2Repository: IRepository<Product2>,IUnitOfWorkRepository
    {
        Product FindByIDIncludePH(int id);
        IEnumerable<Product2> FindProductsByName(string name);
        IEnumerable<Product> ProductsAdjustment();

        void DeleteInclude(int id);
    }
}
