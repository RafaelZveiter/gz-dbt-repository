{% macro margin_percent(revenue, purchase_cost, number=2) %}
    round(
        100 * (safe_divide(({{ revenue }} - {{ purchase_cost }}), {{ revenue }})),
        {{ number }}
    )
{% endmacro %}
