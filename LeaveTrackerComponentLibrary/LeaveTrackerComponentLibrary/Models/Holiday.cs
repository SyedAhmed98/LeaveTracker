using System;
using System.Collections.Generic;

namespace LeaveTrackerComponentLibrary.Models
{
    public partial class Holiday
    {
        public int Idholidays { get; set; }
        public int? Userid { get; set; }
        public int? Holidaystatusid { get; set; }
        public DateTime? Holidaystartdate { get; set; }
        public DateTime? Holidayenddate { get; set; }
        public int? Prioritisation { get; set; }

        public virtual Holidaystatus? Holidaystatus { get; set; }
        public virtual User? User { get; set; }
    }
}
