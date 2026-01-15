 function chpwd() {
       if [[ -z "$VIRTUAL_ENV" ]]; then
           elif [[ -f .venv/bin/activate ]]; then
               source .venv/bin/activate
       elif [[ "$VIRTUAL_ENV" != "$(pwd)"* ]]; then
           deactivate
           elif [[ -f .venv/bin/activate ]]; then
               source .venv/bin/activate
           fi
       fi
   }
