""" Optional problems for Lab 3 """

def is_prime(n):
    """Returns True if n is a prime number and False otherwise.

    >>> is_prime(2)
    True
    >>> is_prime(16)
    False
    >>> is_prime(521)
    True
    """
    "*** YOUR CODE HERE ***"
    def prime(i):
        if i>n//2:
            return True
        elif n%i!=0:
            return prime(i+1)
        else:
            return False
    return prime(2)

def gcd(a, b):
    """Returns the greatest common divisor of a and b.
    Should be implemented using recursion.

    >>> gcd(34, 19)
    1
    >>> gcd(39, 91)
    13
    >>> gcd(20, 30)
    10
    >>> gcd(40, 40)
    40
    """
    "*** YOUR CODE HERE ***"
    if max(a,b)%min(a,b)==0:
        return min(a,b)
    else:
        return gcd(min(a,b),max(a,b)%min(a,b))

'不知道定理的情况下:'
def gcd2(a,b):
    def div(i,j):
        if a%i==0 and b%i==0:
            j=i
        if i==min(a,b):
            return j
        return div(i+1,j)
    return div(1,1)

def ten_pairs(n):
    """Return the number of ten-pairs within positive integer n.

    >>> ten_pairs(7823952)
    3
    >>> ten_pairs(55055)
    6
    >>> ten_pairs(9641469)
    6
    """
    "*** YOUR CODE HERE ***"
    def count(a,n):
        if n==0:
            return 0
        elif a+n%10==10:
            return 1+count(a,n//10)
        else:
            return count(a,n//10)
    if n==0:
        return 0
    else:
        return count(n%10,n//10)+ten_pairs(n//10)