using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ahr.Psi.Domain.Base
{
    public interface IService<TEntity, TRepository>
    {
        TRepository DomainRepository { get; }
        TEntity Get(int id);
        IEnumerable<TEntity> GetAll();
        Validation Add(TEntity entity);
        Validation Update(TEntity entity);
        Validation Delete(int id);

    }
}
