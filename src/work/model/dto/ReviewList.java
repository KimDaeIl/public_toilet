package work.model.dto;

import java.util.ArrayList;

import work.Util.Util;

public class ReviewList {

	private Toilet toilet;

	private ArrayList<Review> list;

	public ReviewList() {
		toilet = new Toilet();
		list = new ArrayList<>();
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
		builder.append("ReviewList {toilet=");
		builder.append(toilet);
		builder.append(", list=");
		builder.append("[");
		for(Review r:list){
			builder.append(r.toString()).append(",");
		}
		builder.append("]");
		builder.append(list);
		builder.append("}");
		return builder.toString();
	}
	
	

}
