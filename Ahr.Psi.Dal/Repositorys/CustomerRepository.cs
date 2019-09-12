using Ahr.Psi.Domain.Entitys;
using Ahr.Psi.Domain.Interfaces.Repositorys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ahr.Psi.Dal.Repositorys
{
    public class CustomerRepository : EntityRepository<Customer>, ICustomerRepository
    {
        public IEnumerable<Customer> FindByName(string name)
        {
            var customers = dbSet.Where(x => x.CustomerName.Contains(name));
            return customers;
        }
    }
}
