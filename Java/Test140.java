/*=============================================
 ���� �ڹ��� �ֿ�(�߿�) Ŭ���� ����
 - �ڹٿ��� �⺻������ �����ϴ� �ֿ� Ŭ������
 - StringTokenizer Ŭ���� (���丸 ����~!!!)
 ============================================*/

/*
�� StringTokenizer Ŭ������
	���ڿ� �Ľ�(parsing)�� ���� ������ �����ϴ� Ŭ������
	�Ľ�(parsing)�ϰ��� �ϴ� ���ڿ��� ���ڷ� �޾� �����ϴµ�,
	���⿡�� ���Ǵ� �Ľ�(parsing)�̶�� ������
	�ϳ��� ���ڿ��� ���� ���ڿ��� ������ �۾��� �ǹ��ϰ� �Ǹ�,
	�� �� ������ ������ �Ǵ� ���ڿ��� ��ū(token)�̶�� �Ѵ�.

	StringTokenizer Ŭ������ ����ϱ� ���ؼ���
	java.util ��Ű���� StringTokenizer �� import �ؾ��Ѵ�.

	StringTokenizer Ŭ������ ȣȯ���� �����ϴ� ����(�������̸� �����ʴ°� ���ڴ����� ���ŵ��� �ʰ�
	���� �����ǰ� ������, ���ڿ��� �Ľ�(parsing)�ϱ� ���ؼ���
	String Ŭ������ split() �޼ҵ峪, javax.util.regex ��Ű����
	����� ���� �����ϰ� �ִ�.


�� ������

	- ����
	  StringTokenizer(String str)
	  StringTokenizer(String str, String delim) --> �����ڰ� ���ڿ� ���·�
	  StringTokenizer(String str, String delim, boolean returnDelims)
	  : �־��� ���ڿ� str�� �ܾ�� �и��ϴ� ��ü�� �����ϸ�
	    ����(����) ���ڴ� delim�� ���Ե� ���ڷ� ó���ϰ� �ȴ�.
	    ���� returnDelims�� true �̸� ���� ���ڵ� �и��� �����ͷ� ó���ϰ� �ȴ�.
*/

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.StringTokenizer;
public class Test140
{
	public static void main(String[] args) throws IOException
	{
		String strTemp;
		String[] strArr;
		int n;

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("�Ľ��� ���ڿ� �Է�(�ĸ� ����) : ");
		strTemp = br.readLine();
		//-- "���,����,�ٳ���,����"

		// StringTokenizer Ŭ���� �ν��Ͻ� ����
		StringTokenizer st = new StringTokenizer(strTemp,",");
		//-- strTemp �� ��� ���ڿ���...("���,����,�ٳ���,����")
		//   ��","���� �����ڷ�...

		// �׽�Ʈ(Ȯ��)
		System.out.println(st.countTokens());
		//--==>> �Ľ��� ���ڿ� �Է�(�ĸ� ����) : ���,����,�ٳ���,����
		//		 4
		//-- StringTokenizer�� ��int countTokens()�� �޼ҵ�
		//	 : �Ľ̵� ���ڿ��� ������ ��ȯ(����)�Ѵ�.

		//strArr = new String[st.countTokens()];
		//					  ----------------
		//							 4

		// �� strArr = new String[4];
		
		// hasMoreTokens() �� ���� ���� �ִ��� ������ true, false�� ��ȯ
		// hasMoreTokens()�� nextToken()�� �Բ� ����
		
		n=0;
		while(st.hasMoreTokens())
		{
			 strArr[n++] = st.nextToken();
			 // strArr[0] = "���";
			 // strArr[1] = "����";
			 // strArr[2] = "�ٳ���";
			 // strArr[3] = "����";

		}

		//-- hasMoreTokens()
		//	 : ����� �� �ִ� ��ū�� �����ִ� ��� true�� ��ȯ
		//	   �� �̻� ����� ��ū�� ���� ��� false�� ��ȯ
		//	   Ȯ�ο� ���� ����� ��ȯ�� �� ���� ������ �о� ������ �ʰ�,
		//     ���� ������ �о���̴� ��带 �̵���Ű���� �ʴ´�.

		//--  nextToken()
		//	  ���� ��ū�� ���´�.
		//	  ���� ��ū�� ������ ��带 �̵���Ű�� �ȴ�.
		//    �����ڸ� �ٲپ��� ��� ���� ȣ�⿡�� �ٲ� �����ڸ� �̿��Ͽ� ��ū�� �и��Ѵ�.


		System.out.print("�Ľ̵� ��ū(���ڿ�) : ");
		for (String str : strArr)
		{
			System.out.print(str + " ");
		}
		System.out.println();
		//--==>> �Ľ��� ���ڿ� �Է�(�ĸ� ����) : ���,����,�ٳ���,����
		//       �Ľ̵� ��ū(���ڿ�) : ��� ���� �ٳ��� ����

	



	}
}