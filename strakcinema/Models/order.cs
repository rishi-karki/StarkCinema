namespace strakcinema
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class order
    {
        [Key]
        public int order_id { get; set; }

        public int user_id { get; set; }

        public int? show_id { get; set; }

        public int total_tickets { get; set; }

        public double total_cost { get; set; }

        [Column(TypeName = "date")]
        public DateTime date { get; set; }

        public int? card_id { get; set; }

        public virtual creditcard creditcard { get; set; }

        public virtual show show { get; set; }

        public virtual user user { get; set; }
    }
}
