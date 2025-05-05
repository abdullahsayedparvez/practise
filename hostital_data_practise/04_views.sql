-- Create your first view
create view appointment_details as
select
	a.patient_id,
    d.doctor_name
from appointments as a
join doctors as d on d.doctor_id = a.doctor_id;

select 
	*
from appointment_details


-- -- Create a view showing total amount paid by each patient.
create view individual_amount_patient_spend as
select
	p.patient_id,
    p.patient_name,
    sum(b.amount)
from bills as b
join appointments as a on b.appointment_id = a.appointment_id
join patients as p on a.patient_id = p.patient_id
group by p.patient_id
order by p.patient_id asc;

select
	*
from individual_amount_patient_spend;

-- -- Create a view to show pending bills with patient and doctor info.
create view pending_bills_with_doc_patient as
select 
	d.doctor_name,
    d.doctor_id,
    p.patient_name,
    p.patient_id,
    b.payment_status
from bills b
join appointments a on b.appointment_id = a.appointment_id
join doctors d on a.doctor_id = d.doctor_id
join patients p on a.patient_id = p.patient_id
where b.payment_status = 'Pending';

select 
	*
from pending_bills_with_doc_patient;

-- -- create view pending_bills_with_doc_patient as
select 
	d.doctor_name,
    d.doctor_id,
    p.patient_name,
    p.patient_id,
    b.payment_status
from bills b
join appointments a on b.appointment_id = a.appointment_id
join doctors d on a.doctor_id = d.doctor_id
join patients p on a.patient_id = p.patient_id
where b.payment_status = 'Pending';

select 
	*
from pending_bills_with_doc_patient;


-- -- Create a view listing doctors and how many appointments they have.
create view total_appointment_to_doctor as
select
	a.doctor_id,
	count(a.patient_id) as total_appointment,
    d.doctor_name
from appointments a
join doctors d on a.doctor_id = d.doctor_id
group by  a.doctor_id
order by a.doctor_id asc;

select 
	*
from total_appointment_to_doctor;


-- -- Create a view to show department-wise appointment count.
create view department_wise_appointment as
select
	dp.department_name,
    count(a.appointment_id) as appointment_count
from appointments a
join doctors d on a.doctor_id = d.doctor_id
join departments dp on d.department_id = dp.department_id
group by dp.department_id;

select 
	*
from department_wise_appointment;
