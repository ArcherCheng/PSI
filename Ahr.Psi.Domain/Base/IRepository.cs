using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ahr.Psi.Domain.Base
{
    public interface IRepository<TEntity> where TEntity : EntityBase<int>
    {
        TEntity FindById(int id);
        IEnumerable<TEntity> FindAll();

        void Add(TEntity entity);
        void Update(TEntity entity);
        void Delete(TEntity entity);
    }
}
