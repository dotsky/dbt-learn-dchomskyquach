
with source as (

    select * from {{ source('ticket_tailor', 'issued_tickets') }}

),

renamed as (

    select
        barcode,
        barcode_url,
        created_at,
        event_id,
        id as ticket_id,
        object as ticket_object,
        order_id,
        status as ticket_status,
        ticket_type_id,
        updated_at,
        voided_at as ticket_voided_at,
        _sdc_batched_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version

    from source

)

select * from renamed