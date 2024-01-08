<%@ page import="com.example.statefulbean.ListElementRemote" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="com.example.statefulbean.ListElements" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<%! private static ListElementRemote values; %>

<%!
    public void jspInit() {
        try {
            System.out.println("Before JNDI Lookup");
            InitialContext initialContext = new InitialContext();
            values = (ListElementRemote) initialContext.lookup("java:global/StateFulBean-1.0-SNAPSHOT/ListElements");
            System.out.println("After JNDI Lookup - values: " + values);
        } catch (Exception e) {
            System.out.println("Exception during JNDI Lookup: " + e);
        }

    }

%>

<%
    Boolean par1 = request.getParameter("add") != null && !request.getParameter("add").isEmpty();
    Boolean par2 = request.getParameter("remove") != null && !request.getParameter("remove").isEmpty();

    if(par1){
        int e = Integer.parseInt(request.getParameter("t1"));
        values.addElement(e);
    }
    else if(par2){
        int e = Integer.parseInt(request.getParameter("t1"));
        values.removeElement(e);
    }


%>


<html>
<head>
    <title>Stateful session bean demo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 20px;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin: 0 auto;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .result {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<form method="post" onsubmit="return validateForm()">
    <label>Enter element to add or index of element to remove</label>
    <input type="text" name="t1" id="t1">
    <br>
    <input type="submit" name="add" value="Add">
    <input type="submit" name="remove" value="Remove">

    <div class="result">
        <%
            if (values != null) {
                List<Integer> nums = values.getElements();
                PrintWriter outer = response.getWriter();
                for (int n : nums)
                    outer.println(n);

                outer.println("Total elements: " + nums.size());
            }
        %>
    </div>
</form>

<script>
    function validateForm(){
        var textBoxValue = document.getElementById("t1").value.trim();
        if(textBoxValue===""){
            alert("Text box is empty");
            return false;
        }
        return true;
    }
</script>

</body>
</html>