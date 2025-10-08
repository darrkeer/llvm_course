#include <stdio.h>

static char* logFileName = "instruction_log.txt";
static FILE *logFile = NULL;

void initLogger() {
    logFile = fopen(logFileName, "w");
}

void closeLogger() {
    if (logFile) {
        fprintf(logFile, "=== End of Log ===\n");
        fclose(logFile);
        logFile = NULL;
    }
}

void instructionLogger(char *opName, char* userName) {
    if (logFile) {
        fprintf(logFile, "%s -> %s\n", userName, opName);
    }
}