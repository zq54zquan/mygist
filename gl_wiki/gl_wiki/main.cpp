//
//  main.cpp
//  gl_wiki
//
//  Created by zhouquan on 16/6/23.
//  Copyright © 2016年 zhouquan. All rights reserved.
//

#include <iostream>
#include <GL/glew.h>
#include <OpenGL/gl3.h>
#include "math_3d.h"
#include <GLUT/GLUT.h>
#include <string>
#include <fstream>


const char *pVS = "/Users/zhouquan/Desktop/codes/mygist/gl_wiki/gl_wiki/shader.vert";
const char *fVS = "/Users/zhouquan/Desktop/codes/mygist/gl_wiki/gl_wiki/shader.frag";
GLuint VBO;
GLuint VAO;
using namespace std;

void createVertexBuffer() {
    Vector3f ver[3];
   
    ver[0] = {-1.0f,-1.0f,0.0f};
    ver[1] = {1.0,-1.0,0};
    ver[2] = {.0,1.0,0};
    /* Allocate and assign a Vertex Array Object to our handle */
    glGenVertexArrays(1, &VAO);
    
    /* Bind our Vertex Array Object as the current used object */
    glBindVertexArray(VAO);
    glGenBuffers(1,&VBO);
    glBindBuffer(GL_ARRAY_BUFFER,VBO);
    glBufferData(GL_ARRAY_BUFFER,sizeof(ver),ver,GL_STATIC_DRAW);
    glEnableVertexAttribArray(0);
}

void renderScreen() {
    glClear(GL_COLOR_BUFFER_BIT);
    
    
    glEnableVertexAttribArray(0);
    
    
    glBindBuffer(GL_ARRAY_BUFFER,VBO);
    
    glVertexAttribPointer(0,3,GL_FLOAT,GL_FALSE, 3*4,0);
    glDrawArrays(GL_TRIANGLES, 0, 3);
    glDisableVertexAttribArray(0);
    
    
    glutSwapBuffers();
}
static
void addShader(GLuint shaderProgram,const char *s , GLenum shaderType) {
    GLuint shaderObj =  glCreateShader(shaderType);
    if ( 0 == shaderObj) {
        printf("%s,%d",__FILE__,__LINE__);
        exit(1);
    }
    
    const GLchar* p[1];
    p[0] = s;
    GLint L[1];
    L[0] = strlen(s);
    glShaderSource(shaderObj,1,p,L);
    
    glCompileShader(shaderObj);
    GLint success;
    glGetShaderiv(shaderObj,GL_COMPILE_STATUS,&success);
    if (!success) {
        GLchar infoLog[1024];
        glGetShaderInfoLog(shaderObj,1024,NULL,infoLog);
        fprintf(stderr, "error compiling shader type :%d: %s",shaderType,infoLog);
        exit(1);
    }
    
    glAttachShader(shaderProgram,shaderObj);
    
}

bool readFile(const char *fileName,string &s) {
    ifstream f(fileName);
    bool ret = false;
    
    if (f.is_open()) {
        string line ;
        while (std::getline(f, line)) {
            s.append(line);
            s.append("\n");
        }
        f.close();
        ret = true;
    }else {
        printf("%s,%d",__FILE__,__LINE__);
    }
    return ret;
}
void compileShaders() {
    string vs,fs;
    if (!readFile(pVS, vs)) {
        exit(1);
    }
    if (!readFile(fVS, fs)) {
        exit(1);
    }
    
//    std::cout<<vs;
//    std::cout<<fs;
    GLuint shaderProgram =  glCreateProgram();
    if (0 == shaderProgram) {
        printf("%s,%d",__FILE__,__LINE__);
    }
    
    addShader(shaderProgram,vs.c_str(),GL_VERTEX_SHADER);
    addShader(shaderProgram,fs.c_str(),GL_FRAGMENT_SHADER);
    
    glLinkProgram(shaderProgram);
    GLint success = 0;
    GLchar errorLog[1024];
    glGetProgramiv(shaderProgram,GL_LINK_STATUS,&success);
    if (0 == success) {
        glGetProgramInfoLog(shaderProgram,sizeof(errorLog),NULL,errorLog);
        fprintf(stderr, "error link shader program:%s",errorLog);
        exit(1);
    }
    glValidateProgram(shaderProgram);
    
    
    glGetProgramiv(shaderProgram,GL_VALIDATE_STATUS,&success);
    if (0 == success) {
        glGetProgramInfoLog(shaderProgram,sizeof(errorLog),NULL,errorLog);
        fprintf(stderr, "error link shader program:%s",errorLog);
        exit(1);
    }
    glUseProgram(shaderProgram);
}



int main(int argc,  char * argv[]) {
    // insert code here...

    
   
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE|GLUT_RGBA|GLUT_3_2_CORE_PROFILE);
    glutInitWindowSize(800, 400);
    glutInitWindowPosition(100, 100);
    glutCreateWindow("t1");
    GLenum res = glewInit();
    if (res!=GLEW_OK) {
        fprintf(stderr, "error :%s",glewGetErrorString(res));
    }
    glutDisplayFunc(renderScreen);
    glutIdleFunc(renderScreen);
    glClearColor(.0f, 1.0f, .0f, .0f);
    createVertexBuffer();

    compileShaders();

    glutMainLoop();
    return 0;
}
