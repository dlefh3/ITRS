/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package base;
import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.sql.*;
/**
 *
 * @author Daniel
 */
public class Game implements Serializable {
    private Date gameDay;
    private String opponent;
    private boolean soldout;
    private int gameNum;

    public Game()
    {
        gameDay = new Date();
        opponent = "";
        soldout = false;
        gameNum = -1;
    }
    public Game(Date d, String s, boolean b, int n)
    {
        gameDay = d;
        opponent = s;
        soldout = b;
        gameNum = n;
    }

    public void setGameNum(int n)
    {
        gameNum = n;
    }
    public int getGameNum()
    {
        return gameNum;
    }
    public void setGameDay(Date d)
    {
        gameDay = d;
    }
    public Date getGameDay()
    {
        return gameDay;
    }
    public void setOpponent(String s)
    {
        opponent = s;
    }
    public String getOpponent()
    {
        return opponent;
    }
    public void setSoldOut(boolean b)
    {
        soldout = b;
    }
    public boolean getSoldOut()
    {
        return soldout;
    }
    public void setGame(ResultSet r)
    {
        try
        {
            setGameNum(r.getInt("game_num"));
            setGameDay(r.getDate("game_date"));
            setOpponent(r.getString("game_opponent"));
            setSoldOut(r.getBoolean("game_soldout"));
        }
        catch(SQLException e) {}
    }
}
