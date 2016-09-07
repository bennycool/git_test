<%@ page import="javax.annotation.processing.FilerException" %>
<%@ page import="java.io.*" %><%
    String history = "";
    String name = request.getParameter("user");
    String file = name+".txt";
    String input = request.getParameter("inputBox");
    String method = request.getMethod();
    if(method.equalsIgnoreCase("post")){
        try {
           /* FileWriter writer = new FileWriter(file,);
            writer.write(input);
            writer.write("\n");
            writer.close();*/
            FileOutputStream of = new FileOutputStream(file,true);
            of.write((input+"\n").getBytes("utf-8"));
            of .close();;
        }catch (IOException e){
            e.printStackTrace();
        }
    }
    else if(method.equalsIgnoreCase("get"))
    {
        String line = "";
        try{
            BufferedReader in = new BufferedReader(new FileReader(file));
            line = in.readLine();
            StringBuffer buf = new StringBuffer("");
            while(line!=null){
                buf.append(line+"\n");
                line = in.readLine();
            }
            history = buf.toString();
            in.close();
        }catch (IOException e){
            e.printStackTrace();
        }
    }


%>
<html>
<body>
<form action="index.jsp" method="post">
    User: <input type="text" name="user"><br>
    InputBox: <textarea name="inputBox" rows="10" cols="30"></textarea><br>
    <input type="submit" name="send" value="Send"><br>
    History Records: <textarea name="historyRecords" rows="10" cols="30"><%=history%></textarea><br>
    <input type="submit" name="getRecords" value="Get Records" formmethod="get" >
</form>


</body>
</html>
