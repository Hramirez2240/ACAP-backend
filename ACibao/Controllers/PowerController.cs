using ACibao.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace ACibao.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PowerController : ControllerBase
    {
        private readonly IGetPowerInfo _getpowerinfo;

        public PowerController(IGetPowerInfo getpowerinfo)
        {
            _getpowerinfo = getpowerinfo;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var result = await _getpowerinfo.PowerInfo();

            return Ok(result);
        }

        [HttpGet("[action]/{cedula}")]
        public async Task<IActionResult> Get(string cedula)
        {
            var result = await _getpowerinfo.PowerInfoCedula(cedula);

            return Ok(result);
        }

        /*[HttpGet("Current")]
        public async Task<IActionResult> GetCurrentUser()
        {

        }*/
    }
}
