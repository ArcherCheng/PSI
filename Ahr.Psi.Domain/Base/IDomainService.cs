using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ahr.Psi.Domain.Base
{
    public interface IDomainService<TEntity>
    {
        TEntity FindById(int id);
        IEnumerable<TEntity> FindAll();
        Validation Add(TEntity entity);
        Validation Update(TEntity entity);
        Validation Delete(int id);
    }
}
