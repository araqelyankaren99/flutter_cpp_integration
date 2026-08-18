#ifndef CALCULATOR_H
#define CALCULATOR_H

#ifdef __cplusplus
extern "C" {
#endif

int calculator_add(int a, int b);

double calculator_multiply(double a, double b);

const char* calculator_get_message();

#ifdef __cplusplus
}
#endif

#endif