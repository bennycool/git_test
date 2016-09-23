

import java.io.*;
import java.net.Socket;
import java.net.SocketTimeoutException;

/**
 * Created by Administrator on 2016/9/8.
 */
public class UsersDao {
    private String path = "E:/lubin/tmp/";


    public String ReadAllRecords(UserBean userBean){
        String records = "";
        String line = "";
        String file = path+userBean.getUserName()+".txt";
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

    public String SendInstruction(UserBean userBean){
        Socket client = null;
        char[] msg = new char[2048];
        try {
            client = new Socket("127.0.0.1", 10245);
            Writer out = new OutputStreamWriter(client.getOutputStream(), "GBK");
            //client.setSoTimeout(8000);
            String input = userBean.Serialized();
            if(!input.isEmpty()) {
                out.write(input + "\r\n");
                out.flush();
            }

            BufferedReader in = new BufferedReader(new InputStreamReader(client.getInputStream()));
            in.read(msg,0,2048);
            System.out.println("received");
                /*while (msg==null)
                {
                    in.read(msg,0,1024);
                }*/
            System.out.println(new String(msg)+"/");

        }  catch (IOException e) {
            e.printStackTrace();
        }
        finally {
            try {
                client.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return new String(msg);
    }

    public void WriteRecordstoFile(UserBean userBean){
//        写入file部分
        if(userBean.getAct().equalsIgnoreCase("Send")){
            String file = path+userBean.getUserName()+".txt";
            String input = userBean.getMessage();
            try {
                FileOutputStream of = new FileOutputStream(file,true);
                of.write((userBean.getSendTime().toString()+" "+"to:"+userBean.getReceiver()+" ").getBytes("utf-8"));
                of.write((input+"\n").getBytes("utf-8"));
                of .close();;
            }catch (IOException e){
                e.printStackTrace();
            }
        }

    }

}

