{% macro learn_logging() %}
    {{ log("call learn_logging", info=True) }}
{% endmacro %}