/*
문제

N×M크기의 배열로 표현되는 미로가 있다.
1	0	1	1	1	1
1	0	1	0	1	0
1	0	1	0	1	1
1	1	1	0	1	1
미로에서 1은 이동할 수 있는 칸을 나타내고, 0은 이동할 수 없는 칸을 나타낸다. 이러한 미로가 주어졌을 때, (1, 1)에서 출발하여 (N, M)의 위치로 이동할 때 지나야 하는 최소의 칸 수를 구하는 프로그램을 작성하시오.
위의 예에서는 15칸을 지나야 (N, M)의 위치로 이동할 수 있다. 칸을 셀 때에는 시작 위치와 도착 위치도 포함한다.

입력
첫째 줄에 두 정수 N, M(2≤N, M≤100)이 주어진다. 다음 N개의 줄에는 M개의 정수로 미로가 주어진다. 각각의 수들은 붙어서 입력으로 주어진다.

출력
첫째 줄에 지나야 하는 최소의 칸 수를 출력한다. 항상 도착위치로 이동할 수 있는 경우만 입력으로 주어진다.

예제입력1
4 6
101111
101010
101011
111011

예제출력1
15

예제입력2
4 6
110110
110110
111111
111101

예제출력2
9



알고리즘
1. BFS 함수 정의 
- 초기 큐에 x,y를 넣음
- 큐에서 x,y를 뽑고 4 방향으로 확인
- 주어진 영역을 벗어난 경우 무시
- 0(이동할수 없는 칸)인 경우 무시
- 해당 위치를 처음 방문한다면 전 위치에서 + 1 하고, 큐에 넣음
- 가장 오른쪽 아래까지의 최단 거리 반환
2. (0,0)에서부터의 BFS 출력

 */

package test;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

public class 미로탈출_BFS_상 {
	static class Node { // static 붙여야 됨
		private int x;
		private int y;

		public Node(int x, int y) {
			this.x = x;
			this.y = y;
		}

		public int getX() {
			return this.x;
		}

		public int getY() {
			return this.y;
		}
	}

	public static int n, m;
	public static int[][] graph = new int[201][201];

	// 이동할 네 가지 방향 정의 (상, 하, 좌, 우)
	public static int dx[] = { -1, 1, 0, 0 };
	public static int dy[] = { 0, 0, -1, 1 };

	public static int bfs(int x, int y) {
		// 큐(Queue) 구현을 위해 queue 라이브러리 사용
		// Queue 같은 경우에는 제일 처음에 들어온게 제일 먼저 나간다 (FIFO)
		/*
		 큐 안에 넣을 때에는
		Queue명.offer(값);
		큐에서 값을 빼낼 때에는
		Queue명.poll();
		 */
		Queue<Node> q = new LinkedList<>();
		q.offer(new Node(x, y)); // node(0,0)을 큐에 넣음(디폴트값)
		// 큐가 빌 때까지 반복하기
		while (!q.isEmpty()) {
			Node node = q.poll(); // q에서 뺀 값을 node에 대입 (0,0)
			x = node.getX();
			y = node.getY();
			// 현재 위치에서 4가지 방향으로의 위치 확인
			for (int i = 0; i < 4; i++) {
				int nx = x + dx[i];
				int ny = y + dy[i];
				// 미로 찾기 공간을 벗어난 경우 무시
				if (nx < 0 || nx >= n || ny < 0 || ny >= m)
					continue;
				// 벽인 경우 무시
				if (graph[nx][ny] == 0)
					continue;
				// 해당 노드를 처음 방문하는 경우에만 최단 거리 기록
				if (graph[nx][ny] == 1) {
					graph[nx][ny] = graph[x][y] + 1;
					q.offer(new Node(nx, ny));
				}
			}
		}
		// 가장 오른쪽 아래까지의 최단 거리 반환
		return graph[n - 1][m - 1];
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
			}
		}

		// BFS를 수행한 결과 출력
		System.out.println(bfs(0, 0));
	}
}

