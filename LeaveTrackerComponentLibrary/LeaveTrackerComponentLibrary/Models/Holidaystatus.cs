using System;
using System.Collections.Generic;

namespace LeaveTrackerComponentLibrary.Models
{
    public partial class Holidaystatus
    {
        public Holidaystatus()
        {
            Holidays = new HashSet<Holiday>();
        }

        public int Idholidaystatus { get; set; }
        public string? Status { get; set; }

        public virtual ICollection<Holiday> Holidays { get; set; }
    }
}
