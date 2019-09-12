using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Ahr.Psi.Domain.Base;

namespace Ahr.Psi.Dal.Base
{
    public class UnitOfWork : IUnitOfWork, IDisposable
    {
        private readonly AppContext _context = new AppContext();

        public void RegisterRepository(IUnitOfWorkRepository repository)
        {
            repository.Context = this._context;
        }

        public void Commit()
        {
            this._context.SaveChanges();
        }

        private bool disposedValue = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    this._context.Dispose();
                }
                disposedValue = true;
            }
        }

        public void Dispose()
        {
            Dispose(true);
        }


    }
}
