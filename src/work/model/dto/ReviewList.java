package work.model.dto;

import java.util.ArrayList;

import work.Util.Util;

public class ReviewList {

	private int page;

	private Toilet toilet;

	private ArrayList<Review> list;

	public ReviewList() {
		toilet = new Toilet();
		list = new ArrayList<>();
	}

	public ReviewList(int page) {
		this();
		this.page = page;
	}

	public Toilet getToilet() {
		return toilet;
	}

	public void setToilet(Toilet toilet) {
		this.toilet = toilet;
	}

	public ArrayList<Review> getList() {
		return list;
	}

	public void setList(ArrayList<Review> list) {
		this.list = list;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void clear() {
		if (!Util.isNull(this.list)) {
			this.list.clear();
		}

		if (!Util.isNull(this.toilet)) {
			this.toilet.setId(0);
		}

	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("{\"page\":");
		builder.append(page);
		builder.append(", \"toilet\":");
		builder.append(toilet);
		builder.append(", \"list\":");
		builder.append("[");
		for (int i = 0; i < list.size(); i++) {
			builder.append(list.get(i).toString()).append(",");
		}
		builder.replace(builder.length() - 1, builder.length(), "");
		builder.append("]");
		builder.append("}");
		return builder.toString();
	}

}
