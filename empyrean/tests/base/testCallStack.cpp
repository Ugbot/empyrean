#include <iostream>
#include "Error.h"
#include "CallStack.h"
using namespace std;
using namespace pyr;


int baz() {
    cout << CallStack().asString() << endl;
    return 0;
}

int bar() {
    return baz();
}

int foo() {
    return bar();
}

int main() {
    PYR_EXCEPTION_TRAP({
        return foo();
    })
}
