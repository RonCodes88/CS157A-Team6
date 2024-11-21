public class Activity {
	private String activityName, activityDesc;
	private int activityID, price;

	public Activity() {
		super();
	}

	public Activity(int activityID, String activityName, String activityDesc, int price) {
		super();
		this.activityID = activityID;
		this.activityName = activityName;
		this.activityDesc = activityDesc;
		this.price = price;
	}

	public int getActivityID() {
		return activityID;
	}

	public void setActivityID(int activityID) {
		this.activityID = activityID;
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
