using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(RotaryDistVoting.Startup))]
namespace RotaryDistVoting
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
