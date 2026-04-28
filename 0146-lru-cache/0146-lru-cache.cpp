#include <unordered_map>
#include <list>

using namespace std;

class LRUCache {
private:
    int cap;
    list<pair<int, int>> cache; 
    unordered_map<int, list<pair<int, int>>::iterator> m;

public:
    LRUCache(int capacity) {
        cap = capacity;
    }
    
    int get(int key) {
        // 키가 존재하지 않으면 -1 반환
        if (m.find(key) == m.end()) {
            return -1;
        }
        
        // 사용 -> 맨 앞으로 이동
        // splice는 노드 위치만 옮기므로 O(1)
        cache.splice(cache.begin(), cache, m[key]);
        
        return m[key]->second;
    }
    
    void put(int key, int value) {
        // 이미 키가 존재하는 경우
        if (m.find(key) != m.end()) {
            // 값 업데이트 후 맨 앞으로 이동
            m[key]->second = value;
            cache.splice(cache.begin(), cache, m[key]);
            return;
        }
        
        // 캐시 용량이 꽉 찼다면 맨 뒤) 삭제
        if (cache.size() == cap) {
            int lastKey = cache.back().first;
            m.erase(lastKey);
            cache.pop_back();
        }
        cache.push_front({key, value});
        m[key] = cache.begin();
    }
};

/**
 * Your LRUCache object will be instantiated and called as such:
 * LRUCache* obj = new LRUCache(capacity);
 * int param_1 = obj->get(key);
 * obj->put(key,value);
 */