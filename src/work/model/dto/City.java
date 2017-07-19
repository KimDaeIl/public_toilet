package work.model.dto;

public class City {
	private int id;
	private String name;
	private String regDate;

	public City() {
	}

	public City(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("{\"id\":");
		builder.append(id);
		builder.append(", \"name\":\"");
		builder.append(name);
		builder.append("\", \"regDate\":\"");
		builder.append(regDate);
		builder.append("\"}");
		return builder.toString();
	}

}
