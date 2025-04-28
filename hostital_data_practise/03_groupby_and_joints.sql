use HospitalManagement;

/*
  _________
 |         |
 |  EASY   |
 |         |
 |_________|
*/
-- Question 1:
-- Fetch the patient name and the doctor name for each appointment.
select
	doctor_name,
    patient_name,
    appointment_date
from appointments a
join patients p on a.patient_id = p.patient_id 
join doctors d on a.doctor_id = d.doctor_id ;

-- Question 2:
-- List the total number of appointments for each doctor.
select
	a.doctor_id,
    count(a.appointment_id)
from appointments a
group by a.doctor_id;

-- Question 3:
-- Find the total amount collected (Paid bills only) for each doctor.
select
	a.doctor_id,
    SUM(b.amount) as total_amount_paid,
    d.doctor_name
from bills b
join appointments a on b.appointment_id = a.appointment_id
join doctors d on a.doctor_id = d.doctor_id
where b.payment_status = 'Paid'
group by a.doctor_id;


-- Question 4:
-- List the patient names who have pending bills.
select
	p.patient_name,
    b.payment_status
from bills b
join appointments a on b.appointment_id = a.appointment_id
join patients p on a.patient_id = p.patient_id
where payment_status = 'Pending';

-- Question 5:
-- Show the number of appointments for each department.
select
	department_name,
    count(a.appointment_id)
from appointments a
join doctors d on a.doctor_id = d.doctor_id
join departments dp on d.department_id = dp.department_id
group by dp.department_name;

-- Question 6:
-- List the patient names and their respective appointment dates.

select
	p.patient_name,
    a.appointment_date
from patients p 
join appointments a on p.patient_id = a.patient_id;

-- Question 7:
-- Find the names of patients who have appointments with 'Dr. Emily River'.

select
	p.patient_name,
    a.appointment_date,
    d.doctor_name
from appointments a
join doctors d on a.doctor_id = d.doctor_id
join patients p on p.patient_id = a.patient_id
where d.doctor_name = 'Dr. Emily River';


-- Question 8:
-- List the total amount collected for each patient
select
	SUM(b.amount),
    p.patient_name,
    p.patient_id
from bills b
join appointments a on b.appointment_id = a.appointment_id
join patients p on a.patient_id = p.patient_id
group by patient_id;

-- Question 9:
-- Find the total amount collected for each doctor from Paid bills, 
-- but only for doctors with more than 1 appointments.

select 
	d.doctor_name,
	d.doctor_id,
	count(b.appointment_id) as total_appointment,
    sum(b.amount) as total_amount
from bills b 
join appointments a on b.appointment_id = a.appointment_id
join doctors d on a.doctor_id = d.doctor_id
where b.payment_status = "Paid"
group by d.doctor_id
having total_appointment>1;

