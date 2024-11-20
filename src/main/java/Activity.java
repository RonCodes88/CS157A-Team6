public class Activity {
	private String activityName, activityDesc;
	private int price;
	
	
	
    public Activity() {
        super();
    }

	public Activity(String activityName, String activityDesc, int price) {
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}



    
}

