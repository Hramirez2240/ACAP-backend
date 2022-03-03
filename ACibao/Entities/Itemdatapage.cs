namespace ACibao.Entities
{
    public class Itemdatapage : BaseEntity 
    {
        public int itemnum { get; set; }
        public int logicalplatternum { get; set; }
        public int diskgroupnum { get; set; }
        public string FILEPATH { get; set; }
    }
}
