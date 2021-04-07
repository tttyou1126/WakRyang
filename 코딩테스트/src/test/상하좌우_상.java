/*
문제 

여행가 A는 N × N 크기의 정사각형 공간 위에 서 있다. 이 공간은 1 × 1 크기의 정사각형으로 나누어져 있다.
가장 왼쪽 위 좌표는 (1, 1)이며, 가장 오른쪽 아래 좌표는 (N, N)에 해당한다.
여행가 A는 상, 하, 좌, 우 방향으로 이동할 수 있으며, 시작 좌표는 항상 (1, 1)이다. 우리 앞에는 여행가 A가
이동할 계획이 적힌 계획서가 놓여 있다

계획서에는 하나의 줄에 띄어쓰기를 기준으로 L, R, U, D 중 하나의 문자가 반복적으로 적혀있다.
각 문자의 의미는 다음과 같다

L: 왼쪽으로 한 칸 이동
R: 오른쪽으로 한 칸 이동
U: 위로 한 칸 이동
D: 아래로 한 칸 이동
이때 여행가 A가 N × N 크기의 정사각형 공간을 벗어나는 움직임은 무시된다
예를 들어 (1, 1)의 위치에서 L 혹은 U를 만나면 무시된다


알고리즘
1. type 리스트에 L,R,U,D 를 넣어놓음
2. 계획서 리스트 전체를 반복하며 L,R,U,D에 따라 x,y 좌표를 변경해줌
3. x,y가 L,R,U,D에 의하여 1보다 작아지거나 N보다 커지는 경우에는 continue로 값이 변경되지 않게함 (맵 밖으로 벗어나지 않게함)
4. 최종 x,y 출력







 # 동, 북, 서, 남
dx = [0, -1, 0, 1]
dy = [1, 0, -1, 0]

# 현재 위치
x, y = 2, 2

for i in range(4):
    # 다음 위치
    nx = x + dx[i]
    ny = y + dy[i]
    print(nx, ny)
 */

/*
 (1,1)(1,2)(1,3)(1,4)(1,5)
 (2,1)(2,2)(2,3)(2,4)(2,5)
 (3,1)(3,2)(3,3)(3,4)(3,5)
 (4,1)(4,2)(4,3)(4,4)(4,5)
 (5,1)(5,2)(5,3)(5,4)(5,5)
 */

/*
 입력값 :
 5
 R R R U D D
 

 
 출력값 : 
 3 4 
 */

package test;

import java.util.*;

public class 상하좌우_상 {

    public static void main(String[] args) {
    	
        Scanner sc = new Scanner(System.in);

        // N을 입력받기
        int n = sc.nextInt();
        sc.nextLine(); // 버퍼 비우기
        String[] plans = sc.nextLine().split(" ");
        int x = 1, y = 1;

        // L, R, U, D에 따른 이동 방향 
        int[] dx = {0, 0, -1, 1};
        int[] dy = {-1, 1, 0, 0};
        char[] moveTypes = {'L', 'R', 'U', 'D'};

        // 이동 계획을 하나씩 확인
        for (int i = 0; i < plans.length; i++) {
            char plan = plans[i].charAt(0); // charAt(0) - 배열의 첫 번째 문자
            // 이동 후 좌표 구하기 
            int nx = -1, ny = -1; // 초기 값이므로 값은 상관없음 
            for (int j = 0; j < 4; j++) {
                if (plan == moveTypes[j]) {
                    nx = x + dx[j];
                    ny = y + dy[j];
                }
            }
            // 공간을 벗어나는 경우 무시 
            if (nx < 1 || ny < 1 || nx > n || ny > n) continue;
            // 이동 수행 
            x = nx;
            y = ny;
        }

        System.out.println(x + " " + y);
    }

}