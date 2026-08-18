chpwd() {
   if [[ -d .venv ]]; then
      source .venv/bin/activate
   elif [[ -d venv ]]; then
     source venv/bin/activate
  elif [[ -n "$VIRUAL_ENV" ]]; then 
    deactivate
   fi
}
