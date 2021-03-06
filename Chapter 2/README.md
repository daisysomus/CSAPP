# 第二章 信息的表示和处理
## 2.1 
### A
0x39A7F8 的二进制表示：0011 1001 1010 0111 1111 1000

### B
1100100101111011 的十六进制表示：0xA97C

### C
0xD5E4C 的二进制表示：1101 0101 1110 0100 1100

### D
1001101110011110110101 的十六进制表示：0x26E7B5

## 2.2 

n|2^n (十进制)|2^n (十六进制)
---|-------|------
9|512|0x200
19|524288|0x80000
14|16384|0x4000
16|65536|0x10000
17|131072|0x20000
5|32|0x20
7|128|0x80

## 2.3
十进制|二进制|十六进制
---|-------|------
0 | 0000 0000 | 0x00
167 |1010 0111 | 0xA7
62 | 0011 1101 | 0x3D
188 | 1011 1100 | 0xBC
55 | 0011 0111 | 0x37
136 | 1000 1000 | 0x88
244 | 1111 0011 | 0xF3
82 | 0101 0010 | 0x52
172 | 1010 1100 | 0xAC
232 | 1110 0111 | 0xE7

## 2.4

### A
0x503c + 0x8 = 0x5044

### B
ox503c + 0x40 = 0x507c

### C
0x503c + 64 = 0x503c + 0x40 = 0x507c

### D
0x50ea - 0x503c = 0xae

## 2.5 
思考下面对 show_bytes 的三次调用：

```
int val = 0x87654321;
byte_pointer valp = (byte_pointer) &val;
show_bytes(valp, 1); /* A. */
show_bytes(valp, 2); /* B. */
show_bytes(valp, 3); /* C. */
```
指出再小端法机器和大端法机器上，每次调用的输出值。

A. 小端法：21 大端法： 87
B. 小端法：2143 大端法：8765
C. 小端法：214365 大端法：876543

## 2.6
使用 show_int 和 show_float，我们确定整数 3510593 的十六进制表示为 0x00359141，而浮点数 3510593.0 的十六进制表示为 0x4A564504。
A. 写出这两个十六进制值的二进制表示
B. 移动这两个二进制串的相对位置，使得它们相匹配的位数最多。有多少位相匹配呢？
C. 串中的什么部分不匹配？

A. 0x00359141 的二进制表示：00000000001101011001000101000001
	0x4A564504 的二进制表示：01001010010101100100010100000100
	
B. 
00000000001101011001000101000001
  01001010010101100100010100000100
  
  有 21 位相同，移动两位即可匹配
  
C. 前面 9 位 和最后两位不匹配

## 2.7
下面对 show_bytes 的调用将输出什么结果？

```
const char *s = "abcdef";
show_bytes((byte_pointer) s, strlen(s));
```
注意字母 ‘a’ ~ ‘z’ 的 ASCII 码为 0x61 ~ 0x7A。

0x616263646566

## 2.8
运算 | 结果
---- | ----
a | [01001001]
b | [01010101]
~a | [10010110]
~b | [10101010]
a & b | [01000001]
a \| b | [01111101]
a ^ b | [00111100]

## 2.9
通过混合三中不同颜色的光（红色、绿色和蓝色），计算机可以再视频屏幕或者液晶显示器上产生彩色的画面。设想一种简单的方法，使用三中不同颜色的光，每种光都能打开或者关闭，投射到玻璃屏幕上。
那么基于光源R（红）、G（绿）、B（蓝）的关闭（0）或打开（1），我们就能够创建 9 种不同的颜色：

R | G | B | 颜色 | R | G | B | 颜色
--- | --- | --- | --- | --- | --- | --- | ---
0 | 0 | 0 | 黑色 | 1 | 0 | 0 | 红色
0 | 0 | 1 | 蓝色 | 1 | 0 | 1 | 红紫色
0 | 1 | 0 | 绿色 | 1 | 1 | 0 | 黄色
0 | 1 | 1 | 蓝绿色 | 1 | 1 | 1 | 白色

这些颜色中的每一种都能用一个长度为 3 的位向量来表示，我们可以对他们进行布尔运算。
A. 一种颜色补是通过关掉打开的官员，且打开关闭的光源而形成的。那么上面列出的 8 种 颜色每一种的补是什么？

