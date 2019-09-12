namespace Ahr.Psi.Domain.Entitys
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("InStockMaster")]
    public partial class InStockMaster
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public InStockMaster()
        {
            InStockDetail = new HashSet<InStockDetail>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(20)]
        public string InStockId { get; set; }

        [Required]
        [StringLength(20)]
        public string PurchaseId { get; set; }

        [Required]
        [StringLength(20)]
        public string VenderId { get; set; }

        [StringLength(10)]
        public string PaymentType { get; set; }

        [Column(TypeName = "date")]
        public DateTime InStockDate { get; set; }

        [StringLength(30)]
        public string Operator { get; set; }

        public int TaxRate { get; set; }

        public int TotalPreTax { get; set; }

        public int TaxAmt { get; set; }

        public int TotalAfterTax { get; set; }

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

        public virtual Vender Vender { get; set; }
    }
}
