with source as (

    select * from {{ source('ticket_tailor', 'events') }}

),

renamed as (

    select
        call_to_action,
        created_at as event_created_at,
        currency,
        description,
        --end as event_end,
        id as event_id,
        images,
        name as event_name,
        object as event_object,
        online_event,
        payment_methods,
        private,
        --start as event_start,
        status as event_status,
        tickets_available,
        ticket_groups,
        ticket_types,
        timezone as event_timezone,
        total_issued_tickets,
        total_orders,
        url,
        venue,
        _sdc_batched_at,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_table_version

    from source

)

select * from renamed