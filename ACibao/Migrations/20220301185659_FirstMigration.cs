using Microsoft.EntityFrameworkCore.Migrations;

namespace ACibao.Migrations
{
    public partial class FirstMigration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "itemdata",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    itemname = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    cedula = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    itemnum = table.Column<int>(type: "int", nullable: false),
                    itemtypegroupnum = table.Column<int>(type: "int", nullable: false),
                    itemtypenum = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_itemdata", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "itemdatapage",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    itemnum = table.Column<int>(type: "int", nullable: false),
                    logicalplatternum = table.Column<int>(type: "int", nullable: false),
                    diskgroupnum = table.Column<int>(type: "int", nullable: false),
                    FILEPATH = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_itemdatapage", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "physicalplatter",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    logicalplatternum = table.Column<int>(type: "int", nullable: false),
                    physicalplatternum = table.Column<int>(type: "int", nullable: false),
                    diskgroupnum = table.Column<int>(type: "int", nullable: false),
                    LASTUSEDDRIVE = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_physicalplatter", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "PowerInfo",
                columns: table => new
                {
                    itemname = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    PATH = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "itemdata");

            migrationBuilder.DropTable(
                name: "itemdatapage");

            migrationBuilder.DropTable(
                name: "physicalplatter");

            migrationBuilder.DropTable(
                name: "PowerInfo");
        }
    }
}
