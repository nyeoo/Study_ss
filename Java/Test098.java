/*======================================================================================
 ■■■ 클래스와 인스턴스 ■■■
 - 정보 은닉과 접근제어지시자(접근 지시자, 접근 제어자, 접근 지정자, 접근 제한자, ....)
=======================================================================================*/

import java.util.Scanner;
class CircleTest2
{
	// 멤버 변수, 인스턴스 변수(인스턴스 생성을 통해 값을 할당받아야함), 전역변수
	//int num;
	//	↓
	// 정보 은닉(Information Hiding)
	// private 이라는 접근제어지시자의 선언은
	// 클래스 내부에서만 접근 및 참조가 가능하게 하겠다는 의미
	// int 형 전역 변수 -> 자동 0으로 초기화 지원

	private int num;

	// getter / setter 구성
	/*
	public int getNum()
	{
		return num;
	}

	public setNum(int num)
	{
		this.num = num;			//-- this.num == CircleTest2 클래스의 num
	}
	*/

	public void input()
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("반지름 입력 : ");
		num = sc.nextInt();
	}

	public double calArea()
	{
		return num * num * 3.141592;
	}

	public void write(double area)
	{
		System.out.println(">> 반지름 : " + num);
		System.out.println(">> 넓이 : " + area);
	}

}

public class Test098
{
	public static void main(String[] args)
	{
		// CircleTest2 인스턴스 생성
		CircleTest2 ob1 = new CircleTest2();

		//ob1.num=10;
		//   ↓
		//ob1.setNum(10);

		//System.out.println("원의 반지름 : " + ob1.num);
 		//		↓
		//System.out.println("원의 반지름 : " + ob1.getNum());
		
		// ※ 현재로써는 유일하게
		//	  CircleTest2 의 num 에 데이터를 전달할 수 있는 방법
		ob1.input();
		//--==>> 반지름 입력 : 500
		//		ob1.num = 500
		
		double result = ob1.calArea();
		
		ob1.write(result);
		

	}
}

// 실행 결과
/*
반지름 입력 : 50
>> 반지름 : 50
>> 넓이 : 7853.9800000000005
계속하려면 아무 키나 누르십시오 . . .
*/