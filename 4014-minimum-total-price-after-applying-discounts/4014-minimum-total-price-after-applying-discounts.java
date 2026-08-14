import java.util.Arrays;

class Solution {
    public double minPrice(int[] prices, int[] discounts) {
        Arrays.sort(prices);
        Arrays.sort(discounts);

        double totalSum = 0.0;
        
        int pIdx = prices.length - 1;       
        int dIdx = discounts.length - 1;    
        
        while (pIdx >= 0 && dIdx >= 0) {
            double price = prices[pIdx];
            double discount = discounts[dIdx];

            totalSum += price * (100.0 - discount) / 100.0;
            
            pIdx--;
            dIdx--;
        }
        
        while (pIdx >= 0) {
            totalSum += prices[pIdx];
            pIdx--;
        }
        
        return totalSum;
    }
}