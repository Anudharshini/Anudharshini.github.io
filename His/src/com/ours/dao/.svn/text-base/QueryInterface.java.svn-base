package com.cognizant.dao;

public interface QueryInterface {
	String userRegister="insert into user_info(first_name, last_name, user_name,password,address, city, state, country, pincode, email, gender,contact_no, date_of_birth, age, insured_type, customer_id,nominee_name,nominee_contact_no,nominee_address) values(?,?,?,md5(?),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    String userLogin="select * from user_info where customer_id=? and password=md5(?)";
    String adminLogin="select * from admin_info where user_name=? and password=md5(?)";
    String PolicyRegister="insert into policy_table(policy_id,insurance_name,policy_duration,premium_type,policy_start_date,discount,premium_amount,maturity_date,policy_amount,customer_id,status) values(?,?,?,?,?,?,?,?,?,?,?)";
    String policyCheck="select policy_id, insurance_name, policy_duration, premium_type, policy_start_date, discount, premium_amount, maturity_date, policy_amount, customer_id from policy_table where status='pending'";
    String approve="update policy_table set status='Approved' where policy_id=?";
    String reject="update policy_table set status='Rejected' where policy_id=?";
    String EditUser="update user_info set password=md5(?),email=?,contact_no=?,user_name=? where customer_id = ?";
    String EditPolicy="update policy_table set insurance_name=?,policy_amount=?,policy_duration=?,discount=?,premium_amount=?";
    String check="select policy_id, insurance_name, policy_duration, premium_type, policy_start_date, discount, premium_amount, maturity_date, policy_amount, status from policy_table where customer_id=?";
    String GetEditPolicy="select policy_id,customer_id,status from policy_table";
    String checKParams="select status from policy_table where policy_id=? and customer_id=?";
    String renewCheck="select status,maturity_date, policy_duration from policy_table where policy_id=?"; 
    String renewedPolicy="update policy_table set status='Pending', policy_start_date=?, maturity_date=? where policy_id=?";
    String approvedPolicy="select policy_id, insurance_name, policy_duration, premium_type, policy_start_date, discount, premium_amount, maturity_date, policy_amount, customer_id,status from policy_table where status='Approved'";
    String rejectedPolicy="select policy_id, insurance_name, policy_duration, premium_type, policy_start_date, discount, premium_amount, maturity_date, policy_amount, customer_id,status from policy_table where status='Rejected'";
    String checkPolicy="select status,policy_id from policy_table where customer_id=?";
    String EditUserpass="update user_info set email=?,contact_no=?,user_name=? where customer_id = ?";
    String uploadClaim="insert into claim_table(customer_id,policy_id,claim_type,claim_amount,upload,status,file1,file2) values(?,?,?,?,?,?,?,?)";
    String getpass="select md5(password) from user_info where user_name=?";
    String viewClaim="select * from claim_table where status='Pending'";
    String viewApprovedClaim="select * from claim_table where status='Approved'";
    String viewRejectedClaim="select * from claim_table where status='Rejected'";
    String adminapproveClaim="update claim_table set status='Approved' where policy_id=?";
    String adminrejectedClaim="update claim_table set status='Rejected' where policy_id=?";
    String retrieve="select policy_start_date,policy_amount,status,insurance_name from policy_table where policy_id=?";
    String calculateClaim="select claim_amount,upload,claim_type from claim_table where policy_id=?";
    /*String approveClaim="update claim_table set status='Approved' where policy_id=?";
    String rejectedClaim="update claim_table set status='Rejected' where policy_id=?";*/
    String checkclaimPolicy="select status,policy_id from policy_table where customer_id=?";
    String claimtype="select claim_type from claim_table where policy_id=?";
/*    String claimcheck="select policy_id,claim_type,claim_amount,status from claim_table where customer_id=?";
*/    String nomineeLogin="select password,customer_id,nominee_name from user_info where customer_id=? and password=md5(?) and nominee_name=?";
    String checkclaimed="select status,policy_id from claim_table where customer_id=?";
    String claimcheck="select policy_id,claim_type,claim_amount,status,reason from claim_table where customer_id=?";
    String approveClaim="update claim_table set status='Approved', reason=? where policy_id=?";
    String rejectedClaim="update claim_table set status='Rejected', reason=? where policy_id=?";
    String checkpolicy="select policy_id from policy_table where customer_id=? and status='Pending'";
    String checkrenewpolicy="select status,policy_id from policy_table where customer_id=? and datediff(maturity_date,now())<15";
}
