/**

All Types of INITIALIZATIONS

    1. Default        Initialization   [C]     ----> The God of "Undefined Behavior"
    2.         Member Initialiser List [C++98] ----> Manually Setting Values
    3. Default Member Initializer      [C++11] ----> 💁‍♀️ what I do

    4.   Copy         Initialization   [C]     ----> "   = Value   "   💁‍♀️What I Do + 👀 [Watch Out]    
       - INFO:-
         - Looks Same as Type3
         - Copy-Init is never an "Assignment"
         - IF: Types don't match --> THEN: Copy-Init performs a "CONVERSION" sequence

    5. Aggregate      Initialization   [C]     ----> 👀 [Watch Out]
       - INFO:
         - Calls onto COPY-INIT

    6.   Zero         Initialization   [C] 
       - INFO:
         - Brace Elision Case:- [6.1] [SPECIAL TRAP]

    7. Constant       Initialization   [C]
       - CODE:-
            static int i = 3;

    8. Static         Initialization   [C]
       - CODE:-
            static int j;  // No Value ===> Zero Init
       - INFO:-
            special case [8.1]
            initialization ORDER FIASCO [8.2]



    C++ Gives us CONSTRUCTORS

    9. Direct Init [C++98]
            int i(3)
            Foo foo(1,2)
            auto* foo_ptr = new Foo(2,3);
            static_cast<Foo>(bar);

       Direct Init v/s Copy Init
            a) Same thing for "Built-In Types"
            b) for CLASSES
                - See [9.1]
                - `explicit` constructor [9.2]
                - most vexing parse [9.3]

    10. Value Init [C++03]
            return int();       // UB in C++98, returns 0 since C++03

            IF: type has a user-provided default CONSTRUCTOR, THEN: it's called
            OTHERWISE: Zero-Init
            CAUTION: user-provided CONSTRUCTOR sucks.... 10.1
            FIX: for CAUTION: user-defined v/s user-provided CONSTRUCTOR [since C++11]   10.2

    11. Uniform/UniCorn Init

    12. List Initialization ----- BRACED INIT LIST
            Foo foo{1, 2};
            std::vector<int> vec{0,1,2,3,4};

        Direct List Init
            Foo foo{1, 2};

        Copy List Init
            Foo foo = {1, 2};

    13. Designated init -----> I really like it

    14. Aggregate Init using "()" instead of "{}" since C++20
    
 */


// ====== Default Inialization 1 ======
int main() {
    int x;
    return x; // Undefined Behavior
}




// ====== 1. Default Inialization 2 ======
struct Foo1 {
    int i;
    int j;
};

int main() {
    Foo1 foo;
    return foo.i;   // Undefined Behavior
}




// ====== 1. Default Inialization 3 ======
class Foo2 {
public:
    Foo2() {}
    int get_i() const noexcept { return i; }
    int get_j() const noexcept { return j; }
private:
    int i;  //default init
    int j;  //default init
};

int main() {
    Foo2 foo;
    return foo.get_i();     // UB = Undefined Behavior
}






// ====== 2. Member Initialiser List [C++98] ======
class Foo3 {
public:
    Foo3() : i(0), j(0) {} // member initialiser list
private:
    int i;
    int j;
};

// ====== 3. Default Member Initializer [C++11] ======
class Foo3 {
public:
    Foo3();
private:
    int i = 0; // default member initializer
    int j = 0;
};






// ====== 4. Copy Initialization ======
int main() {
    int i = 2;          // initializer starting with "="
}

int square(int i) {     // passing argument by value
    return i * i;       // or, returning by value
}






// ====== 5. Aggregate Initialization ======
int i[4] = {0,1,2,3};
int j[]  = {0,1,2,3};   // Array Size Deduction by compiler

struct Foo4 {   // aggerate type
    int i;
    float j;
};

Foo4 foo = {1, 3.14159};    // Foo4    is "Aggregate Initialized"
                            // Foo4.i  is "Copy      Initialized"
                            // Foo4.j  is "Copy      Initialized"






// ====== 6. Zero Initialization [of Aggregate Struffs] ======
struct Foo {
    int i;
    int j;
};

int main() {
    Foo foo = {1}; // elements with no initialiser are zero-initialised!
    return foo.j;  // OK, returns 0
}





// ====== 6. Zero Initialization ======

int arr[100] = {}; // all elements are zero-initialised!



// ====== 6.1. Brace Elision [Special TRAP] ======
struct Foo {
    int i;
    int j;
};
struct Bar {
    Foo f;
    int k;
};
int main() {
    Bar b = {1, 2}; // Equivalent to Bar b = {{1, 2}, 0};
    return b.k; // returns 0!
}





// ====== 8.1. Static Init [Special CASE] ======
static int a = 2;   // Constant init
static int b;       // Zero init

int main() {
    return a + b;   // OK, returns 3
}



// ====== 8.2. Initialization Order FIASCO [Special CASE] ======
struct Colour {
    int r;
    int g;
    int b;
};

static Colour red = {255, 0, 0};        // Now if you use "red" object in another translation unit
                                        //   then IDK what will happen.... UNDEFINED BEHAVIOR



// ====== 9.1. Direct-Init v/s Copy-Init ======
class Colour2 {
public:
    int r;
    int g;
    int b;

    Colour2(int param_r, int param_g, int param_b) : r(param_r), g(param_g), b(param_b) {}
};

int main(void) {
    Colour2 black(0,0,0);                   //    Direct Init

    Colour2 grey = {10, 10, 10};            // Aggregate Init?
    Colour2 grey2 = Colour2(20, 20, 20);    //      Copy Init? Copy Elision?
                                            // https://devdocs.io/cpp/language/copy_initialization
}


// ====== 9.2. `explicit` constructor ======
struct Foo5 {
    explicit Foo5(int x) {}
};

Foo5 foo_5 = 1; //ERROR
Foo5 foo_6(1);  //OK

// ====== 9.2. `explicit` constructor ======
struct Foo6 {
    explicit Foo6(int) {}
    Foo6(double) {}
};

Foo6 foo_6 = 1; //Foo6(double)
Foo6 foo_7(1);  //Foo6(int)



// ====== 9.3. most vexing parse ======
struct Foo {};
struct Bar {
    Bar(Foo) {}
};
int main() {
    Bar bar(Foo());    // This is a function declaration :(
                       // "bar" = function
                       // "bar" is taking an argument which itself is an Function
                       // "bar" is returning type "Bar"
}


// ====== 10.1. [Value-Init] user-provided CONSTRUCTOR sucks.... ======
struct Foo9 {
    Foo9() {} // user-provided CONTRUCTOR!
    int i;   // But the VALUE will be UB!   [\See 1. Default Constructor 3]
};
Foo9 get_foo9() {
    return Foo9(); // Value initialisation
}
int main() {
    return get_foo9().i; // Value-Init calls Default-CONSTRUCTOR ----> value is uninitialised ----> UB!!!
}


// ====== 10.2. user-defined v/s user-provided CONSTRUCTOR [since C++11] ======
struct Foo {
    Foo() = default; // (since C++11) user-defined, but not user-provided
    int i;
};
// This fixes the above Issue seen @ [10.1]

//CAUTION:- This below won't work
Foo::Foo() = default;        // counts as user-provided.... & `Foo.i` will be uninitialized 
                             // it's because, this thing might just be in another Translation Unit....