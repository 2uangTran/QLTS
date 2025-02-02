//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QuanLyTaiSan_UserManagement.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class DeviceType
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DeviceType()
        {
            this.Devices = new HashSet<Device>();
            this.DeviceTypeComponantTypes = new HashSet<DeviceTypeComponantType>();
            this.DeviceTypeComponantTypes1 = new HashSet<DeviceTypeComponantType>();
            this.RequestDevices = new HashSet<RequestDevice>();
        }
    
        public int Id { get; set; }
        public string TypeName { get; set; }
        public string TypeSymbol { get; set; }
        public string Notes { get; set; }
        public Nullable<int> OrderCode { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Device> Devices { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DeviceTypeComponantType> DeviceTypeComponantTypes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DeviceTypeComponantType> DeviceTypeComponantTypes1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RequestDevice> RequestDevices { get; set; }
    }
}
