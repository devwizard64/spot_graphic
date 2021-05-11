#ifndef _PROJECT_H_
#define _PROJECT_H_

/* #define DEMO_DVD */
/* #define DEMO_TIME */
/* #define DEMO_OLD */
/* #define DEMO_ORG */
/* #define DEMO_HI */

#if !defined(DEMO_DVD) && !defined(DEMO_OLD) && !defined(DEMO_ORG)
#define F3D_SPOT
#endif

#ifdef DEMO_TIME
#define PRINT
#endif

#endif /* _PROJECT_H_ */
