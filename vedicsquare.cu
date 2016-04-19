
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <iostream>
#include <stdio.h>
#include <cuda.h>

using namespace std;

__global__ void square(int *l, int *m, int *n)
{
	int id = threadIdx.x;
	__shared__ int add, mul;

	if (id == 1)
	{
		add = (l[0] + m[0]);
	}
	else
	{
		mul = m[0] * m[0];
	}

	__syncthreads();
	n[2] = add * 10 + mul;
}

int main()
{
	int num[1], diff[1];
	int *a, *b, *c;
	int squ[3];

	cout << "Enter number : " << endl;
	cin >> num[0];

	diff[0] = num[0] - 10;

	cudaMalloc(&a, sizeof(int));
	cudaMalloc(&b, sizeof(int));
	cudaMalloc(&c, sizeof(int)*3);

	cudaMemcpy(a, num,sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(b, diff,sizeof(int), cudaMemcpyHostToDevice);

	square << <1, 2 >> >(a, b, c);

	cudaMemcpy(squ, c, sizeof(int)* 3, cudaMemcpyDeviceToHost);

	cout << endl << "Square is: ";
	cout << squ[2];

	cudaFree(a);
	cudaFree(b);
	cudaFree(c);

	return 0;
}
