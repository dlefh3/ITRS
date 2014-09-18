/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package base;
import java.util.Date;
import java.io.Serializable;
import java.sql.*;
/**
 *
 * @author Daniel
 */
public class CompRequest implements Serializable {
    private int compNum, acctNum, depNum, gameNum, secNum, reqSeats, actSeats, status;
    private String recipient, purpose, denyReason, department, section, opponent, fName, lName;
    private boolean locNA, toi;
    private Date subDate, apprDate, purchDate, game;
    
    public CompRequest() 
    {
        
    }
    
    public void setCompNum(int n)
    {
        compNum = n;
    }
    public void setAcctNum(int n)
    {
        acctNum = n;
    }
    public void setDepNum(int n)
    {
        depNum = n;
    }
    public void setFName(String s)
    {
        fName = s;
    }
    public void setLName(String s)
    {
        lName = s;
    }
    public void setGameNum(int n)
    {
        gameNum = n;
    }
    public void setSecNum(int n)
    {
        secNum = n;
    }
    public void setDepartment(String s)
    {
        department = s;
    }
    public void setGame(Date d)
    {
        game = d;
    }
    public void setSection(String s)
    {
        section = s;
    }
    public void setReqSeats(int n)
    {
        reqSeats = n;
    }
    public void setActSeats(int n)
    {
        actSeats = n;
    }
    public void setStatus(int n)
    {
        status = n;
    }
    public void setRecipient(String s)
    {
        recipient = s;
    }
    public void setPurpose(String s)
    {
        purpose = s;
    }
    public void setOpponent(String s)
    {
        opponent = s;
    }
    public void setDenyReason(String s)
    {
        denyReason = s;
    }
    public void setLocNA(boolean b)
    {
        locNA = b;
    }
    public void setToi(boolean b)
    {
        toi = b;
    }
    public void setSubDate(Date d)
    {
        subDate = d;
    }
    public void setApprDate(Date d)
    {
        apprDate = d;
    }
    public void setPurchDate(Date d)
    {
        purchDate = d;
    }
    public int getCompNum()
    {
        return compNum;
    }
    public int getAcctNum()
    {
        return acctNum;
    }
    public String getFName()
    {
        return fName;
    }
    public String getLName()
    {
        return lName;
    }
    public String getOpponent()
    {
        return opponent;
    }
    public String getDepartment()
    {
        return department;
    }
    public Date getGame()
    {
        return game;
    }
    public String getSection()
    {
        return section;
    }
    public int getSecNum()
    {
        return secNum;
    }
    public int getGameNum()
    {
        return gameNum;
    }
    public int getDepNum()
    {
        return depNum;
    }
    public int getReqSeats()
    {
        return reqSeats;
    }
    public int getActSeats()
    {
        return actSeats;
    }
    public int getStatus()
    {
        return status;
    }
    public String getRecipient()
    {
        return recipient;
    }
    public String getPurpose()
    {
        return purpose;
    }
    public String getDenyReason()
    {
        return denyReason;
    }
    public boolean getLocNA()
    {
        return locNA;
    }
    public boolean getToi()
    {
        return toi;
    }
    public Date getSubDate()
    {
        return subDate;
    }
    public Date getApprDate()
    {
        return apprDate;
    }
    public Date getPurchDate()
    {
        return purchDate;
    }
    public void setRequest(ResultSet r)
    {
        try
        {
            setCompNum(r.getInt("comp_num"));
            setAcctNum(r.getInt("emp_acctnum"));
            setFName(r.getString("emp_fname"));
            setLName(r.getString("emp_lname"));
            setDepNum(r.getInt("dep_num"));
            setDepartment(r.getString("dep_name"));
            setGameNum(r.getInt("game_num"));
            setGame(r.getDate("game_date"));
            setSecNum(r.getInt("sec_num"));
            setSection(r.getString("sec_name"));
            setReqSeats(r.getInt("comp_req_seats"));
            setRecipient(r.getString("comp_recipient"));
            setPurpose(r.getString("comp_purpose"));
            setActSeats(r.getInt("comp_act_seats"));
            setLocNA(r.getBoolean("comp_loc_na"));
            setToi(r.getBoolean("comp_toi"));
            setStatus(r.getInt("comp_status"));
            setOpponent(r.getString("game_opponent"));
            setSubDate(r.getDate("comp_submit_date"));
            setApprDate(r.getDate("comp_approval_date"));
            setPurchDate(r.getDate("comp_purchase_date"));
            setDenyReason(r.getString("comp_deny_reason"));
        }
        catch (SQLException e) {}
    }
    
}
