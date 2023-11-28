#include <stdio.h>
void daxpy(double *x, double *y, double a, int n)
{
for (int i = 0; i < n; i++) {
y[i] = a * x[i] + y[i];
}
}

