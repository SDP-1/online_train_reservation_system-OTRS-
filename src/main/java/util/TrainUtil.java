package util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;

import model.Reservation;
import model.Train;

public class TrainUtil {

	private static Connection connection;
	private static Statement statement;

	public static ArrayList<Train> getTrains() {

		ArrayList<Train> trains = new ArrayList<>();
		try {
			connection = DBConnectionUtil.getDBConnection();

			statement = connection.createStatement();

			String sql = "Select * from train";

			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String name = resultSet.getString("name");
				String start = resultSet.getString("start");
				String end = resultSet.getString("end");
				int seatCount = resultSet.getInt("seatCount");
				int availableSeatCount = resultSet.getInt("availableSeatCount");

				Train train = new Train(id, name, start, end, seatCount, availableSeatCount);
				trains.add(train);
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return trains;
	}

	public static String getTrainName(int id) {

		String trainName = null;

		try {
			connection = DBConnectionUtil.getDBConnection();
			statement = connection.createStatement();

			String sql = "Select name from train where id = " + id;

			ResultSet resultSet = statement.executeQuery(sql);

			if (resultSet.next()) {
				trainName = resultSet.getString("name");
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return trainName;
	}

	public static void decreaseSheetCount(int trainId, int passengerCount) {

		int updatedPassengerCount = -1;

		try {
			connection = DBConnectionUtil.getDBConnection();
			statement = connection.createStatement();

			// First, fetch the current passenger count for the train
			String fetchCountSQL = "SELECT availableSeatCount FROM train WHERE id = " + trainId;
			ResultSet resultSet = statement.executeQuery(fetchCountSQL);

			if (resultSet.next()) {
				int currentPassengerCount = resultSet.getInt("availableSeatCount");

				if (currentPassengerCount >= passengerCount) {
					// Calculate the updated passenger count
					updatedPassengerCount = currentPassengerCount - passengerCount;

					// Update the database with the new passenger count
					String updateCountSQL = "UPDATE train SET availableSeatCount = " + updatedPassengerCount
							+ " WHERE id = " + trainId;
					int rowsAffected = statement.executeUpdate(updateCountSQL);

					if (rowsAffected > 0) {
						// Update was successful
					} else {
						// Handle the case where the update did not affect any rows
						updatedPassengerCount = -1;
					}
				} else {
					// Handle the case where there are not enough passengers to decrease
					updatedPassengerCount = -1;
				}
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void increaseSheetCount(int trainId, int passengerCount) {

		int updatedPassengerCount = -1;

		try {
			connection = DBConnectionUtil.getDBConnection();
			statement = connection.createStatement();

			// First, fetch the current passenger count for the train
			String fetchCountSQL = "SELECT availableSeatCount FROM train WHERE id = " + trainId;
			ResultSet resultSet = statement.executeQuery(fetchCountSQL);

			if (resultSet.next()) {
				int currentPassengerCount = resultSet.getInt("availableSeatCount");

				if (currentPassengerCount >= passengerCount) {
					// Calculate the updated passenger count
					updatedPassengerCount = currentPassengerCount + passengerCount;

					// Update the database with the new passenger count
					String updateCountSQL = "UPDATE train SET availableSeatCount = " + updatedPassengerCount
							+ " WHERE id = " + trainId;
					int rowsAffected = statement.executeUpdate(updateCountSQL);

					if (rowsAffected > 0) {
						// Update was successful
					} else {
						// Handle the case where the update did not affect any rows
						updatedPassengerCount = -1;
					}
				} else {
					// Handle the case where there are not enough passengers to decrease
					updatedPassengerCount = -1;
				}
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

}