R | G | B | 颜色 | 补色 | R | G | B | 颜色 | 补色 
--- | --- | --- | --- | --- | --- | --- | --- | --- | ---
0 | 0 | 0 | 黑色 | 白色 | 1 | 0 | 0 | 红色 | 蓝绿色
0 | 0 | 1 | 蓝色 | 黄色 | 1 | 0 | 1 | 红紫色 | 绿色
0 | 1 | 0 | 绿色 | 红紫色 | 1 | 1 | 0 | 黄色 | 蓝色
0 | 1 | 1 | 蓝绿色 | 红色 | 1 | 1 | 1 | 白色 | 褐色

B. 描述下列颜色应用布尔运算的结果：
蓝色 | 绿色 == 蓝绿色
黄色 & 蓝绿色 ==  绿色
红色 ^ 红紫色 == 蓝色

## 2.10
对于任意一位向量 a， 有 a ^ a = 0。应用这一属性，考虑下面的程序：

```
void inplace_swap(int *x, int *y) {
	*y = *x ^ *y; /* Step 1 */
	*x = *x ^ *y; /* Step 2 */
	*y = *x ^ *y; /* Step 3 */
}
```
正如程序名所暗示的那样，我们认为这个过程的效果是交换指针变量 x 和 y 所指向的存储位置处存放的值。注意，与通常的交换两个数值的技术不一样，当移动一个值时，我们不需要第三个位置来临时存储另一个值。这种交换方式并没有性能上的优势，它仅仅是一个智力游戏。
以指针 x 和 y 指向的位置存储的值分别是 a 和 b 作为开始，填写下表，给出在程序的每一步之后，存储在这两个位置中的值。利用 ^ 的属性证明达到了所希望的结果。回想一下，每个元素就是它自身的加法逆元 (a ^ a = 0)。

步骤 | *x | *y 
--- | --- | ---
初始 | a  | b
第 1 步 | a | a ^ b
第 2 步 | b | a ^ b
第 3 步 | b | a

## 2.11
在练习题 2.10 中的 `inplace_swap` 函数的基础上，你决定写一段代码，实现将一个数组中的元素头尾两端依次对调。你写出下面这个函数：

```
void reverse_array(int a[], int cnt) {
	int first, last;
	for (first = 0, last = cnt - 1; first <= last); first++, last--) 
		inplace_swap(&a[first], &a[last]) 
}
```
当你对一个包含元素1、2、3 和 4 的数组使用这个函数时，正如预期的那样，现在数组的元素变成了 4、3、2 和 1.不过，当你对一个包含元素1、2、3、4 和 5 的数组使用这个函数时，你会很惊奇地看到得到的数字的元素为5、4、0、2 和 1.实际上，你会发现这段代码对所有偶数长度的数组都能正确地工作，但是当数组的长度为奇数时，它就会把中间的元素设置成 0。
A. 对于一个长度为奇数的数组，长度 `cnt = 2k + 1`，函数 `reverse_array` 最后一次循环中，变量 `first` 和 `last` 的值分别是什么？ `first = last = k`

B. 为什么这时调用函数 `inplace_swap` 会将数组元素设置为 0？因为这时候 `first` 和 `last` 相等，而根据 `a ^ a = 0` ，所以 `first` 和 `last` 就变成 `0` 了。

C. 对 `reverse_array` 的代码做哪些简单改动就能消除这个问题？ 把条件 `first <= last` 改成 `first < last` 即可。

## 2.12 
对于下面的值，写出变量 x 的 C 语言表达式。你的代码应该对任何字长 w >= 8 都能工作。我们给出了当 x=0x87654321 以及 w = 32 时表达式求值的结果，仅供参考。
A. x 的最低有效字节，其他位均置为 0。[0x00000021]。 x & 0x000000FF
B. 除了 x 的最低有效字节外，其他的位都取补，最低有效字节保持不变。[0x789ABC21]。 
x ^ 0xFFFFFF00
C. x 的最低有效字节设置成全 1，其他字节都保持不变。[0x876543FF]。x | 0x000000FF

