#include <iostream>
using namespace std;

int main() {
    const int arr[] = {1,2,3,4,5,6,7,8,9,10};
    const int size = sizeof(arr) / sizeof(arr[0]);
    
    int i = 0;
    int sum = arr[i];
    
    do {
        cout << "Элементы массива: [";
        for (int j = 0; j <= i; j++) {
            if (j > 0) cout << ", ";
            cout << arr[j];
        }
        cout << "] ";
        
        cout << "Сумма массива: " << sum << endl;
        i++;

        sum += arr[i]; // Увеличивает уже на следующую итерацию
        
    } while (sum < 32 && i < size);

    return 0;
}