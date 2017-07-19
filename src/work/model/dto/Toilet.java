package work.model.dto;

public class Toilet {

	public Toilet() {
	}

	public Toilet(int id) {
		this();
		setId(id);
	}

	// database id
	private int id;

	// 이름
	private String name;

	// 구분
	private String type;

	// 남여공용
	private char isCommon;

	// 남성용-대변기수
	private int countManFeces;

	// 남성용-소변기수
	private int countManUrine;

	// 남성용-장애인용대변기수
	private int countManFecesForHandicapped;

	// 남성용-장애인용소변기수
	private int countManUrineForHandicapped;

	// 남성용-어린이용대변기수
	private int countManChildFeces;

	// 남성용-어린이용소변기수
	private int countManChildUrine;

	// 여성용-대변기수
	private int countLadyFeces;

	// 여성용-장애인용대변기수
	private int countLadyFecesForHandicapped;

	// 여성용-어린이용대변기수
	private int countLadyChildFeces;

	// 관리기관명
	private String managementAgency;

	// 전화번호

	private String phone;

	// 개방시간

	private String openTime;

	// 설치날짜

	private String installationDate;

	// 위도
	private double lat;

	// 경도
	private double lon;

	// 데이터기준일자
	private String stdDate;

	// 입력일
	private String regDate;

	// 연락처

	private String phone2;

	// 설치된 도시이름
	private String cityName;

	// 설치된 구 이름
	private String boroughName;

	// 리뷰 총점
	private int sumReview;

	// 리뷰 수
	private int countReview;

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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public char getIsCommon() {
		return isCommon;
	}

	public void setIsCommon(char isCommon) {
		this.isCommon = isCommon;
	}

	public int getCountManFeces() {
		return countManFeces;
	}

	public void setCountManFeces(int countManFeces) {
		this.countManFeces = countManFeces;
	}

	public int getCountManUrine() {
		return countManUrine;
	}

	public void setCountManUrine(int countManUrine) {
		this.countManUrine = countManUrine;
	}

	public int getCountManFecesForHandicapped() {
		return countManFecesForHandicapped;
	}

	public void setCountManFecesForHandicapped(int countManFecesForHandicapped) {
		this.countManFecesForHandicapped = countManFecesForHandicapped;
	}

	public int getCountManUrineForHandicapped() {
		return countManUrineForHandicapped;
	}

	public void setCountManUrineForHandicapped(int countManUrineForHandicapped) {
		this.countManUrineForHandicapped = countManUrineForHandicapped;
	}

	public int getCountManChildFeces() {
		return countManChildFeces;
	}

	public void setCountManChildFeces(int countManChildFeces) {
		this.countManChildFeces = countManChildFeces;
	}

	public int getCountManChildUrine() {
		return countManChildUrine;
	}

	public void setCountManChildUrine(int countManChildUrine) {
		this.countManChildUrine = countManChildUrine;
	}

	public int getCountLadyFeces() {
		return countLadyFeces;
	}

	public void setCountLadyFeces(int countLadyFeces) {
		this.countLadyFeces = countLadyFeces;
	}

	public int getCountLadyFecesForHandicapped() {
		return countLadyFecesForHandicapped;
	}

	public void setCountLadyFecesForHandicapped(int countLadyFecesForHandicapped) {
		this.countLadyFecesForHandicapped = countLadyFecesForHandicapped;
	}

	public int getCountLadyChildFeces() {
		return countLadyChildFeces;
	}

	public void setCountLadyChildFeces(int countLadyChildFeces) {
		this.countLadyChildFeces = countLadyChildFeces;
	}

	public String getManagementAgency() {
		return managementAgency;
	}

	public void setManagementAgency(String managementAgency) {
		this.managementAgency = managementAgency;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getOpenTime() {
		return openTime;
	}

	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}

	public String getInstallationDate() {
		return installationDate;
	}

