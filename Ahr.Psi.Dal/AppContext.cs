namespace Ahr.Psi.Dal
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    using Ahr.Psi.Domain.Entitys;
    using Ahr.Psi.Dal.ModelConfigurations;

    public partial class AppContext : DbContext
    {
        public AppContext()
            : base("name=Model1")
        {
        }

        public virtual DbSet<Customer> Customer { get; set; }
        public virtual DbSet<InStockDetail> InStockDetail { get; set; }
        public virtual DbSet<InStockMaster> InStockMaster { get; set; }
        public virtual DbSet<Product> Product { get; set; }
        public virtual DbSet<Product2> Product2 { get; set; }
        public virtual DbSet<ProductCategory> ProductCategory { get; set; }
        public virtual DbSet<ProductUnit> ProductUnit { get; set; }
        public virtual DbSet<PurchaseDetail> PurchaseDetail { get; set; }
        public virtual DbSet<PurchaseMaster> PurchaseMaster { get; set; }
        public virtual DbSet<SaleDetail> SaleDetail { get; set; }
        public virtual DbSet<SaleMaster> SaleMaster { get; set; }
        public virtual DbSet<SysTransLog> SysTransLog { get; set; }
        public virtual DbSet<SysUserLog> SysUserLog { get; set; }
        public virtual DbSet<Vender> Vender { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new Product2Configuration());

            modelBuilder.Entity<Customer>()
                .HasMany(e => e.SaleMaster)
                .WithRequired(e => e.Customer)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<InStockMaster>()
                .HasMany(e => e.InStockDetail)
                .WithRequired(e => e.InStockMaster)
                .HasForeignKey(e => e.MasterId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Product>()
                .HasMany(e => e.InStockDetail)
                .WithRequired(e => e.Product)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Product>()
                .HasMany(e => e.PurchaseDetail)
                .WithRequired(e => e.Product)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Product>()
                .HasMany(e => e.SaleDetail)
                .WithRequired(e => e.Product)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ProductCategory>()
                .HasMany(e => e.Product)
                .WithRequired(e => e.ProductCategory)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ProductUnit>()
                .HasMany(e => e.Product)
                .WithRequired(e => e.ProductUnit)
                .HasForeignKey(e => e.CategoryId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PurchaseMaster>()
                .HasMany(e => e.PurchaseDetail)
                .WithRequired(e => e.PurchaseMaster)
                .HasForeignKey(e => e.MasterId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SaleMaster>()
                .HasMany(e => e.SaleDetail)
                .WithRequired(e => e.SaleMaster)
                .HasForeignKey(e => e.MasterId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Vender>()
                .HasMany(e => e.InStockMaster)
                .WithRequired(e => e.Vender)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Vender>()
                .HasMany(e => e.PurchaseMaster)
                .WithRequired(e => e.Vender)
                .WillCascadeOnDelete(false);
        }
    }
}
