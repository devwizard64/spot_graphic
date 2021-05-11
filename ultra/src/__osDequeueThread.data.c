#include <ultra64.h>

/* 0x803359A0 */ __OSThreadTail __osThreadTail = {NULL, -1};
/* 0x803359A8 */ OSThread *__osRunQueue = (OSThread *)&__osThreadTail;
/* 0x803359AC */ OSThread *__osActiveQueue = (OSThread *)&__osThreadTail;
/* 0x803359B0 */ OSThread *__osRunningThread = NULL;
/* 0x803359B4 */ OSThread *__osFaultedThread = NULL;
