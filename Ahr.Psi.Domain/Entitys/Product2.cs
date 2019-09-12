namespace Ahr.Psi.Domain.Entitys
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using Ahr.Psi.Domain.Base;

    [Table("Product2")]
    public partial class Product2 : EntityAggregateRootBase<int>
    {
        public int Id { get; set; }

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

    }
}
