namespace Ahr.Psi.Domain.Entitys
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ProductUnit")]
    public partial class ProductUnit
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ProductUnit()
        {
            Product = new HashSet<Product>();
        }

        [Key]
        [StringLength(20)]
        public string UnitId { get; set; }

        [Required]
        [StringLength(20)]
        public string UnitName { get; set; }

        public DateTime? CreateTime { get; set; }

        public DateTime? UpdateTime { get; set; }

        [StringLength(30)]
        public string UserId { get; set; }

        [StringLength(30)]
        public string UserIp { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Product> Product { get; set; }
    }
}
