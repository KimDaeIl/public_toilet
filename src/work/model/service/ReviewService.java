package work.model.service;

import java.util.ArrayList;

import work.Util.Util;
import work.model.dao.ReviewDao;
import work.model.dto.Review;
import work.model.dto.ReviewList;

public class ReviewService {

	private ReviewDao dao = null;

	public ReviewService() {
		dao = new ReviewDao();
	}

	public ReviewList getReviews(String toiletNum) {
		ReviewList reviewList = new ReviewList();

		if (!Util.isEqualsNull(toiletNum)) {
			toiletNum = toiletNum.trim();

			try {

				int toiletId = Integer.parseInt(toiletNum);

				if (toiletId > 0) {
					System.out.println(toiletId);
					reviewList = dao.getToiletReivews(toiletId);
				}
			} catch (NumberFormatException e) {
				e.printStackTrace();
				reviewList.clear();
			}
		}

		return reviewList;
	}
}
