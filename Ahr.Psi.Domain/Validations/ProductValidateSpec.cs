using Ahr.Psi.Domain.Base;
using Ahr.Psi.Domain.Entitys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ahr.Psi.Domain.Validations
{
    public class ProductValidateSpec : IValidateSpec<Product2>
    {
        private readonly Validation _validation = new Validation();

        public Validation Validate(Product2 entity)
        {
            if (entity.CostPrice < 0)
            {
                string errMsg = "商品成本價格不可以小於0";
                this._validation.AddRule(new ValidationRule(errMsg));
            }

            if (entity.ProductName.Length < 2)
            {
                string errMsg = "商品名稱必須兩個字以上";
                this._validation.AddRule(new ValidationRule(errMsg));
            }
            return this._validation;
        }
    }
}
