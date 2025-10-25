const FibonacciError = error{ OverFibonacciLimit, UnderFibonacciLimit };

const fibonacci_limit = 30;

pub fn fibonacci(n: usize) !i32 {
    if (n == 0) {
        return 0;
    } else if (n == 1) {
        return 1;
    } else if (n > fibonacci_limit) {
        return FibonacciError.OverFibonacciLimit;
    }
    return try fibonacci(n - 1) + try fibonacci(n - 2);
}
