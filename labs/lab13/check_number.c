#include <stdio.h>
#include <stdlib.h>

int main() {
    int n;
    printf("Enter a number: ");
    scanf("%d", &n);
    if (n > 0) {
        exit(1);
    } else if (n < 0) {
        exit(2);
    } else {
        exit(0);
    }
}
