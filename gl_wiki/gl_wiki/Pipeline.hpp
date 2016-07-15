//
//  Pipeline.hpp
//  gl_wiki
//
//  Created by zhouquan on 16/7/13.
//  Copyright © 2016年 zhouquan. All rights reserved.
//

#ifndef Pipeline_hpp
#define Pipeline_hpp

#include <stdio.h>
#include "math_3d.h"
class Pipeline {
public:
    Pipeline() {
        m_scale = {1,1,1};
        m_rotation  = {0 ,0, 0};
        m_worldPos = {0, 0, 0};
    }
    
    void scale(float x, float y, float z) {
        m_scale.x = x;
        m_scale.y = y;
        m_scale.z = z;
    }
    void rotate(float x, float y, float z) {
        m_rotation.x = x;
        m_rotation.y = y;
        m_rotation.z = z;
    }
    void translate(float x, float y, float z) {
        m_worldPos.x = x;
        m_worldPos.y = y;
        m_worldPos.z = z;
    }

    
    void setPerspectivePro (float FOV,float width,float heigh,float zNear,float zFar) {
        m_Preproj.FOV = FOV;
        m_Preproj.width = width;
        m_Preproj.heigh = heigh;
        m_Preproj.zNear = zNear;
        m_Preproj.zFar = zFar;
    }
    
    const Mat4f* getTrans();
    
    ~Pipeline(){}
private:
    Vector3f m_scale;
    Vector3f m_rotation;
    Vector3f m_worldPos;
    
    Mat4f m_transform;
    
    
    struct {
        float FOV;
        float width;
        float heigh;
        float zNear;
        float zFar;
    } m_Preproj;
    
    void initScaleTans(Mat4f&);
    void initRotateTans(Mat4f&);
    void initTranslateTrans(Mat4f&);
    void initPerspectiveProj(Mat4f&);
    
};
#endif /* Pipeline_hpp */
