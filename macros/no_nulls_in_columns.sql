{% macro no_nulls_in_columns(model) %}
    SELECT * FROM {{ model }} WHERE 
    {% for col in adapter.get_columns_in_relation(model) -%} --iterate through every column
        {{ col.column }} IS NULL OR --where column name is null or next...
    {% endfor %}
    FALSE
{% endmacro %}
