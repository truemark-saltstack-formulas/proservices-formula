{% if grains['virtual'] == 'VMware' %}
open-vm-tools:
  pkg.installed
haveged:
  pkg.installed
{% endif %}