package com.ours.beans;

public class ClaimBean {

      private String claim_type;
      private double claim_amount;
      private String customer_id;
      private String status;
      private long policy_id;
      private String upload;
      private String file1;
      private String reason;

  	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	private String file2;
  	
      public String getFile1() {
		return file1;
	}

	public void setFile1(String file1) {
		this.file1 = file1;
	}

	public String getFile2() {
		return file2;
	}

	public void setFile2(String file2) {
		this.file2 = file2;
	}

      
      
      public String getStatus() {
  		return status;
  	}

  	public void setStatus(String status) {
  		this.status = status;
  	}
      public double getClaim_amount() {
  		return claim_amount;
  	}

  	public void setClaim_amount(double claim_amount) {
  		this.claim_amount = claim_amount;
  	}
      

      public long getPolicy_id() {
            return policy_id;
      }

      public void setPolicy_id(long policy_id) {
            this.policy_id = policy_id;
      }

      public String getUpload() {
            return upload;
      }

      public void setUpload(String upload) {
            this.upload = upload;
      }

      
      public String getCustomer_id() {
            return customer_id;
      }

      public void setCustomer_id(String customer_id) {
            this.customer_id = customer_id;
      }

      

      public String getClaim_type() {
            return claim_type;
      }

      public void setClaim_type(String claim_type) {
            this.claim_type = claim_type;
      }
      
}
