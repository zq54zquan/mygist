//
//  main.cpp
//  gl_wiki
//
//  Created by zhouquan on 16/6/23.
//  Copyright © 2016年 zhouquan. All rights reserved.
//

#include <iostream>
#include <GL/glew.h>
#include <OpenGL/OpenGL.h>
#include "math_3d.h"
#include <GLUT/GLUT.h>
GLuint VBO;

void renderScreen() {
    glClear(GL_COLOR_BUFFER_BIT);
    glBindBuffer(GL_ARRAY_BUFFER,VBO);
    glVertexAttribPointer(0,3,GL_FLOAT,GL_FALSE,0,0);
    glDrawArrays(GL_TRIANGLES, 0, 3);
    glutSwapBuffers();
}

int main(int argc,  char * argv[]) {
    // insert code here...

    
   
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE|GLUT_RGBA);
    glutInitWindowSize(1024, 768);
    glutInitWindowPosition(100, 100);
    glutCreateWindow("t1");
    GLenum res = glewInit();
    if (res!=GLEW_OK) {
        fprintf(stderr, "error :%s",glewGetErrorString(res));
    }
    glutDisplayFunc(renderScreen);
    glClearColor(.0f, .0f, .0f, .0f);
    Vector3f vertices[3];
    vertices[0] = {-1.0f,-1.0f,0.0f};
    vertices[1] = {1.0f,-1.0f,0.0f};
    vertices[2] = {.0f,1.0f,0.0f};

    
    glGenBuffers(1,&VBO);
    glBindBuffer(GL_ARRAY_BUFFER,VBO);
    glBufferData(GL_ARRAY_BUFFER,sizeof(vertices),vertices,GL_STATIC_DRAW);
    glEnableVertexAttribArray(0);
    
    glBindBuffer(GL_ARRAY_BUFFER,VBO);
    glVertexAttribPointer(0,3,GL_FLOAT,GL_TRUE,0,0);
    glDrawArrays(GL_TRIANGLES, 0, 3);

    glutMainLoop();
    return 0;
}
