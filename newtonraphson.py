
from sympy import Symbol
from scipy.misc import derivative

sqrt1 = 0
sqrt2 = 4

def minimo(min):
   
    while min < 0 or min >4:
        fxnp=derivada.subs(x,min)
        fxn=y.subs(x,min)
        result = min - (fxn/fxnp)
        min = result
        print (float(result))
    

x=Symbol('x')
y=x**2-4*x
derivada=y.diff(x)
minimo(5)