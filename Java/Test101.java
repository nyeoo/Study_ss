/*==================================
 ���� Ŭ������ �ν��Ͻ� ����
 - Ŭ������ �ν��Ͻ� Ȱ��
====================================*/

// �л����� �̸�, ��������, ��������, ���������� �Է¹޾�
// ����, ����� ����ϴ� ���α׷��� �����Ѵ�.
// ��, Ŭ������ ������ Ȱ���Ͽ� �ۼ��� �� �ֵ��� �Ѵ�.
// ����, �� �������� �迭�� ���������� Ȱ���� �� �ֵ��� �Ѵ�.
// Ŭ���� ����� ������ ���̵���ο� ���� ������ �� �ֵ��� �Ѵ�.

// [���̵����]
// ���α׷��� �����ϴ� Ŭ����
// 1. Record Ŭ����	-> �л���
//	  - �Ӽ��� �����ϴ� Ŭ������ ������ ��~!!!
// 2. Sungjuk Ŭ����
//    - �ο����� �Է¹޾�,
//      �Է¹��� �ο� �� ��ŭ �̸�, ��������, ��������, ���������� �Է¹ް�
//      ������ ����� �����ϴ� Ŭ������ ������ ��~!!!
//      - �Ӽ� : �ο���, Record Ÿ���� �迭 -> �л���
//	    - ��� : �ο��� �Է�, �� ������ �Է�, ���� �� ��� ����, ��� ���
// 3. Test101 Ŭ����
//    - main() �޼ҵ尡 �����ϴ� �ܺ� Ŭ������ ������ ��~!!!

// ���� ��)
// �ο� �� �Է�(1~100) : 102
// �ο� �� �Է�(1~100) : -10
// �ο� �� �Է�(1~100) : 3

// 1��° �л��� �̸� �Է� : �ڳ���
// ���� ���� : 90
// ���� ���� : 80
// ���� ���� : 70

// 2��° �л��� �̸� �Է� : ������
// ���� ���� : 92
// ���� ���� : 82
// ���� ���� : 72

// 3��° �л��� �̸� �Է� : ������
// ���� ���� : 82
// ���� ���� : 72
// ���� ���� : 62

// �ڳ��� 90 80 70 240 xx.xx 2
// ������ 92 82 72 xxx xx.xx 1
// ������ 82 72 62 xxx xx.xx 3

// ����Ϸ��� �ƹ� Ű�� ��������...



import java.io.IOException;

public class Test101
{
	public static void main(String[] args) throws IOException
	{

		Sungjuk sj = new Sungjuk();

		sj.set();
		sj.input();
		sj.print();




		/*
		Sungjuk sj = new Sungjuk();
		
		sj.print(sj.input());
		*/
		
	}
}

// ���� ���

/*
�ο� �� �Է�(1~100) : 3
1��° �л��� �̸� �Է� : �ڳ���
���� ���� : 34
���� ���� : 52
���� ���� : 64

2��° �л��� �̸� �Է� : ������
���� ���� : 12
���� ���� : 66
���� ���� : 85

3��° �л��� �̸� �Է� : �ٶ�
���� ���� : 46
���� ���� : 76
���� ���� : 89

  �ڳ���  34  52  64  150   50.00   3
  ������  12  66  85  163   54.33   2
  �ٶ�  46  76  89  211   70.33   1
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .

*/