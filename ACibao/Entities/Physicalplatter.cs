namespace ACibao.Entities
{
    public class Physicalplatter : BaseEntity
    {
        public int logicalplatternum { get; set; }
        public int physicalplatternum { get; set; }
        public int diskgroupnum { get; set; }
        public string LASTUSEDDRIVE { get; set; }
    }
}
