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
    public interface ICustomerService:IService<Customer,ICustomerRepository>
    {
        IEnumerable<Customer> GetCustomers(string name);
    }
}
