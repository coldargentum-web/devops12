import math
import time

def simple_prime_search(limit):
    """Проста реалізація пошуку простих чисел без оптимізацій."""
    primes = []
    for n in range(2, limit + 1):
        is_prime = True
        # Перевірка за всіма числами від 2 до n - 1 (без зупинки та без sqrt)
        for i in range(2, n):
            if n % i == 0:
                is_prime = False
        if is_prime:
            primes.append(n)
    return primes

def sieve_eratosthenes(limit):
    """Ефективна реалізація пошуку простих чисел (Решето Ератосфена)."""
    if limit < 2:
        return []
    is_prime = [True] * (limit + 1)
    is_prime[0] = is_prime[1] = False
    
    for i in range(2, int(math.sqrt(limit)) + 1):
        if is_prime[i]:
            for j in range(i * i, limit + 1, i):
                is_prime[j] = False
                
    return [x for x, prime in enumerate(is_prime) if prime]

def measure_time(func, *args, **kwargs):
    """Функція для вимірювання часу виконання переданої функції."""
    start = time.time()
    result = func(*args, **kwargs)
    end_time = time.time()
    print(f"Time of the {func.__name__} function: {end_time - start:.10f} sec.")
    return result

# Виконання та порівняння для різних діапазонів
ranges = [100, 1000, 10000]

for limit in ranges:
    print(f"\n--- Порівняння для n = {limit} ---")
    print("1. Простий метод:")
    primes_simple = measure_time(simple_prime_search, limit)
    
    print("2. Решето Ератосфена:")
    primes_sieve = measure_time(sieve_eratosthenes, limit)