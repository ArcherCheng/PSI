using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ahr.Psi.Domain
{
    public class ValidationRule
    {
        private readonly string _ruleMessage;

        public ValidationRule(string ruleMessage)
        {
            this._ruleMessage = ruleMessage; 
        }

        public string RuleMessage
        {
            get { return this._ruleMessage; }
        }

    }
}
