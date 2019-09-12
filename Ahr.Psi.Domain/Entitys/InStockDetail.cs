namespace Ahr.Psi.Domain.Entitys
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("InStockDetail")]
    public partial class InStockDetail
    {
        public int Id { get; set; }

        public int MasterId { get; set; }

        [Required]
        [StringLength(20)]
        public string ProductId { get; set; }

        public int Qty { get; set; }

        public int Price { get; set; }

        public int Total { get; set; }

        [Required]
        [StringLength(500)]
        public string Notes { get; set; }

        public DateTime? CreateTime { get; set; }

        public DateTime? UpdateTime { get; set; }

        [StringLength(30)]
        public string UserId { get; set; }

        [StringLength(30)]
        public string UserIp { get; set; }

        public virtual InStockMaster InStockMaster { get; set; }

        public virtual Product Product { get; set; }
    }
}
