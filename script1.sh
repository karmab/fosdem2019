{% for package in packages %}
yum -y install {{ package }}
{% endfor%}
