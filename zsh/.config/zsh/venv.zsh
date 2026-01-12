 function chpwd() {
       if [[ -z "$VIRTUAL_ENV" ]]; then
           # Not in a virtual env, check for one to activate
           if [[ -f venv/bin/activate ]]; then
               source venv/bin/activate
           elif [[ -f .venv/bin/activate ]]; then
               source .venv/bin/activate
           elif [[ -f env/bin/activate ]]; then
               source env/bin/activate
           fi
       elif [[ "$VIRTUAL_ENV" != "$(pwd)"* ]]; then
           # In a virtual env from a different dir, deactivate and try to activate new one
           deactivate
           if [[ -f venv/bin/activate ]]; then
               source venv/bin/activate
           elif [[ -f .venv/bin/activate ]]; then
               source .venv/bin/activate
           elif [[ -f env/bin/activate ]]; then
               source env/bin/activate
           fi
       fi
   }
