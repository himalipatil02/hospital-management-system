package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctor;
import com.entity.Specialist;

public class DoctorDao {
	private Connection con;

	public DoctorDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean doctorRegistor(Doctor d){
		boolean f=false;
		try {
			String sql = "insert into doctor(fullname,dob,qualification,specialist,email,mobile,password) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, d.getFullname());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobile());
			ps.setString(7, d.getPassword());
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Doctor> getAllDoctor(){
		List<Doctor> list = new ArrayList<Doctor>();
		Doctor d=null;
		try {
			String sql="Select * from doctor order by id desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullname(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialist(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobile(rs.getString(7));
				d.setPassword(rs.getString(8));
				list.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	public Doctor getAllDoctorbyId(int id){
		
		Doctor d=null;
		try {
			String sql="Select * from doctor where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullname(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialist(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobile(rs.getString(7));
				d.setPassword(rs.getString(8));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return d;
		
	}
	public boolean doctorupdate(Doctor d){
		boolean f=false;
		try {
			String sql = "update doctor set fullname=?,dob=?,qualification=?,specialist=?,email=?,mobile=?,password=? where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, d.getFullname());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobile());
			ps.setString(7, d.getPassword());
			ps.setInt(8, d.getId());
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public boolean deleteDoctor(int  id){
		boolean f=false;
		try {
			String sql = "delete from doctor where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setInt(1,id);
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public Doctor login(String email,String password) {
		Doctor  d = null;
		try {
			PreparedStatement ps = con.prepareStatement("select * from doctor where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt(1));
				d.setFullname(rs.getString(2));
				d.setDob(rs.getString(3));
				d.setQualification(rs.getString(4));
				d.setSpecialist(rs.getString(5));
				d.setEmail(rs.getString(6));
				d.setMobile(rs.getString(7));
				d.setPassword(rs.getString(8));
				
			}
			} catch (Exception e) {
			e.printStackTrace();
		}
		return d;
	}
	
	
	
public int countAllDoctors(){
		
		int i=0;
		try {
			String sql="Select * from doctor";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				i++;
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
		
	}
public int countAllAppointment(){
	
	int i=0;
	try {
		String sql="Select * from appointment";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			i++;
			
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return i;
	
}
public int countAllAppointmentById(int did){
	
	int i=0;
	try {
		String sql="Select * from appointment where doctorId=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, did);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			i++;
			
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return i;
	
}
public int countAllSpecialist(){
	
	int i=0;
	try {
		String sql="Select * from specialist";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			i++;
			
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return i;
	
}
public int countAllUsers(){
	
	int i=0;
	try {
		String sql="Select * from user_details";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			i++;
			
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return i;
	
}

}
