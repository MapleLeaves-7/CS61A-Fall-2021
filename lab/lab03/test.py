

import trace
import sys


def inverse_cascade(n):
    def grow(n): return f_then_g(grow, print, n//10)
    def shrink(n): return f_then_g(print, shrink, n//10)

    grow(n)
    print(n)
    shrink(n)


def f_then_g(f, g, n):
    if n:
        f(n)
        g(n)


def is_prime(n):
    if n == 2:
        return True
    else:
        return prime_helper(n, n-1)


def prime_helper(n, k):
    if k == 2:
        return n % 2 != 0
    else:
        return n % k != 0 and prime_helper(n, k-1)


def hailstone(n):
    print(n)
    if n == 1:
        return 1
    elif n % 2 == 0:
        return 1 + hailstone(n//2)
    else:
        return 1 + hailstone(3*n + 1)


def merge(n1, n2):
    if n1 == 0:
        return n2
    if n2 == 0:
        return n1
    last1, last2 = n1 % 10, n2 % 10
    if last1 < last2:
        return last1 + 10*(merge(n1//10, n2))
    else:
        return last2 + 10*(merge(n1, n2//10))


def multiply(m, n):
    if m == 0 or n == 0:
        return 0
    elif m == 1:
        return n
    return n + multiply(m-1, n)


def multiply1(m, n):
    if m == 1:
        return n
    return n + multiply(m-1, n)


def skip_mul(n):
    if n <= 1:
        return 1
    else:
        return n * skip_mul(n - 2)


def is_prime_sol(n):
    """Returns True if n is a prime number and False otherwise.

    >>> is_prime(2)
    True
    >>> is_prime(16)
    False
    >>> is_prime(521)
    True
    """
    def helper(i):
        if i > (n ** 0.5):  # Could replace with i == n
            return True
        elif n % i == 0:
            return False
        return helper(i + 1)
    return helper(2)
