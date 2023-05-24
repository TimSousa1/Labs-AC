#include <stdio.h>
#include <stdlib.h>

int findstr(char *needle, char *text, int needleLen, int textLen){
    if (needleLen > textLen)
        return -1;
    // check if the first ‘needleLen’ characters of
    // both strings match
    int match = 1;
    for (int i=0; i<needleLen; i++) {
        if (needle[i] != text[i]){
            match = 0;
            break;
        }
    }
    if (match == 1) {
        return 0; // return match on first character (0)
    }else{
        // find a match starting on the next position of ‘text’
        int i = findstr(needle,text+1,needleLen,textLen-1);
        if (i<0) return i;
        else return i+1;
    }
}

int main(){

    int i = findstr("cool", "Mancool", 4, 7);
    printf("%d", i);

    return 0;

}