## 2.13 
从 20 世纪 70 年代末到 80 年代末，Digital Equipment 的 VAX 计算机是一种非常刘姓的机型。它没有布尔运算 AND 和 OR 指令，只有 bis（位设置）和 bic（位清除）这两种指令。两种指令的输入都是一个数据字 x 和一个掩码字 m。它们生成一个结果 z，z 是由根据掩码 m 的位来修改 x 的位得到的。使用 bis 指令，这种修改就是在 m 为 1 的每个位置，将 z 对应的位设置为 0.

为了看清楚这些运算与 C 语言位级运算的关系，假设我们有两个函数 bis 和 bic 来实现位设置和位清除操作。只想用这两个函数，而不实用任何其他 C 语言运算，来实现按位 | 和 ^ 运算。填写下列代码中缺失的代码。提示：写出 bis 和 bic 的 C 语言表达式。

```
/ * Declarations of functions implementing operations bis and bic */
int bis(int x, int m);
int bic(int x, int m);

/ * Compute x|y using only calls to functions bis and bic */
int bool_or(int x, int y) {
	int result = bis(x, y);
	return result;
}

/ * Compute x^y using only calls to functions bis and bic */
int bool_xor(int x, int y) {
	int result = bis(bic(x, y), bic(y, x));
	return result;
}
```
## 2.14 
假设 x 和 y 的字节值分别是 0x66 和 0x39。填写下表，指明各个 C 表达式的字节值。

表达式 | 值 | 表达式 | 值
--- | --- | --- | ---|
x & y | 0x20 | x && y | 1
x \| y | 0x7F | x \|\| y | 1
~x \| ~y | 0xDF | !x \|\| ~y | 0
x & !y | 0x00 | x && ~y | 0

## 2.15
只使用位级和逻辑运算，编写一个 C 表达式，它等价于 x == y。换句话说，当 x 和 y 相等时它将返回 1，否则就返回 0。

!(x ^ y)

## 2.16 
填写下表，展示不同移位运算对单字节数的影响。思考移位运算的最好方式是使用二进制表示。将最初的值转换成为二进制，执行移位运算，然后再转换回十六进制。每个答案都应该是 8 个二进制数字或者 2 个十六进制数字。

x | x <<3 | x>>2 (逻辑的) | x >>2 (算术的)
---|---|---|---

十六进制 | 二进制 | 二进制 | 十六进制 | 二进制 | 十六进制 | 二进制 | 十六进制
---|---|---|---|---|---|---|---
0xC3 | 10110011 | 10011000 | 0x98 | 00101100 | 0x2C | 11101100 | 0xEC
0x75 | 01110101 | 10101000 | 0xA8 | 00011101 | 0x1D | 00011101 | 0x1D
0x87 | 10000001 | 00001000 | 0x08 | 00100000 | 0x20 | 11100000 | 0xE0
0x66 | 01100110 | 00110000 | 0x30 | 00011001 | 0x19 | 00011001 | 0x19

## 2.17
假设 w = 4， 我们鞥给每个可能的十六进制数字赋予一个数值，假设用一个无符号或者补码表示。请根据这些表示，通过写出等式（2.1）和等式（2.3）所示的求和公式中的2 的非零次幂，填写下表：

十六进制 | 二进制 | B2U(x) | B2T(x) 
---|---|---|---
0xE | [1110] | 2^3 + 2^2 + 2^1 = 14 | -2^3 + 2^2 + 2^1 = -2
0x0 | [0000] | 0 | 0
0x5 | [0101] | 2^2 + 2^0 = 5 | 2^2 + 2^0 = 5
0x8 | [1000] | 2^3 = 8 | -2^3  = -8
0xD | [1101] | 2^3 + 2^2 + 2^0 = 13 | -2^3 + 2^2 + 2^0 = -3
0xF | [1111] | 2^3 + 2^2 + 2^1 + 2^0 = 15 | -2^3 + 2^3 + 2^1 + 2^0 = -1

## 2.18 
在第 3章中，我们讲看到由反汇编器生成的列表，反汇编器是一种将可执行程序文件转换回可读性更好的 ASCII 码形式的程序。这些文件包含许多十六进制数字，都是用典型的补码形式来表示这些值。能够认识这些数字并理解它们的意义（例如他们是正数还是负数），是一项重要的技巧。
在下面的列表中，对于标号为 A~I（标记再右边）的哪些行，将指令名（sub、mov 和 add）右边显示的（32位补码形式表示的）十六进制值转换为等价的十进制值。

