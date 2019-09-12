using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ahr.Psi.Domain
{
    public abstract class EntityBase<T> : IEqualityComparer<EntityBase<T>>
    {
        private readonly Validation _validation = new Validation();

        public T EntityId { get; set; }

        public bool Equals(EntityBase<T> x, EntityBase<T> y)
        {
            return x.EntityId.ToString() == y.EntityId.ToString();
        }

        public int GetHashCode(EntityBase<T> obj)
        {
            if (obj == null)
                return 0;
            else
                return obj.EntityId.GetHashCode();
        }

        public abstract Validation Validate();

        //protected void AddRule(string msg)
        //{
        //    ValidationRule rule = new ValidationRule(msg);
        //    this._validation.AddRule(rule);
        //}

        //protected List<ValidationRule> GetRules()
        //{
        //    return this._validation.GetRules().ToList();
        //}


        //public Validation EntityValidation
        //{
        //    get { return this.validation; }
        //}


    }
}
