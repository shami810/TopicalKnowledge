package services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.DoctrineRule;

public class SearchService {
	
	Connection connection;
	PreparedStatement preparedStatement;
	ResultSet resultSet;
	
	public List<DoctrineRule> searchDoctrine(String keyword){
		List<DoctrineRule> doctrines=null;
		String query="SELECT `doctrinerule`.`doctrineRuleId`,`doctrinerule`.`doctrineName`,"
				+ "`doctrinerule`.`doctrineType`,`doctrinerule`.`doctrineReferenceNo`,"
				+ "`doctrinerule`.`doctrineDateCreated`,`doctrinerule`.`doctrineChapterNo`,"
				+ "`doctrinerule`.`doctrineSectionNo`,`doctrinerule`.`doctrineSummary`,`doctrinerule`.`keywords` "
				+ "FROM `tkbs`.`doctrinerule`"
				+ "WHERE `doctrinerule`.`doctrineName` like ? AND `doctrinerule`.`Active`= '1' AND `doctrinerule`.`status`!= 'D';;";
		try {
			doctrines=new ArrayList<DoctrineRule>();
			DoctrineRule doctrineRule=null;
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
			preparedStatement=connection.prepareStatement(query); 
			preparedStatement.setString(1, "%"+keyword+"%");
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()){
				doctrineRule=new DoctrineRule();
				doctrineRule.setDoctrineRuleId(resultSet.getInt("doctrineRuleId"));
				doctrineRule.setDoctrineName(resultSet.getString("doctrineName"));
				doctrineRule.setDoctrineType(resultSet.getString("doctrineType"));
				doctrineRule.setDoctrineReferenceNo(resultSet.getString("doctrineReferenceNo"));
				doctrineRule.setDoctrineDateCreated(resultSet.getString("doctrineDateCreated"));
				doctrineRule.setDoctrineSectionNo(resultSet.getString("doctrineSectionNo"));
				doctrineRule.setDoctrineChapterNo(resultSet.getString("doctrineChapterNo"));
				doctrines.add(doctrineRule);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return doctrines;
	}

}
