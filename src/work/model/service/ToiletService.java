package work.model.service;

import java.util.ArrayList;

import work.Util.Util;
import work.model.dao.ToiletDao;
import work.model.dto.Borough;
import work.model.dto.City;
import work.model.dto.Toilet;

public class ToiletService {
	private ToiletDao dao = null;

	public ToiletService() {
		dao = new ToiletDao();
	}

	public ArrayList<Toilet> getAllToiletsInBorough(String guNumber) {
		ArrayList<Toilet> list = new ArrayList<>();

		if (!Util.isEqualsNull(guNumber)) {
			guNumber = guNumber.trim();
			try {

				int gu = Integer.parseInt(guNumber);
				if (gu > 0) {
					list = dao.getAll(gu);
				}

			} catch (NumberFormatException e) {
				System.out.println("ToiletService >> getAll(String)");
				e.printStackTrace();
				list.clear();

				return list;
			}
		}

		return list;
	}

	public ArrayList<City> getCityList() {
		return dao.getCityList();
	}

	public ArrayList<Borough> getBoroughList(String city) {
		ArrayList<Borough> list = new ArrayList<>();

		if (!Util.isEqualsNull(city)) {
			city = city.trim();
			try {

				int cityId = Integer.parseInt(city);
				if (cityId > 0) {
					list = dao.getBoroughList(cityId);
				}

			} catch (NumberFormatException e) {
				System.out.println("Toilet > Service > getBoroughList");
				e.printStackTrace();
			}

		}

		return list;

	}

}
