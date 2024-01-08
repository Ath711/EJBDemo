package com.example.StateLessBean;

import java.io.*;

import com.example.StateLessBean.beans.AddBeanEJB;
import jakarta.ejb.EJB;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "addServlet", value = "/addServlet")
public class AddServlet extends HttpServlet {
    // The object is already created in server container and EJB annotation injects dependency into variable
    @EJB
    AddBeanEJB addBeanEJB;
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // this creates dependency
        // In distributed systems we have beans on different machines and server on different
        // server does not know implementation of beans
        // when we create object it gives dependency and means we should know implementation
        // to remove this dependency we need EJB

        /*
        AddBean addBean = new AddBean();
        addBean.setI(Integer.parseInt(request.getParameter("t1")));
        addBean.setJ(Integer.parseInt(request.getParameter("t2")));
        addBean.add();
        */

        addBeanEJB.setI(Integer.parseInt(request.getParameter("t1")));
        addBeanEJB.setJ(Integer.parseInt(request.getParameter("t2")));
        addBeanEJB.add();

        PrintWriter printWriter = response.getWriter();
        printWriter.println(addBeanEJB.getK());
    }



}
