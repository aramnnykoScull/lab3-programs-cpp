#include <iostream>
using namespace std;

int main() {
    bool flag = true;
    string input;

    cout << "Введите число: ";
    
    if (!getline(cin, input) || input.empty()) {
        cout << "Вы не ввели число" << endl;
        return 1;
    }

    try {
        double number = stod(input); // пытаемся преобразовать в double

        cout << "Ваше число ";

        if (number == 0)
        cout << "ноль" << endl;
        else if(number < 0)
        cout << "отрицательное" << endl;
        else
        cout << "положительное" << endl;

    } catch (...) {
        cout << "Вы ввели не число" << endl;
        flag = false;
    }

    return flag ? 0 : 1;
}