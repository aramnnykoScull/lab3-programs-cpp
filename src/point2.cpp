// 2) Разработать консольное приложение для подсчета суммы элементов массива от 1 до 10. 
// Пользователь получает сообщение о элементах массива и его сумме. (через for)


#include <iostream>
using namespace std;

int main() {
    const int arr[] = {1,2,3,4,5,6,7,8,9,10};
    const int size = sizeof(arr) / sizeof(arr[0]);
    
    cout << "Массив: ";
    for(int i = 0; i < size; i++) cout << arr[i] << " ";
    cout << endl;

    int sum = 0;

    cout << "Сумма массива: ";
    for(int i = 0; i < size; i++) sum += arr[i];
    cout << sum << endl;


    return 0;
}