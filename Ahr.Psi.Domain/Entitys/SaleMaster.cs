namespace Ahr.Psi.Domain.Entitys
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SaleMaster")]
    public partial class SaleMaster
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SaleMaster()
        {
            SaleDetail = new HashSet<SaleDetail>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(20)]
        public string SaleId { get; set; }

        [Required]
        [StringLength(20)]
        public string PurchaseId { get; set; }

        [Required]
        [StringLength(20)]
        public string CustomerId { get; set; }

        [StringLength(10)]
        public string PaymentType { get; set; }

        [Column(TypeName = "date")]
        public DateTime SaleDate { get; set; }

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

        public virtual Customer Customer { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SaleDetail> SaleDetail { get; set; }
    }
}
