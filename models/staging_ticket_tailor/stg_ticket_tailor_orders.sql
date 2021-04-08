with source as (

    select * from {{ source('ticket_tailor', 'orders') }}

),

renamed as (

    select
        created_at,
        currency,
        event_summary,
        id as order_id,
        line_items,
        object as order_object,
        refund_amount,
        status as order_status,
        subtotal,
        tax,
        total,
        txn_id,
        _sdc_batched_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version

    from source

)

select * from renamed