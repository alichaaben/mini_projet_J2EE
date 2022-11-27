package com.example.conct;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ServletJeux", value = "/ServletJeux")
public class ServletJeux extends HttpServlet {
    Arraylist m=new Arraylist();

    connection kilma=new connection();
     String N= kilma.getMot();
    int nb=0;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("kilma",N);
        this.getServletContext().getRequestDispatcher("/Jeux.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        m.addList(request.getParameter("mot"));
        request.setAttribute("Mot",m);
        nb++;
        request.setAttribute("nb",nb);
        if( nb>7){
            m.getListMot().clear();
            nb=0;
        }
        request.setAttribute("nbItantative",nb);
        request.setAttribute("kilma",N);
        this.getServletContext().getRequestDispatcher("/Jeux.jsp").forward(request,response);
    }
}
