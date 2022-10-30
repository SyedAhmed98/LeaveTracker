using System;
using System.Collections.Generic;

namespace LeaveTrackerComponentLibrary.Models
{
    public partial class User
    {
        public User()
        {
            Holidays = new HashSet<Holiday>();
        }

        public int Idusers { get; set; }
        public int? Roleid { get; set; }
        public int? Departmentid { get; set; }
        public string? Username { get; set; }
        public string? Password { get; set; }
        public string? Fname { get; set; }
        public string? Lname { get; set; }
        public string? Phonenumber { get; set; }
        public DateTime? Datejoined { get; set; }
        public int? Holidayentitlement { get; set; }

        public virtual Department? Department { get; set; }
        public virtual Role? Role { get; set; }
        public virtual ICollection<Holiday> Holidays { get; set; }
    }
}
