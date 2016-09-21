import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Administrator on 2016/9/20.
 */
public class SubmitServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String btn1 = req.getParameter("SendMsg");
        String btn2 = req.getParameter("GetAllRecords");
        String btn3 = req.getParameter("GetSpecificRecords");
        String btn4 = req.getParameter("Login");

        if(btn4!=null){
            req.getRequestDispatcher("/LoginServlet").forward(req,resp);
        }
        else{
            //发送信息
            if(btn1!=null){
                req.getRequestDispatcher("/TestServlet").forward(req,resp);
            }
            //得到当前用户所有通信记录
            else if(btn2!=null){
                req.getRequestDispatcher("/GetRecordsServlet").forward(req,resp);
            }
            //得到当前用户特定时间段通信记录
            else if(btn3!=null){
                req.getRequestDispatcher("/GetRecordsServlet").forward(req,resp);
            }
        }

    }
}
