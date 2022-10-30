using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace LeaveTrackerComponentLibrary.Models
{
    public partial class LeaveTrackerDbContext : DbContext
    {
        public LeaveTrackerDbContext()
        {
        }

        public LeaveTrackerDbContext(DbContextOptions<LeaveTrackerDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Department> Departments { get; set; } = null!;
        public virtual DbSet<Holiday> Holidays { get; set; } = null!;
        public virtual DbSet<Holidaystatus> Holidaystatuses { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=LeaveTrackerDb;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Department>(entity =>
            {
                entity.HasKey(e => e.Iddepartments)
                    .HasName("PK__departme__887FA0E75276BB22");

                entity.ToTable("departments");

                entity.Property(e => e.Iddepartments).HasColumnName("iddepartments");

                entity.Property(e => e.Departmentname)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("departmentname");
            });

            modelBuilder.Entity<Holiday>(entity =>
            {
                entity.HasKey(e => e.Idholidays)
                    .HasName("PK__holidays__0397B86A17FD2704");

                entity.ToTable("holidays");

                entity.HasIndex(e => e.Userid, "holidays_ibfk_1");

                entity.HasIndex(e => e.Holidaystatusid, "holidaystatusid");

                entity.Property(e => e.Idholidays).HasColumnName("idholidays");

                entity.Property(e => e.Holidayenddate)
                    .HasColumnType("date")
                    .HasColumnName("holidayenddate");

                entity.Property(e => e.Holidaystartdate)
                    .HasColumnType("date")
                    .HasColumnName("holidaystartdate");

                entity.Property(e => e.Holidaystatusid).HasColumnName("holidaystatusid");

                entity.Property(e => e.Prioritisation).HasColumnName("prioritisation");

                entity.Property(e => e.Userid).HasColumnName("userid");

                entity.HasOne(d => d.Holidaystatus)
                    .WithMany(p => p.Holidays)
                    .HasForeignKey(d => d.Holidaystatusid)
                    .HasConstraintName("holidays_ibfk_2");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Holidays)
                    .HasForeignKey(d => d.Userid)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("holidays_ibfk_1");
            });

            modelBuilder.Entity<Holidaystatus>(entity =>
            {
                entity.HasKey(e => e.Idholidaystatus)
                    .HasName("PK__holidays__9F65038E70779B9D");

                entity.ToTable("holidaystatus");

                entity.Property(e => e.Idholidaystatus).HasColumnName("idholidaystatus");

                entity.Property(e => e.Status)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("status");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.HasKey(e => e.Idroles)
                    .HasName("PK__roles__3544366355EBB194");

                entity.ToTable("roles");

                entity.Property(e => e.Idroles).HasColumnName("idroles");

                entity.Property(e => e.Rolename)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("rolename");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.HasKey(e => e.Idusers)
                    .HasName("PK__users__F6101F080B66DDB8");

                entity.ToTable("users");

                entity.HasIndex(e => e.Departmentid, "departmentid");

                entity.HasIndex(e => e.Roleid, "roleid");

                entity.Property(e => e.Idusers).HasColumnName("idusers");

                entity.Property(e => e.Datejoined)
                    .HasColumnType("date")
                    .HasColumnName("datejoined");

                entity.Property(e => e.Departmentid).HasColumnName("departmentid");

                entity.Property(e => e.Fname)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("fname");

                entity.Property(e => e.Holidayentitlement).HasColumnName("holidayentitlement");

                entity.Property(e => e.Lname)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("lname");

                entity.Property(e => e.Password)
                    .HasMaxLength(256)
                    .IsUnicode(false)
                    .HasColumnName("password");

                entity.Property(e => e.Phonenumber)
                    .HasMaxLength(11)
                    .IsUnicode(false)
                    .HasColumnName("phonenumber");

                entity.Property(e => e.Roleid).HasColumnName("roleid");

                entity.Property(e => e.Username)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("username");

                entity.HasOne(d => d.Department)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.Departmentid)
                    .HasConstraintName("users_ibfk_2");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.Roleid)
                    .HasConstraintName("users_ibfk_1");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
