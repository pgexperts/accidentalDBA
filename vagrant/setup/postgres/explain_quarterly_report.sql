explain ( analyze on, buffers on )
with fines_incurred as (
    select branch_name, sum(fine) as total_fines_incurred
    from fines
        join loans USING (loan_id)
        join copies USING (copy_id)
    where due_date >= '2011-01-01'
        and due_date < '2011-04-01'
    group by branch_name
)
select branch_name,
    count(*) as number_loans,
    count(distinct card_no) as number_patrons,
    count(distinct isbn) as number_titles,
    count(distinct copy_id) as number_copies,
    fines_incurred.total_fines_incurred
from branches
    join copies USING ( branch_name )
    join loans USING ( copy_id )
    LEFT OUTER JOIN fines_incurred USING ( branch_name )
where tstzrange(checkout_date, return_date) &&
    tstzrange '[2011-01-01,2013-04-01)'
group by branch_name, total_fines_incurred
order by number_loans desc;
