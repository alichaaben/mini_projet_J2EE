<%@ page import="com.example.conct.Arraylist" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.example.conct.connection" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Jeux</title>
    <link rel="stylesheet" href="tab.css">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<br><br>
<%!
    public boolean testMot(String m,ArrayList<String> z){
        Iterator<String> it=z.iterator();
        while(it.hasNext()){
            if(it.next().equals(m))
                return true;
        }
        return false;
    }
%>

<%
    Arraylist m=(Arraylist) request.getAttribute("Mot");
    String BD=(String)request.getAttribute("kilma");
    boolean test=false;
    if(m==null){
%>
<%@include file="form.jsp"%>

<%}else if(m!=null ){
    if((m.getListMot().size() != 7) && testMot(BD, m.getListMot())==false){
%>
<%@include file="form.jsp"%>
<%
        }
    }
%>
<br>


<div class="container-md">
    <p><b><h2>Le mot :(<%out.print(BD.charAt(0)+"******");%>)</h2></b></p>
    <br>
    <table class="tab">
        <%!
            public  boolean exist(char C,String ch){
                for(int i=0;i<ch.length();i++){
                    if(ch.charAt(i)==C)
                        return true;
                }
                return false;
            }
        %>

        <%

            for(int i=0;i<7;i++){
        %>
        <tr>
            <%for(int j=0;j<7;j++){%>
            <td class="td">
                <%
                    if(m!=null && m.getListMot().size()>=i+1){
                        String ch=m.getListMot().get(i);
                        if(ch.equals(BD)){
                            test=true;

                %>
                <span class="highlightmeR"><% out.print(ch.charAt(j));%></span>
                <%}else if(exist(ch.charAt(j),BD)&&(ch.charAt(j)==BD.charAt(j))){%>
                <span class="highlightmeR"><% out.print(ch.charAt(j));%></span>
                <%}else if(exist(ch.charAt(j),BD)&&(ch.charAt(j)!=BD.charAt(j))){%>
                <span class="highlightmeJ"><%out.print(ch.charAt(j)); %> </span>
                <%}else{%>
                <span><%out.print(ch.charAt(j)); %> </span>
                <%
                        }
                    }
                %>
            </td>
            <%}%>
        </tr>
        <%
            }
        %>
    </table>

    <br><br>
    <%if(test==true){%>
    <p><h1 class="msgV">Bravo,Vous avez gangé</h1></p>

    <%} else if (test!=true && m!=null && m.getListMot().size()==7) {%>
    <p><h1 class="msgR">Desolé,Vous avez perdu</h1></p>
    <%
        }
    %>
</div>
<br>
</body>
</html>