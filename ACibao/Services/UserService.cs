using ACibao.Entities;
using Microsoft.AspNetCore.Http;
using System.Linq;
using System.Threading.Tasks;

namespace ACibao.Services
{

    public class UserService
    {
        private readonly IHttpContextAccessor _accessor;
        public UserAd GetCurrentADUser()
        {
            var adUser = new UserAd
            {
                Id = int.Parse(_accessor.HttpContext.User.Claims.FirstOrDefault(x => x.Type == "http://schemas.microsoft.com/identity/claims/objectidentifier")?.Value),
                Name = _accessor.HttpContext.User.Claims.FirstOrDefault(x => x.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/givenname")?.Value,
                Surname = _accessor.HttpContext.User.Claims.FirstOrDefault(x => x.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/surname")?.Value,
                Email = _accessor.HttpContext.User.Claims.FirstOrDefault(x => x.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/upn")?.Value,
                TenantId = _accessor.HttpContext.User.Claims.FirstOrDefault(x => x.Type == "http://schemas.microsoft.com/identity/claims/tenantid")?.Value
            };

            return adUser;
        }
    }
}
