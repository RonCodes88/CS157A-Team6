





public class CustomActivity {
	private String activityName, activityDesc;
	private double price;
	
	
	
    public CustomActivity() {
        super();
    }

	public CustomActivity(String activityName, String activityDesc, double price) {
		super();
		this.activityName = activityName;
		this.activityDesc = activityDesc;
		this.price = price;
	}

	public String getActivityName() {
		return activityName;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}

	public String getActivityDesc() {
		return activityDesc;
	}

	public void setActivityDesc(String activityDesc) {
		this.activityDesc = activityDesc;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}



    
}

