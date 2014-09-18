/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package base;
import java.io.Serializable;
import java.sql.*;
/**
 *
 * @author Daniel
 */
public class Employee implements Serializable
{
    private int acctNum;
    private int depNum;
    private String depName;
    private String fName;
    private String lName;
    private String password;
    private boolean tp;
    private boolean vpoa;
    private boolean admin;
    private boolean loggedIn;

    public Employee()
    {
        acctNum = -1;
        fName = "";
        lName = "";
        password = "";
        tp = false;
        vpoa = false;
        admin = false;
        loggedIn = false;
        depNum = 0;
        depName = "";

    }
    public void setDepNum(int n)
    {
        depNum = n;
    }
    public int getDepNum()
    {
        return depNum;
    }
    public void setDepName(String s)
    {
        depName = s;
    }
    public String getDepName()
    {
        return depName;
    }
    public void setAdmin(boolean b)
    {
        admin = b;
    }
    public void setAcctNum(int n)
    {
        acctNum = n;
    }
    public void setFName(String s)
    {
        fName = s;
    }
    public void setLName(String s)
    {
        lName = s;
    }
    public void setPassword(String s)
    {
        password = s;
    }
    public void setTP(boolean b)
    {
        tp = b;
    }
    public void setVpoa(boolean b)
    {
        vpoa = b;
    }
    public void setLoggedIn(String s)
    {
        if (s.equals(password))
        {
           loggedIn = true;
        }
        else loggedIn = false;
    }
    public boolean getAdmin()
    {
        return admin;
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
    public String getPassword()
    {
        return password;
    }
    public boolean getTP()
    {
        return tp;
    }
    public boolean getVpoa()
    {
        return vpoa;
    }
    public boolean getLoggedIn()
    {
        return loggedIn;
    }
    public void setEmployee(ResultSet r)
    {
        try
        {
            setAcctNum(r.getInt("emp_acctnum"));
            setLName(r.getString("emp_lname"));
            setFName(r.getString("emp_fname"));
            setTP(r.getBoolean("emp_tp"));
            setVpoa(r.getBoolean("emp_vpoa"));
            setAdmin(r.getBoolean("emp_admin"));
            setPassword(r.getString("emp_pswd"));
            setDepNum(r.getInt("dep_num"));
            setDepName(r.getString("dep_name"));
    
            
        }
        catch(SQLException e) {}
    }

}
