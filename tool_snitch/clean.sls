# vim: ft=sls

{#-
    *Meta-state*.

    Undoes everything performed in the ``tool_snitch`` meta-state
    in reverse order.
#}

include:
  - .license.clean
  - .package.clean
