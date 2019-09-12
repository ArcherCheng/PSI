using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ahr.Psi.Domain
{
    public class Validation
    {
        private readonly List<ValidationRule> _validationRules = new List<ValidationRule>();

        public IEnumerable<ValidationRule> GetRules()
        {
            return this._validationRules;
        }

        public void AddRule(ValidationRule rule)
        {
            this._validationRules.Add(rule);
        }
    }
}
