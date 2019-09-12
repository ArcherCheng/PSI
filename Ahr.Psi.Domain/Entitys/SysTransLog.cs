namespace Ahr.Psi.Domain.Entitys
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SysTransLog")]
    public partial class SysTransLog
    {
        public long Id { get; set; }

        [Required]
        [StringLength(30)]
        public string TableName { get; set; }

        public string InsertData { get; set; }

        public string DeleteData { get; set; }

        public byte IudType { get; set; }

        public DateTime? WriteTime { get; set; }
    }
}
