namespace strakcinema
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class DataModel : DbContext
    {
        public DataModel()
            : base("name=DataModel")
        {
        }

        public virtual DbSet<creditcard> creditcards { get; set; }
        public virtual DbSet<movy> movies { get; set; }
        public virtual DbSet<order> orders { get; set; }
        public virtual DbSet<show> shows { get; set; }
        public virtual DbSet<theater> theaters { get; set; }
        public virtual DbSet<user> users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<creditcard>()
                .Property(e => e.card_type)
                .IsUnicode(false);

            modelBuilder.Entity<creditcard>()
                .Property(e => e.card_name)
                .IsUnicode(false);

            modelBuilder.Entity<creditcard>()
                .Property(e => e.card_expiry)
                .IsUnicode(false);

            modelBuilder.Entity<creditcard>()
                .Property(e => e.card_cvv)
                .HasPrecision(3, 0);

            modelBuilder.Entity<movy>()
                .Property(e => e.movie_name)
                .IsUnicode(false);

            modelBuilder.Entity<movy>()
                .Property(e => e.genre)
                .IsUnicode(false);

            modelBuilder.Entity<movy>()
                .Property(e => e.runtime)
                .IsUnicode(false);

            modelBuilder.Entity<movy>()
                .Property(e => e.release_date)
                .IsUnicode(false);

            modelBuilder.Entity<movy>()
                .Property(e => e.language)
                .IsUnicode(false);

            modelBuilder.Entity<movy>()
                .Property(e => e.subtitle)
                .IsUnicode(false);

            modelBuilder.Entity<movy>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<movy>()
                .Property(e => e.image_path)
                .IsUnicode(false);

            modelBuilder.Entity<movy>()
                .Property(e => e.video_path)
                .IsUnicode(false);

            modelBuilder.Entity<movy>()
                .Property(e => e.rating)
                .IsUnicode(false);

            modelBuilder.Entity<movy>()
                .Property(e => e.director)
                .IsUnicode(false);

            modelBuilder.Entity<movy>()
                .HasMany(e => e.shows)
                .WithRequired(e => e.movy)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<order>()
                .Property(e => e.total_cost);

            modelBuilder.Entity<show>()
                .Property(e => e.price);

            modelBuilder.Entity<theater>()
                .Property(e => e.theater_name)
                .IsUnicode(false);

            modelBuilder.Entity<theater>()
                .Property(e => e.city)
                .IsUnicode(false);

            modelBuilder.Entity<theater>()
                .Property(e => e.country)
                .IsUnicode(false);

            modelBuilder.Entity<theater>()
                .HasMany(e => e.shows)
                .WithRequired(e => e.theater)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<user>()
                .Property(e => e.last_name)
                .IsUnicode(false);

            modelBuilder.Entity<user>()
                .Property(e => e.first_name)
                .IsUnicode(false);

            modelBuilder.Entity<user>()
                .Property(e => e.phone);

            modelBuilder.Entity<user>()
                .Property(e => e.street_no);

            modelBuilder.Entity<user>()
                .Property(e => e.street_name)
                .IsUnicode(false);

            modelBuilder.Entity<user>()
                .Property(e => e.city)
                .IsUnicode(false);

            modelBuilder.Entity<user>()
                .Property(e => e.province)
                .IsUnicode(false);

            modelBuilder.Entity<user>()
                .Property(e => e.postal_code)
                .IsUnicode(false);

            modelBuilder.Entity<user>()
                .Property(e => e.country)
                .IsUnicode(false);

            modelBuilder.Entity<user>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<user>()
                .Property(e => e.password)
                .IsUnicode(false);

            modelBuilder.Entity<user>()
                .HasMany(e => e.orders)
                .WithRequired(e => e.user)
                .WillCascadeOnDelete(false);
        }
    }
}
