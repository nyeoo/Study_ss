/*=============================================
 ���� �ڹ��� �ֿ�(�߿�) Ŭ���� ����
 - �ڹٿ��� �⺻������ �����ϴ� �ֿ� Ŭ������
 - Wrapper Ŭ����
 ============================================*/


public class Test131
{
	public static void main(String[] args)
	{
		boolean bi = true;
		Boolean wrapBi = new Boolean(bi);
		Boolean wBi = bi;					// ���� �ڽ�

		int n = 300;
		Integer wrapN = new Integer(n);
		int n2 = wrapN;						// ���� ��ڽ�
		
		float f = 300.3f;
		Float wrapF = new Float(f);
		
		System.out.println(wrapBi.toString());			//-- Ŭ������@�ؽ��ڵ� �� ������ �ʴ� ������ ���� �ڱ������� �������̵� �߱� ����
		System.out.println(wrapN.toString());
		System.out.println(wrapF.toString());
		//--==>> true
		//		 300
		//		 300.3

		System.out.println(wrapBi);
		System.out.println(wrapN);
		System.out.println(wrapF);
		//--==>> true
		//       300
		//	  	 300.3

		//Integer Ŭ����
		String sn = "12";
		int ni = Integer.parseInt(sn);
		System.out.println(ni);
		//--==>> 12

		ni = Integer.parseInt("0101", 2);

		System.out.println(ni);
		//--==>> 5

		ni = Integer.parseInt("12", 8);
		System.out.println(ni);
		//--==>> 10

		ni = Integer.parseInt("A", 16);
		System.out.println(ni);
		//--==>> 10

		sn = Integer.toBinaryString(20);		// �޼ҵ� �̸��߿� to~() : ��ȯ���ִ¿��� , is~() : ~�����ƴ���Ȯ�� ����
		System.out.println(sn);
		//--==>> 10100							// 2������ ��ȯ�ϴ� ���

		sn = Integer.toOctalString(31);
		System.out.println(sn);
		//--==>> 37								// 8������ ��ȯ�ϴ� ���

		sn = Integer.toHexString(31);
		System.out.println(sn);
		//--==>> 1f								// 16������ ��ȯ�ϴ� ���

		Integer num = new Integer(50);
		System.out.println(num.toString());		// ���ڸ� ���ڿ�Ÿ������ ��ȯ�ϴ� ���
		//--==>> 50

		int n3 = 345;
		Integer n4 = Integer.valueOf(n3);		// ���� Integer Ÿ��, ���� Integer Ÿ�� n4
		System.out.println(n4);
		//--==>> 345

	}
}