```
4004d0: 48 81 ec e0 02 00 00   sub $0x2e0, %rsp                A.
4004d7: 48 8b 44 24 a8         mov -0x58(%rsp), %rax           B.
4004dc: 48 03 47 28            add 0x28(%rdi), %rax            C.
4004e0: 48 89 44 24 d0         mov %rax, -0x30(%rsp)           D.
4004e5: 48 8b 44 24 78         mov 0x78(%rsp), %rax            E.
4004ea: 48 89 87 88 00 00 00   mov %rax, 0x88(%rdi)            F.
4004f1: 48 8b 84 24 f8 01 00   mov 0x1f8(%rsp), %rax           G.
4004f8: 00
4004f9: 48 03 44 24 08         add 0x8(%rsp), %rax             
4004fe: 48 89 84 24 c0 00 00   mov %rax, 0xc0(%rsp)            H.
400505: 00         
400506: 48 8b 44 d4 b8         mov -0x48(%rsp, %rdx, 8), %rax  I.
```

## 2.19 
利用你解答练习题 2.17 时填写的表哥，填写下列描述函数 T2U 的表格。

x | T2U(x)
---|---
-8 | 8
-3 | 13
-2 | 14
-1 | 15
0 | 0
5 | 5

## 2.20 
请说明等式（2.5）是如何应用到解答练习题2.19时生成的表格中的各项的。
T2Uw (x) = 			
x + 2^w; x < 0 
x; x >= 0 

## 2.21 
假设再采用补码运算的 32 位机器上对这些表达式求值，按照图 2-19 的格式填写下表，描述强制类型转换和关系运算的结果。

表达式 | 类型 | 求值
--- | --- | ---
-2147483647 - 1 == 2147483648U | 无符号 | 0
-2147483647 - 1 < 2147483647 | 有符号 | 1
-2147483647 - 1U < 2147483647 | 无符号 | 0
-2147483647 - 1 < -2147483647 | 有符号 | 1
-2147483647 -1U < -2147483647 | 无符号 | 1

## 2.22
通过应用等式（2.3），表明下面每个位向量都是 -5 的补码表示。

A. [1011] -2^3 + 2^1 + 2^0 = -5
B. [11011]  -2^4 + 2^3 + 2^1 + 2^0 = -5
C. [111011] -2^5 + 2^4 + 2^3 + 2^1 + 2^0 = -5

## 2.23
考虑下面的 C 函数：

```
int func1(unsigned word) {
	return (int) ((word << 24) >> 24);
}

int func2(unsigned word) {
	return ((int) word << 24) >> 24);
}
```
假设在一个采用补码运算的机器上以32位程序来执行这些函数。还假设有符号数值的右移是算术右移，而无符号数值的右移是逻辑右移。
A. 填写下表，说明这些函数对几个示例参数的结果。你会发现用十六进制表示来做会更方便，只要记住十六进制数字 8 到 F 的最高有效位等于 1。

