{% macro learn_variables() %}
    {% set your_name = 'Sen' %}
    {{ log("Hello" ~ your_name, info=True) }}
    {{ log("Hello dbt user "~ var("user_name", "no user name"), info=True) }}
{% endmacro %}
