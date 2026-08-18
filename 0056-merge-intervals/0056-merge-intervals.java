class Solution {
    public int[][] merge(int[][] intervals) {
        // 구간이 1개 이하 그대로 반환
        if (intervals.length <= 1) {
            return intervals;
        }

        Arrays.sort(intervals, (a, b) -> Integer.compare(a[0], b[0]));

        List<int[]> merged = new ArrayList<>();
        
        // 배열의 첫 번째 구간을 기준으로 리스트에 넣음
        int[] currentInterval = intervals[0];
        merged.add(currentInterval);

        // 두 번째 구간부터 순회하며 병합
        for (int[] interval : intervals) {
            int currentEnd = currentInterval[1]; // 현재 병합 중인 구간의 끝
            int nextStart = interval[0];         // 다음 구간의 시작
            int nextEnd = interval[1];           // 다음 구간의 끝

            if (currentEnd >= nextStart) {
                currentInterval[1] = Math.max(currentEnd, nextEnd);
            } else {
                // 다음 구간 기준으로 바꿈, 리스트에 추가
                currentInterval = interval;
                merged.add(currentInterval);
            }
        }
        return merged.toArray(new int[merged.size()][]);
    }
}