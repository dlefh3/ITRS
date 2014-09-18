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
public class PaidRequest implements Serializable
{
    private int paidNum, acctNum, depNum, gameNum, secNum, reqSeats, actSeats, status, amtDue;
    private String denyReason, department, section, opponent, fName, lName, recipient;
    private boolean locNA, toi;
    private Date subDate, purchDate, game;

    private String cardType, cardExpir, cardSecNum, cardNum;

    public void setRecipient(String s)
    {
        recipient = s;
    }
    public String getRecipient()
    {
        return recipient;
    }
    public void setAmtDue(int n)
    {
        amtDue = n;
    }
    public int getAmtDue()
    {
        return amtDue;
    }
    public void setCardType(String s)
    {
        cardType = s;
    }
    public void setCardExpir(String s)
    {
        cardExpir = s;
    }
    public void setCardSecNum(String s)
    {
        cardSecNum = s;
    }
    public void setCardNum(String s)
    {
        cardNum = s;
    }
    public String getCardType()
    {
        return cardType;
    }
    public String getCardExpir()
    {
        return cardExpir;
    }
    public String getCardNum()
    {
        return cardNum;
    }
    public String getCardSecNum()
    {
        return cardSecNum;
    }
    public void setPaidNum(int n)
    {
        paidNum = n;
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
    
    public void setPurchDate(Date d)
    {
        purchDate = d;
    }
    public int getPaidNum()
    {
        return paidNum;
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
    
    public Date getPurchDate()
    {
        return purchDate;
    }
    public String getCardNumProt()
    {
       String s = cardNum.substring(cardNum.length()-4, cardNum.length());
       s = "XXXX-XXXX-XXXX-" + s;
        return s;
    }
    public void setRequest(ResultSet r)
    {
        try
        {
            setPaidNum(r.getInt("paid_num"));
            setAcctNum(r.getInt("emp_acctnum"));
            setFName(r.getString("emp_fname"));
            setLName(r.getString("emp_lname"));
            setDepNum(r.getInt("dep_num"));
            setDepartment(r.getString("dep_name"));
            setGameNum(r.getInt("game_num"));
            setGame(r.getDate("game_date"));
            setSecNum(r.getInt("sec_num"));
            setSection(r.getString("sec_name"));
            setReqSeats(r.getInt("paid_req_seats"));
            setActSeats(r.getInt("paid_act_seats"));
            setLocNA(r.getBoolean("paid_loc_na"));
            setToi(r.getBoolean("paid_toi"));
            setStatus(r.getInt("paid_status"));
            setOpponent(r.getString("game_opponent"));
            setSubDate(r.getDate("paid_submit_date"));
            setPurchDate(r.getDate("paid_purchase_date"));
            setDenyReason(r.getString("paid_deny_reason"));
            setAmtDue(r.getInt("paid_amtdue"));
            setCardType(r.getString("paid_cc_type"));
            setCardNum(r.getString("paid_cc_num"));
            setCardExpir(r.getString("paid_cc_expir"));
            setCardSecNum(r.getString("paid_cc_secnum"));
            setRecipient(r.getString("paid_recipient"));
        }
        catch(SQLException e) {}

    }
}
