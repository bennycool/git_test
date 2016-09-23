import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by Administrator on 2016/9/13.
 */
public class GetRecordsServlet extends HttpServlet {
    private UsersDao usersDao = new UsersDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserBean userBean = new UserBean();
        HttpSession session = (HttpSession)req.getSession(true);
        userBean.setUserName(session.getAttribute("userName").toString());
        String records = usersDao.ReadAllRecords(userBean);

        //req.setAttribute("records",userBean.getMessage());
        //req.getRequestDispatcher("/index.jsp").forward(req,resp);
        PrintWriter writer = resp.getWriter();
        writer.write(records);
        writer.close();

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserBean userBean = new UserBean();
        HttpSession session = (HttpSession)req.getSession(true);
        userBean.setUserName(session.getAttribute("userName").toString());
        resp.setHeader("Cache-Control", "no-cache");
        //resp.setHeader("pragma","no-cache");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Calendar c = Calendar.getInstance();
        c.set(1,1,1,1,1,1);
        Date start = c.getTime();
        c.set(2200,1,1,1,1,1);
        Date end = c.getTime();

        try {
            start = sdf.parse(req.getParameter("startTime").toString());
        } catch (ParseException e) {
            e.printStackTrace();
        }catch (NullPointerException e){
            e.printStackTrace();
        }
        try {
            end = sdf.parse(req.getParameter("endTime").toString());
        } catch (ParseException e) {
            e.printStackTrace();
        }catch (NullPointerException e){
            e.printStackTrace();
        }

        userBean.setStartTime(sdf.format(start));
        userBean.setEndTime(sdf.format(end));
        userBean.setAct("GetSpecificRecords");
        String records = usersDao.SendInstruction(userBean);
        //req.setAttribute("records",records);
        //req.getRequestDispatcher("/index.jsp").forward(req,resp);

        PrintWriter out = resp.getWriter();
        out.write(records);
        out.close();
    }
}
