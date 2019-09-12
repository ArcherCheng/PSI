namespace Ahr.Psi.Domain.Entitys
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            InStockDetail = new HashSet<InStockDetail>();
            PurchaseDetail = new HashSet<PurchaseDetail>();
            SaleDetail = new HashSet<SaleDetail>();
        }

        [StringLength(20)]
        public string ProductId { get; set; }

        [Required]
        [StringLength(60)]
        public string ProductName { get; set; }

        [Required]
        [StringLength(20)]
        public string CategoryId { get; set; }

        [Required]
        [StringLength(20)]
        public string UnitId { get; set; }

        [Required]
        [StringLength(30)]
        public string BarCode { get; set; }

        public int CostPrice { get; set; }

        public int SellingPrice { get; set; }

        public int SuggestPrice { get; set; }

        public int StockQty { get; set; }

        public int MaxQty { get; set; }

        public int MinQty { get; set; }

        [Required]
        [StringLength(500)]
        public string Notes { get; set; }

        public DateTime? CreateTime { get; set; }

        public DateTime? UpdateTime { get; set; }

        [StringLength(30)]
        public string UserId { get; set; }

        [StringLength(30)]
        public string UserIp { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<InStockDetail> InStockDetail { get; set; }

        public virtual ProductCategory ProductCategory { get; set; }

        public virtual ProductUnit ProductUnit { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PurchaseDetail> PurchaseDetail { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SaleDetail> SaleDetail { get; set; }
    }
}
