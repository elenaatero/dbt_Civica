{% snapshot users_snapshot_hard_deletes_newrecord %}

{{
    config(
        target_schema='snapshots',
        unique_key='DNI',
        strategy='timestamp',
        updated_at='fecha_alta_sistema',
        hard_deletes='new_record'
    )
}}

SELECT
    Nombre,
    DNI,
    email,
    fecha_alta_sistema
FROM {{ source('google_sheets', 'users') }}

{% endsnapshot %}