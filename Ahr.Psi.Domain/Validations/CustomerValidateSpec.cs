using Ahr.Psi.Domain.Base;
using Ahr.Psi.Domain.Entitys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ahr.Psi.Domain.Validations
{
    public partial class CustomerValidateSpec : IValidateSpec<Customer>
    {
        Validation validation = new Validation();

        public Validation Validate(Customer entity)
        {
            if (entity.CustomerName.Length < 2)
            {
                string errMsg = "客戶名稱最少要兩個字以上";
                validation.AddRule(new ValidationRule(errMsg));
            }
            return validation;
        }
    }
}
