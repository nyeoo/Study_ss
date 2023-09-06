/*===========================================
■■■ 실행 흐름의 컨트롤(제어문) ■■■
- 반복문(for문) 실습 및 관찰
=============================================*/

// ○ 다중 for문(반복문의 중첩)을 활용한 별찍기 실습

// ○ 과제
//	  다음과 같은 내용이 출력될 수 있도록
//	  반복문의 중첩 구문을 작성하여 프로그램을 구현한다.

// 실행 예)
/*

    *
   ***
  *****
 *******
*********

*/

public class Test061
{
	public static void main(String[] args)
	{

		int i;						//-- 행을 의미하는 변수를 선언한다.
		int j;						//-- 별을 추가해 줄 변수를 선언한다.
		int k;						//-- 공백을 추가해 줄 변수를 선언한다.


		for (i=1; i<=5; i++)		//-- 1 에서 5 행까지 반복한다.
		{

			//-- 공백(" ")을 첫 번째 행에서 4번, 두 번째 행 3번, 세 번째 행 2번, 네 번째 행 1번, 다섯 번째 행 0번 출력하도록 반복한다.
			for (k=1;k<=5-i; k++)
			{
				System.out.print(" ");
			}
			

			//-- 별(*)을 첫 번째 행에서 1개, 두 번째 행 3개, 세 번째 행 5개, 네 번째 행 7개, 다섯 번째 행 9개 출력하도록 반복한다.
			for (j=1; j<=(2*i)-1; j++)
			{
				System.out.printf("%s","*");

			}
			System.out.println();	//-- 행 반복이 끝날 때마다 개행한다.
		}
		
		
	}

}

// 실행 결과

/*

    *
   ***
  *****
 *******
*********
계속하려면 아무 키나 누르십시오 . . .

*/