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

	public ReviewList getReviewsWithMembers(String toiletNum, String memberStr){
		ReviewList reviewList = new ReviewList();

		if (!Util.isEqualsNull(toiletNum)) {
			toiletNum = toiletNum.trim();

			try {

				int toiletId = Integer.parseInt(toiletNum);
				int memberId = Integer.parseInt(memberStr); 

				if (toiletId > 0) {
					reviewList = dao.getToiletReivewsWithMembers(toiletId,memberId);
				}
			}catch (NumberFormatException e) {
				System.out.println("review > service > getReviewsWithMembers");
				e.printStackTrace();
				reviewList.clear();
			}
		}
		
		
		return reviewList;
	}
	public ReviewList getReviews(String toiletNum) {
		ReviewList reviewList = new ReviewList();

		if (!Util.isEqualsNull(toiletNum)) {
			toiletNum = toiletNum.trim();

			try {

				int toiletId = Integer.parseInt(toiletNum);

				if (toiletId > 0) {
					reviewList = dao.getToiletReivews(toiletId);
				}
			} catch (NumberFormatException e) {
				System.out.println("review > service > getReviews");
				e.printStackTrace();
				reviewList.clear();
			}
		}

		return reviewList;
	}

	public ReviewList getReviewPage(String pageString, String toiletNum) {
		ReviewList reviewList = new ReviewList();
		
		if (!Util.isEqualsNull(pageString) && !Util.isEqualsNull(toiletNum)) {
			toiletNum = toiletNum.trim();
			pageString = pageString.trim();

			try {
				int page = Integer.parseInt(pageString);
				int toiletId = Integer.parseInt(toiletNum);

				if (Util.isValidId(page) && Util.isValidId(toiletId)) {
					reviewList = dao.getReviewPage(toiletId, page);
				}

			} catch (NumberFormatException e) {
				System.out.println("review > service > getReviewPage");
				e.printStackTrace();

			}

		}

		return reviewList;
	}

	public int addReview(String toiletNum, String writerNum, String review, String scoreString) {

		if (!isDataNull(toiletNum, writerNum, review, scoreString)) {

			toiletNum = toiletNum.trim();
			writerNum = writerNum.trim();
			review = review.trim();
			scoreString = scoreString.trim();

			System.out.println("--------------------");
			System.out.println(toiletNum);
			System.out.println(writerNum);
			System.out.println(review);
			System.out.println(scoreString);
			System.out.println("--------------------");

			if (Util.isValidStringLength(review, 10, 100)) {
				try {

					int toiletId = Integer.parseInt(toiletNum);
					int writerId = Integer.parseInt(writerNum);
					int score = Integer.parseInt(scoreString);

					if (Util.isValidId(toiletId) && Util.isValidId(writerId)) {
						if (score < 1) {
							score = 1;
						} else if (score > 10) {
							score = 10;
						}

						return dao.add(toiletId, writerId, review, score);
					}

				} catch (NumberFormatException e) {
					System.out.println("review > service > addReview");
					e.printStackTrace();
				}
			}
		}

		return 0;
	}

	public int updateReview(String toiletNum, String writerNum, String review, String scoreString) {
		if (!isDataNull(toiletNum, writerNum, review, scoreString)) {

			toiletNum = toiletNum.trim();
			writerNum = writerNum.trim();
			review = review.trim();
			scoreString = scoreString.trim();

			System.out.println("--------------------");
			System.out.println(toiletNum);
			System.out.println(writerNum);
			System.out.println(review);
			System.out.println(scoreString);
			System.out.println("--------------------");

			if (Util.isValidStringLength(review, 10, 100)) {
				try {

					int toiletId = Integer.parseInt(toiletNum);
					int writerId = Integer.parseInt(writerNum);
					int score = Integer.parseInt(scoreString);

					if (Util.isValidId(toiletId) && Util.isValidId(writerId)) {

						return dao.update(toiletId, writerId, review, score);
					}

				} catch (NumberFormatException e) {
					System.out.println("review > service > addReview");
					e.printStackTrace();
				}
			}
		}

		return 0;
	}

	private boolean isDataNull(String toiletNum, String writerNum, String review, String scoreString) {
		if (Util.isEqualsNull(toiletNum) || Util.isEqualsNull(writerNum) || Util.isEqualsNull(review)
				|| Util.isEqualsNull(scoreString)) {
			return true;
		}

		return false;

	}
}
