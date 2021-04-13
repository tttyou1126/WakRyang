/*
<문제> 거스름 돈: 문제 설명
당신은 음식점의 계산을 도와주는 점원입니다. 카운터에는 거스름돈으로 사용할 500원, 100원, 50원, 10원짜리 동전이 무한히 존재한다고 가정합니다.
손님에게 거슬러 주어야 할 돈이 N원일 때 거슬러 주어야 할 동전의 최소 개수를 구하세요.
단, 거슬러 줘야 할 돈 N은 항상 10의 배수입니다.
<문제> 거스름 돈: 문제 해결 아이디어
최적의 해를 빠르게 구하기 위해서는 가장 큰 화폐 단위부터 돈을 거슬러 주면 됨

N원을 거슬러 줘야 할 때 가장 먼저 500원으로 거슬러 줄 수 있을 만큼 거슬러 준다

이후에 100원, 50원, 10원짜리 동전을 차례대로 거슬러 줄 수 있을 만큼 거슬러 주면 됨
N = 1,260일 때의 예시를 확인

[Step 0] 초기 단계 - 남은 돈: 1,260원
[Step 1] 초기 단계 - 남은 돈: 260원
[Step 2] 초기 단계 - 남은 돈: 60원
[Step 3] 초기 단계 - 남은 돈: 10원
[Step 4] 초기 단계 - 남은 돈: 0원

<문제> 거스름 돈: 정당성 분석
가장 큰 화폐 단위부터 돈을 거슬러 주는 것이 최적의 해를 보장하는 이유는 무엇일까?
가지고 있는 동전 중에서 큰 단위가 항상 작은 단위의 배수이므로 작은 단위의 동전들을 종합해 다른 해가 나올 수 없기 때문
만약에 800원을 거슬러 주어야 하는데 화폐 단위가 500원, 400원, 100원이라면 어떻게 될까?
그리디 알고리즘 문제에서는 이처럼 문제 풀이를 위한 최소한의 아이디어를 떠올리고 이것이 정당하닞 검토할 수 있어야 함
 */

package test;

import java.util.Scanner;

public class 거스름돈_하 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int cnt = 0;
        int[] coinTypes = {500, 100, 50, 10};
		
        for (int i = 0; i < 4; i++) {
            int coin = coinTypes[i];
            cnt += n / coin;
            n %= coin;
        }

        System.out.println(cnt);
    }
}



/*
응용문제 

1650
최소 동전 갯수 : 0
오백원 갯수 : 3
백원 갯수 : 1
오십원 갯수 : 1
십원 갯수 : 0

	public static void main(String[] args) {
		int cnt = 0;
		int[] coinTypes = {500, 100, 50, 10};
		int oback = 0;
		int back = 0;
		int oship = 0;
		int ship = 0;
		
		
		Scanner sc = new Scanner(System.in);
		
		int tot = sc.nextInt();
		
		for (int i = 0; i < coinTypes.length; i++) {
			if(coinTypes[i] == 500) {
				oback = tot/coinTypes[i];
			}
			
			if(coinTypes[i] == 100) {
				back = tot/coinTypes[i];
			}
			
			if(coinTypes[i] == 50) {
				oship = tot/coinTypes[i];
			}
			
			if(coinTypes[i] == 10) {
				ship = tot/coinTypes[i];
			}
			
			cnt = tot/coinTypes[i];
			
			tot %= coinTypes[i];

		}
		System.out.println("최소 동전 갯수 : " + cnt);
		System.out.println("오백원 갯수 : " + oback);
		System.out.println("백원 갯수 : " + back);
		System.out.println("오십원 갯수 : " + oship);
		System.out.println("십원 갯수 : " + ship);
	}
*/