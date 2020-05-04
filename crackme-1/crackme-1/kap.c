#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#define FLAGSIZE 64
#define MAGIC 11742860

/* gcc kap.c -o ctf_binary -lm */
/* 1 9 45 55 99 297 703 999 2223 2728 4879 4950 5050 5292 7272 7777 9999 17344 22222 38962 727329 3127482 7757143 */
/* total: 11742860 */

void flag() {
  char buf[FLAGSIZE];
  FILE *f = fopen("/home/ctf/flag.txt","r");
  if (f == NULL) {
    printf("'flag.txt' missing\n");
    exit(0);
  }

  fgets(buf,FLAGSIZE,f);
  printf("%s",buf);
  fflush(stdout);
}


int iskaprekar(int n) {
	if (n == 1)
		return 1;
	int sq_n = n * n;
	int count_digits = 0;
	while (sq_n) {
		count_digits++;
		sq_n /= 10;
	}
	sq_n = n*n;
	for (int r_digits=1; r_digits<count_digits; r_digits++) {
		int eq_parts = pow(10, r_digits);
		if (eq_parts == n)
			continue;
		int sum = sq_n/eq_parts + sq_n % eq_parts;
		if (sum == n)
			return 1;
	}
	return 0;
}

int arr_sum(int arr[], int n) {
	int sum = 0;
	for (int i = 0; i < n; i++) {
		sum += arr[i];
	}
	return sum;
}

int in_arr(int arr[], int p, int n) {
	for (int i = 0; i < n; i++) {
		if (arr[i] == p) {
			return 1;
		}
	}
	return 0;
}
int main() {
	int nums[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
	int nums_sum = 0;
	int cnt = 0;
	int n = sizeof(nums) / sizeof(nums[0]);
	while (nums_sum < MAGIC) {
		if (cnt > 30) {
			break;
		}
		printf("do the needful\n");
		fflush(stdout);
		int num;
		scanf("%d",&num);
		cnt++;
		if (iskaprekar(num)) {
			//printf("got one\n");
			n = sizeof(nums) / sizeof(nums[0]);
			if (in_arr(nums,num,n) == 0) { 
				for(int z = 0; z < 23; z++) {
					if (nums[z] == 0) {
						nums[z] = num;
						break;
					}
				}
			} else {
				printf("you already said that\n");
				fflush(stdout);
			}
		}
		n = sizeof(nums) / sizeof(nums[0]);
		nums_sum = arr_sum(nums,n);
	}
	if (nums_sum == MAGIC) {
		flag();
		return 0;
	}
	return 1;
}
