<%@ page contentType="text/html; charset=UTF-8"%> <!-- ← jsp 정체성을 띄는 것을 의미 -->
<%
	// Forward10_1.jsp
	
	// 이전 페이지(Send10.jsp)로부터 넘어온 데이터 수신
	// → num1, calResult, num2
	
	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String calResult = request.getParameter("calResult");
	
	int num1 = 0;
	int num2 = 0;
	String result = "";
	
	try
	{
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);
		
		if (calResult.equals("1"))		// 더하기
			result = String.format("%d + %d = %d", num1, num2, (num1+num2));
		else if (calResult.equals("2"))		// 빼기
			result = String.format("%d - %d = %d", num1, num2, (num1-num2));
		else if (calResult.equals("3"))		// 곱하기
			result = String.format("%d * %d = %d", num1, num2, (num1*num2));
		else if (calResult.equals("4"))		// 나누기
			result = String.format("%d / %d = %.1f", num1, num2, (num1/(double)num2));
			
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	
	// 요청에 내용 추가
	request.setAttribute("resultStr", result);
	
	// check~!!!
	RequestDispatcher dispatcher = request.getRequestDispatcher("Receive10.jsp");
	dispatcher.forward(request, response);
	
%>




















