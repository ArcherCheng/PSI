using Ahr.Psi.Domain.Base;
using Ahr.Psi.Domain.Validations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ahr.Psi.Domain.Entitys
{
    public partial class Product2 : EntityAggregateRootBase<int>
    {
        public override Validation Validate()
        {
            var validateSpec = new ProductValidateSpec();
            Validation validation = validateSpec.Validate(this);
            return validation;
        }
    }
}
