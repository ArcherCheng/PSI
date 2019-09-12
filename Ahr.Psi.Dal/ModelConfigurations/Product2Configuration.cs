using Ahr.Psi.Domain.Entitys;
using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ahr.Psi.Dal.ModelConfigurations
{
    public class Product2Configuration:EntityTypeConfiguration<Product2>
    {
        public Product2Configuration()
        {
            this.ToTable("Product2");

            this.HasKey(x => x.EntityId)
                .Property(x => x.EntityId)
                .HasColumnName("Id");

            this.Property(x => x.ProductName).IsRequired();

            this.Property(x => x.SellingPrice).IsRequired();
        }
    }
}
