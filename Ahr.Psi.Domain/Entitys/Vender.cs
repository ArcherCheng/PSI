namespace Ahr.Psi.Domain.Entitys
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Vender")]
    public partial class Vender
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Vender()
        {
            InStockMaster = new HashSet<InStockMaster>();
            PurchaseMaster = new HashSet<PurchaseMaster>();
        }

        [StringLength(20)]
        public string VenderId { get; set; }

        [Required]
        [StringLength(60)]
        public string VenderName { get; set; }

        [StringLength(120)]
        public string EngName { get; set; }

        [StringLength(10)]
        public string TaxId { get; set; }

        [StringLength(30)]
        public string Operator { get; set; }

        [StringLength(30)]
        public string TelNo { get; set; }

        [StringLength(30)]
        public string MobileNo { get; set; }

        [StringLength(30)]
        public string FaxNo { get; set; }

        [StringLength(6)]
        public string PostNo { get; set; }

        [StringLength(60)]
        public string Address { get; set; }

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
        public virtual ICollection<InStockMaster> InStockMaster { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PurchaseMaster> PurchaseMaster { get; set; }
    }
}