	public void setInstallationDate(String installationDate) {
		this.installationDate = installationDate;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLon() {
		return lon;
	}

	public void setLon(double lon) {
		this.lon = lon;
	}

	public String getStdDate() {
		return stdDate;
	}

	public void setStdDate(String stdDate) {
		this.stdDate = stdDate;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getBoroughName() {
		return boroughName;
	}

	public void setBoroughName(String boroughName) {
		this.boroughName = boroughName;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getSumReview() {
		return sumReview;
	}

	public void setSumReview(int sumReview) {
		this.sumReview = sumReview;
	}

	public int getCountReview() {
		return countReview;
	}

	public void setCountReview(int countReview) {
		this.countReview = countReview;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("{\"id\":").append(id).append(", \"name\":").append("\"").append(name).append("\"")
				.append(", \"type\":").append("\"").append(type).append("\"").append(", \"isCommon\":").append("\"")
				.append(isCommon).append("\"").append(", \"countManFeces\":").append(countManFeces)
				.append(", \"countManUrine\":").append(countManUrine).append(", \"countManFecesForHandicapped\":")
				.append(countManFecesForHandicapped).append(", \"countManUrineForHandicapped\":")
				.append(countManUrineForHandicapped).append(", \"countManChildFeces\":").append(countManChildFeces)
				.append(", \"countManChildUrine\":").append(countManChildUrine).append(", \"countLadyFeces\":")
				.append(countLadyFeces).append(", \"countLadyFecesForHandicapped\":")
				.append(countLadyFecesForHandicapped).append(", \"countLadyChildFeces\":").append(countLadyChildFeces)
				.append(", \"managementAgency\":").append("\"").append(managementAgency).append("\"")
				.append(", \"phone\":").append("\"").append(phone).append("\"").append(", \"openTime\":").append("\"")
				.append(openTime).append("\"").append(", \"installationDate\":").append("\"").append(installationDate)
				.append("\"").append(", \"lat\":").append(lat).append(", \"lon\":").append(lon).append(", \"stdDate\":")
				.append("\"").append(stdDate).append("\"").append(", \"regDate\":").append("\"").append(regDate)
				.append("\"").append(", \"phone2\":").append("\"").append(phone2).append("\"").append(", \"cityName\":")
				.append("\"").append(cityName).append("\"").append(", \"boroughName\":").append("\"")
				.append(boroughName).append("\"").append(", \"sumReview\":").append(sumReview)
				.append(", \"countReview\":").append(countReview).append("}");
		return builder.toString();
	}

	//
	// @Override
	// public String toString() {
	//
	// StringBuilder builder = new StringBuilder();
	// builder.append("Toilet [id=");
	// builder.append(id);
	// builder.append(", \"name=");
	// builder.append(name);
	// builder.append(", \"type=");
	// builder.append(type);
	// builder.append(", \"isCommon=");
	// builder.append(isCommon);
	// builder.append(", \"countManFeces=");
	// builder.append(countManFeces);
	// builder.append(", \"countManUrine=");
	// builder.append(countManUrine);
	// builder.append(", \"countManFecesForHandicapped=");
	// builder.append(countManFecesForHandicapped);
	// builder.append(", \"countManUrineForHandicapped=");
	// builder.append(countManUrineForHandicapped);
	// builder.append(", \"countManChildFeces=");
	// builder.append(countManChildFeces);
	// builder.append(", \"countManChildUrine=");
	// builder.append(countManChildUrine);
	// builder.append(", \"countLadyFeces=");
	// builder.append(countLadyFeces);
	// builder.append(", \"countLadyFecesForHandicapped=");
	// builder.append(countLadyFecesForHandicapped);
	// builder.append(", \"countLadyChildFeces=");
	// builder.append(countLadyChildFeces);
	// builder.append(", \"managementAgency=");
	// builder.append(managementAgency);
	// builder.append(", \"phone=");
	// builder.append(phone);
	// builder.append(", \"openTime=");
	// builder.append(openTime);
	// builder.append(", \"installationDate=");
	// builder.append(installationDate);
	// builder.append(", \"lat=");
	// builder.append(lat);
	// builder.append(", \"lon=");
	// builder.append(lon);
	// builder.append(", \"stdDate=");
	// builder.append(stdDate);
	// builder.append(", \"regDate=");
	// builder.append(regDate);
	// builder.append(", \"phone2=");
	// builder.append(phone2);
	// builder.append(", \"cityName=");
	// builder.append(cityName);
	// builder.append(", \"boroughName=");
	// builder.append(boroughName);
	// builder.append(", \"sumReview=");
	// builder.append(sumReview);
	// builder.append(", \"countReview=");
	// builder.append(countReview);
	// builder.append("]\n");
	// return builder.toString();
	// }
	//
	//
}
