/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package base;
import java.sql.*;
import java.io.Serializable;
/**
 *
 * @author Daniel
 */
public class Section implements Serializable {
    private String name;
    private int priceReg;
    private int pricePrem;
    private int secNum;

    public Section()
    {
        name = "";
        priceReg = 0;
        pricePrem = 0;
        secNum = 1;
    }

    public void setSecNum(int n)
    {
        secNum = n;
    }
    public int getSecNum()
    {
        return secNum;
    }
    public void setName(String s)
    {
        name = s;
    }
    public void setPriceReg(int n)
    {
        priceReg = n;
    }
    public void setPricePrem(int n)
    {
        pricePrem = n;
    }
    public String getName()
    {
        return name;
    }
    public int getPriceReg()
    {
        return priceReg;
    }
    public int getPricePrem()
    {
        return pricePrem;
    }
    public void setSection(ResultSet r)
    {
        try
        {
            setSecNum(r.getInt("sec_num"));
            setName(r.getString("sec_name"));
            setPriceReg(r.getInt("sec_price"));
            setPricePrem(r.getInt("sec_price_prem"));
        }
        catch(SQLException e) {}
    }
}
