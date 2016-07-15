//
//  Pipeline.cpp
//  gl_wiki
//
//  Created by zhouquan on 16/7/13.
//  Copyright © 2016年 zhouquan. All rights reserved.
//

#include "Pipeline.hpp"
#include <math.h>
const Mat4f* Pipeline::getTrans() {
    Mat4f scaleT,rotateT,tanslateT,perprojTrans;
    initScaleTans(scaleT);
    initRotateTans(rotateT);
    initTranslateTrans(tanslateT);
    initPerspectiveProj(perprojTrans);
    
    m_transform = tanslateT*rotateT*scaleT;
    return &m_transform;
}


void Pipeline::initScaleTans(Mat4f& world){
    world.mat[0][0] = m_scale.x;world.mat[0][1] = 0;world.mat[0][2] = 0;world.mat[0][3] = 0.0;
    
    world.mat[1][0] =0;world.mat[1][1] = m_scale.y;world.mat[1][2] = 0.0;world.mat[1][3] = 0.0;
    
    world.mat[2][0] = 0;world.mat[2][1] = 0.0;world.mat[2][2] = m_scale.z;world.mat[2][3] = 0.0;
    
    world.mat[3][0] = 0.0;world.mat[3][1] = 0.0;world.mat[3][2] = 0.0;world.mat[3][3] = 1.0;
}

float ToRadian(float x) {
    return x/180.0*M_PI;
}

void Pipeline::initRotateTans(Mat4f& world){
    Mat4f rx, ry, rz;
    
    const float x = ToRadian(m_rotation.x);
    const float y = ToRadian(m_rotation.y);
    const float z = ToRadian(m_rotation.z);
    
    rx.mat[0][0] = 1.0f; rx.mat[0][1] = 0.0f; rx.mat[0][2] = 0.0f; rx.mat[0][3] = 0.0f;
    rx.mat[1][0] = 0.0f; rx.mat[1][1] = cosf(x); rx.mat[1][2] = -sinf(x); rx.mat[1][3] = 0.0f;
    rx.mat[2][0] = 0.0f; rx.mat[2][1] = sinf(x); rx.mat[2][2] = cosf(x); rx.mat[2][3] = 0.0f;
    rx.mat[3][0] = 0.0f; rx.mat[3][1] = 0.0f; rx.mat[3][2] = 0.0f; rx.mat[3][3] = 1.0f;
    
    ry.mat[0][0] = cosf(y); ry.mat[0][1] = 0.0f; ry.mat[0][2] = -sinf(y); ry.mat[0][3] = 0.0f;
    ry.mat[1][0] = 0.0f; ry.mat[1][1] = 1.0f; ry.mat[1][2] = 0.0f; ry.mat[1][3] = 0.0f;
    ry.mat[2][0] = sinf(y); ry.mat[2][1] = 0.0f; ry.mat[2][2] = cosf(y); ry.mat[2][3] = 0.0f;
    ry.mat[3][0] = 0.0f; ry.mat[3][1] = 0.0f; ry.mat[3][2] = 0.0f; ry.mat[3][3] = 1.0f;
    
    rz.mat[0][0] = cosf(z); rz.mat[0][1] = -sinf(z); rz.mat[0][2] = 0.0f; rz.mat[0][3] = 0.0f;
    rz.mat[1][0] = sinf(z); rz.mat[1][1] = cosf(z); rz.mat[1][2] = 0.0f; rz.mat[1][3] = 0.0f;
    rz.mat[2][0] = 0.0f; rz.mat[2][1] = 0.0f; rz.mat[2][2] = 1.0f; rz.mat[2][3] = 0.0f;
    rz.mat[3][0] = 0.0f; rz.mat[3][1] = 0.0f; rz.mat[3][2] = 0.0f; rz.mat[3][3] = 1.0f;
    
    world = rz * ry * rx;
}

void Pipeline::initTranslateTrans(Mat4f& world){
    world.mat[0][0] = 1;world.mat[0][1] = 0;world.mat[0][2] = 0;world.mat[0][3] = m_worldPos.x;
    
    world.mat[1][0] =0;world.mat[1][1] = 1;world.mat[1][2] = 0.0;world.mat[1][3] = m_worldPos.y;
    
    world.mat[2][0] = 0;world.mat[2][1] = 0.0;world.mat[2][2] = 1;world.mat[2][3] = m_worldPos.z;
    
    world.mat[3][0] = 0.0;world.mat[3][1] = 0.0;world.mat[3][2] = 0.0;world.mat[3][3] = 1.0;
}


void Pipeline::initPerspectiveProj(Mat4f &world) {
    const float ar = m_Preproj.width/m_Preproj.heigh;
    const float zNear = -m_Preproj.zNear;
    const float zFar  = -m_Preproj.zFar;
    const float zRange = zNear-zFar;
    
}