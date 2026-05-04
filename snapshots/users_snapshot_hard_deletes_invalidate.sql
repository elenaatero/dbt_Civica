{% snapshot users_snapshot_hard_deletes_invalidate %}

{{
    config(
        target_schema='snapshots',
        unique_key='DNI',
        strategy='timestamp',
        updated_at='fecha_alta_sistema',
        hard_deletes='invalidate'
    )
}}

SELECT
    Nombre,
    DNI,
    email,
    fecha_alta_sistema
FROM {{ source('google_sheets', 'users') }}

{% endsnapshot %}