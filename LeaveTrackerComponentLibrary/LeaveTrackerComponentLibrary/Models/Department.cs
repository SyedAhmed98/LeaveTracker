using System;
using System.Collections.Generic;

namespace LeaveTrackerComponentLibrary.Models
{
    public partial class Department
    {
        public Department()
        {
            Users = new HashSet<User>();
        }

        public int Iddepartments { get; set; }
        public string? Departmentname { get; set; }

        public virtual ICollection<User> Users { get; set; }
    }
}
