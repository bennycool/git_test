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
<body>
<form action="TestServlet" method="post">
    User: <input type="text" name="user"><br>
    InputBox: <textarea name="inputBox" rows="10" cols="30"></textarea><br>
    <input type="submit" name="send" value="Send"><br>
    History Records: <textarea name="historyRecords" rows="10" cols="30"><%=session.getAttribute("userBean") %></textarea><br>
    <input type="submit" name="getRecords" value="Get Records"  formmethod="get">
</form>



</body>
</html>
