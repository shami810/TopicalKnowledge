package services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import bean.DoctrineCases;
import bean.DoctrineNotes;
import bean.DoctrineRule;

public class DoctrineService {

	Connection connection;
	PreparedStatement preparedStatement;
	ResultSet resultSet;
	PreparedStatement ps2;
	ResultSet rs2;
	PreparedStatement ps3;
	ResultSet rs3;
	Date d = new Date();
	DateFormat d1 = DateFormat.getInstance();
	String date = d1.format(d);

	public boolean addNewDoctrine(DoctrineRule doctrineRule)
	{
		DoctrineRule doctrine=validateDoctrine(doctrineRule.getDoctrineSectionNo(), doctrineRule.getDoctrineChapterNo());
		String query="";
		String docname=null;
		String doctype = null;
		String docid = null;
		String sec = null;
		String chp = null;
		String sum = null;
		if(doctrine!=null)
		{
			//System.out.println(doctrine.getDoctrineSummary());
			//System.out.println(doctrine.getKeywords());
			query="UPDATE `tkbs`.`doctrinerule` SET `doctrineSummary` = ?,`keywords` = ? "
					+ "WHERE `doctrineChapterNo` = ? AND `doctrineSectionNo`=?;";
			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
				preparedStatement=connection.prepareStatement(query); 
				preparedStatement.setString(1, doctrineRule.getDoctrineSummary());
				preparedStatement.setString(2, doctrineRule.getKeywords());
				preparedStatement.setString(3, doctrineRule.getDoctrineChapterNo());
				preparedStatement.setString(4, doctrineRule.getDoctrineSectionNo());
				int count=preparedStatement.executeUpdate();
				if(count>0)
					return true;
				else
					return false;
				}
				

			catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}	

		}
		else{
			query="INSERT INTO `tkbs`.`doctrinerule`(`doctrineName`,`doctrineType`,`doctrineReferenceNo`,`doctrineDateCreated`,`doctrineChapterNo`,`doctrineSectionNo`,`doctrineSummary`,`keywords`, `status`, `Active`)"
					+ "VALUES(?,?,?,?,?,?,?,?,?,?)";
			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
				preparedStatement=connection.prepareStatement(query); 
				preparedStatement.setString(1, doctrineRule.getDoctrineName());
				preparedStatement.setString(2, doctrineRule.getDoctrineType());
				preparedStatement.setString(3, "");
				preparedStatement.setString(4, date);
				preparedStatement.setString(5, doctrineRule.getDoctrineChapterNo());
				preparedStatement.setString(6, doctrineRule.getDoctrineSectionNo());
				preparedStatement.setString(7, doctrineRule.getDoctrineSummary());
				preparedStatement.setString(8, doctrineRule.getKeywords());
				preparedStatement.setString(9, "N");
				preparedStatement.setString(10, "1");
				int count=preparedStatement.executeUpdate();
				
				if(count>0)
					return true;
				else
					return false;

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}			 
		}
		return false;
	}

	public boolean addNotes(DoctrineNotes notes){
		String query="INSERT INTO `tkbs`.`doctrinenotes`(`doctrineReferenceNo`,`doctrineNotes`,`doctrineNotesDateCreated`, `status`)"
				+ "VALUES(?,?,?,?);";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
			preparedStatement=connection.prepareStatement(query); 
			preparedStatement.setInt(1, notes.getDoctrineReferenceNo());
			preparedStatement.setString(2, notes.getDoctrineNotes());
			preparedStatement.setString(3, date);
			preparedStatement.setString(4, "N");
			int count=preparedStatement.executeUpdate();
			if(count>0)
				return true;
			else
				return false;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	public boolean addCases(DoctrineCases cases){
		String query="INSERT INTO `tkbs`.`controllingcases`(`doctrineReferenceNo`,`sectionNo`,`chapterNo`,`caseName`,`caseCode`,`caseYear`,`caseSummary`, `dateCreated`,`status`)"
				+ "VALUES(?,?,?,?,?,?,?,?,?);";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
			preparedStatement=connection.prepareStatement(query); 
			preparedStatement.setInt(1, cases.getDoctrineReferenceNo());
			preparedStatement.setString(2, cases.getSectionNo());
			preparedStatement.setString(3, cases.getChapterNo());
			preparedStatement.setString(4, cases.getCaseName());
			preparedStatement.setString(5, cases.getCaseCode());
			preparedStatement.setString(6, cases.getCaseYear());
			preparedStatement.setString(7, cases.getCaseSummary());
			preparedStatement.setString(8, date);
			preparedStatement.setString(9, "N");
			int count=preparedStatement.executeUpdate();
			if(count>0)
				return true;
			else
				return false;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	public List<DoctrineCases> getRelatedCases(Integer refNo){
		String query="SELECT `controllingcases`.`controllingCasesId`,`controllingcases`.`doctrineReferenceNo`,"
				+ "`controllingcases`.`caseName`,`controllingcases`.`caseCode`,`controllingcases`.`sectionNo`,"
				+ "`controllingcases`.`caseYear`,`controllingcases`.`chapterNo` FROM `tkbs`.`controllingcases` "
				+ "WHERE `controllingcases`.`doctrineReferenceNo`=?;";
		List<DoctrineCases> casesList=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
			preparedStatement=connection.prepareStatement(query); 
			preparedStatement.setInt(1, refNo);
			resultSet = preparedStatement.executeQuery();
			casesList=new ArrayList<DoctrineCases>();
			DoctrineCases cases=null;
			while(resultSet.next()){
				cases=new DoctrineCases();
				cases.setControllingCasesId(resultSet.getInt("controllingCasesId"));
				cases.setSectionNo(resultSet.getString("sectionNo"));
				cases.setChapterNo(resultSet.getString("chapterNo"));
				cases.setDoctrineReferenceNo(resultSet.getInt("doctrineReferenceNo"));
				cases.setCaseName(resultSet.getString("caseName"));
				cases.setCaseCode(resultSet.getString("caseCode"));
				cases.setCaseYear(resultSet.getString("caseYear"));
				casesList.add(cases);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return casesList;
	}

	public DoctrineCases getCaseById(Integer refNo){
		String query="SELECT `controllingcases`.`controllingCasesId`,`controllingcases`.`doctrineReferenceNo`,"
				+ "`controllingcases`.`caseName`,`controllingcases`.`caseCode`,`controllingcases`.`sectionNo`,"
				+ "`controllingcases`.`caseYear`,`controllingcases`.`chapterNo` FROM `tkbs`.`controllingcases` "
				+ "WHERE `controllingcases`.`controllingCasesId`=?;";
		DoctrineCases cases=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
			preparedStatement=connection.prepareStatement(query); 
			preparedStatement.setInt(1, refNo);
			resultSet = preparedStatement.executeQuery();
			cases=new DoctrineCases();
			while(resultSet.next()){
				cases=new DoctrineCases();
				cases.setControllingCasesId(resultSet.getInt("controllingCasesId"));
				cases.setSectionNo(resultSet.getString("sectionNo"));
				cases.setChapterNo(resultSet.getString("chapterNo"));
				cases.setDoctrineReferenceNo(resultSet.getInt("doctrineReferenceNo"));
				cases.setCaseName(resultSet.getString("caseName"));
				cases.setCaseCode(resultSet.getString("caseCode"));
				cases.setCaseYear(resultSet.getString("caseYear"));
			}
			query="UPDATE `tkbs`.`controllingcases` SET `count` = `count`+1 WHERE `controllingCasesId`=?";
			preparedStatement=connection.prepareStatement(query); 
			preparedStatement.setInt(1, refNo);
			preparedStatement.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return cases;
	}


	public List<DoctrineNotes> getRelatedNotes(Integer refNo){
		String query="SELECT `doctrinenotes`.`doctrineNotesId`,`doctrinenotes`.`doctrineReferenceNo`,"
				+ "`doctrinenotes`.`doctrineNotes`,`doctrinenotes`.`doctrineNotesDateCreated` "
				+ "FROM `tkbs`.`doctrinenotes` WHERE `doctrinenotes`.`doctrineReferenceNo`=?;";
		List<DoctrineNotes> casesList=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
			preparedStatement=connection.prepareStatement(query); 
			preparedStatement.setInt(1, refNo);
			resultSet = preparedStatement.executeQuery();
			casesList=new ArrayList<DoctrineNotes>();
			DoctrineNotes notes=null;
			while(resultSet.next()){
				notes=new DoctrineNotes();
				notes.setDoctrineNotesId(resultSet.getInt("doctrineNotesId"));
				notes.setDoctrineReferenceNo(resultSet.getInt("doctrineReferenceNo"));
				notes.setDoctrineNotes(resultSet.getString("doctrineNotes"));
				notes.setDoctrineNotesDateCreated(resultSet.getString("doctrineNotesDateCreated"));
				casesList.add(notes);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return casesList;
	}

	public DoctrineRule validateDoctrine(String sectionNo, String chapterNo){
		String query="SELECT `doctrinerule`.`doctrineRuleId`,`doctrinerule`.`doctrineName`,`doctrinerule`.`doctrineType`,"
				+ "`doctrinerule`.`doctrineReferenceNo`,`doctrinerule`.`doctrineDateCreated`,`doctrinerule`.`doctrineChapterNo`,"
				+ "`doctrinerule`.`doctrineSectionNo`,`doctrinerule`.`doctrineSummary`,`doctrinerule`.`keywords`"
				+ "FROM `tkbs`.`doctrinerule` WHERE `doctrinerule`.`doctrineSectionNo`=? AND `doctrinerule`.`doctrineChapterNo`=?;";
		DoctrineRule doctrineRule=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
			preparedStatement=connection.prepareStatement(query); 
			preparedStatement.setString(1, sectionNo);
			preparedStatement.setString(2, chapterNo);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()){
				doctrineRule=new DoctrineRule();
				doctrineRule.setDoctrineRuleId(resultSet.getInt("doctrineRuleId"));
				doctrineRule.setDoctrineName(resultSet.getString("doctrineName"));
				doctrineRule.setDoctrineType(resultSet.getString("doctrineType"));
				doctrineRule.setDoctrineReferenceNo(resultSet.getString("doctrineReferenceNo"));
				doctrineRule.setDoctrineDateCreated(resultSet.getString("doctrineDateCreated"));
				doctrineRule.setDoctrineChapterNo(resultSet.getString("doctrineChapterNo"));
				doctrineRule.setDoctrineSectionNo(resultSet.getString("doctrineSectionNo"));
				doctrineRule.setDoctrineSummary(resultSet.getString("doctrineSummary"));
				doctrineRule.setKeywords(resultSet.getString("keywords"));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}		


		return doctrineRule;
	}
	public DoctrineRule validateDoctrine(Integer refNo){
		String query="SELECT `doctrinerule`.`doctrineRuleId`,`doctrinerule`.`doctrineName`,`doctrinerule`.`doctrineType`,"
				+ "`doctrinerule`.`doctrineReferenceNo`,`doctrinerule`.`doctrineDateCreated`,`doctrinerule`.`doctrineChapterNo`,"
				+ "`doctrinerule`.`doctrineSectionNo`,`doctrinerule`.`doctrineSummary`,`doctrinerule`.`keywords`"
				+ "FROM `tkbs`.`doctrinerule` WHERE `doctrinerule`.`doctrineRuleId`=?;";
		DoctrineRule doctrineRule=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
			preparedStatement=connection.prepareStatement(query); 
			preparedStatement.setInt(1, refNo);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()){
				doctrineRule=new DoctrineRule();
				doctrineRule.setDoctrineRuleId(resultSet.getInt("doctrineRuleId"));
				doctrineRule.setDoctrineName(resultSet.getString("doctrineName"));
				doctrineRule.setDoctrineType(resultSet.getString("doctrineType"));
				doctrineRule.setDoctrineReferenceNo(resultSet.getString("doctrineReferenceNo"));
				doctrineRule.setDoctrineDateCreated(resultSet.getString("doctrineDateCreated"));
				doctrineRule.setDoctrineChapterNo(resultSet.getString("doctrineChapterNo"));
				doctrineRule.setDoctrineSectionNo(resultSet.getString("doctrineSectionNo"));
				doctrineRule.setDoctrineSummary(resultSet.getString("doctrineSummary"));
				doctrineRule.setKeywords(resultSet.getString("keywords"));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}		


		return doctrineRule;
	}

	public List<DoctrineRule> getDoctrineReport(String startDate, String endDate){
		List<DoctrineRule> doctrines=null;
		String query="SELECT `doctrinerule`.`doctrineRuleId`,`doctrinerule`.`doctrineName`,"
				+ "`doctrinerule`.`doctrineType`,`doctrinerule`.`doctrineReferenceNo`,"
				+ "`doctrinerule`.`doctrineDateCreated`,`doctrinerule`.`doctrineChapterNo`,"
				+ "`doctrinerule`.`doctrineSectionNo`,`doctrinerule`.`doctrineSummary`,`doctrinerule`.`keywords` "
				+ "FROM `tkbs`.`doctrinerule`"
				+ "WHERE `doctrinerule`.`doctrineDateCreated` >= ? "
				+ "AND `doctrinerule`.`doctrineDateCreated`<=?;";
		try {
			doctrines=new ArrayList<DoctrineRule>();
			DoctrineRule doctrineRule=null;
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
			preparedStatement=connection.prepareStatement(query); 
			preparedStatement.setString(1, startDate);
			preparedStatement.setString(2, endDate);
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
				doctrineRule.setDoctrineSummary(resultSet.getString("doctrineSummary"));
				doctrineRule.setKeywords(resultSet.getString("keywords"));
				doctrines.add(doctrineRule);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return doctrines;
	}

	public List<DoctrineCases> mostViewedCases(){
		List<DoctrineCases> list=null;
		DoctrineCases cases=null;
		ResultSet resultSet;
		String query="SELECT `controllingcases`.`controllingCasesId`,`controllingcases`.`doctrineReferenceNo`,"+
				"`controllingcases`.`caseName`,`controllingcases`.`caseCode`,`controllingcases`.`caseYear`,"+
				"`controllingcases`.`sectionNo`,`controllingcases`.`chapterNo`,`controllingcases`.`caseSummary`,"+
				"`controllingcases`.`count` FROM tkbs.controllingcases order by `count` DESC LIMIT 10;";
		try{
			list=new ArrayList<DoctrineCases>();
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
			preparedStatement=connection.prepareStatement(query);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()){
				cases=new DoctrineCases();
				cases.setControllingCasesId(resultSet.getInt("controllingCasesId"));
				cases.setDoctrineReferenceNo(resultSet.getInt("doctrineReferenceNo"));
				cases.setCaseName(resultSet.getString("caseName"));
				cases.setCaseCode(resultSet.getString("caseCode"));
				cases.setCaseYear(resultSet.getString("caseYear"));
				cases.setSectionNo(resultSet.getString("sectionNo"));
				cases.setChapterNo(resultSet.getString("chapterNo"));
				cases.setCaseSummary(resultSet.getString("caseSummary"));
				list.add(cases);
			}
			
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return list;
	}
	
	public String deleteDoctrine(String section, String chapter){
		String query="DELETE FROM `tkbs`.`doctrinerule` WHERE doctrineSectionNo=? AND doctrineChapterNo=?;";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/tkbs","root","");
			preparedStatement=connection.prepareStatement(query);
			preparedStatement.setString(1, section);
			preparedStatement.setString(2, chapter);
			int count=preparedStatement.executeUpdate();
			if(count>0){
				return "Doctrine deleted successfully.";
			}
			else{
				return "No Doctrine found.";
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		
		return "";
	}
	
	//write a method for case details
	//method to validate statutory info
	//add a db table for statutory info
	//method to alter keywords

}
