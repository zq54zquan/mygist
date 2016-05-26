#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#ifndef BUF_SIZE
#define	BUF_SIZE 1024
#endif

int main(int argc,char **argv) {
	int inputFd,outputFd,openFlags;
	mode_t filePerms;
	ssize_t numRead;
	char buf[BUF_SIZE];
	
	if (argc!=3 || strcmp(argv[1], "--help")==0) {
		fprintf(stderr,"error");
	}
	
	inputFd = open(argv[1], O_RDONLY);
	if (inputFd == -1) {
		fprintf(stderr,"file open failed");
	}
	openFlags = O_CREAT|O_WRONLY|O_TRUNC;
	filePerms = S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH;
	
	outputFd = open(argv[2],openFlags,filePerms);
	if(outputFd==-1) {
		fprintf(stderr,"des file cant opne");
	}
	
	while((numRead = read(inputFd,buf,BUF_SIZE))>0) {
		if(write(outputFd,buf,numRead)!=numRead) {
			fprintf(stderr,"write file err");
		}	
	}
	if(numRead == -1) {
		fprintf(stderr,"write error");
	}
	if(close(inputFd)==-1) {
		fprintf(stderr,"close source file err");
	}
	if(close(outputFd)==-1) {
		fprintf(stderr,"close des file err");
	}

	exit(EXIT_SUCCESS);
}
