using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ahr.Psi.Domain.Base
{
    public abstract class DomainService<TEntity, TRepository, TService> : IDomainService<TEntity>
        where TEntity : EntityBase<int>
        where TRepository : IRepository<TEntity>
        where TService: IService<TEntity, TRepository>
    {
        protected TRepository _repository;

        public DomainService(TRepository repository)
        {
            _repository = repository;
        }

        public TRepository DomainRepository
        {
            get { return _repository; }
        }

        public Validation Add(TEntity entity)
        {
            var validation = entity.Validate();
            if (!(validation.GetRules().Count() > 0))
            {
                _repository.Add(entity);
            }
            return validation;
        }

        public Validation Delete(int id)
        {
            var entity = _repository.FindById(id);
            var validation = ValidateExistingEntity(entity);
            if (!(validation.GetRules().Count() > 0))
            {
                _repository.Delete(entity);
            }
            return validation;
        }

        protected Validation ValidateExistingEntity(TEntity entity)
        {
            Validation validation = new Validation();
            if(entity == null)
            {
                validation.AddRule(new ValidationRule(""));
            }
            return validation;
        }

        public TEntity Get(int id)
        {
            TEntity entity = _repository.FindById(id);
            return entity;
        }

        public IEnumerable<TEntity> GetAll()
        {
            var list = _repository.FindAll();
            return list;
        }

        public Validation Update(TEntity entity)
        {
            var validation = entity.Validate();
            if (!(validation.GetRules().Count() > 0))
            {
                _repository.Update(entity);
            }
            return validation;
        }

        public TEntity FindById(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<TEntity> FindAll()
        {
            throw new NotImplementedException();
        }
    }
}
