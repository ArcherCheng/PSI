using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ahr.Psi.Domain.Base
{
    public interface IValidateSpec<Tentity> where Tentity : class
    {
        Validation Validate(Tentity entity);
    }
}
