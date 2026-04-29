{{ 
    config(
        materialized='table',
        tags= ['silver'],
        
    ) 
}}

with 

source as (

    select * from {{ source('postgres_db', 'ADDRESSES') }}

),

renamed as (

    select
        address_id,
        zipcode,
        country,
        address,
        state,
        _fivetran_deleted,
        _fivetran_synced

    from source

)

select * from renamed