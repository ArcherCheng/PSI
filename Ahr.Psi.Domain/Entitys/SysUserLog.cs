namespace Ahr.Psi.Domain.Entitys
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SysUserLog")]
    public partial class SysUserLog
    {
        public long Id { get; set; }

        [Required]
        [StringLength(30)]
        public string UserId { get; set; }

        [StringLength(255)]
        public string Refer { get; set; }

        [StringLength(255)]
        public string Destination { get; set; }

        [StringLength(255)]
        public string QueryString { get; set; }

        [StringLength(30)]
        public string Method { get; set; }

        [StringLength(30)]
        public string IpAddress { get; set; }

        public DateTime? RequestTime { get; set; }
    }
}
