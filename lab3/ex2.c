# include <stdio.h>
# include <stdlib.h>

int dist(int x1,int y1,int x2,int y2){
    int dx = x1-x2;
    int dy = y1-y2;
    return dx*dx+dy*dy;
}



int find_nearest(int xref, int yref, int *vx, int* vy, int N){
    int k, index = 0;
    int d, dmin = dist(xref,yref,vx[0],vy[0]);
    for (k=1; (k<N) && (dmin>0); k++) {
        d = dist(xref,yref,vx[k],vy[k]);
        if (d<dmin) {
            dmin = d;
            index = k;
        }
    }
    return index;
}

int main(){
    int d1[] = {-4, 1,2,7, -4,-13,4,2,-10,-2};
    int d2[] = {2,-10,-7,4,2,3,6,-5,-5,-4};
    int N = 10; // número de elementos nos vetores A e B
    int i=find_nearest(3,4,d1,d2,N);

    printf("%d", i);

}
