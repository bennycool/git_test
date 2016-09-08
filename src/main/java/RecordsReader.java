/**
 * Created by Administrator on 2016/9/8.
 */
import java.io.*;

public class RecordsReader{
    public String ReadRecords(UserBean userBean){
        String records = "";
        String line = "";
        String file = userBean.getUserName()+".txt";
        try{
            BufferedReader in = new BufferedReader(new FileReader(file));
            line = in.readLine();
            StringBuffer buf = new StringBuffer("");
            while(line!=null){
                buf.append(line+"\n");
                line = in.readLine();
            }
            records = buf.toString();
            in.close();
        }catch (IOException e){
            e.printStackTrace();
        }
        return records;
    }


    public String GetHistory(UserBean userBean){
//        String history = "";
//        String line = "";
//        String file = userBean.getUserName()+".txt";
//        try{
//            BufferedReader in = new BufferedReader(new FileReader(file));
//            line = in.readLine();
//            StringBuffer buf = new StringBuffer("");
//            while(line!=null){
//                buf.append(line+"\n");
//                line = in.readLine();
//            }
//            history = buf.toString();
//            in.close();
//        }catch (IOException e){
//            e.printStackTrace();
//        }


//        History history;
//        history.a().b().c();
//
//        h.handle(history);
          return "";
    }


//    private Handler h_;
//
//    Handler geth();
//    void seth(Handler h);
}
