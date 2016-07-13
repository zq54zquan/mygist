//
//  math_3d.h
//  gl_wiki
//
//  Created by zhouquan on 16/6/23.
//  Copyright © 2016年 zhouquan. All rights reserved.
//

#ifndef math_3d_h
#define math_3d_h

typedef struct  {
    float x,y,z;
} Vector3f;

typedef struct XXX{
    float mat[4][4];
    
    inline struct XXX operator* (const struct XXX& Right) {
        struct XXX ret ;
        for(unsigned int i = 0; i < 4; i++) {
            for(unsigned int j = 0; j < 4; j++){
                ret.mat[i][j] = mat[i][0]*Right.mat[0][j]
                +mat[i][1]*Right.mat[1][j]
                +mat[i][2]*Right.mat[2][j]
                +mat[i][3]*Right.mat[3][j];
            }
        }
        return ret;
    }
} Mat4f;
#endif /* math_3d_h */
