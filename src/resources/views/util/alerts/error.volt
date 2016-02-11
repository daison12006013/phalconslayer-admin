{# Error Messages #}
{% if di().get('flash').has('error')  %}
    <div class="alert alert-danger">
        {{ di().get('flash').get('error') }}
    </div>
{% endif %}