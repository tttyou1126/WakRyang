/*
 <문제> 음료수 얼려 먹기: 문제 설명
N × M 크기의 얼음 틀이 있다. 구멍이 뚫려 있는 부분은 0, 칸막이가 존재하는 부분은 1로 표시된다.
구멍이 뚫려 있는 부분끼리 상, 하, 좌, 우로 붙어 있는 경우 서로 연결되어 있는 것으로 간주한다.
이때 얼음 틀의 모양이 주어졌을 때 생성되는 총 아이스크림의 개수를 구하는 프로그램을 작성하라.
다음의 4 × 5 얼음 틀 예시에서는 아이스크림이 총 3개가 생성된다


<문제> 음료수 얼려 먹기: 문제 해결 아이디어
이 문제는 DFS 혹은 BFS로 해결할 수 있다. 일단 앞에서 배운 대로 얼음을 얼릴 수 있는 공간이
상, 하, 좌, 우로 연결되어 있다고 표현할 수 있으므로 그래프 형태로 모델링 할 수 있다.
다음과 같이 3 × 3 크기의 얼음 틀이 있다고 가정하고 생각해보자

DFS를 활용하는 알고리즘은 다음과 같다
특정한 지점의 주변 상, 하, 좌, 우를 살펴본 뒤에 주변 지점 중에서 '0'이면서 아직 방문하지
않은 지점이 있다면 해당 지점을 방문한다
방문한 지점에서 다시 상, 하, 좌, 우를 살펴보면서 방문을 진행하는 과정을 반복하면, 연결된 모든
지점을 방문할 수 있다
모든 노드에 대하여 1 ~ 2번의 과정을 반복하며, 방문하지 않은 지점의 수를 카운트한다


4 5
00110
00011
11111
00000

 */

package test;

import java.util.Scanner;

public class DFS_상 {
	public static int n, m;
    public static int[][] graph = new int[1000][1000];

    // DFS로 특정 노드를 방문하고 연결된 모든 노드들도 방문
    public static boolean dfs(int x, int y) {
        // 주어진 범위를 벗어나는 경우에는 즉시 종료
        if (x <= -1 || x >=n || y <= -1 || y >= m) {
            return false;
        }
        // 현재 노드를 아직 방문하지 않았다면
        if (graph[x][y] == 0) {
            // 해당 노드 방문 처리
            graph[x][y] = 1;
            // 상, 하, 좌, 우의 위치들도 모두 재귀적으로 호출
            dfs(x - 1, y);
            dfs(x, y - 1);
            dfs(x + 1, y);
            dfs(x, y + 1);
            /*
                     연결된 모드 노드들 방문 후 true 리턴함.
                     결국에는 0으로 된 노드들 1로 변환하여 리턴하며 다음에 호출 시에는 1로 된 노드들은 집계 대상 제외됨.
            */
            return true;
        }
        return false;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // N, M을 공백을 기준으로 구분하여 입력 받기
        n = sc.nextInt();
        m = sc.nextInt();
        sc.nextLine(); // 버퍼 지우기

        // 2차원 리스트의 맵 정보 입력 받기
        for (int i = 0; i < n; i++) {
            String str = sc.nextLine();
            for (int j = 0; j < m; j++) {
                graph[i][j] = str.charAt(j) - '0'; 
                /*
                ex)         
                charAt(int i)메서드는 문자열에서 i번째 문자를 반환한다.(i의 값은 0부터 시작한다.) 예를 들어, "Hello"라는 문자열이 있을 때 "Hello".charAt(4)는 문자 'o'가 된다.
                            배열 [0][0]에 00100의 0번째 자리인 0을 넣음 
                            배열 [1][3]에 00011의 3번째 자리인 1을 넣음 
                            문자'3'을 숫자 3로 바꾸는 방법은 문자'3'에서 문자'0'을 빼주면 됨.
                */
            }
        }

        // 모든 노드(위치)에 대하여 음료수 채우기
        int result = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                // 현재 위치에서 DFS 수행
                if (dfs(i, j)) {
                    result += 1;
                }
            }
        }
        System.out.println(result); // 정답 출력 
    }
}



/*

[0][0]

-1 0
0 -1
1 0 - 재귀
0 1 - 재귀

[1][0]                [0][1]

0 0                   -1 1 
1 -1                   0 0
2 0 - 재귀                        1 1 - 재귀
1 1 - 재귀                        0 2 - 재귀

*/