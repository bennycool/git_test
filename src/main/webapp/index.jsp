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
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    if(request.getAttribute("records")==null) request.setAttribute("records","Records");
%>
<html>
<meta charset="utf-8">

<body>
<script type="text/javascript" src="/My97DatePicker/WdatePicker.js"></script>
<script>
    var xmlhttp;
    function myFunction() {

        if(window.XMLHttpRequest){
            xmlhttp = new XMLHttpRequest();
        }
        else{
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function () {
//            alert(xmlhttp.readyState+","+xmlhttp.status);
            if(xmlhttp.readyState==4){
                if(xmlhttp.status==200){
                    document.getElementById("historyRecords").innerText = xmlhttp.responseText;

                }
            }
        }
        startTime = document.getElementById("startTime").value;
        endTime = document.getElementById("endTime").value;
        var param;
        param = "startTime="+startTime+"&endTime="+endTime;
        //alert(param);
        xmlhttp.open("POST","/GetRecordsServlet",true);
        xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
        //xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        xmlhttp.send(param);
    }
    
    function myFun() {
        if (window.XMLHttpRequest) {
            xmlhttp = new XMLHttpRequest();
        }
        else {
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4) {
                if (xmlhttp.status == 200) {
                    document.getElementById("historyRecords").innerHTML = xmlhttp.responseText;

                }
            }
        }
        xmlhttp.open("GET","/GetRecordsServlet",true);
        xmlhttp.send();
    }
</script>


<div>Welcome,<%=session.getAttribute("userName")%>!</div><br>

<form action="SubmitServlet" method="post">
    <textarea name="inputBox" rows="10" cols="50"></textarea>
    <textarea name="contacts" rows="10" cols="10" ><%=session.getAttribute("contacts")%></textarea>
    <br>
    To: <input name="receiver">
    <input type="submit" name="SendMsg" value="Send"><br><br>
</form>
<input type="button" name="GetAllRecords" value="Get All Records" onclick="myFun()"><br>

<form id="timeForm" >
    start time:<input type="text" name="startTime" class="Wdate" id="startTime" onclick="WdatePicker({dateFmt:'yyyy/MM/dd HH:mm:ss'})"/><br>
    end time: <input type="text" class="Wdate" name="endTime" id="endTime" onclick="WdatePicker({dateFmt:'yyyy/MM/dd HH:mm:ss'})"/>
    <input type="button" name="GetSpecificRecords" value="Get Records" onclick="myFunction()">
</form>
<textarea id="historyRecords" name="historyRecords" rows="10" cols="50" >
</textarea><br>

</body>
</html>
