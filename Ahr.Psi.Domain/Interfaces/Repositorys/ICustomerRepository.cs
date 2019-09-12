using Ahr.Psi.Domain.Base;
using Ahr.Psi.Domain.Entitys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ahr.Psi.Domain.Interfaces.Repositorys
{
    public interface ICustomerRepository : IRepository<Customer>, IUnitOfWorkRepository
    {
        IEnumerable<Customer> FindByName(string name);
    }
}
