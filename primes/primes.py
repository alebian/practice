"""This script gives basic prime number functions."""

import math
import itertools


def is_prime(number):
    """Checks if a number is prime"""
    if number <= 1:
        return False
    if number == 2:
        return True
    else:
        maximum = int(math.sqrt(number)) + 1
        for i in range(2, maximum):
            if number % i == 0:
                return False
        return True


def primes_gen():
    """Generator of prime numbers"""
    for number in itertools.count(2):
        if is_prime(number):
            yield number


def primes_list(size):
    """Generates a list of n prime numbers"""
    return list(itertools.islice(primes_gen(), size))


def prime_decomposition(number):
    """Returns a dictionary with the prime decomposition of n"""
    decomposition = {}
    number = int(number)
    if number < 2:
        return decomposition
    gen = primes_gen()
    break_condition = int(math.sqrt(number))
    while number > 1:
        current_prime = next(gen)
        if current_prime > break_condition:
            decomposition[number] = 1
            return decomposition
        while number % current_prime == 0 or number == current_prime:
            if current_prime in decomposition:
                decomposition[current_prime] += 1
            else:
                decomposition[current_prime] = 1
            number /= current_prime
    return decomposition


def get_from_decomposition(decomposition):
    """Returns a number from a prime decomposition"""
    result = 1
    for key in decomposition:
        result *= math.pow(key, decomposition[key])
    return result
