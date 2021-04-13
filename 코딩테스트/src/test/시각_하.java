/*
<문제> 시각: 문제 설명
정수 N이 입력되면 00시 00분 00초부터 N시 59분 59초까지의 모든 시각 중에서 3이 하나라도 포함되는
모든 경우의 수를 구하는 프로그램을 작성하라. 예를 들어 1을 입력했을 때
다음은 3이 하나라도 포함되어 있으므로 세어야 하는 시각이다
00시 00분 03초
00시 13분 30초
반면에 다음은 3이 하나도 포함되어 있지 않으므로 세면 안 되는 시각이다
00시 02분 55초
01시 27분 45초
<문제> 시각: 문제 조건

<문제> 시각: 문제 해결 아이디어
이 문제는 가능한 모든 시각의 경우를 하나씩 모두 세서 풀 수 있는 문제이다
하루는 86,400초이므로, 00시 00분 00초부터 23시 59분 59초까지의 모든 경우는 86,400가지 이다
24 * 60 * 60 = 86,400
따라서 단순히 시각을 1씩 증가시키면서 3이 하나라도 포함되어 있는지를 확인하면 된다
이러한 유형은 완전 탐색(Brute Forcing) 문제 유형이라고 불린다
가능한 경우의 수를 모두 검사해보는 탐색 방법을 의미한다
 */

package test;

import java.util.Scanner;

public class 시각_하 {
// -> 완전 탐색 유형 ( 가능한 경우의 수를 모두 검사해보는 탐색 방법 )	
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		int h = sc.nextInt();
		int cnt = 0;
		
		for (int i = 0; i <= h; i++) {
			for (int j = 0; j < 60; j++) {
				for (int k = 0; k < 60; k++) {
					String tmp = "";
					tmp += i;
					tmp += j;
					tmp += k;
					
					if (tmp.contains("3")) {
						cnt++;
					}
				}
			}
		}
		System.out.println(cnt);
		
	}
	
	/*
	 * 응용문제
	 * 시만 입력하는게 아니라 시, 분, 초 모두 입력
	 * tmp를 밖에서 선언하지 않고 for문 안에 넣어야됨. (말그대로 임시변수)
	 * 
public static void main(String[] args) {

		int cnt = 0;
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("시 : ");
		int h = sc.nextInt();

		System.out.print("분 : ");
		int m = sc.nextInt();

		System.out.print("초 : ");
		int s = sc.nextInt();
		
	
		
		for (int i = 0; i <= h; i++) {
			if (i == h) {
				for (int j = 0; j <= m; j++) {
					if (j == m) {
						for (int j2 = 0; j2 <= s; j2++) {
							String tmp = "";
							tmp += i;
							tmp += j;
							tmp += j2;
							
							if(tmp.contains("3")) {
								cnt++;
							}

						}
					}
					else {
						for (int j2 = 0; j2 < 60; j2++) {
							String tmp = "";
							tmp += i;
							tmp += j;
							tmp += j2;
							
							if(tmp.contains("3")) {
								cnt++;
							}							
						}						
					}
					
				}
			}
			else {
				for (int j = 0; j < 60; j++) {
					if (j == m) {
						for (int j2 = 0; j2 <= s; j2++) {
							String tmp = "";
							tmp += i;
							tmp += j;
							tmp += j2;
							
							if(tmp.contains("3")) {
								cnt++;
							}

						}
					}
					else {
						for (int j2 = 0; j2 < 60; j2++) {
							String tmp = "";
							tmp += i;
							tmp += j;
							tmp += j2;
							
							if(tmp.contains("3")) {
								cnt++;
							}							
						}						
					}					
				}
			}
			
		}
		System.out.println(cnt);
		
	}
    */
}
