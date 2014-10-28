public static void main(String[] arg) {
	Event_StorkTeam est = new Event_StorkTeam();
	Event event = new Event();
	event.setTitle("on my own");
	event.setLogo("lazy");
	event.setDescription("till It find");
	event.setSpeaker("Owl");
	event.setAddress("Tree");
	event.setSlogan("Take your time");
	event.setStartDate(new org.joda.time.DateTime(2000, 12, 4, 10, 48));
	event.setEndDate(new org.joda.time.DateTime(2014, 2, 25, 14, 9));
	est.addEvent(event);
}

public static void main(String[] args) {
	Category_StorkTeam cst = new Category_StorkTeam();
	List<Category> list = cst.selectAllFromCategory();
	System.out.println(list.size());
}