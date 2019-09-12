using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Ahr.Psi.Domain.Base;

namespace Ahr.Psi.Dal
{
    public class EntityRepository<T> : IRepository<T>, IUnitOfWorkRepository where T : EntityAggregateRootBase<int>
    {
        internal AppContext db;
        internal DbSet<T> dbSet;

        public DbContext Context
        {
            set
            {
                db = (AppContext)value;
                dbSet = db.Set<T>();

            }
        }

        public void Add(T entity)
        {
            dbSet.Add(entity);
        }

        public void Delete(T entity)
        {
            dbSet.Remove(entity);
        }

        public IEnumerable<T> FindAll()
        {
            return dbSet;
        }

        public T FindById(int id)
        {
            return dbSet.Find(id);
        }

        public void Update(T entity)
        {
            var entry = db.Entry(entity);
            dbSet.Attach(entity);
            entry.State = EntityState.Modified;
        }
    }
}
