package entity;

import java.util.ArrayList;
import java.util.List;

public class RouteResult {

	List<String> from_cities = new ArrayList<String>();
	List<String> to_cities = new ArrayList<String>();

	public RouteResult() {
		super();
	}

	public List<String> getFrom_cities() {
		return from_cities;
	}

	public void setFrom_cities(List<String> from_cities) {
		this.from_cities = from_cities;
	}

	public List<String> getTo_cities() {
		return to_cities;
	}

	public void setTo_cities(List<String> to_cities) {
		this.to_cities = to_cities;
	}

}
