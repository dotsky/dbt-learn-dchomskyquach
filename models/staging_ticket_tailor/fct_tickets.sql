with tickets as (
    select * from {{ ref('stg_ticket_tailor_issued_tickets') }}
),
events as (
    select * from {{ ref('stg_ticket_tailor_events') }}
),
orders as (
    select * from {{ ref('stg_ticket_tailor_orders') }}
),
joined as (
    select 
        ticket_id,
        event_id,
        order_id,
        created_at,
        updated_at,
        events.event_name,
        events.event_timezone,
        orders.total as ticket_amount,
        case 
            when orders.order_status = 'completed' then false
            when orders.order_status = 'cancelled' then true
        end as is_refunded
    from tickets
    left join events using (event_id)
    left join orders using (order_id)
)
select * from joined