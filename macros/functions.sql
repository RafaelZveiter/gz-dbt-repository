{% macro margin_percent(revenue, purchase_cost, number = 2) %}
     ROUND(100 * (SAFE_DIVIDE( ({{revenue}} - {{purchase_cost}}) , {{revenue}})), {{number}})
 {% endmacro %}