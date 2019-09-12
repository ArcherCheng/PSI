using Ahr.Psi.Domain.Base;
using Ahr.Psi.Domain.Entitys;
using Ahr.Psi.Domain.Interfaces.Repositorys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ahr.Psi.Domain.Interfaces.Services
{
    public interface IProduct2Service : IService<Product2,IProduct2Repository>
    {
        IEnumerable<Product2> GetProducts(string name);
        IEnumerable<Product2> GetProducts(int id);
        //
        Validation AddInclude(Product2 product);
        Validation Update(int id, int quantity);
        void DeleteInclude(int id);
    }
}
