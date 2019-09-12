using Ahr.Psi.Domain.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ahr.Psi.Dal.Base
{
    public interface IUnitOfWork
    {
        void RegisterRepository(IUnitOfWorkRepository repository);
        void Commit();
             
    }
}
