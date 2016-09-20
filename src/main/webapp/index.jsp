<%--&lt;%&ndash;<%@ page import="javax.annotation.processing.FilerException" %>&ndash;%&gt;--%>
<%--&lt;%&ndash;<%@ page import="java.io.*" %>&lt;%&ndash;%>--%>
    <%--&lt;%&ndash;String history = "";&ndash;%&gt;--%>
    <%--&lt;%&ndash;String name = request.getParameter("user");&ndash;%&gt;--%>
    <%--&lt;%&ndash;String file = name+".txt";&ndash;%&gt;--%>
    <%--&lt;%&ndash;String input = request.getParameter("inputBox");&ndash;%&gt;--%>
    <%--&lt;%&ndash;String method = request.getMethod();&ndash;%&gt;--%>
    <%--&lt;%&ndash;if(method.equalsIgnoreCase("post")){&ndash;%&gt;--%>
        <%--&lt;%&ndash;try {&ndash;%&gt;--%>
           <%--&lt;%&ndash;/* FileWriter writer = new FileWriter(file,);&ndash;%&gt;--%>
            <%--&lt;%&ndash;writer.write(input);&ndash;%&gt;--%>
            <%--&lt;%&ndash;writer.write("\n");&ndash;%&gt;--%>
            <%--&lt;%&ndash;writer.close();*/&ndash;%&gt;--%>
            <%--&lt;%&ndash;FileOutputStream of = new FileOutputStream(file,true);&ndash;%&gt;--%>
            <%--&lt;%&ndash;of.write((input+"\n").getBytes("utf-8"));&ndash;%&gt;--%>
            <%--&lt;%&ndash;of .close();;&ndash;%&gt;--%>
        <%--&lt;%&ndash;}catch (IOException e){&ndash;%&gt;--%>
            <%--&lt;%&ndash;e.printStackTrace();&ndash;%&gt;--%>
        <%--&lt;%&ndash;}&ndash;%&gt;--%>
    <%--&lt;%&ndash;}&ndash;%&gt;--%>
    <%--&lt;%&ndash;else if(method.equalsIgnoreCase("get"))&ndash;%&gt;--%>
    <%--&lt;%&ndash;{&ndash;%&gt;--%>
        <%--&lt;%&ndash;String line = "";&ndash;%&gt;--%>
        <%--&lt;%&ndash;try{&ndash;%&gt;--%>
            <%--&lt;%&ndash;BufferedReader in = new BufferedReader(new FileReader(file));&ndash;%&gt;--%>
            <%--&lt;%&ndash;line = in.readLine();&ndash;%&gt;--%>
            <%--&lt;%&ndash;StringBuffer buf = new StringBuffer("");&ndash;%&gt;--%>
            <%--&lt;%&ndash;while(line!=null){&ndash;%&gt;--%>
                <%--&lt;%&ndash;buf.append(line+"\n");&ndash;%&gt;--%>
                <%--&lt;%&ndash;line = in.readLine();&ndash;%&gt;--%>
            <%--&lt;%&ndash;}&ndash;%&gt;--%>
            <%--&lt;%&ndash;history = buf.toString();&ndash;%&gt;--%>
            <%--&lt;%&ndash;in.close();&ndash;%&gt;--%>
        <%--&lt;%&ndash;}catch (IOException e){&ndash;%&gt;--%>
            <%--&lt;%&ndash;e.printStackTrace();&ndash;%&gt;--%>
        <%--&lt;%&ndash;}&ndash;%&gt;--%>
    <%--&lt;%&ndash;}&ndash;%&gt;--%>
<%--%>--%>


<html>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<body>
<div>Welcome,<%=session.getAttribute("userName")%>!</div><br>
<form action="SubmitServlet" method="post">
    <textarea name="inputBox" rows="10" cols="50"></textarea><br>
    To: <input name="receiver">
    <input type="submit" name="SendMsg" value="Send"><br><br>
</form>
<form action="SubmitServlet" method="get">
    <%--根据时间信息调回记录或者调回全部记录--%>
    <input type="submit" name="GetAllRecords" value="Get All Records" ><br>
</form>
<form action="SubmitServlet" method="post">
    start time: <input name="year1">-<input name="month1">-<input name="date1"> <input name="hour1">:<input name="minute1">:<input name="second1"><br>
    end time: <input name="year2" value="2016">-<input name="month2"value="9">-<input name="date2" value="18"> <input name="hour2" value="13">:<input name="minute2" value="30">:<input name="second2" value="0">
    <%--<input type="text" id="startTime" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy/MM/dd HH:mm:ss'})"/>--%>
    <input type="submit" name="GetSpecificRecords" value="Get Records">
</form>
<textarea name="historyRecords" rows="10" cols="50" ><%=session.getAttribute("records")%></textarea><br>
</body>
</html>
