namespace ACibao.Entities
{
    public class Itemdata : BaseEntity
    {
        public string itemname { get; set; }
        public string cedula { get; set; }
        public int itemnum { get; set; }
        public int itemtypegroupnum { get; set; }
        public int itemtypenum { get; set; }
    }
}
