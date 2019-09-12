using Ahr.Psi.Domain;
using Ahr.Psi.Domain.Base;
using Ahr.Psi.Domain.Entitys;
using Ahr.Psi.Domain.Interfaces.Repositorys;
using Ahr.Psi.Domain.Interfaces.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ahr.Psi.Bll.Services
{
    public class Product2Service : DomainService<Product2, IProduct2Repository>, IProduct2Service
    {
        public Product2Service(IProduct2Repository product2Repository) : base(product2Repository)
        {

        }
        public Validation AddInclude(Product2 product)
        {
            //ProductHolding ph = new ProductHolding
            //{
            //    EntityId = product.EntityId,
            //    Quantity = 0,
            //    ReorderLevel = 0
            //};
            //product.ProductHolding = ph;

            var validation = this.Add(product);
            return validation;
        }

        public void DeleteInclude(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Product2> GetProducts(string name)
        {
            IEnumerable<Product2> products;
            if (name == null || name.Length == 0)
            {
                products = _repository.FindAll();
            }
            else
            {
                products = _repository.FindProductsByName(name);
            }
            return products;
        }

        public IEnumerable<Product2> GetProducts(int id)
        {
            var product = _repository.FindById(id);
            if (product == null)
                return null;
            else
            {
                List<Product2> products = new List<Product2>();
                products.Add(product);
                return products;
            }
        }

        public Validation Update(int id, int quantity)
        {
            throw new NotImplementedException();
        }
    }
}
