#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#define FLAGSIZE 64
/* gcc rand_word.c -zexecstack -fno-stack-protector -o ctf_binary -m32 */
/* V1: always chooses the same "random" word and format str vuln       */

char* choose_random_word(const char *filename) {
    FILE *f;
    size_t lineno = 0;
    size_t selectlen;
    char selected[256]; /* Arbitrary, make it whatever size makes sense */
    char current[256];
    selected[0] = '\0'; /* Don't crash if file is empty */

    f = fopen(filename, "r"); /* Add your own error checking */
    while (fgets(current, sizeof(current), f)) {
        if (drand48() < 1.0 / ++lineno) {
            strcpy(selected, current);
        }
    }
    fclose(f);
    selectlen = strlen(selected);
    if (selectlen > 0 && selected[selectlen-1] == '\n') {
        selected[selectlen-1] = '\0';
    }
    return strdup(selected);
}
void flag() {
  char buf[FLAGSIZE];
  FILE *f = fopen("/home/ctf/flag.txt","r");
  if (f == NULL) {
    printf("'flag.txt' missing in the current directory!\n");
    exit(0);
  }

  fgets(buf,FLAGSIZE,f);
  printf(buf);
}


int main() {
  setvbuf(stdout, NULL, _IONBF, 0);
  srand((unsigned) time(NULL));
  char *filename = "/usr/share/dict/american-english";
  char *word = choose_random_word(filename);
  printf("What's my word?\n");
  char str[120];
  fgets(str,120,stdin);
  str[strcspn(str, "\n")] = '\0';
  if (strcmp(word,str) == 0) {
	  printf("yay, you got me\n");
	  flag();
  } else {
	  printf("nay, you wrong\nThe correct word was not ");
    printf(str);
  }

  return 0;
}
