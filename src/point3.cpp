// 3) Разработать консольное приложение 
// для распределения человека в команду в зависимости от его класса 
// (если 1 класс, то в команду зеленых, если 2 - красных, 3 - синих, 4 - желтых). 
// (через switch)

#include <iostream>
using namespace std;

int main() {
    bool flag = true;
    string input;

    cout << "Введите номер класса (1-4 (одну цифру)): ";
   
    if (!getline(cin, input) || input.empty()) {
        cout << "Вы не ввели число" << endl;
        return 1;
    }

    try {
        int number = stoi(input); // пытаемся преобразовать в int
        cout << "Вы в команде ";
        
        switch(number){
            case 1: cout << "зеленых" << endl; break;
            case 2: cout << "красных" << endl; break;
            case 3: cout << "синих" << endl; break;
            case 4: cout << "желтых" << endl; break;
            default: cout << "...никакой, нет такого класса" << endl; flag = false; break;
        }

    } catch (...) {
        cout << "Вы ввели не число" << endl;
        flag = false;
    }

    return flag ? 0 : 1;
}