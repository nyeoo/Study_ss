/*===========================================
���� ���� �帧�� ��Ʈ��(���) ����
- �ݺ���(for��) �ǽ� �� ����
=============================================*/

// �� ���� for��(�ݺ����� ��ø)�� Ȱ���� ����� �ǽ�

// �� ����
//	  ������ ���� ������ ��µ� �� �ֵ���
//	  �ݺ����� ��ø ������ �ۼ��Ͽ� ���α׷��� �����Ѵ�.

// ���� ��)
/*

*********
 *******
  *****
   ***
    *

*/

public class Test062
{
	public static void main(String[] args)
	{

		// �ֿ� ���� ����
		int i;						//-- ���� �ǹ��ϴ� ������ �����Ѵ�.
		int j;						//-- ���� �߰��� �� ������ �����Ѵ�.
		int k;						//-- ������ �߰��� �� ������ �����Ѵ�.



		for (i=0; i<=4; i++)		//-- 1(0) ���� 5(4) ����� �ݺ��Ѵ�.
		{

			//-- ����(" ")�� ù ��° �࿡�� 0��, �� ��° �� 1��, �� ��° �� 2��, �� ��° �� 3��, �ټ� ��° �� 4�� ����ϵ��� �ݺ��Ѵ�.
			for (k=0;k<i; k++)
			{
				System.out.print(" ");
			}
			

			//-- ��(*)�� ù ��° �࿡�� 9��, �� ��° �� 7��, �� ��° �� 5��, �� ��° �� 3��, �ټ� ��° �� 1�� ����ϵ��� �ݺ��Ѵ�.
			for (j=1; j<=9-(2*i); j++)
			{
				System.out.printf("%s","*");

			}
			System.out.println();	//-- �� �ݺ��� ���� ������ �����Ѵ�.

		}
		
	}

}

// ���� ���

/*

*********
 *******
  *****
   ***
    *
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .

*/