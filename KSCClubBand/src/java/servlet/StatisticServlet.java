package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import db.Statistic_StorkTeam;
import java.util.Map;
import org.joda.time.DateTime;
import model.Event;

public class StatisticServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userPath = request.getServletPath();
        if(userPath.equals("/JSPSumPriceEveryMonthOfYear") |
           userPath.equals("/JSPNextSumPriceEveryMonthOfYear") |
           userPath.equals("/JSPPrevSumPriceEveryMonthOfYear")) {
            Statistic_StorkTeam db = new Statistic_StorkTeam();
            int currentYear;
            if(userPath.equals("/JSPNextSumPriceEveryMonthOfYear")) {
                currentYear = Integer.parseInt(request.getParameter("currentYear")) + 1;
            } else if(userPath.equals("/JSPPrevSumPriceEveryMonthOfYear")) {
                currentYear = Integer.parseInt(request.getParameter("currentYear")) - 1;
            } else {
                DateTime currentTime = new DateTime();
                currentYear = currentTime.getYear();
            }
            Map<Integer, Float> mapSumPrices = db.selectSumPriceEveryMonthOfYear(currentYear);
            Map<Integer, Integer> mapAmountEvents = db.selectAmountEventEveryMonthOfYear(currentYear);
            Map<Integer, Integer> mapAmountParticipants = db.selectAmountParticipantsEveryMonthOfYear(currentYear);
            request.setAttribute("currentYear", currentYear);
            request.setAttribute("mapAmountEvents", mapAmountEvents);
            request.setAttribute("mapSumPrices", mapSumPrices);
            request.setAttribute("mapAmountParticipants", mapAmountParticipants);
            request.getRequestDispatcher("/WEB-INF/admin/statistic.jsp").forward(request, response);
        } else if(userPath.equals("/SelectAmountClassifyEventsMonth")) {
            int currentYear = Integer.parseInt(request.getParameter("year"));
            int month = Integer.parseInt(request.getParameter("month"));
            Statistic_StorkTeam db = new Statistic_StorkTeam();
            
            Map<Integer, Float> mapSumPrices = db.selectSumPriceEveryMonthOfYear(currentYear);
            Map<Integer, Integer> mapAmountEvents = db.selectAmountEventEveryMonthOfYear(currentYear);
            Map<Integer, Integer> mapAmountParticipants = db.selectAmountParticipantsEveryMonthOfYear(currentYear);
            request.setAttribute("currentYear", currentYear);
            request.setAttribute("mapAmountEvents", mapAmountEvents);
            request.setAttribute("mapSumPrices", mapSumPrices);
            request.setAttribute("mapAmountParticipants", mapAmountParticipants);
            request.setAttribute("month", month);
            Map<String, Integer> mapAmountClassifyEventsMonth = db.selectAmountClassifyEventsMonth(currentYear, month);
            request.setAttribute("mapAmountClassifyEventsMonth", mapAmountClassifyEventsMonth);
            request.getRequestDispatcher("/WEB-INF/admin/statistic.jsp").forward(request, response);
        } else if(userPath.equals("/SelectClassifyEventsMonth")) {
            int year = Integer.parseInt(request.getParameter("year"));
            int month = Integer.parseInt(request.getParameter("month"));
            Statistic_StorkTeam db = new Statistic_StorkTeam();
            Map<Integer, Event> mapClassifyEvents = db.selectClassifyEventsMonth(year, month);
            request.setAttribute("mapClassifyEvents", mapClassifyEvents);
            request.getRequestDispatcher("/WEB-INF/admin/classifyevent.jsp").forward(request, response);
        }
    }
}
