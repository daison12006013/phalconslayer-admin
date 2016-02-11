{# Success Messages #}
{% if di().get('flash').has('success')  %}
    <div class="alert alert-success">
        {{ di().get('flash').get('success') }}
    </div>
{% endif %}