w | func(w0 | func2(w)
--- | --- | ---
0x00000076 |0x00000076|0x00000076
0x87654321 |0x00000021|0x00000021
0x000000C9 |0x000000C9|0x000000C9
0xEDCBA987 |0x00000087|0xFFFFFF87

B. 用语言来描述这些函数执行的有用的计算。

## 2.24
假设将一个 4 位数值（用十六进制数字0~F表示）截断到一个 3 位数值（用十六进制数字 0~7表示）。填写下表，根据那些位模式的无符号和补码揭示，说明这种截断对某些情况的结果。

十六进制
原始值 | 截断值
---|---
0 | 0
2 | 2
9 | 1
B | 3
F | 7

无符号
原始值 | 截断值
---|---
0 | 0
2 | 2
9 | 1
11 | 3
15 | 7

补码
原始值 | 截断值
---|---
0 | 0
2 | 2
-7 | 1
-5 | 3
-1 | -1

## 2.25 
考虑下列代码，这段代码视图计算数组 a 中所有元素的和，其中元素的数量由参数 length 给出。

```
/ *WARNING: This is buggy code */
float sum_elements(float a[], unsigned length) {
	int i;
	float result = 0;
	
	for (i = 0; i <= length; i++) 
		result += a[i];
	return result
}
```
当参数 length 等于 0 时，运行这段代码应该返回 0.0。但实际上，运行时会遇到一个内存错误。请揭示为什么会发生这样的情况，并且说明如何修改代码。

解答：当 `length` 为 `0` 时，执行 `length - 1` 得到 `-1`，由于 `length` 是 `unsigned` 的，所以 -1 转成 `unsigned` 时变得很大，这超出了数组的范围。将条件 `i <= length - 1` 改成 `i < length`

## 2.26 
现在给你一个任务，写一个函数用来判定一个字符串是否比另一个更长。前提是你要用字符串库函数 strlen，它的声明如下：

```
/* Prototype for library function strlen */
size_t strlen(const char *s)；
```
最开始你写的函数是这样的：

```
/* Determine whether string s is longer than string t */
/* WARNING: This function is buggy */
int strlonger(char *s, char *t) {
	return strlen(s) - strlen(t) > 0;
}
```
当你再一些示例数据上测试这个函数时，一切似乎都是正确的。进一步研究发现在头文件 stdio.h 中数据类型 size_t 是定义成 unsigned int 的。
A. 在什么情况下，这个函数会产生不正确的结果。
B. 解释为什么会出现这样不正确的结果。
C. 说明如何修改这段代码好让它能可靠地工作。

解答：
A. 当 s 的长度为 0 而 t 的长度不为 0 时会产生不正确的结果。
B. 因为 0 减去一个正数得到的是一个负数，但是由于是 unsigned int 类型，负数就变成了一个很大的值，而且比 0 大，所以得到一个不正确的结果
C. strlen(s) > strlen(t) 

## 2.27
写出一个具有如下原型的函数：

```
/* Determine whether arguments can be added without overflow */
int uadd_ok(unsigned x, unsigned y);
```
如果参数 x 和 y 相加不会产生益处，这个函数就返回 1。

```
int uadd_ok(unsigned x, unsigned y)
{
	return x + y >= x
}
```

## 2.28 
我们能用一个十六进制数字来表示长度 w = 4 的位模式，对于这些数字的无符号解释，使用等式 （2.12）填写下表，给出所时数字的无符号加法逆元的位表示（用十六进制形式）。

x | x | -x |-x
--- | --- | --- | ---
十六进制 | 十进制 | 十进制 | 十六进制
0 | 0 | 0 | 0
5 | 5 | 11 | B
8 | 8 | 8 | 8
D | 13 | 3 | 3
F | 15 | 1 | 1

## 2.29
按照图2-25的形式填写下表。分别列出 5 位 参数的整数值、整数和与补码和的数值、补码和的位级表示，以及属于等式（2.13）推导中的哪种情况。

x | y | x + y | x + y （补码和的位级表示）| 情况
--- | --- | --- | --- | --- 
[10100] | [10001] | [100101] | [00101] | 1
[11000] | [11000] | [110000] | [10000] | 1
[10111] | [01000] | [111111] | [11111] | 2
[00010] | [00101] | [00111] | [00111] | 3
[01100] | [00100] | [10000] | [10000] | 4

## 2.30 
写出一个具有如下原型的函数：
```
/* Determine wether arguments can be added without overflow */
int tadd_ok(int x, int y);
```
如果参数 x 和 y 相加不会产生溢出，这个函数就返回 1。

```
int tadd_ok(int x, int y)
{
	 return (x > 0 && y > 0 && x + y <=0) || (x < 0 && y < 0 && x + y >=0)
}
```

## 2.31 
你的同事对你补码加法溢出条件的分析有些不耐烦了，他给出了一个函数 tadd_ok 的实现，如下所示：

```
/ * Determine whether arguments can be added without overflow */
/ * WARING: This code is buggy. */
int tadd_ok(int x, int y) {
	int sum = x + y;
	return (sum - x == y) && (sum - y == x);
}
```
你看了代码以后笑了。解释一下为什么。

## 2.32
你现在有个任务，编写函数 tsub_ok 的代码，函数的参数是 x 和 y，如果计算 x - y 不产生溢出，函数就返回 1。假设你写的练习题 2.30 的代码如下所示：

```
/* Determin wthether arguments can be subtracted without overlfow */
/* WARNING: This code is buggy. */
int tsub_ok(int x, int y) {
	return tadd_ok(x, -y);
}
```
x 和 y 取什么值时，这个函数会产生错误的结果？写一个该函数的正确版本。

## 2.33 
我们可以用一个十六进制数字来表示长度 w = 4 的位模式。根据这些数字的补码的揭示，填写下表，确定所示数字的加法逆元。

x | x | x 加法逆元 | x 加法逆元
--- | --- | --- | ---
十六进制 | 十进制 | 十进制 | 十六进制
0 | 0 | 0 | 0
5 | 5 | -5 | B
8 | 8 | -8 | 8
D | -3 | 3 | 3
F | -1 | 1 | 1

## 2.34
按照图 2-27 的风格填写下表，说明不同的 3 位数字乘法的结果。

模式 | x | y | x * y | 截断的 x*y
--- | --- | --- | --- | ---
无符号 | [100] | [101] | [10100] | [100] 
补码 | [100] | [101] | [10100] | [100] 
无符号 | [010] | [111] | [1110] | [110] 
补码 | [010] | [111] | [1110] | [110] 
无符号 | [110] | [110] | [1001011] | [011] 
补码 | [110] | [110] | [1001011] | [011] 

## 2.35 
给你一个任务，开发函数 tmult_ok 的代码，该函数会判断两个参数相乘是否会产生溢出。下面是你的解决方案：

```
/ * Determine whether arguments can be multiplied without overflow */
int tmult_ok(int x, int y) {
	int p = x * y;
	/* Either x is zero, or dividing p by x gives y */
	return !x || p/x == y;
}
```

## 2.36 
对于数据类型 int 为 32 位的情况，设计一个版本的 tmult_ok 函数（练习题2.35），使用 64 位精度的数据类型 int64_t，而不实用除法。

## 2.37
现在你有一个任务，当数据类型 int 和 size_t 都是 32 位的，修补上述旁注给出的 XDR 代码中的漏洞。你决定将待分配自己数设置为数据类型 uint64_t，来消除乘法益处的可能性。你把原来对 malloc 函数的调用（第 9 行）替换如下：
```
	uint64_t asize = ele_cnt * (uint64_t) ele_size;
	void *result = malloc(asize);
```
提醒一下，malloc 的参数类型是 size_t。
A. 这段代码对原始代码有了哪些改进？
B. 你该如何修改代码来消除这个漏洞？

## 2.38
就像我们将在第 3 章 中看到的那样，LEA 指令能够执行形如 (a<<k)+b 的计算，这里 k 等于 0、1、2 或 3，而 b 等于 0 或者某个程序值。编译器常常用这条指令来执行常数因子乘法。例如，我们可以用 (a<<1)+a 来计算 3*a。

考虑 b 等于 0 或者等于 a、k 为任意可能的值得情况，用一条 LEA 指令可以计算 a 的哪些倍数？

## 2.39
对于位位置 n 为最高有效位的情况，我们要怎样修改形式 B 的表达式？

## 2.40
对于下面每个 K 的值，找出只用指定数量的运算表达式 x * K 的方法，这里我们认为加法和减法的开销相当。除了我们已经考虑过的简单的形式 A 和 B 原则，你可能会需要使用一些技巧。

K | 移位 | 加法/减法 | 表达式 
--- | --- | --- | --- 
6 | 2 | 1 | A
31 | 1 | 1 | B
-6 | 2 | 1 | A
55 | 2 | 2 | 

## 2.41
对于一组从位位置 n 开始到位位置 m 的连续的 1 (n>=m)，我们看到可以产生两种形式的代码，A 和 B。编译器该如何决定使用哪一种呢？

## 2.42
写一个函数 div16，对于整数参数 x 返回 x/16 的值。你的函数不能使用除法、模运算、乘法、任何条件语句(if 或者 ?:)、任何比较运算符（例如<、>或==）或任何循环。你可以假设数据类型 int 是 32 位长，使用补码表示，而右移是算术右移。

## 2.43
在下面的代码中，我们省略了常熟 M 和 N 的定义：

```
	#deine M /* Mystery number 1 */
	#define N /* Mystery number 2 */
	int arith(int x, int y) {
		int result = 0;
		result = x*M + y/N; /* M and N are mystery numbers. */
		return result;
	}
```

我们以某个 M 和 N 的值编译这段代码。编译器用我们讨论过的方法优化乘法和除法。下面是将产生出的机器代码翻译回 C 语言的结果：

```
	/* Translation of assembly code for arith */
	int optarith(int x, int y) {
		int t = x;
		x <<=5;
		x -= t;
		if (y < 0) y += 7;
		y >>= 3; /* Arithmetic shift */
		return x+y;
	}
```

M 和 N 的值为多少？

## 2.44 
假设我们在对右符号使用补码运算的 32 位机器上的运行代码。对于有符号值使用的是算术右移，而对于无符号值使用的是逻辑右移。变量的声明和初始化如下：

```
	int x = foo(); /* Arbitrary value */
	int y = bar(); /* Arfbitrary value */

	unsigned ux = x;
	unisigned uy = y;
```
对于下面每个 C 表达式， 1） 证明对于所有的 x 和 y 的值，它都为真（等于1）；或者 2）给出使得它为假（等于0）的 x 和 y 的值：
A. (x > 0) || (x - 1 <0)
B. (x & 7) != 7 || (x<<29 <0)
C. (x * x) >=0
D. x < 0 || -x <= 0
E. x > 0 || -x >=0
F. x + y == ux + uy
G. x & ~y + uy*ux == -x

## 2.45 填写下表中的缺失的信息：

小数值 | 二进制表示 | 十进制表示 
--- | --- | ---  
1/8 | 0.001 | 0.125 
3/4 | 0.11 | 0.75 
25/16 |  | 1.5625 
43/16 | 10.1011 | 2.6875
9/8 | 1.001 | 1.125
47/8 | 101.111 | 5.875 
51/16 | 11.0011 | 3.1875

## 2.46 
浮点运算的不精确性能够产生灾难性的后果。1991 年 2 月 25 日，在第一次海湾战争期间，沙特阿拉伯的达摩地区设置的美国爱国者导弹，拦截伊拉克的飞毛腿导弹失败。飞毛腿导弹中了美国的一个兵营，造成 28 名士兵失望。美国总审计局（GAO）对失败原因做了详细的分析，并且确定底层的原因在于一个数字计算不准确。在这个练习中，你将重现总审计局分析的一部分。

爱国者导弹系统中含有一个内置的时钟，其实现类似一个计数器，每 0.1 秒就加 1.为了以秒为单位来确定时间，程序将用一个 24 位的近似于 1/10 的二进制小数值来乘以这个计数器的值。特别地，1/10 的二进制表达式是一个无穷序列0.000110011[0011]……，其中，方括号里的部分是无限重复的。程序用值 x 来近似地表示0.1，x 只考虑这个序列的二进制小数点右边的前 23位：x = 0.00011001100110011001100。（参考习题 2.51，里面有关于如何能够更精确地近似表示 0.1 的讨论。）
A. 0.1 - x 的二进制表示是什么？ 0.00000000000000000000000
B. 0.1 - x 的近似的十进制值是多少？0.00151064
C. 当系统初始启动时，时钟从 0 开始，并且一直保持计数。在这个例子中，系统已经运行了大约 100 个小时。程序计算出的时间和实际的时间之差为多少？5438.29261秒
D. 系统根据一枚来袭导弹的速率和它最后被雷达侦测到的时间，来预测它将在哪里出现。嘉定飞毛腿的速率大约是 2000 米每秒，对它的预测偏差了多少？10876585.2

通过一次读取时钟得到的绝对时间中的轻微错误，通常不会影响跟踪的计算。相反，它应该依赖于两次连续的读取之间的相对时间。问题是爱国者导弹的软件已经升级，可以使用更精确的函数来读取时间，但不是所有的函数调用都用新的代码替换了。结果就是，跟踪软件一次读取用的是精确地时间，而另一次读取用的是不精确的时间。















