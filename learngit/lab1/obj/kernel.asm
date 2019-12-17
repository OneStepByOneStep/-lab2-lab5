
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba a0 fd 10 00       	mov    $0x10fda0,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 ea 10 00 	movl   $0x10ea16,(%esp)
  100027:	e8 da 2d 00 00       	call   102e06 <memset>

    cons_init();                // init the console
  10002c:	e8 57 15 00 00       	call   101588 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 00 36 10 00 	movl   $0x103600,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 1c 36 10 00 	movl   $0x10361c,(%esp)
  100046:	e8 21 02 00 00       	call   10026c <cprintf>

    print_kerninfo();
  10004b:	e8 c2 08 00 00       	call   100912 <print_kerninfo>

    grade_backtrace();
  100050:	e8 8e 00 00 00       	call   1000e3 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 81 2a 00 00       	call   102adb <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 68 16 00 00       	call   1016c7 <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 ed 17 00 00       	call   101851 <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 00 0d 00 00       	call   100d69 <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 93 17 00 00       	call   101801 <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();
    lab1_switch_test();
  10006e:	e8 6b 01 00 00       	call   1001de <lab1_switch_test>
    /* do nothing */
    while (1);
  100073:	eb fe                	jmp    100073 <kern_init+0x73>

00100075 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100075:	55                   	push   %ebp
  100076:	89 e5                	mov    %esp,%ebp
  100078:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  10007b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100082:	00 
  100083:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10008a:	00 
  10008b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100092:	e8 c0 0c 00 00       	call   100d57 <mon_backtrace>
}
  100097:	90                   	nop
  100098:	c9                   	leave  
  100099:	c3                   	ret    

0010009a <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  10009a:	55                   	push   %ebp
  10009b:	89 e5                	mov    %esp,%ebp
  10009d:	53                   	push   %ebx
  10009e:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000a1:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  1000a4:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000a7:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1000ad:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000b1:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000b5:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000b9:	89 04 24             	mov    %eax,(%esp)
  1000bc:	e8 b4 ff ff ff       	call   100075 <grade_backtrace2>
}
  1000c1:	90                   	nop
  1000c2:	83 c4 14             	add    $0x14,%esp
  1000c5:	5b                   	pop    %ebx
  1000c6:	5d                   	pop    %ebp
  1000c7:	c3                   	ret    

001000c8 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c8:	55                   	push   %ebp
  1000c9:	89 e5                	mov    %esp,%ebp
  1000cb:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000ce:	8b 45 10             	mov    0x10(%ebp),%eax
  1000d1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d8:	89 04 24             	mov    %eax,(%esp)
  1000db:	e8 ba ff ff ff       	call   10009a <grade_backtrace1>
}
  1000e0:	90                   	nop
  1000e1:	c9                   	leave  
  1000e2:	c3                   	ret    

001000e3 <grade_backtrace>:

void
grade_backtrace(void) {
  1000e3:	55                   	push   %ebp
  1000e4:	89 e5                	mov    %esp,%ebp
  1000e6:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e9:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000ee:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000f5:	ff 
  1000f6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000fa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100101:	e8 c2 ff ff ff       	call   1000c8 <grade_backtrace0>
}
  100106:	90                   	nop
  100107:	c9                   	leave  
  100108:	c3                   	ret    

00100109 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100109:	55                   	push   %ebp
  10010a:	89 e5                	mov    %esp,%ebp
  10010c:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10010f:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100112:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100115:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100118:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  10011b:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011f:	83 e0 03             	and    $0x3,%eax
  100122:	89 c2                	mov    %eax,%edx
  100124:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100129:	89 54 24 08          	mov    %edx,0x8(%esp)
  10012d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100131:	c7 04 24 21 36 10 00 	movl   $0x103621,(%esp)
  100138:	e8 2f 01 00 00       	call   10026c <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  10013d:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100141:	89 c2                	mov    %eax,%edx
  100143:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100148:	89 54 24 08          	mov    %edx,0x8(%esp)
  10014c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100150:	c7 04 24 2f 36 10 00 	movl   $0x10362f,(%esp)
  100157:	e8 10 01 00 00       	call   10026c <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  10015c:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100160:	89 c2                	mov    %eax,%edx
  100162:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100167:	89 54 24 08          	mov    %edx,0x8(%esp)
  10016b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10016f:	c7 04 24 3d 36 10 00 	movl   $0x10363d,(%esp)
  100176:	e8 f1 00 00 00       	call   10026c <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10017b:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10017f:	89 c2                	mov    %eax,%edx
  100181:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100186:	89 54 24 08          	mov    %edx,0x8(%esp)
  10018a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10018e:	c7 04 24 4b 36 10 00 	movl   $0x10364b,(%esp)
  100195:	e8 d2 00 00 00       	call   10026c <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  10019a:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10019e:	89 c2                	mov    %eax,%edx
  1001a0:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001a5:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001ad:	c7 04 24 59 36 10 00 	movl   $0x103659,(%esp)
  1001b4:	e8 b3 00 00 00       	call   10026c <cprintf>
    round ++;
  1001b9:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001be:	40                   	inc    %eax
  1001bf:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001c4:	90                   	nop
  1001c5:	c9                   	leave  
  1001c6:	c3                   	ret    

001001c7 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001c7:	55                   	push   %ebp
  1001c8:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
    asm volatile (
  1001ca:	83 ec 08             	sub    $0x8,%esp
  1001cd:	cd 78                	int    $0x78
  1001cf:	89 ec                	mov    %ebp,%esp
	    "int %0 \n"
	    "movl %%ebp, %%esp"
	    : 
	    : "i"(T_SWITCH_TOU)
	);
}
  1001d1:	90                   	nop
  1001d2:	5d                   	pop    %ebp
  1001d3:	c3                   	ret    

001001d4 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001d4:	55                   	push   %ebp
  1001d5:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
    asm volatile (
  1001d7:	cd 79                	int    $0x79
  1001d9:	89 ec                	mov    %ebp,%esp
	    "int %0 \n"
	    "movl %%ebp, %%esp \n"
	    : 
	    : "i"(T_SWITCH_TOK)
	);
}
  1001db:	90                   	nop
  1001dc:	5d                   	pop    %ebp
  1001dd:	c3                   	ret    

001001de <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001de:	55                   	push   %ebp
  1001df:	89 e5                	mov    %esp,%ebp
  1001e1:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001e4:	e8 20 ff ff ff       	call   100109 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001e9:	c7 04 24 68 36 10 00 	movl   $0x103668,(%esp)
  1001f0:	e8 77 00 00 00       	call   10026c <cprintf>
    lab1_switch_to_user();
  1001f5:	e8 cd ff ff ff       	call   1001c7 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001fa:	e8 0a ff ff ff       	call   100109 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001ff:	c7 04 24 88 36 10 00 	movl   $0x103688,(%esp)
  100206:	e8 61 00 00 00       	call   10026c <cprintf>
    lab1_switch_to_kernel();
  10020b:	e8 c4 ff ff ff       	call   1001d4 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100210:	e8 f4 fe ff ff       	call   100109 <lab1_print_cur_status>
}
  100215:	90                   	nop
  100216:	c9                   	leave  
  100217:	c3                   	ret    

00100218 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100218:	55                   	push   %ebp
  100219:	89 e5                	mov    %esp,%ebp
  10021b:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  10021e:	8b 45 08             	mov    0x8(%ebp),%eax
  100221:	89 04 24             	mov    %eax,(%esp)
  100224:	e8 8c 13 00 00       	call   1015b5 <cons_putc>
    (*cnt) ++;
  100229:	8b 45 0c             	mov    0xc(%ebp),%eax
  10022c:	8b 00                	mov    (%eax),%eax
  10022e:	8d 50 01             	lea    0x1(%eax),%edx
  100231:	8b 45 0c             	mov    0xc(%ebp),%eax
  100234:	89 10                	mov    %edx,(%eax)
}
  100236:	90                   	nop
  100237:	c9                   	leave  
  100238:	c3                   	ret    

00100239 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  100239:	55                   	push   %ebp
  10023a:	89 e5                	mov    %esp,%ebp
  10023c:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  10023f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100246:	8b 45 0c             	mov    0xc(%ebp),%eax
  100249:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10024d:	8b 45 08             	mov    0x8(%ebp),%eax
  100250:	89 44 24 08          	mov    %eax,0x8(%esp)
  100254:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100257:	89 44 24 04          	mov    %eax,0x4(%esp)
  10025b:	c7 04 24 18 02 10 00 	movl   $0x100218,(%esp)
  100262:	e8 f2 2e 00 00       	call   103159 <vprintfmt>
    return cnt;
  100267:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10026a:	c9                   	leave  
  10026b:	c3                   	ret    

0010026c <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  10026c:	55                   	push   %ebp
  10026d:	89 e5                	mov    %esp,%ebp
  10026f:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100272:	8d 45 0c             	lea    0xc(%ebp),%eax
  100275:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100278:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10027b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10027f:	8b 45 08             	mov    0x8(%ebp),%eax
  100282:	89 04 24             	mov    %eax,(%esp)
  100285:	e8 af ff ff ff       	call   100239 <vcprintf>
  10028a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10028d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100290:	c9                   	leave  
  100291:	c3                   	ret    

00100292 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100292:	55                   	push   %ebp
  100293:	89 e5                	mov    %esp,%ebp
  100295:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100298:	8b 45 08             	mov    0x8(%ebp),%eax
  10029b:	89 04 24             	mov    %eax,(%esp)
  10029e:	e8 12 13 00 00       	call   1015b5 <cons_putc>
}
  1002a3:	90                   	nop
  1002a4:	c9                   	leave  
  1002a5:	c3                   	ret    

001002a6 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  1002a6:	55                   	push   %ebp
  1002a7:	89 e5                	mov    %esp,%ebp
  1002a9:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002ac:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  1002b3:	eb 13                	jmp    1002c8 <cputs+0x22>
        cputch(c, &cnt);
  1002b5:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  1002b9:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1002bc:	89 54 24 04          	mov    %edx,0x4(%esp)
  1002c0:	89 04 24             	mov    %eax,(%esp)
  1002c3:	e8 50 ff ff ff       	call   100218 <cputch>
    while ((c = *str ++) != '\0') {
  1002c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1002cb:	8d 50 01             	lea    0x1(%eax),%edx
  1002ce:	89 55 08             	mov    %edx,0x8(%ebp)
  1002d1:	0f b6 00             	movzbl (%eax),%eax
  1002d4:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002d7:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002db:	75 d8                	jne    1002b5 <cputs+0xf>
    }
    cputch('\n', &cnt);
  1002dd:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1002e0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1002e4:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  1002eb:	e8 28 ff ff ff       	call   100218 <cputch>
    return cnt;
  1002f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1002f3:	c9                   	leave  
  1002f4:	c3                   	ret    

001002f5 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1002f5:	55                   	push   %ebp
  1002f6:	89 e5                	mov    %esp,%ebp
  1002f8:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1002fb:	e8 df 12 00 00       	call   1015df <cons_getc>
  100300:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100303:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100307:	74 f2                	je     1002fb <getchar+0x6>
        /* do nothing */;
    return c;
  100309:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10030c:	c9                   	leave  
  10030d:	c3                   	ret    

0010030e <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  10030e:	55                   	push   %ebp
  10030f:	89 e5                	mov    %esp,%ebp
  100311:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100314:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100318:	74 13                	je     10032d <readline+0x1f>
        cprintf("%s", prompt);
  10031a:	8b 45 08             	mov    0x8(%ebp),%eax
  10031d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100321:	c7 04 24 a7 36 10 00 	movl   $0x1036a7,(%esp)
  100328:	e8 3f ff ff ff       	call   10026c <cprintf>
    }
    int i = 0, c;
  10032d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100334:	e8 bc ff ff ff       	call   1002f5 <getchar>
  100339:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  10033c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100340:	79 07                	jns    100349 <readline+0x3b>
            return NULL;
  100342:	b8 00 00 00 00       	mov    $0x0,%eax
  100347:	eb 78                	jmp    1003c1 <readline+0xb3>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100349:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10034d:	7e 28                	jle    100377 <readline+0x69>
  10034f:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100356:	7f 1f                	jg     100377 <readline+0x69>
            cputchar(c);
  100358:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10035b:	89 04 24             	mov    %eax,(%esp)
  10035e:	e8 2f ff ff ff       	call   100292 <cputchar>
            buf[i ++] = c;
  100363:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100366:	8d 50 01             	lea    0x1(%eax),%edx
  100369:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10036c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10036f:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  100375:	eb 45                	jmp    1003bc <readline+0xae>
        }
        else if (c == '\b' && i > 0) {
  100377:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  10037b:	75 16                	jne    100393 <readline+0x85>
  10037d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100381:	7e 10                	jle    100393 <readline+0x85>
            cputchar(c);
  100383:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100386:	89 04 24             	mov    %eax,(%esp)
  100389:	e8 04 ff ff ff       	call   100292 <cputchar>
            i --;
  10038e:	ff 4d f4             	decl   -0xc(%ebp)
  100391:	eb 29                	jmp    1003bc <readline+0xae>
        }
        else if (c == '\n' || c == '\r') {
  100393:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100397:	74 06                	je     10039f <readline+0x91>
  100399:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  10039d:	75 95                	jne    100334 <readline+0x26>
            cputchar(c);
  10039f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003a2:	89 04 24             	mov    %eax,(%esp)
  1003a5:	e8 e8 fe ff ff       	call   100292 <cputchar>
            buf[i] = '\0';
  1003aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003ad:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1003b2:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1003b5:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1003ba:	eb 05                	jmp    1003c1 <readline+0xb3>
        c = getchar();
  1003bc:	e9 73 ff ff ff       	jmp    100334 <readline+0x26>
        }
    }
}
  1003c1:	c9                   	leave  
  1003c2:	c3                   	ret    

001003c3 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003c3:	55                   	push   %ebp
  1003c4:	89 e5                	mov    %esp,%ebp
  1003c6:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  1003c9:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  1003ce:	85 c0                	test   %eax,%eax
  1003d0:	75 5b                	jne    10042d <__panic+0x6a>
        goto panic_dead;
    }
    is_panic = 1;
  1003d2:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  1003d9:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  1003dc:	8d 45 14             	lea    0x14(%ebp),%eax
  1003df:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  1003e2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003e5:	89 44 24 08          	mov    %eax,0x8(%esp)
  1003e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1003ec:	89 44 24 04          	mov    %eax,0x4(%esp)
  1003f0:	c7 04 24 aa 36 10 00 	movl   $0x1036aa,(%esp)
  1003f7:	e8 70 fe ff ff       	call   10026c <cprintf>
    vcprintf(fmt, ap);
  1003fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003ff:	89 44 24 04          	mov    %eax,0x4(%esp)
  100403:	8b 45 10             	mov    0x10(%ebp),%eax
  100406:	89 04 24             	mov    %eax,(%esp)
  100409:	e8 2b fe ff ff       	call   100239 <vcprintf>
    cprintf("\n");
  10040e:	c7 04 24 c6 36 10 00 	movl   $0x1036c6,(%esp)
  100415:	e8 52 fe ff ff       	call   10026c <cprintf>
    
    cprintf("stack trackback:\n");
  10041a:	c7 04 24 c8 36 10 00 	movl   $0x1036c8,(%esp)
  100421:	e8 46 fe ff ff       	call   10026c <cprintf>
    print_stackframe();
  100426:	e8 32 06 00 00       	call   100a5d <print_stackframe>
  10042b:	eb 01                	jmp    10042e <__panic+0x6b>
        goto panic_dead;
  10042d:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  10042e:	e8 d5 13 00 00       	call   101808 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100433:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10043a:	e8 4b 08 00 00       	call   100c8a <kmonitor>
  10043f:	eb f2                	jmp    100433 <__panic+0x70>

00100441 <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100441:	55                   	push   %ebp
  100442:	89 e5                	mov    %esp,%ebp
  100444:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100447:	8d 45 14             	lea    0x14(%ebp),%eax
  10044a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  10044d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100450:	89 44 24 08          	mov    %eax,0x8(%esp)
  100454:	8b 45 08             	mov    0x8(%ebp),%eax
  100457:	89 44 24 04          	mov    %eax,0x4(%esp)
  10045b:	c7 04 24 da 36 10 00 	movl   $0x1036da,(%esp)
  100462:	e8 05 fe ff ff       	call   10026c <cprintf>
    vcprintf(fmt, ap);
  100467:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10046a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10046e:	8b 45 10             	mov    0x10(%ebp),%eax
  100471:	89 04 24             	mov    %eax,(%esp)
  100474:	e8 c0 fd ff ff       	call   100239 <vcprintf>
    cprintf("\n");
  100479:	c7 04 24 c6 36 10 00 	movl   $0x1036c6,(%esp)
  100480:	e8 e7 fd ff ff       	call   10026c <cprintf>
    va_end(ap);
}
  100485:	90                   	nop
  100486:	c9                   	leave  
  100487:	c3                   	ret    

00100488 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100488:	55                   	push   %ebp
  100489:	89 e5                	mov    %esp,%ebp
    return is_panic;
  10048b:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100490:	5d                   	pop    %ebp
  100491:	c3                   	ret    

00100492 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  100492:	55                   	push   %ebp
  100493:	89 e5                	mov    %esp,%ebp
  100495:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  100498:	8b 45 0c             	mov    0xc(%ebp),%eax
  10049b:	8b 00                	mov    (%eax),%eax
  10049d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1004a0:	8b 45 10             	mov    0x10(%ebp),%eax
  1004a3:	8b 00                	mov    (%eax),%eax
  1004a5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1004a8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1004af:	e9 ca 00 00 00       	jmp    10057e <stab_binsearch+0xec>
        int true_m = (l + r) / 2, m = true_m;
  1004b4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1004ba:	01 d0                	add    %edx,%eax
  1004bc:	89 c2                	mov    %eax,%edx
  1004be:	c1 ea 1f             	shr    $0x1f,%edx
  1004c1:	01 d0                	add    %edx,%eax
  1004c3:	d1 f8                	sar    %eax
  1004c5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1004c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004cb:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1004ce:	eb 03                	jmp    1004d3 <stab_binsearch+0x41>
            m --;
  1004d0:	ff 4d f0             	decl   -0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  1004d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004d6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004d9:	7c 1f                	jl     1004fa <stab_binsearch+0x68>
  1004db:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004de:	89 d0                	mov    %edx,%eax
  1004e0:	01 c0                	add    %eax,%eax
  1004e2:	01 d0                	add    %edx,%eax
  1004e4:	c1 e0 02             	shl    $0x2,%eax
  1004e7:	89 c2                	mov    %eax,%edx
  1004e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1004ec:	01 d0                	add    %edx,%eax
  1004ee:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004f2:	0f b6 c0             	movzbl %al,%eax
  1004f5:	39 45 14             	cmp    %eax,0x14(%ebp)
  1004f8:	75 d6                	jne    1004d0 <stab_binsearch+0x3e>
        }
        if (m < l) {    // no match in [l, m]
  1004fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004fd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100500:	7d 09                	jge    10050b <stab_binsearch+0x79>
            l = true_m + 1;
  100502:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100505:	40                   	inc    %eax
  100506:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100509:	eb 73                	jmp    10057e <stab_binsearch+0xec>
        }

        // actual binary search
        any_matches = 1;
  10050b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100512:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100515:	89 d0                	mov    %edx,%eax
  100517:	01 c0                	add    %eax,%eax
  100519:	01 d0                	add    %edx,%eax
  10051b:	c1 e0 02             	shl    $0x2,%eax
  10051e:	89 c2                	mov    %eax,%edx
  100520:	8b 45 08             	mov    0x8(%ebp),%eax
  100523:	01 d0                	add    %edx,%eax
  100525:	8b 40 08             	mov    0x8(%eax),%eax
  100528:	39 45 18             	cmp    %eax,0x18(%ebp)
  10052b:	76 11                	jbe    10053e <stab_binsearch+0xac>
            *region_left = m;
  10052d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100530:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100533:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100535:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100538:	40                   	inc    %eax
  100539:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10053c:	eb 40                	jmp    10057e <stab_binsearch+0xec>
        } else if (stabs[m].n_value > addr) {
  10053e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100541:	89 d0                	mov    %edx,%eax
  100543:	01 c0                	add    %eax,%eax
  100545:	01 d0                	add    %edx,%eax
  100547:	c1 e0 02             	shl    $0x2,%eax
  10054a:	89 c2                	mov    %eax,%edx
  10054c:	8b 45 08             	mov    0x8(%ebp),%eax
  10054f:	01 d0                	add    %edx,%eax
  100551:	8b 40 08             	mov    0x8(%eax),%eax
  100554:	39 45 18             	cmp    %eax,0x18(%ebp)
  100557:	73 14                	jae    10056d <stab_binsearch+0xdb>
            *region_right = m - 1;
  100559:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10055c:	8d 50 ff             	lea    -0x1(%eax),%edx
  10055f:	8b 45 10             	mov    0x10(%ebp),%eax
  100562:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  100564:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100567:	48                   	dec    %eax
  100568:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10056b:	eb 11                	jmp    10057e <stab_binsearch+0xec>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  10056d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100570:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100573:	89 10                	mov    %edx,(%eax)
            l = m;
  100575:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100578:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  10057b:	ff 45 18             	incl   0x18(%ebp)
    while (l <= r) {
  10057e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100581:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100584:	0f 8e 2a ff ff ff    	jle    1004b4 <stab_binsearch+0x22>
        }
    }

    if (!any_matches) {
  10058a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10058e:	75 0f                	jne    10059f <stab_binsearch+0x10d>
        *region_right = *region_left - 1;
  100590:	8b 45 0c             	mov    0xc(%ebp),%eax
  100593:	8b 00                	mov    (%eax),%eax
  100595:	8d 50 ff             	lea    -0x1(%eax),%edx
  100598:	8b 45 10             	mov    0x10(%ebp),%eax
  10059b:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  10059d:	eb 3e                	jmp    1005dd <stab_binsearch+0x14b>
        l = *region_right;
  10059f:	8b 45 10             	mov    0x10(%ebp),%eax
  1005a2:	8b 00                	mov    (%eax),%eax
  1005a4:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1005a7:	eb 03                	jmp    1005ac <stab_binsearch+0x11a>
  1005a9:	ff 4d fc             	decl   -0x4(%ebp)
  1005ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005af:	8b 00                	mov    (%eax),%eax
  1005b1:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1005b4:	7e 1f                	jle    1005d5 <stab_binsearch+0x143>
  1005b6:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005b9:	89 d0                	mov    %edx,%eax
  1005bb:	01 c0                	add    %eax,%eax
  1005bd:	01 d0                	add    %edx,%eax
  1005bf:	c1 e0 02             	shl    $0x2,%eax
  1005c2:	89 c2                	mov    %eax,%edx
  1005c4:	8b 45 08             	mov    0x8(%ebp),%eax
  1005c7:	01 d0                	add    %edx,%eax
  1005c9:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1005cd:	0f b6 c0             	movzbl %al,%eax
  1005d0:	39 45 14             	cmp    %eax,0x14(%ebp)
  1005d3:	75 d4                	jne    1005a9 <stab_binsearch+0x117>
        *region_left = l;
  1005d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005db:	89 10                	mov    %edx,(%eax)
}
  1005dd:	90                   	nop
  1005de:	c9                   	leave  
  1005df:	c3                   	ret    

001005e0 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1005e0:	55                   	push   %ebp
  1005e1:	89 e5                	mov    %esp,%ebp
  1005e3:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  1005e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005e9:	c7 00 f8 36 10 00    	movl   $0x1036f8,(%eax)
    info->eip_line = 0;
  1005ef:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005f2:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  1005f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005fc:	c7 40 08 f8 36 10 00 	movl   $0x1036f8,0x8(%eax)
    info->eip_fn_namelen = 9;
  100603:	8b 45 0c             	mov    0xc(%ebp),%eax
  100606:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10060d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100610:	8b 55 08             	mov    0x8(%ebp),%edx
  100613:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100616:	8b 45 0c             	mov    0xc(%ebp),%eax
  100619:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100620:	c7 45 f4 4c 3f 10 00 	movl   $0x103f4c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100627:	c7 45 f0 10 bd 10 00 	movl   $0x10bd10,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10062e:	c7 45 ec 11 bd 10 00 	movl   $0x10bd11,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100635:	c7 45 e8 21 de 10 00 	movl   $0x10de21,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10063c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10063f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100642:	76 0b                	jbe    10064f <debuginfo_eip+0x6f>
  100644:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100647:	48                   	dec    %eax
  100648:	0f b6 00             	movzbl (%eax),%eax
  10064b:	84 c0                	test   %al,%al
  10064d:	74 0a                	je     100659 <debuginfo_eip+0x79>
        return -1;
  10064f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100654:	e9 b7 02 00 00       	jmp    100910 <debuginfo_eip+0x330>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100659:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100660:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100663:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100666:	29 c2                	sub    %eax,%edx
  100668:	89 d0                	mov    %edx,%eax
  10066a:	c1 f8 02             	sar    $0x2,%eax
  10066d:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  100673:	48                   	dec    %eax
  100674:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  100677:	8b 45 08             	mov    0x8(%ebp),%eax
  10067a:	89 44 24 10          	mov    %eax,0x10(%esp)
  10067e:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  100685:	00 
  100686:	8d 45 e0             	lea    -0x20(%ebp),%eax
  100689:	89 44 24 08          	mov    %eax,0x8(%esp)
  10068d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  100690:	89 44 24 04          	mov    %eax,0x4(%esp)
  100694:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100697:	89 04 24             	mov    %eax,(%esp)
  10069a:	e8 f3 fd ff ff       	call   100492 <stab_binsearch>
    if (lfile == 0)
  10069f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a2:	85 c0                	test   %eax,%eax
  1006a4:	75 0a                	jne    1006b0 <debuginfo_eip+0xd0>
        return -1;
  1006a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006ab:	e9 60 02 00 00       	jmp    100910 <debuginfo_eip+0x330>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1006b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006b3:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1006b6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006b9:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1006bc:	8b 45 08             	mov    0x8(%ebp),%eax
  1006bf:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006c3:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1006ca:	00 
  1006cb:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1006ce:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006d2:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1006d5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006dc:	89 04 24             	mov    %eax,(%esp)
  1006df:	e8 ae fd ff ff       	call   100492 <stab_binsearch>

    if (lfun <= rfun) {
  1006e4:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1006e7:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1006ea:	39 c2                	cmp    %eax,%edx
  1006ec:	7f 7c                	jg     10076a <debuginfo_eip+0x18a>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  1006ee:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006f1:	89 c2                	mov    %eax,%edx
  1006f3:	89 d0                	mov    %edx,%eax
  1006f5:	01 c0                	add    %eax,%eax
  1006f7:	01 d0                	add    %edx,%eax
  1006f9:	c1 e0 02             	shl    $0x2,%eax
  1006fc:	89 c2                	mov    %eax,%edx
  1006fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100701:	01 d0                	add    %edx,%eax
  100703:	8b 00                	mov    (%eax),%eax
  100705:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100708:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10070b:	29 d1                	sub    %edx,%ecx
  10070d:	89 ca                	mov    %ecx,%edx
  10070f:	39 d0                	cmp    %edx,%eax
  100711:	73 22                	jae    100735 <debuginfo_eip+0x155>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100713:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100716:	89 c2                	mov    %eax,%edx
  100718:	89 d0                	mov    %edx,%eax
  10071a:	01 c0                	add    %eax,%eax
  10071c:	01 d0                	add    %edx,%eax
  10071e:	c1 e0 02             	shl    $0x2,%eax
  100721:	89 c2                	mov    %eax,%edx
  100723:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100726:	01 d0                	add    %edx,%eax
  100728:	8b 10                	mov    (%eax),%edx
  10072a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10072d:	01 c2                	add    %eax,%edx
  10072f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100732:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100735:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100738:	89 c2                	mov    %eax,%edx
  10073a:	89 d0                	mov    %edx,%eax
  10073c:	01 c0                	add    %eax,%eax
  10073e:	01 d0                	add    %edx,%eax
  100740:	c1 e0 02             	shl    $0x2,%eax
  100743:	89 c2                	mov    %eax,%edx
  100745:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100748:	01 d0                	add    %edx,%eax
  10074a:	8b 50 08             	mov    0x8(%eax),%edx
  10074d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100750:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100753:	8b 45 0c             	mov    0xc(%ebp),%eax
  100756:	8b 40 10             	mov    0x10(%eax),%eax
  100759:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  10075c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10075f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100762:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100765:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100768:	eb 15                	jmp    10077f <debuginfo_eip+0x19f>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  10076a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10076d:	8b 55 08             	mov    0x8(%ebp),%edx
  100770:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  100773:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100776:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  100779:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10077c:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  10077f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100782:	8b 40 08             	mov    0x8(%eax),%eax
  100785:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  10078c:	00 
  10078d:	89 04 24             	mov    %eax,(%esp)
  100790:	e8 ed 24 00 00       	call   102c82 <strfind>
  100795:	89 c2                	mov    %eax,%edx
  100797:	8b 45 0c             	mov    0xc(%ebp),%eax
  10079a:	8b 40 08             	mov    0x8(%eax),%eax
  10079d:	29 c2                	sub    %eax,%edx
  10079f:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007a2:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1007a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1007a8:	89 44 24 10          	mov    %eax,0x10(%esp)
  1007ac:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1007b3:	00 
  1007b4:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1007b7:	89 44 24 08          	mov    %eax,0x8(%esp)
  1007bb:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1007be:	89 44 24 04          	mov    %eax,0x4(%esp)
  1007c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007c5:	89 04 24             	mov    %eax,(%esp)
  1007c8:	e8 c5 fc ff ff       	call   100492 <stab_binsearch>
    if (lline <= rline) {
  1007cd:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007d3:	39 c2                	cmp    %eax,%edx
  1007d5:	7f 23                	jg     1007fa <debuginfo_eip+0x21a>
        info->eip_line = stabs[rline].n_desc;
  1007d7:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007da:	89 c2                	mov    %eax,%edx
  1007dc:	89 d0                	mov    %edx,%eax
  1007de:	01 c0                	add    %eax,%eax
  1007e0:	01 d0                	add    %edx,%eax
  1007e2:	c1 e0 02             	shl    $0x2,%eax
  1007e5:	89 c2                	mov    %eax,%edx
  1007e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007ea:	01 d0                	add    %edx,%eax
  1007ec:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  1007f0:	89 c2                	mov    %eax,%edx
  1007f2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007f5:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007f8:	eb 11                	jmp    10080b <debuginfo_eip+0x22b>
        return -1;
  1007fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007ff:	e9 0c 01 00 00       	jmp    100910 <debuginfo_eip+0x330>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100804:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100807:	48                   	dec    %eax
  100808:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  10080b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10080e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100811:	39 c2                	cmp    %eax,%edx
  100813:	7c 56                	jl     10086b <debuginfo_eip+0x28b>
           && stabs[lline].n_type != N_SOL
  100815:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100818:	89 c2                	mov    %eax,%edx
  10081a:	89 d0                	mov    %edx,%eax
  10081c:	01 c0                	add    %eax,%eax
  10081e:	01 d0                	add    %edx,%eax
  100820:	c1 e0 02             	shl    $0x2,%eax
  100823:	89 c2                	mov    %eax,%edx
  100825:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100828:	01 d0                	add    %edx,%eax
  10082a:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10082e:	3c 84                	cmp    $0x84,%al
  100830:	74 39                	je     10086b <debuginfo_eip+0x28b>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100832:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100835:	89 c2                	mov    %eax,%edx
  100837:	89 d0                	mov    %edx,%eax
  100839:	01 c0                	add    %eax,%eax
  10083b:	01 d0                	add    %edx,%eax
  10083d:	c1 e0 02             	shl    $0x2,%eax
  100840:	89 c2                	mov    %eax,%edx
  100842:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100845:	01 d0                	add    %edx,%eax
  100847:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10084b:	3c 64                	cmp    $0x64,%al
  10084d:	75 b5                	jne    100804 <debuginfo_eip+0x224>
  10084f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100852:	89 c2                	mov    %eax,%edx
  100854:	89 d0                	mov    %edx,%eax
  100856:	01 c0                	add    %eax,%eax
  100858:	01 d0                	add    %edx,%eax
  10085a:	c1 e0 02             	shl    $0x2,%eax
  10085d:	89 c2                	mov    %eax,%edx
  10085f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100862:	01 d0                	add    %edx,%eax
  100864:	8b 40 08             	mov    0x8(%eax),%eax
  100867:	85 c0                	test   %eax,%eax
  100869:	74 99                	je     100804 <debuginfo_eip+0x224>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10086b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10086e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100871:	39 c2                	cmp    %eax,%edx
  100873:	7c 46                	jl     1008bb <debuginfo_eip+0x2db>
  100875:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100878:	89 c2                	mov    %eax,%edx
  10087a:	89 d0                	mov    %edx,%eax
  10087c:	01 c0                	add    %eax,%eax
  10087e:	01 d0                	add    %edx,%eax
  100880:	c1 e0 02             	shl    $0x2,%eax
  100883:	89 c2                	mov    %eax,%edx
  100885:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100888:	01 d0                	add    %edx,%eax
  10088a:	8b 00                	mov    (%eax),%eax
  10088c:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  10088f:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100892:	29 d1                	sub    %edx,%ecx
  100894:	89 ca                	mov    %ecx,%edx
  100896:	39 d0                	cmp    %edx,%eax
  100898:	73 21                	jae    1008bb <debuginfo_eip+0x2db>
        info->eip_file = stabstr + stabs[lline].n_strx;
  10089a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10089d:	89 c2                	mov    %eax,%edx
  10089f:	89 d0                	mov    %edx,%eax
  1008a1:	01 c0                	add    %eax,%eax
  1008a3:	01 d0                	add    %edx,%eax
  1008a5:	c1 e0 02             	shl    $0x2,%eax
  1008a8:	89 c2                	mov    %eax,%edx
  1008aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008ad:	01 d0                	add    %edx,%eax
  1008af:	8b 10                	mov    (%eax),%edx
  1008b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1008b4:	01 c2                	add    %eax,%edx
  1008b6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008b9:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1008bb:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1008be:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1008c1:	39 c2                	cmp    %eax,%edx
  1008c3:	7d 46                	jge    10090b <debuginfo_eip+0x32b>
        for (lline = lfun + 1;
  1008c5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1008c8:	40                   	inc    %eax
  1008c9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1008cc:	eb 16                	jmp    1008e4 <debuginfo_eip+0x304>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1008ce:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008d1:	8b 40 14             	mov    0x14(%eax),%eax
  1008d4:	8d 50 01             	lea    0x1(%eax),%edx
  1008d7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008da:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  1008dd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008e0:	40                   	inc    %eax
  1008e1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008e4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008e7:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  1008ea:	39 c2                	cmp    %eax,%edx
  1008ec:	7d 1d                	jge    10090b <debuginfo_eip+0x32b>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008ee:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008f1:	89 c2                	mov    %eax,%edx
  1008f3:	89 d0                	mov    %edx,%eax
  1008f5:	01 c0                	add    %eax,%eax
  1008f7:	01 d0                	add    %edx,%eax
  1008f9:	c1 e0 02             	shl    $0x2,%eax
  1008fc:	89 c2                	mov    %eax,%edx
  1008fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100901:	01 d0                	add    %edx,%eax
  100903:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100907:	3c a0                	cmp    $0xa0,%al
  100909:	74 c3                	je     1008ce <debuginfo_eip+0x2ee>
        }
    }
    return 0;
  10090b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100910:	c9                   	leave  
  100911:	c3                   	ret    

00100912 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100912:	55                   	push   %ebp
  100913:	89 e5                	mov    %esp,%ebp
  100915:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100918:	c7 04 24 02 37 10 00 	movl   $0x103702,(%esp)
  10091f:	e8 48 f9 ff ff       	call   10026c <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100924:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10092b:	00 
  10092c:	c7 04 24 1b 37 10 00 	movl   $0x10371b,(%esp)
  100933:	e8 34 f9 ff ff       	call   10026c <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100938:	c7 44 24 04 00 36 10 	movl   $0x103600,0x4(%esp)
  10093f:	00 
  100940:	c7 04 24 33 37 10 00 	movl   $0x103733,(%esp)
  100947:	e8 20 f9 ff ff       	call   10026c <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  10094c:	c7 44 24 04 16 ea 10 	movl   $0x10ea16,0x4(%esp)
  100953:	00 
  100954:	c7 04 24 4b 37 10 00 	movl   $0x10374b,(%esp)
  10095b:	e8 0c f9 ff ff       	call   10026c <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100960:	c7 44 24 04 a0 fd 10 	movl   $0x10fda0,0x4(%esp)
  100967:	00 
  100968:	c7 04 24 63 37 10 00 	movl   $0x103763,(%esp)
  10096f:	e8 f8 f8 ff ff       	call   10026c <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100974:	b8 a0 fd 10 00       	mov    $0x10fda0,%eax
  100979:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10097f:	b8 00 00 10 00       	mov    $0x100000,%eax
  100984:	29 c2                	sub    %eax,%edx
  100986:	89 d0                	mov    %edx,%eax
  100988:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10098e:	85 c0                	test   %eax,%eax
  100990:	0f 48 c2             	cmovs  %edx,%eax
  100993:	c1 f8 0a             	sar    $0xa,%eax
  100996:	89 44 24 04          	mov    %eax,0x4(%esp)
  10099a:	c7 04 24 7c 37 10 00 	movl   $0x10377c,(%esp)
  1009a1:	e8 c6 f8 ff ff       	call   10026c <cprintf>
}
  1009a6:	90                   	nop
  1009a7:	c9                   	leave  
  1009a8:	c3                   	ret    

001009a9 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1009a9:	55                   	push   %ebp
  1009aa:	89 e5                	mov    %esp,%ebp
  1009ac:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1009b2:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1009b5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1009bc:	89 04 24             	mov    %eax,(%esp)
  1009bf:	e8 1c fc ff ff       	call   1005e0 <debuginfo_eip>
  1009c4:	85 c0                	test   %eax,%eax
  1009c6:	74 15                	je     1009dd <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1009c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1009cb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009cf:	c7 04 24 a6 37 10 00 	movl   $0x1037a6,(%esp)
  1009d6:	e8 91 f8 ff ff       	call   10026c <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  1009db:	eb 6c                	jmp    100a49 <print_debuginfo+0xa0>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009dd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1009e4:	eb 1b                	jmp    100a01 <print_debuginfo+0x58>
            fnname[j] = info.eip_fn_name[j];
  1009e6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1009e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009ec:	01 d0                	add    %edx,%eax
  1009ee:	0f b6 00             	movzbl (%eax),%eax
  1009f1:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009f7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009fa:	01 ca                	add    %ecx,%edx
  1009fc:	88 02                	mov    %al,(%edx)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009fe:	ff 45 f4             	incl   -0xc(%ebp)
  100a01:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a04:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100a07:	7c dd                	jl     1009e6 <print_debuginfo+0x3d>
        fnname[j] = '\0';
  100a09:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100a0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a12:	01 d0                	add    %edx,%eax
  100a14:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100a17:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100a1a:	8b 55 08             	mov    0x8(%ebp),%edx
  100a1d:	89 d1                	mov    %edx,%ecx
  100a1f:	29 c1                	sub    %eax,%ecx
  100a21:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100a24:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a27:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100a2b:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a31:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100a35:	89 54 24 08          	mov    %edx,0x8(%esp)
  100a39:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a3d:	c7 04 24 c2 37 10 00 	movl   $0x1037c2,(%esp)
  100a44:	e8 23 f8 ff ff       	call   10026c <cprintf>
}
  100a49:	90                   	nop
  100a4a:	c9                   	leave  
  100a4b:	c3                   	ret    

00100a4c <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a4c:	55                   	push   %ebp
  100a4d:	89 e5                	mov    %esp,%ebp
  100a4f:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a52:	8b 45 04             	mov    0x4(%ebp),%eax
  100a55:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a58:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a5b:	c9                   	leave  
  100a5c:	c3                   	ret    

00100a5d <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a5d:	55                   	push   %ebp
  100a5e:	89 e5                	mov    %esp,%ebp
  100a60:	53                   	push   %ebx
  100a61:	83 ec 44             	sub    $0x44,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100a64:	89 e8                	mov    %ebp,%eax
  100a66:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    return ebp;
  100a69:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
	uint32_t ebps = read_ebp();
  100a6c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	uint32_t eips = read_eip();
  100a6f:	e8 d8 ff ff ff       	call   100a4c <read_eip>
  100a74:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (int i = 0; i<STACKFRAME_DEPTH; i++)
  100a77:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100a7e:	e9 8a 00 00 00       	jmp    100b0d <print_stackframe+0xb0>
	{
		cprintf("ebps:0x%08x eips:0x%08x", ebps, eips);
  100a83:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a86:	89 44 24 08          	mov    %eax,0x8(%esp)
  100a8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a8d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a91:	c7 04 24 d4 37 10 00 	movl   $0x1037d4,(%esp)
  100a98:	e8 cf f7 ff ff       	call   10026c <cprintf>
		uint32_t *arguments = ebps + 2;
  100a9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100aa0:	83 c0 02             	add    $0x2,%eax
  100aa3:	89 45 e8             	mov    %eax,-0x18(%ebp)
		cprintf("arguments:0x%08x, 0x%08x, 0x%08x, 0x%08x", *arguments,*(arguments+1), *(arguments+2), *(arguments+3));
  100aa6:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100aa9:	83 c0 0c             	add    $0xc,%eax
  100aac:	8b 18                	mov    (%eax),%ebx
  100aae:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100ab1:	83 c0 08             	add    $0x8,%eax
  100ab4:	8b 08                	mov    (%eax),%ecx
  100ab6:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100ab9:	83 c0 04             	add    $0x4,%eax
  100abc:	8b 10                	mov    (%eax),%edx
  100abe:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100ac1:	8b 00                	mov    (%eax),%eax
  100ac3:	89 5c 24 10          	mov    %ebx,0x10(%esp)
  100ac7:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100acb:	89 54 24 08          	mov    %edx,0x8(%esp)
  100acf:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ad3:	c7 04 24 ec 37 10 00 	movl   $0x1037ec,(%esp)
  100ada:	e8 8d f7 ff ff       	call   10026c <cprintf>
		cprintf("\n");
  100adf:	c7 04 24 15 38 10 00 	movl   $0x103815,(%esp)
  100ae6:	e8 81 f7 ff ff       	call   10026c <cprintf>
		print_debuginfo(eips - 1);
  100aeb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100aee:	48                   	dec    %eax
  100aef:	89 04 24             	mov    %eax,(%esp)
  100af2:	e8 b2 fe ff ff       	call   1009a9 <print_debuginfo>
		eips = ((uint32_t *)ebps)[1];
  100af7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100afa:	83 c0 04             	add    $0x4,%eax
  100afd:	8b 00                	mov    (%eax),%eax
  100aff:	89 45 f0             	mov    %eax,-0x10(%ebp)
                ebps = ((uint32_t *)ebps)[0];
  100b02:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b05:	8b 00                	mov    (%eax),%eax
  100b07:	89 45 f4             	mov    %eax,-0xc(%ebp)
	for (int i = 0; i<STACKFRAME_DEPTH; i++)
  100b0a:	ff 45 ec             	incl   -0x14(%ebp)
  100b0d:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100b11:	0f 8e 6c ff ff ff    	jle    100a83 <print_stackframe+0x26>

	}

}
  100b17:	90                   	nop
  100b18:	83 c4 44             	add    $0x44,%esp
  100b1b:	5b                   	pop    %ebx
  100b1c:	5d                   	pop    %ebp
  100b1d:	c3                   	ret    

00100b1e <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100b1e:	55                   	push   %ebp
  100b1f:	89 e5                	mov    %esp,%ebp
  100b21:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100b24:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b2b:	eb 0c                	jmp    100b39 <parse+0x1b>
            *buf ++ = '\0';
  100b2d:	8b 45 08             	mov    0x8(%ebp),%eax
  100b30:	8d 50 01             	lea    0x1(%eax),%edx
  100b33:	89 55 08             	mov    %edx,0x8(%ebp)
  100b36:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b39:	8b 45 08             	mov    0x8(%ebp),%eax
  100b3c:	0f b6 00             	movzbl (%eax),%eax
  100b3f:	84 c0                	test   %al,%al
  100b41:	74 1d                	je     100b60 <parse+0x42>
  100b43:	8b 45 08             	mov    0x8(%ebp),%eax
  100b46:	0f b6 00             	movzbl (%eax),%eax
  100b49:	0f be c0             	movsbl %al,%eax
  100b4c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b50:	c7 04 24 98 38 10 00 	movl   $0x103898,(%esp)
  100b57:	e8 f4 20 00 00       	call   102c50 <strchr>
  100b5c:	85 c0                	test   %eax,%eax
  100b5e:	75 cd                	jne    100b2d <parse+0xf>
        }
        if (*buf == '\0') {
  100b60:	8b 45 08             	mov    0x8(%ebp),%eax
  100b63:	0f b6 00             	movzbl (%eax),%eax
  100b66:	84 c0                	test   %al,%al
  100b68:	74 65                	je     100bcf <parse+0xb1>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100b6a:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100b6e:	75 14                	jne    100b84 <parse+0x66>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100b70:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100b77:	00 
  100b78:	c7 04 24 9d 38 10 00 	movl   $0x10389d,(%esp)
  100b7f:	e8 e8 f6 ff ff       	call   10026c <cprintf>
        }
        argv[argc ++] = buf;
  100b84:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b87:	8d 50 01             	lea    0x1(%eax),%edx
  100b8a:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100b8d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100b94:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b97:	01 c2                	add    %eax,%edx
  100b99:	8b 45 08             	mov    0x8(%ebp),%eax
  100b9c:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b9e:	eb 03                	jmp    100ba3 <parse+0x85>
            buf ++;
  100ba0:	ff 45 08             	incl   0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ba3:	8b 45 08             	mov    0x8(%ebp),%eax
  100ba6:	0f b6 00             	movzbl (%eax),%eax
  100ba9:	84 c0                	test   %al,%al
  100bab:	74 8c                	je     100b39 <parse+0x1b>
  100bad:	8b 45 08             	mov    0x8(%ebp),%eax
  100bb0:	0f b6 00             	movzbl (%eax),%eax
  100bb3:	0f be c0             	movsbl %al,%eax
  100bb6:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bba:	c7 04 24 98 38 10 00 	movl   $0x103898,(%esp)
  100bc1:	e8 8a 20 00 00       	call   102c50 <strchr>
  100bc6:	85 c0                	test   %eax,%eax
  100bc8:	74 d6                	je     100ba0 <parse+0x82>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100bca:	e9 6a ff ff ff       	jmp    100b39 <parse+0x1b>
            break;
  100bcf:	90                   	nop
        }
    }
    return argc;
  100bd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100bd3:	c9                   	leave  
  100bd4:	c3                   	ret    

00100bd5 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100bd5:	55                   	push   %ebp
  100bd6:	89 e5                	mov    %esp,%ebp
  100bd8:	53                   	push   %ebx
  100bd9:	83 ec 64             	sub    $0x64,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100bdc:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100bdf:	89 44 24 04          	mov    %eax,0x4(%esp)
  100be3:	8b 45 08             	mov    0x8(%ebp),%eax
  100be6:	89 04 24             	mov    %eax,(%esp)
  100be9:	e8 30 ff ff ff       	call   100b1e <parse>
  100bee:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100bf1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100bf5:	75 0a                	jne    100c01 <runcmd+0x2c>
        return 0;
  100bf7:	b8 00 00 00 00       	mov    $0x0,%eax
  100bfc:	e9 83 00 00 00       	jmp    100c84 <runcmd+0xaf>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c01:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c08:	eb 5a                	jmp    100c64 <runcmd+0x8f>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100c0a:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100c0d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c10:	89 d0                	mov    %edx,%eax
  100c12:	01 c0                	add    %eax,%eax
  100c14:	01 d0                	add    %edx,%eax
  100c16:	c1 e0 02             	shl    $0x2,%eax
  100c19:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c1e:	8b 00                	mov    (%eax),%eax
  100c20:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100c24:	89 04 24             	mov    %eax,(%esp)
  100c27:	e8 87 1f 00 00       	call   102bb3 <strcmp>
  100c2c:	85 c0                	test   %eax,%eax
  100c2e:	75 31                	jne    100c61 <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100c30:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c33:	89 d0                	mov    %edx,%eax
  100c35:	01 c0                	add    %eax,%eax
  100c37:	01 d0                	add    %edx,%eax
  100c39:	c1 e0 02             	shl    $0x2,%eax
  100c3c:	05 08 e0 10 00       	add    $0x10e008,%eax
  100c41:	8b 10                	mov    (%eax),%edx
  100c43:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c46:	83 c0 04             	add    $0x4,%eax
  100c49:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100c4c:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100c4f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100c52:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c56:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c5a:	89 1c 24             	mov    %ebx,(%esp)
  100c5d:	ff d2                	call   *%edx
  100c5f:	eb 23                	jmp    100c84 <runcmd+0xaf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100c61:	ff 45 f4             	incl   -0xc(%ebp)
  100c64:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c67:	83 f8 02             	cmp    $0x2,%eax
  100c6a:	76 9e                	jbe    100c0a <runcmd+0x35>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100c6c:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100c6f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c73:	c7 04 24 bb 38 10 00 	movl   $0x1038bb,(%esp)
  100c7a:	e8 ed f5 ff ff       	call   10026c <cprintf>
    return 0;
  100c7f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c84:	83 c4 64             	add    $0x64,%esp
  100c87:	5b                   	pop    %ebx
  100c88:	5d                   	pop    %ebp
  100c89:	c3                   	ret    

00100c8a <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100c8a:	55                   	push   %ebp
  100c8b:	89 e5                	mov    %esp,%ebp
  100c8d:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100c90:	c7 04 24 d4 38 10 00 	movl   $0x1038d4,(%esp)
  100c97:	e8 d0 f5 ff ff       	call   10026c <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100c9c:	c7 04 24 fc 38 10 00 	movl   $0x1038fc,(%esp)
  100ca3:	e8 c4 f5 ff ff       	call   10026c <cprintf>

    if (tf != NULL) {
  100ca8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100cac:	74 0b                	je     100cb9 <kmonitor+0x2f>
        print_trapframe(tf);
  100cae:	8b 45 08             	mov    0x8(%ebp),%eax
  100cb1:	89 04 24             	mov    %eax,(%esp)
  100cb4:	e8 4e 0d 00 00       	call   101a07 <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100cb9:	c7 04 24 21 39 10 00 	movl   $0x103921,(%esp)
  100cc0:	e8 49 f6 ff ff       	call   10030e <readline>
  100cc5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100cc8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100ccc:	74 eb                	je     100cb9 <kmonitor+0x2f>
            if (runcmd(buf, tf) < 0) {
  100cce:	8b 45 08             	mov    0x8(%ebp),%eax
  100cd1:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cd8:	89 04 24             	mov    %eax,(%esp)
  100cdb:	e8 f5 fe ff ff       	call   100bd5 <runcmd>
  100ce0:	85 c0                	test   %eax,%eax
  100ce2:	78 02                	js     100ce6 <kmonitor+0x5c>
        if ((buf = readline("K> ")) != NULL) {
  100ce4:	eb d3                	jmp    100cb9 <kmonitor+0x2f>
                break;
  100ce6:	90                   	nop
            }
        }
    }
}
  100ce7:	90                   	nop
  100ce8:	c9                   	leave  
  100ce9:	c3                   	ret    

00100cea <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100cea:	55                   	push   %ebp
  100ceb:	89 e5                	mov    %esp,%ebp
  100ced:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100cf0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100cf7:	eb 3d                	jmp    100d36 <mon_help+0x4c>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100cf9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100cfc:	89 d0                	mov    %edx,%eax
  100cfe:	01 c0                	add    %eax,%eax
  100d00:	01 d0                	add    %edx,%eax
  100d02:	c1 e0 02             	shl    $0x2,%eax
  100d05:	05 04 e0 10 00       	add    $0x10e004,%eax
  100d0a:	8b 08                	mov    (%eax),%ecx
  100d0c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d0f:	89 d0                	mov    %edx,%eax
  100d11:	01 c0                	add    %eax,%eax
  100d13:	01 d0                	add    %edx,%eax
  100d15:	c1 e0 02             	shl    $0x2,%eax
  100d18:	05 00 e0 10 00       	add    $0x10e000,%eax
  100d1d:	8b 00                	mov    (%eax),%eax
  100d1f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100d23:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d27:	c7 04 24 25 39 10 00 	movl   $0x103925,(%esp)
  100d2e:	e8 39 f5 ff ff       	call   10026c <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100d33:	ff 45 f4             	incl   -0xc(%ebp)
  100d36:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d39:	83 f8 02             	cmp    $0x2,%eax
  100d3c:	76 bb                	jbe    100cf9 <mon_help+0xf>
    }
    return 0;
  100d3e:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d43:	c9                   	leave  
  100d44:	c3                   	ret    

00100d45 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d45:	55                   	push   %ebp
  100d46:	89 e5                	mov    %esp,%ebp
  100d48:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100d4b:	e8 c2 fb ff ff       	call   100912 <print_kerninfo>
    return 0;
  100d50:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d55:	c9                   	leave  
  100d56:	c3                   	ret    

00100d57 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100d57:	55                   	push   %ebp
  100d58:	89 e5                	mov    %esp,%ebp
  100d5a:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100d5d:	e8 fb fc ff ff       	call   100a5d <print_stackframe>
    return 0;
  100d62:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d67:	c9                   	leave  
  100d68:	c3                   	ret    

00100d69 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d69:	55                   	push   %ebp
  100d6a:	89 e5                	mov    %esp,%ebp
  100d6c:	83 ec 28             	sub    $0x28,%esp
  100d6f:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100d75:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d79:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d7d:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100d81:	ee                   	out    %al,(%dx)
  100d82:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d88:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100d8c:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d90:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d94:	ee                   	out    %al,(%dx)
  100d95:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100d9b:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
  100d9f:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100da3:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100da7:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100da8:	c7 05 28 f9 10 00 00 	movl   $0x0,0x10f928
  100daf:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100db2:	c7 04 24 2e 39 10 00 	movl   $0x10392e,(%esp)
  100db9:	e8 ae f4 ff ff       	call   10026c <cprintf>
    pic_enable(IRQ_TIMER);
  100dbe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100dc5:	e8 ca 08 00 00       	call   101694 <pic_enable>
}
  100dca:	90                   	nop
  100dcb:	c9                   	leave  
  100dcc:	c3                   	ret    

00100dcd <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100dcd:	55                   	push   %ebp
  100dce:	89 e5                	mov    %esp,%ebp
  100dd0:	83 ec 10             	sub    $0x10,%esp
  100dd3:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dd9:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100ddd:	89 c2                	mov    %eax,%edx
  100ddf:	ec                   	in     (%dx),%al
  100de0:	88 45 f1             	mov    %al,-0xf(%ebp)
  100de3:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100de9:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100ded:	89 c2                	mov    %eax,%edx
  100def:	ec                   	in     (%dx),%al
  100df0:	88 45 f5             	mov    %al,-0xb(%ebp)
  100df3:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100df9:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100dfd:	89 c2                	mov    %eax,%edx
  100dff:	ec                   	in     (%dx),%al
  100e00:	88 45 f9             	mov    %al,-0x7(%ebp)
  100e03:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100e09:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100e0d:	89 c2                	mov    %eax,%edx
  100e0f:	ec                   	in     (%dx),%al
  100e10:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e13:	90                   	nop
  100e14:	c9                   	leave  
  100e15:	c3                   	ret    

00100e16 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e16:	55                   	push   %ebp
  100e17:	89 e5                	mov    %esp,%ebp
  100e19:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e1c:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e23:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e26:	0f b7 00             	movzwl (%eax),%eax
  100e29:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e2d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e30:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e35:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e38:	0f b7 00             	movzwl (%eax),%eax
  100e3b:	0f b7 c0             	movzwl %ax,%eax
  100e3e:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100e43:	74 12                	je     100e57 <cga_init+0x41>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e45:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e4c:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e53:	b4 03 
  100e55:	eb 13                	jmp    100e6a <cga_init+0x54>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e57:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e5a:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e5e:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e61:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e68:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e6a:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e71:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100e75:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e79:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100e7d:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100e81:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e82:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e89:	40                   	inc    %eax
  100e8a:	0f b7 c0             	movzwl %ax,%eax
  100e8d:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e91:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100e95:	89 c2                	mov    %eax,%edx
  100e97:	ec                   	in     (%dx),%al
  100e98:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100e9b:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100e9f:	0f b6 c0             	movzbl %al,%eax
  100ea2:	c1 e0 08             	shl    $0x8,%eax
  100ea5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100ea8:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100eaf:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100eb3:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100eb7:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100ebb:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100ebf:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100ec0:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ec7:	40                   	inc    %eax
  100ec8:	0f b7 c0             	movzwl %ax,%eax
  100ecb:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ecf:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100ed3:	89 c2                	mov    %eax,%edx
  100ed5:	ec                   	in     (%dx),%al
  100ed6:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100ed9:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100edd:	0f b6 c0             	movzbl %al,%eax
  100ee0:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100ee3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ee6:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100eeb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100eee:	0f b7 c0             	movzwl %ax,%eax
  100ef1:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100ef7:	90                   	nop
  100ef8:	c9                   	leave  
  100ef9:	c3                   	ret    

00100efa <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100efa:	55                   	push   %ebp
  100efb:	89 e5                	mov    %esp,%ebp
  100efd:	83 ec 48             	sub    $0x48,%esp
  100f00:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100f06:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f0a:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100f0e:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100f12:	ee                   	out    %al,(%dx)
  100f13:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100f19:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
  100f1d:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100f21:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100f25:	ee                   	out    %al,(%dx)
  100f26:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100f2c:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
  100f30:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100f34:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100f38:	ee                   	out    %al,(%dx)
  100f39:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f3f:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
  100f43:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f47:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f4b:	ee                   	out    %al,(%dx)
  100f4c:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100f52:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
  100f56:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f5a:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f5e:	ee                   	out    %al,(%dx)
  100f5f:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100f65:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
  100f69:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f6d:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f71:	ee                   	out    %al,(%dx)
  100f72:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f78:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
  100f7c:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f80:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f84:	ee                   	out    %al,(%dx)
  100f85:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f8b:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100f8f:	89 c2                	mov    %eax,%edx
  100f91:	ec                   	in     (%dx),%al
  100f92:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100f95:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f99:	3c ff                	cmp    $0xff,%al
  100f9b:	0f 95 c0             	setne  %al
  100f9e:	0f b6 c0             	movzbl %al,%eax
  100fa1:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100fa6:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fac:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100fb0:	89 c2                	mov    %eax,%edx
  100fb2:	ec                   	in     (%dx),%al
  100fb3:	88 45 f1             	mov    %al,-0xf(%ebp)
  100fb6:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  100fbc:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100fc0:	89 c2                	mov    %eax,%edx
  100fc2:	ec                   	in     (%dx),%al
  100fc3:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fc6:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100fcb:	85 c0                	test   %eax,%eax
  100fcd:	74 0c                	je     100fdb <serial_init+0xe1>
        pic_enable(IRQ_COM1);
  100fcf:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100fd6:	e8 b9 06 00 00       	call   101694 <pic_enable>
    }
}
  100fdb:	90                   	nop
  100fdc:	c9                   	leave  
  100fdd:	c3                   	ret    

00100fde <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fde:	55                   	push   %ebp
  100fdf:	89 e5                	mov    %esp,%ebp
  100fe1:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fe4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100feb:	eb 08                	jmp    100ff5 <lpt_putc_sub+0x17>
        delay();
  100fed:	e8 db fd ff ff       	call   100dcd <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100ff2:	ff 45 fc             	incl   -0x4(%ebp)
  100ff5:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100ffb:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100fff:	89 c2                	mov    %eax,%edx
  101001:	ec                   	in     (%dx),%al
  101002:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101005:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101009:	84 c0                	test   %al,%al
  10100b:	78 09                	js     101016 <lpt_putc_sub+0x38>
  10100d:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101014:	7e d7                	jle    100fed <lpt_putc_sub+0xf>
    }
    outb(LPTPORT + 0, c);
  101016:	8b 45 08             	mov    0x8(%ebp),%eax
  101019:	0f b6 c0             	movzbl %al,%eax
  10101c:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  101022:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101025:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101029:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10102d:	ee                   	out    %al,(%dx)
  10102e:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  101034:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  101038:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10103c:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101040:	ee                   	out    %al,(%dx)
  101041:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  101047:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
  10104b:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10104f:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101053:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101054:	90                   	nop
  101055:	c9                   	leave  
  101056:	c3                   	ret    

00101057 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101057:	55                   	push   %ebp
  101058:	89 e5                	mov    %esp,%ebp
  10105a:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  10105d:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101061:	74 0d                	je     101070 <lpt_putc+0x19>
        lpt_putc_sub(c);
  101063:	8b 45 08             	mov    0x8(%ebp),%eax
  101066:	89 04 24             	mov    %eax,(%esp)
  101069:	e8 70 ff ff ff       	call   100fde <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  10106e:	eb 24                	jmp    101094 <lpt_putc+0x3d>
        lpt_putc_sub('\b');
  101070:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101077:	e8 62 ff ff ff       	call   100fde <lpt_putc_sub>
        lpt_putc_sub(' ');
  10107c:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101083:	e8 56 ff ff ff       	call   100fde <lpt_putc_sub>
        lpt_putc_sub('\b');
  101088:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10108f:	e8 4a ff ff ff       	call   100fde <lpt_putc_sub>
}
  101094:	90                   	nop
  101095:	c9                   	leave  
  101096:	c3                   	ret    

00101097 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  101097:	55                   	push   %ebp
  101098:	89 e5                	mov    %esp,%ebp
  10109a:	53                   	push   %ebx
  10109b:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  10109e:	8b 45 08             	mov    0x8(%ebp),%eax
  1010a1:	25 00 ff ff ff       	and    $0xffffff00,%eax
  1010a6:	85 c0                	test   %eax,%eax
  1010a8:	75 07                	jne    1010b1 <cga_putc+0x1a>
        c |= 0x0700;
  1010aa:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  1010b1:	8b 45 08             	mov    0x8(%ebp),%eax
  1010b4:	0f b6 c0             	movzbl %al,%eax
  1010b7:	83 f8 0a             	cmp    $0xa,%eax
  1010ba:	74 55                	je     101111 <cga_putc+0x7a>
  1010bc:	83 f8 0d             	cmp    $0xd,%eax
  1010bf:	74 63                	je     101124 <cga_putc+0x8d>
  1010c1:	83 f8 08             	cmp    $0x8,%eax
  1010c4:	0f 85 94 00 00 00    	jne    10115e <cga_putc+0xc7>
    case '\b':
        if (crt_pos > 0) {
  1010ca:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010d1:	85 c0                	test   %eax,%eax
  1010d3:	0f 84 af 00 00 00    	je     101188 <cga_putc+0xf1>
            crt_pos --;
  1010d9:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010e0:	48                   	dec    %eax
  1010e1:	0f b7 c0             	movzwl %ax,%eax
  1010e4:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1010ed:	98                   	cwtl   
  1010ee:	25 00 ff ff ff       	and    $0xffffff00,%eax
  1010f3:	98                   	cwtl   
  1010f4:	83 c8 20             	or     $0x20,%eax
  1010f7:	98                   	cwtl   
  1010f8:	8b 15 60 ee 10 00    	mov    0x10ee60,%edx
  1010fe:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  101105:	01 c9                	add    %ecx,%ecx
  101107:	01 ca                	add    %ecx,%edx
  101109:	0f b7 c0             	movzwl %ax,%eax
  10110c:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  10110f:	eb 77                	jmp    101188 <cga_putc+0xf1>
    case '\n':
        crt_pos += CRT_COLS;
  101111:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101118:	83 c0 50             	add    $0x50,%eax
  10111b:	0f b7 c0             	movzwl %ax,%eax
  10111e:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  101124:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  10112b:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  101132:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  101137:	89 c8                	mov    %ecx,%eax
  101139:	f7 e2                	mul    %edx
  10113b:	c1 ea 06             	shr    $0x6,%edx
  10113e:	89 d0                	mov    %edx,%eax
  101140:	c1 e0 02             	shl    $0x2,%eax
  101143:	01 d0                	add    %edx,%eax
  101145:	c1 e0 04             	shl    $0x4,%eax
  101148:	29 c1                	sub    %eax,%ecx
  10114a:	89 c8                	mov    %ecx,%eax
  10114c:	0f b7 c0             	movzwl %ax,%eax
  10114f:	29 c3                	sub    %eax,%ebx
  101151:	89 d8                	mov    %ebx,%eax
  101153:	0f b7 c0             	movzwl %ax,%eax
  101156:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  10115c:	eb 2b                	jmp    101189 <cga_putc+0xf2>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  10115e:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  101164:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10116b:	8d 50 01             	lea    0x1(%eax),%edx
  10116e:	0f b7 d2             	movzwl %dx,%edx
  101171:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  101178:	01 c0                	add    %eax,%eax
  10117a:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  10117d:	8b 45 08             	mov    0x8(%ebp),%eax
  101180:	0f b7 c0             	movzwl %ax,%eax
  101183:	66 89 02             	mov    %ax,(%edx)
        break;
  101186:	eb 01                	jmp    101189 <cga_putc+0xf2>
        break;
  101188:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101189:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101190:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  101195:	76 5d                	jbe    1011f4 <cga_putc+0x15d>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  101197:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10119c:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  1011a2:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011a7:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  1011ae:	00 
  1011af:	89 54 24 04          	mov    %edx,0x4(%esp)
  1011b3:	89 04 24             	mov    %eax,(%esp)
  1011b6:	e8 8b 1c 00 00       	call   102e46 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011bb:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1011c2:	eb 14                	jmp    1011d8 <cga_putc+0x141>
            crt_buf[i] = 0x0700 | ' ';
  1011c4:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011c9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1011cc:	01 d2                	add    %edx,%edx
  1011ce:	01 d0                	add    %edx,%eax
  1011d0:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011d5:	ff 45 f4             	incl   -0xc(%ebp)
  1011d8:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011df:	7e e3                	jle    1011c4 <cga_putc+0x12d>
        }
        crt_pos -= CRT_COLS;
  1011e1:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011e8:	83 e8 50             	sub    $0x50,%eax
  1011eb:	0f b7 c0             	movzwl %ax,%eax
  1011ee:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011f4:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011fb:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  1011ff:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
  101203:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101207:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10120b:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  10120c:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101213:	c1 e8 08             	shr    $0x8,%eax
  101216:	0f b7 c0             	movzwl %ax,%eax
  101219:	0f b6 c0             	movzbl %al,%eax
  10121c:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101223:	42                   	inc    %edx
  101224:	0f b7 d2             	movzwl %dx,%edx
  101227:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  10122b:	88 45 e9             	mov    %al,-0x17(%ebp)
  10122e:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101232:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101236:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  101237:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  10123e:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  101242:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
  101246:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10124a:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10124e:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  10124f:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101256:	0f b6 c0             	movzbl %al,%eax
  101259:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101260:	42                   	inc    %edx
  101261:	0f b7 d2             	movzwl %dx,%edx
  101264:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  101268:	88 45 f1             	mov    %al,-0xf(%ebp)
  10126b:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10126f:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101273:	ee                   	out    %al,(%dx)
}
  101274:	90                   	nop
  101275:	83 c4 34             	add    $0x34,%esp
  101278:	5b                   	pop    %ebx
  101279:	5d                   	pop    %ebp
  10127a:	c3                   	ret    

0010127b <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  10127b:	55                   	push   %ebp
  10127c:	89 e5                	mov    %esp,%ebp
  10127e:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101281:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101288:	eb 08                	jmp    101292 <serial_putc_sub+0x17>
        delay();
  10128a:	e8 3e fb ff ff       	call   100dcd <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10128f:	ff 45 fc             	incl   -0x4(%ebp)
  101292:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101298:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10129c:	89 c2                	mov    %eax,%edx
  10129e:	ec                   	in     (%dx),%al
  10129f:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1012a2:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1012a6:	0f b6 c0             	movzbl %al,%eax
  1012a9:	83 e0 20             	and    $0x20,%eax
  1012ac:	85 c0                	test   %eax,%eax
  1012ae:	75 09                	jne    1012b9 <serial_putc_sub+0x3e>
  1012b0:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  1012b7:	7e d1                	jle    10128a <serial_putc_sub+0xf>
    }
    outb(COM1 + COM_TX, c);
  1012b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1012bc:	0f b6 c0             	movzbl %al,%eax
  1012bf:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1012c5:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012c8:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1012cc:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1012d0:	ee                   	out    %al,(%dx)
}
  1012d1:	90                   	nop
  1012d2:	c9                   	leave  
  1012d3:	c3                   	ret    

001012d4 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1012d4:	55                   	push   %ebp
  1012d5:	89 e5                	mov    %esp,%ebp
  1012d7:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1012da:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012de:	74 0d                	je     1012ed <serial_putc+0x19>
        serial_putc_sub(c);
  1012e0:	8b 45 08             	mov    0x8(%ebp),%eax
  1012e3:	89 04 24             	mov    %eax,(%esp)
  1012e6:	e8 90 ff ff ff       	call   10127b <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  1012eb:	eb 24                	jmp    101311 <serial_putc+0x3d>
        serial_putc_sub('\b');
  1012ed:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012f4:	e8 82 ff ff ff       	call   10127b <serial_putc_sub>
        serial_putc_sub(' ');
  1012f9:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101300:	e8 76 ff ff ff       	call   10127b <serial_putc_sub>
        serial_putc_sub('\b');
  101305:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10130c:	e8 6a ff ff ff       	call   10127b <serial_putc_sub>
}
  101311:	90                   	nop
  101312:	c9                   	leave  
  101313:	c3                   	ret    

00101314 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  101314:	55                   	push   %ebp
  101315:	89 e5                	mov    %esp,%ebp
  101317:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  10131a:	eb 33                	jmp    10134f <cons_intr+0x3b>
        if (c != 0) {
  10131c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101320:	74 2d                	je     10134f <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  101322:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101327:	8d 50 01             	lea    0x1(%eax),%edx
  10132a:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  101330:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101333:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  101339:	a1 84 f0 10 00       	mov    0x10f084,%eax
  10133e:	3d 00 02 00 00       	cmp    $0x200,%eax
  101343:	75 0a                	jne    10134f <cons_intr+0x3b>
                cons.wpos = 0;
  101345:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  10134c:	00 00 00 
    while ((c = (*proc)()) != -1) {
  10134f:	8b 45 08             	mov    0x8(%ebp),%eax
  101352:	ff d0                	call   *%eax
  101354:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101357:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  10135b:	75 bf                	jne    10131c <cons_intr+0x8>
            }
        }
    }
}
  10135d:	90                   	nop
  10135e:	c9                   	leave  
  10135f:	c3                   	ret    

00101360 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  101360:	55                   	push   %ebp
  101361:	89 e5                	mov    %esp,%ebp
  101363:	83 ec 10             	sub    $0x10,%esp
  101366:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10136c:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101370:	89 c2                	mov    %eax,%edx
  101372:	ec                   	in     (%dx),%al
  101373:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101376:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  10137a:	0f b6 c0             	movzbl %al,%eax
  10137d:	83 e0 01             	and    $0x1,%eax
  101380:	85 c0                	test   %eax,%eax
  101382:	75 07                	jne    10138b <serial_proc_data+0x2b>
        return -1;
  101384:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101389:	eb 2a                	jmp    1013b5 <serial_proc_data+0x55>
  10138b:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101391:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101395:	89 c2                	mov    %eax,%edx
  101397:	ec                   	in     (%dx),%al
  101398:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  10139b:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  10139f:	0f b6 c0             	movzbl %al,%eax
  1013a2:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  1013a5:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  1013a9:	75 07                	jne    1013b2 <serial_proc_data+0x52>
        c = '\b';
  1013ab:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  1013b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1013b5:	c9                   	leave  
  1013b6:	c3                   	ret    

001013b7 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  1013b7:	55                   	push   %ebp
  1013b8:	89 e5                	mov    %esp,%ebp
  1013ba:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  1013bd:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1013c2:	85 c0                	test   %eax,%eax
  1013c4:	74 0c                	je     1013d2 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  1013c6:	c7 04 24 60 13 10 00 	movl   $0x101360,(%esp)
  1013cd:	e8 42 ff ff ff       	call   101314 <cons_intr>
    }
}
  1013d2:	90                   	nop
  1013d3:	c9                   	leave  
  1013d4:	c3                   	ret    

001013d5 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1013d5:	55                   	push   %ebp
  1013d6:	89 e5                	mov    %esp,%ebp
  1013d8:	83 ec 38             	sub    $0x38,%esp
  1013db:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1013e4:	89 c2                	mov    %eax,%edx
  1013e6:	ec                   	in     (%dx),%al
  1013e7:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1013ea:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013ee:	0f b6 c0             	movzbl %al,%eax
  1013f1:	83 e0 01             	and    $0x1,%eax
  1013f4:	85 c0                	test   %eax,%eax
  1013f6:	75 0a                	jne    101402 <kbd_proc_data+0x2d>
        return -1;
  1013f8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013fd:	e9 55 01 00 00       	jmp    101557 <kbd_proc_data+0x182>
  101402:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101408:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10140b:	89 c2                	mov    %eax,%edx
  10140d:	ec                   	in     (%dx),%al
  10140e:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  101411:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  101415:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  101418:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  10141c:	75 17                	jne    101435 <kbd_proc_data+0x60>
        // E0 escape character
        shift |= E0ESC;
  10141e:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101423:	83 c8 40             	or     $0x40,%eax
  101426:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  10142b:	b8 00 00 00 00       	mov    $0x0,%eax
  101430:	e9 22 01 00 00       	jmp    101557 <kbd_proc_data+0x182>
    } else if (data & 0x80) {
  101435:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101439:	84 c0                	test   %al,%al
  10143b:	79 45                	jns    101482 <kbd_proc_data+0xad>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  10143d:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101442:	83 e0 40             	and    $0x40,%eax
  101445:	85 c0                	test   %eax,%eax
  101447:	75 08                	jne    101451 <kbd_proc_data+0x7c>
  101449:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10144d:	24 7f                	and    $0x7f,%al
  10144f:	eb 04                	jmp    101455 <kbd_proc_data+0x80>
  101451:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101455:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  101458:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10145c:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101463:	0c 40                	or     $0x40,%al
  101465:	0f b6 c0             	movzbl %al,%eax
  101468:	f7 d0                	not    %eax
  10146a:	89 c2                	mov    %eax,%edx
  10146c:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101471:	21 d0                	and    %edx,%eax
  101473:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101478:	b8 00 00 00 00       	mov    $0x0,%eax
  10147d:	e9 d5 00 00 00       	jmp    101557 <kbd_proc_data+0x182>
    } else if (shift & E0ESC) {
  101482:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101487:	83 e0 40             	and    $0x40,%eax
  10148a:	85 c0                	test   %eax,%eax
  10148c:	74 11                	je     10149f <kbd_proc_data+0xca>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  10148e:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101492:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101497:	83 e0 bf             	and    $0xffffffbf,%eax
  10149a:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  10149f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014a3:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  1014aa:	0f b6 d0             	movzbl %al,%edx
  1014ad:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014b2:	09 d0                	or     %edx,%eax
  1014b4:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  1014b9:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014bd:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  1014c4:	0f b6 d0             	movzbl %al,%edx
  1014c7:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014cc:	31 d0                	xor    %edx,%eax
  1014ce:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  1014d3:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014d8:	83 e0 03             	and    $0x3,%eax
  1014db:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  1014e2:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014e6:	01 d0                	add    %edx,%eax
  1014e8:	0f b6 00             	movzbl (%eax),%eax
  1014eb:	0f b6 c0             	movzbl %al,%eax
  1014ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014f1:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014f6:	83 e0 08             	and    $0x8,%eax
  1014f9:	85 c0                	test   %eax,%eax
  1014fb:	74 22                	je     10151f <kbd_proc_data+0x14a>
        if ('a' <= c && c <= 'z')
  1014fd:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  101501:	7e 0c                	jle    10150f <kbd_proc_data+0x13a>
  101503:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  101507:	7f 06                	jg     10150f <kbd_proc_data+0x13a>
            c += 'A' - 'a';
  101509:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  10150d:	eb 10                	jmp    10151f <kbd_proc_data+0x14a>
        else if ('A' <= c && c <= 'Z')
  10150f:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  101513:	7e 0a                	jle    10151f <kbd_proc_data+0x14a>
  101515:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  101519:	7f 04                	jg     10151f <kbd_proc_data+0x14a>
            c += 'a' - 'A';
  10151b:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  10151f:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101524:	f7 d0                	not    %eax
  101526:	83 e0 06             	and    $0x6,%eax
  101529:	85 c0                	test   %eax,%eax
  10152b:	75 27                	jne    101554 <kbd_proc_data+0x17f>
  10152d:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  101534:	75 1e                	jne    101554 <kbd_proc_data+0x17f>
        cprintf("Rebooting!\n");
  101536:	c7 04 24 49 39 10 00 	movl   $0x103949,(%esp)
  10153d:	e8 2a ed ff ff       	call   10026c <cprintf>
  101542:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  101548:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10154c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101550:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101553:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101554:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101557:	c9                   	leave  
  101558:	c3                   	ret    

00101559 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101559:	55                   	push   %ebp
  10155a:	89 e5                	mov    %esp,%ebp
  10155c:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  10155f:	c7 04 24 d5 13 10 00 	movl   $0x1013d5,(%esp)
  101566:	e8 a9 fd ff ff       	call   101314 <cons_intr>
}
  10156b:	90                   	nop
  10156c:	c9                   	leave  
  10156d:	c3                   	ret    

0010156e <kbd_init>:

static void
kbd_init(void) {
  10156e:	55                   	push   %ebp
  10156f:	89 e5                	mov    %esp,%ebp
  101571:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  101574:	e8 e0 ff ff ff       	call   101559 <kbd_intr>
    pic_enable(IRQ_KBD);
  101579:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  101580:	e8 0f 01 00 00       	call   101694 <pic_enable>
}
  101585:	90                   	nop
  101586:	c9                   	leave  
  101587:	c3                   	ret    

00101588 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101588:	55                   	push   %ebp
  101589:	89 e5                	mov    %esp,%ebp
  10158b:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  10158e:	e8 83 f8 ff ff       	call   100e16 <cga_init>
    serial_init();
  101593:	e8 62 f9 ff ff       	call   100efa <serial_init>
    kbd_init();
  101598:	e8 d1 ff ff ff       	call   10156e <kbd_init>
    if (!serial_exists) {
  10159d:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1015a2:	85 c0                	test   %eax,%eax
  1015a4:	75 0c                	jne    1015b2 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  1015a6:	c7 04 24 55 39 10 00 	movl   $0x103955,(%esp)
  1015ad:	e8 ba ec ff ff       	call   10026c <cprintf>
    }
}
  1015b2:	90                   	nop
  1015b3:	c9                   	leave  
  1015b4:	c3                   	ret    

001015b5 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  1015b5:	55                   	push   %ebp
  1015b6:	89 e5                	mov    %esp,%ebp
  1015b8:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  1015bb:	8b 45 08             	mov    0x8(%ebp),%eax
  1015be:	89 04 24             	mov    %eax,(%esp)
  1015c1:	e8 91 fa ff ff       	call   101057 <lpt_putc>
    cga_putc(c);
  1015c6:	8b 45 08             	mov    0x8(%ebp),%eax
  1015c9:	89 04 24             	mov    %eax,(%esp)
  1015cc:	e8 c6 fa ff ff       	call   101097 <cga_putc>
    serial_putc(c);
  1015d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1015d4:	89 04 24             	mov    %eax,(%esp)
  1015d7:	e8 f8 fc ff ff       	call   1012d4 <serial_putc>
}
  1015dc:	90                   	nop
  1015dd:	c9                   	leave  
  1015de:	c3                   	ret    

001015df <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015df:	55                   	push   %ebp
  1015e0:	89 e5                	mov    %esp,%ebp
  1015e2:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015e5:	e8 cd fd ff ff       	call   1013b7 <serial_intr>
    kbd_intr();
  1015ea:	e8 6a ff ff ff       	call   101559 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015ef:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1015f5:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1015fa:	39 c2                	cmp    %eax,%edx
  1015fc:	74 36                	je     101634 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015fe:	a1 80 f0 10 00       	mov    0x10f080,%eax
  101603:	8d 50 01             	lea    0x1(%eax),%edx
  101606:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  10160c:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  101613:	0f b6 c0             	movzbl %al,%eax
  101616:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  101619:	a1 80 f0 10 00       	mov    0x10f080,%eax
  10161e:	3d 00 02 00 00       	cmp    $0x200,%eax
  101623:	75 0a                	jne    10162f <cons_getc+0x50>
            cons.rpos = 0;
  101625:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  10162c:	00 00 00 
        }
        return c;
  10162f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101632:	eb 05                	jmp    101639 <cons_getc+0x5a>
    }
    return 0;
  101634:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101639:	c9                   	leave  
  10163a:	c3                   	ret    

0010163b <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  10163b:	55                   	push   %ebp
  10163c:	89 e5                	mov    %esp,%ebp
  10163e:	83 ec 14             	sub    $0x14,%esp
  101641:	8b 45 08             	mov    0x8(%ebp),%eax
  101644:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101648:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10164b:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  101651:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101656:	85 c0                	test   %eax,%eax
  101658:	74 37                	je     101691 <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  10165a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10165d:	0f b6 c0             	movzbl %al,%eax
  101660:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  101666:	88 45 f9             	mov    %al,-0x7(%ebp)
  101669:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10166d:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101671:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  101672:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101676:	c1 e8 08             	shr    $0x8,%eax
  101679:	0f b7 c0             	movzwl %ax,%eax
  10167c:	0f b6 c0             	movzbl %al,%eax
  10167f:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  101685:	88 45 fd             	mov    %al,-0x3(%ebp)
  101688:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  10168c:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101690:	ee                   	out    %al,(%dx)
    }
}
  101691:	90                   	nop
  101692:	c9                   	leave  
  101693:	c3                   	ret    

00101694 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101694:	55                   	push   %ebp
  101695:	89 e5                	mov    %esp,%ebp
  101697:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  10169a:	8b 45 08             	mov    0x8(%ebp),%eax
  10169d:	ba 01 00 00 00       	mov    $0x1,%edx
  1016a2:	88 c1                	mov    %al,%cl
  1016a4:	d3 e2                	shl    %cl,%edx
  1016a6:	89 d0                	mov    %edx,%eax
  1016a8:	98                   	cwtl   
  1016a9:	f7 d0                	not    %eax
  1016ab:	0f bf d0             	movswl %ax,%edx
  1016ae:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1016b5:	98                   	cwtl   
  1016b6:	21 d0                	and    %edx,%eax
  1016b8:	98                   	cwtl   
  1016b9:	0f b7 c0             	movzwl %ax,%eax
  1016bc:	89 04 24             	mov    %eax,(%esp)
  1016bf:	e8 77 ff ff ff       	call   10163b <pic_setmask>
}
  1016c4:	90                   	nop
  1016c5:	c9                   	leave  
  1016c6:	c3                   	ret    

001016c7 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1016c7:	55                   	push   %ebp
  1016c8:	89 e5                	mov    %esp,%ebp
  1016ca:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  1016cd:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  1016d4:	00 00 00 
  1016d7:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  1016dd:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
  1016e1:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1016e5:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1016e9:	ee                   	out    %al,(%dx)
  1016ea:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  1016f0:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
  1016f4:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1016f8:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1016fc:	ee                   	out    %al,(%dx)
  1016fd:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101703:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
  101707:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  10170b:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  10170f:	ee                   	out    %al,(%dx)
  101710:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  101716:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
  10171a:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  10171e:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  101722:	ee                   	out    %al,(%dx)
  101723:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  101729:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
  10172d:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101731:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101735:	ee                   	out    %al,(%dx)
  101736:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  10173c:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
  101740:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101744:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101748:	ee                   	out    %al,(%dx)
  101749:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  10174f:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
  101753:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101757:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  10175b:	ee                   	out    %al,(%dx)
  10175c:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  101762:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
  101766:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10176a:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10176e:	ee                   	out    %al,(%dx)
  10176f:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  101775:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
  101779:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10177d:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101781:	ee                   	out    %al,(%dx)
  101782:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  101788:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
  10178c:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101790:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101794:	ee                   	out    %al,(%dx)
  101795:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  10179b:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
  10179f:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1017a3:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1017a7:	ee                   	out    %al,(%dx)
  1017a8:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  1017ae:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
  1017b2:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1017b6:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1017ba:	ee                   	out    %al,(%dx)
  1017bb:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  1017c1:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
  1017c5:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1017c9:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1017cd:	ee                   	out    %al,(%dx)
  1017ce:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  1017d4:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
  1017d8:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1017dc:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1017e0:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017e1:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017e8:	3d ff ff 00 00       	cmp    $0xffff,%eax
  1017ed:	74 0f                	je     1017fe <pic_init+0x137>
        pic_setmask(irq_mask);
  1017ef:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017f6:	89 04 24             	mov    %eax,(%esp)
  1017f9:	e8 3d fe ff ff       	call   10163b <pic_setmask>
    }
}
  1017fe:	90                   	nop
  1017ff:	c9                   	leave  
  101800:	c3                   	ret    

00101801 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  101801:	55                   	push   %ebp
  101802:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  101804:	fb                   	sti    
    sti();
}
  101805:	90                   	nop
  101806:	5d                   	pop    %ebp
  101807:	c3                   	ret    

00101808 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  101808:	55                   	push   %ebp
  101809:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  10180b:	fa                   	cli    
    cli();
}
  10180c:	90                   	nop
  10180d:	5d                   	pop    %ebp
  10180e:	c3                   	ret    

0010180f <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100
static int32_t count = 0;
static void print_ticks() {
  10180f:	55                   	push   %ebp
  101810:	89 e5                	mov    %esp,%ebp
  101812:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  101815:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  10181c:	00 
  10181d:	c7 04 24 80 39 10 00 	movl   $0x103980,(%esp)
  101824:	e8 43 ea ff ff       	call   10026c <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
  101829:	c7 04 24 8a 39 10 00 	movl   $0x10398a,(%esp)
  101830:	e8 37 ea ff ff       	call   10026c <cprintf>
    panic("EOT: kernel seems ok.");
  101835:	c7 44 24 08 98 39 10 	movl   $0x103998,0x8(%esp)
  10183c:	00 
  10183d:	c7 44 24 04 12 00 00 	movl   $0x12,0x4(%esp)
  101844:	00 
  101845:	c7 04 24 ae 39 10 00 	movl   $0x1039ae,(%esp)
  10184c:	e8 72 eb ff ff       	call   1003c3 <__panic>

00101851 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101851:	55                   	push   %ebp
  101852:	89 e5                	mov    %esp,%ebp
  101854:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
 extern uintptr_t __vectors[];
    int i;
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  101857:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10185e:	e9 c4 00 00 00       	jmp    101927 <idt_init+0xd6>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  101863:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101866:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  10186d:	0f b7 d0             	movzwl %ax,%edx
  101870:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101873:	66 89 14 c5 c0 f0 10 	mov    %dx,0x10f0c0(,%eax,8)
  10187a:	00 
  10187b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10187e:	66 c7 04 c5 c2 f0 10 	movw   $0x8,0x10f0c2(,%eax,8)
  101885:	00 08 00 
  101888:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10188b:	0f b6 14 c5 c4 f0 10 	movzbl 0x10f0c4(,%eax,8),%edx
  101892:	00 
  101893:	80 e2 e0             	and    $0xe0,%dl
  101896:	88 14 c5 c4 f0 10 00 	mov    %dl,0x10f0c4(,%eax,8)
  10189d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018a0:	0f b6 14 c5 c4 f0 10 	movzbl 0x10f0c4(,%eax,8),%edx
  1018a7:	00 
  1018a8:	80 e2 1f             	and    $0x1f,%dl
  1018ab:	88 14 c5 c4 f0 10 00 	mov    %dl,0x10f0c4(,%eax,8)
  1018b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018b5:	0f b6 14 c5 c5 f0 10 	movzbl 0x10f0c5(,%eax,8),%edx
  1018bc:	00 
  1018bd:	80 e2 f0             	and    $0xf0,%dl
  1018c0:	80 ca 0e             	or     $0xe,%dl
  1018c3:	88 14 c5 c5 f0 10 00 	mov    %dl,0x10f0c5(,%eax,8)
  1018ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018cd:	0f b6 14 c5 c5 f0 10 	movzbl 0x10f0c5(,%eax,8),%edx
  1018d4:	00 
  1018d5:	80 e2 ef             	and    $0xef,%dl
  1018d8:	88 14 c5 c5 f0 10 00 	mov    %dl,0x10f0c5(,%eax,8)
  1018df:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018e2:	0f b6 14 c5 c5 f0 10 	movzbl 0x10f0c5(,%eax,8),%edx
  1018e9:	00 
  1018ea:	80 e2 9f             	and    $0x9f,%dl
  1018ed:	88 14 c5 c5 f0 10 00 	mov    %dl,0x10f0c5(,%eax,8)
  1018f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018f7:	0f b6 14 c5 c5 f0 10 	movzbl 0x10f0c5(,%eax,8),%edx
  1018fe:	00 
  1018ff:	80 ca 80             	or     $0x80,%dl
  101902:	88 14 c5 c5 f0 10 00 	mov    %dl,0x10f0c5(,%eax,8)
  101909:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10190c:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  101913:	c1 e8 10             	shr    $0x10,%eax
  101916:	0f b7 d0             	movzwl %ax,%edx
  101919:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10191c:	66 89 14 c5 c6 f0 10 	mov    %dx,0x10f0c6(,%eax,8)
  101923:	00 
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  101924:	ff 45 fc             	incl   -0x4(%ebp)
  101927:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10192a:	3d ff 00 00 00       	cmp    $0xff,%eax
  10192f:	0f 86 2e ff ff ff    	jbe    101863 <idt_init+0x12>
    }
    SETGATE(idt[T_SWITCH_TOK], 1, GD_KTEXT, __vectors[T_SWITCH_TOK], 3);
  101935:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  10193a:	0f b7 c0             	movzwl %ax,%eax
  10193d:	66 a3 88 f4 10 00    	mov    %ax,0x10f488
  101943:	66 c7 05 8a f4 10 00 	movw   $0x8,0x10f48a
  10194a:	08 00 
  10194c:	0f b6 05 8c f4 10 00 	movzbl 0x10f48c,%eax
  101953:	24 e0                	and    $0xe0,%al
  101955:	a2 8c f4 10 00       	mov    %al,0x10f48c
  10195a:	0f b6 05 8c f4 10 00 	movzbl 0x10f48c,%eax
  101961:	24 1f                	and    $0x1f,%al
  101963:	a2 8c f4 10 00       	mov    %al,0x10f48c
  101968:	0f b6 05 8d f4 10 00 	movzbl 0x10f48d,%eax
  10196f:	0c 0f                	or     $0xf,%al
  101971:	a2 8d f4 10 00       	mov    %al,0x10f48d
  101976:	0f b6 05 8d f4 10 00 	movzbl 0x10f48d,%eax
  10197d:	24 ef                	and    $0xef,%al
  10197f:	a2 8d f4 10 00       	mov    %al,0x10f48d
  101984:	0f b6 05 8d f4 10 00 	movzbl 0x10f48d,%eax
  10198b:	0c 60                	or     $0x60,%al
  10198d:	a2 8d f4 10 00       	mov    %al,0x10f48d
  101992:	0f b6 05 8d f4 10 00 	movzbl 0x10f48d,%eax
  101999:	0c 80                	or     $0x80,%al
  10199b:	a2 8d f4 10 00       	mov    %al,0x10f48d
  1019a0:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  1019a5:	c1 e8 10             	shr    $0x10,%eax
  1019a8:	0f b7 c0             	movzwl %ax,%eax
  1019ab:	66 a3 8e f4 10 00    	mov    %ax,0x10f48e
  1019b1:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    asm volatile ("lidt (%0)" :: "r" (pd));
  1019b8:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1019bb:	0f 01 18             	lidtl  (%eax)
    lidt(&idt_pd);

}
  1019be:	90                   	nop
  1019bf:	c9                   	leave  
  1019c0:	c3                   	ret    

001019c1 <trapname>:

static const char *
trapname(int trapno) {
  1019c1:	55                   	push   %ebp
  1019c2:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  1019c4:	8b 45 08             	mov    0x8(%ebp),%eax
  1019c7:	83 f8 13             	cmp    $0x13,%eax
  1019ca:	77 0c                	ja     1019d8 <trapname+0x17>
        return excnames[trapno];
  1019cc:	8b 45 08             	mov    0x8(%ebp),%eax
  1019cf:	8b 04 85 00 3d 10 00 	mov    0x103d00(,%eax,4),%eax
  1019d6:	eb 18                	jmp    1019f0 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  1019d8:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  1019dc:	7e 0d                	jle    1019eb <trapname+0x2a>
  1019de:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  1019e2:	7f 07                	jg     1019eb <trapname+0x2a>
        return "Hardware Interrupt";
  1019e4:	b8 bf 39 10 00       	mov    $0x1039bf,%eax
  1019e9:	eb 05                	jmp    1019f0 <trapname+0x2f>
    }
    return "(unknown trap)";
  1019eb:	b8 d2 39 10 00       	mov    $0x1039d2,%eax
}
  1019f0:	5d                   	pop    %ebp
  1019f1:	c3                   	ret    

001019f2 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  1019f2:	55                   	push   %ebp
  1019f3:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  1019f5:	8b 45 08             	mov    0x8(%ebp),%eax
  1019f8:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  1019fc:	83 f8 08             	cmp    $0x8,%eax
  1019ff:	0f 94 c0             	sete   %al
  101a02:	0f b6 c0             	movzbl %al,%eax
}
  101a05:	5d                   	pop    %ebp
  101a06:	c3                   	ret    

00101a07 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101a07:	55                   	push   %ebp
  101a08:	89 e5                	mov    %esp,%ebp
  101a0a:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101a0d:	8b 45 08             	mov    0x8(%ebp),%eax
  101a10:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a14:	c7 04 24 13 3a 10 00 	movl   $0x103a13,(%esp)
  101a1b:	e8 4c e8 ff ff       	call   10026c <cprintf>
    print_regs(&tf->tf_regs);
  101a20:	8b 45 08             	mov    0x8(%ebp),%eax
  101a23:	89 04 24             	mov    %eax,(%esp)
  101a26:	e8 8f 01 00 00       	call   101bba <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101a2b:	8b 45 08             	mov    0x8(%ebp),%eax
  101a2e:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101a32:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a36:	c7 04 24 24 3a 10 00 	movl   $0x103a24,(%esp)
  101a3d:	e8 2a e8 ff ff       	call   10026c <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101a42:	8b 45 08             	mov    0x8(%ebp),%eax
  101a45:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101a49:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a4d:	c7 04 24 37 3a 10 00 	movl   $0x103a37,(%esp)
  101a54:	e8 13 e8 ff ff       	call   10026c <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101a59:	8b 45 08             	mov    0x8(%ebp),%eax
  101a5c:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101a60:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a64:	c7 04 24 4a 3a 10 00 	movl   $0x103a4a,(%esp)
  101a6b:	e8 fc e7 ff ff       	call   10026c <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101a70:	8b 45 08             	mov    0x8(%ebp),%eax
  101a73:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101a77:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a7b:	c7 04 24 5d 3a 10 00 	movl   $0x103a5d,(%esp)
  101a82:	e8 e5 e7 ff ff       	call   10026c <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101a87:	8b 45 08             	mov    0x8(%ebp),%eax
  101a8a:	8b 40 30             	mov    0x30(%eax),%eax
  101a8d:	89 04 24             	mov    %eax,(%esp)
  101a90:	e8 2c ff ff ff       	call   1019c1 <trapname>
  101a95:	89 c2                	mov    %eax,%edx
  101a97:	8b 45 08             	mov    0x8(%ebp),%eax
  101a9a:	8b 40 30             	mov    0x30(%eax),%eax
  101a9d:	89 54 24 08          	mov    %edx,0x8(%esp)
  101aa1:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aa5:	c7 04 24 70 3a 10 00 	movl   $0x103a70,(%esp)
  101aac:	e8 bb e7 ff ff       	call   10026c <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101ab1:	8b 45 08             	mov    0x8(%ebp),%eax
  101ab4:	8b 40 34             	mov    0x34(%eax),%eax
  101ab7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101abb:	c7 04 24 82 3a 10 00 	movl   $0x103a82,(%esp)
  101ac2:	e8 a5 e7 ff ff       	call   10026c <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101ac7:	8b 45 08             	mov    0x8(%ebp),%eax
  101aca:	8b 40 38             	mov    0x38(%eax),%eax
  101acd:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ad1:	c7 04 24 91 3a 10 00 	movl   $0x103a91,(%esp)
  101ad8:	e8 8f e7 ff ff       	call   10026c <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101add:	8b 45 08             	mov    0x8(%ebp),%eax
  101ae0:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101ae4:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ae8:	c7 04 24 a0 3a 10 00 	movl   $0x103aa0,(%esp)
  101aef:	e8 78 e7 ff ff       	call   10026c <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101af4:	8b 45 08             	mov    0x8(%ebp),%eax
  101af7:	8b 40 40             	mov    0x40(%eax),%eax
  101afa:	89 44 24 04          	mov    %eax,0x4(%esp)
  101afe:	c7 04 24 b3 3a 10 00 	movl   $0x103ab3,(%esp)
  101b05:	e8 62 e7 ff ff       	call   10026c <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b0a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101b11:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101b18:	eb 3d                	jmp    101b57 <print_trapframe+0x150>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101b1a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b1d:	8b 50 40             	mov    0x40(%eax),%edx
  101b20:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101b23:	21 d0                	and    %edx,%eax
  101b25:	85 c0                	test   %eax,%eax
  101b27:	74 28                	je     101b51 <print_trapframe+0x14a>
  101b29:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b2c:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b33:	85 c0                	test   %eax,%eax
  101b35:	74 1a                	je     101b51 <print_trapframe+0x14a>
            cprintf("%s,", IA32flags[i]);
  101b37:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b3a:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b41:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b45:	c7 04 24 c2 3a 10 00 	movl   $0x103ac2,(%esp)
  101b4c:	e8 1b e7 ff ff       	call   10026c <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b51:	ff 45 f4             	incl   -0xc(%ebp)
  101b54:	d1 65 f0             	shll   -0x10(%ebp)
  101b57:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b5a:	83 f8 17             	cmp    $0x17,%eax
  101b5d:	76 bb                	jbe    101b1a <print_trapframe+0x113>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101b5f:	8b 45 08             	mov    0x8(%ebp),%eax
  101b62:	8b 40 40             	mov    0x40(%eax),%eax
  101b65:	c1 e8 0c             	shr    $0xc,%eax
  101b68:	83 e0 03             	and    $0x3,%eax
  101b6b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b6f:	c7 04 24 c6 3a 10 00 	movl   $0x103ac6,(%esp)
  101b76:	e8 f1 e6 ff ff       	call   10026c <cprintf>

    if (!trap_in_kernel(tf)) {
  101b7b:	8b 45 08             	mov    0x8(%ebp),%eax
  101b7e:	89 04 24             	mov    %eax,(%esp)
  101b81:	e8 6c fe ff ff       	call   1019f2 <trap_in_kernel>
  101b86:	85 c0                	test   %eax,%eax
  101b88:	75 2d                	jne    101bb7 <print_trapframe+0x1b0>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101b8a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b8d:	8b 40 44             	mov    0x44(%eax),%eax
  101b90:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b94:	c7 04 24 cf 3a 10 00 	movl   $0x103acf,(%esp)
  101b9b:	e8 cc e6 ff ff       	call   10026c <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101ba0:	8b 45 08             	mov    0x8(%ebp),%eax
  101ba3:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101ba7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bab:	c7 04 24 de 3a 10 00 	movl   $0x103ade,(%esp)
  101bb2:	e8 b5 e6 ff ff       	call   10026c <cprintf>
    }
}
  101bb7:	90                   	nop
  101bb8:	c9                   	leave  
  101bb9:	c3                   	ret    

00101bba <print_regs>:

/* temporary trapframe or pointer to trapframe */
struct trapframe switchk2u, *switchu2k;

void
print_regs(struct pushregs *regs) {
  101bba:	55                   	push   %ebp
  101bbb:	89 e5                	mov    %esp,%ebp
  101bbd:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101bc0:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc3:	8b 00                	mov    (%eax),%eax
  101bc5:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bc9:	c7 04 24 f1 3a 10 00 	movl   $0x103af1,(%esp)
  101bd0:	e8 97 e6 ff ff       	call   10026c <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101bd5:	8b 45 08             	mov    0x8(%ebp),%eax
  101bd8:	8b 40 04             	mov    0x4(%eax),%eax
  101bdb:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bdf:	c7 04 24 00 3b 10 00 	movl   $0x103b00,(%esp)
  101be6:	e8 81 e6 ff ff       	call   10026c <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101beb:	8b 45 08             	mov    0x8(%ebp),%eax
  101bee:	8b 40 08             	mov    0x8(%eax),%eax
  101bf1:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bf5:	c7 04 24 0f 3b 10 00 	movl   $0x103b0f,(%esp)
  101bfc:	e8 6b e6 ff ff       	call   10026c <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101c01:	8b 45 08             	mov    0x8(%ebp),%eax
  101c04:	8b 40 0c             	mov    0xc(%eax),%eax
  101c07:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c0b:	c7 04 24 1e 3b 10 00 	movl   $0x103b1e,(%esp)
  101c12:	e8 55 e6 ff ff       	call   10026c <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101c17:	8b 45 08             	mov    0x8(%ebp),%eax
  101c1a:	8b 40 10             	mov    0x10(%eax),%eax
  101c1d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c21:	c7 04 24 2d 3b 10 00 	movl   $0x103b2d,(%esp)
  101c28:	e8 3f e6 ff ff       	call   10026c <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101c2d:	8b 45 08             	mov    0x8(%ebp),%eax
  101c30:	8b 40 14             	mov    0x14(%eax),%eax
  101c33:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c37:	c7 04 24 3c 3b 10 00 	movl   $0x103b3c,(%esp)
  101c3e:	e8 29 e6 ff ff       	call   10026c <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101c43:	8b 45 08             	mov    0x8(%ebp),%eax
  101c46:	8b 40 18             	mov    0x18(%eax),%eax
  101c49:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c4d:	c7 04 24 4b 3b 10 00 	movl   $0x103b4b,(%esp)
  101c54:	e8 13 e6 ff ff       	call   10026c <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101c59:	8b 45 08             	mov    0x8(%ebp),%eax
  101c5c:	8b 40 1c             	mov    0x1c(%eax),%eax
  101c5f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c63:	c7 04 24 5a 3b 10 00 	movl   $0x103b5a,(%esp)
  101c6a:	e8 fd e5 ff ff       	call   10026c <cprintf>
}
  101c6f:	90                   	nop
  101c70:	c9                   	leave  
  101c71:	c3                   	ret    

00101c72 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101c72:	55                   	push   %ebp
  101c73:	89 e5                	mov    %esp,%ebp
  101c75:	57                   	push   %edi
  101c76:	56                   	push   %esi
  101c77:	53                   	push   %ebx
  101c78:	83 ec 2c             	sub    $0x2c,%esp
    char c;

    switch (tf->tf_trapno) {
  101c7b:	8b 45 08             	mov    0x8(%ebp),%eax
  101c7e:	8b 40 30             	mov    0x30(%eax),%eax
  101c81:	83 f8 2f             	cmp    $0x2f,%eax
  101c84:	77 21                	ja     101ca7 <trap_dispatch+0x35>
  101c86:	83 f8 2e             	cmp    $0x2e,%eax
  101c89:	0f 83 62 02 00 00    	jae    101ef1 <trap_dispatch+0x27f>
  101c8f:	83 f8 21             	cmp    $0x21,%eax
  101c92:	0f 84 9a 00 00 00    	je     101d32 <trap_dispatch+0xc0>
  101c98:	83 f8 24             	cmp    $0x24,%eax
  101c9b:	74 6c                	je     101d09 <trap_dispatch+0x97>
  101c9d:	83 f8 20             	cmp    $0x20,%eax
  101ca0:	74 1c                	je     101cbe <trap_dispatch+0x4c>
  101ca2:	e9 15 02 00 00       	jmp    101ebc <trap_dispatch+0x24a>
  101ca7:	83 f8 78             	cmp    $0x78,%eax
  101caa:	0f 84 ab 00 00 00    	je     101d5b <trap_dispatch+0xe9>
  101cb0:	83 f8 79             	cmp    $0x79,%eax
  101cb3:	0f 84 86 01 00 00    	je     101e3f <trap_dispatch+0x1cd>
  101cb9:	e9 fe 01 00 00       	jmp    101ebc <trap_dispatch+0x24a>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
	count += 1;
  101cbe:	a1 a0 f0 10 00       	mov    0x10f0a0,%eax
  101cc3:	40                   	inc    %eax
  101cc4:	a3 a0 f0 10 00       	mov    %eax,0x10f0a0
	if ((count % TICK_NUM) == 0)
  101cc9:	8b 0d a0 f0 10 00    	mov    0x10f0a0,%ecx
  101ccf:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
  101cd4:	f7 e9                	imul   %ecx
  101cd6:	c1 fa 05             	sar    $0x5,%edx
  101cd9:	89 c8                	mov    %ecx,%eax
  101cdb:	c1 f8 1f             	sar    $0x1f,%eax
  101cde:	29 c2                	sub    %eax,%edx
  101ce0:	89 d0                	mov    %edx,%eax
  101ce2:	c1 e0 02             	shl    $0x2,%eax
  101ce5:	01 d0                	add    %edx,%eax
  101ce7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  101cee:	01 d0                	add    %edx,%eax
  101cf0:	c1 e0 02             	shl    $0x2,%eax
  101cf3:	29 c1                	sub    %eax,%ecx
  101cf5:	89 ca                	mov    %ecx,%edx
  101cf7:	85 d2                	test   %edx,%edx
  101cf9:	0f 85 f5 01 00 00    	jne    101ef4 <trap_dispatch+0x282>
	{
		print_ticks();
  101cff:	e8 0b fb ff ff       	call   10180f <print_ticks>
	}
        break;
  101d04:	e9 eb 01 00 00       	jmp    101ef4 <trap_dispatch+0x282>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101d09:	e8 d1 f8 ff ff       	call   1015df <cons_getc>
  101d0e:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101d11:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101d15:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101d19:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d1d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d21:	c7 04 24 69 3b 10 00 	movl   $0x103b69,(%esp)
  101d28:	e8 3f e5 ff ff       	call   10026c <cprintf>
        break;
  101d2d:	e9 c9 01 00 00       	jmp    101efb <trap_dispatch+0x289>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101d32:	e8 a8 f8 ff ff       	call   1015df <cons_getc>
  101d37:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101d3a:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101d3e:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101d42:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d46:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d4a:	c7 04 24 7b 3b 10 00 	movl   $0x103b7b,(%esp)
  101d51:	e8 16 e5 ff ff       	call   10026c <cprintf>
        break;
  101d56:	e9 a0 01 00 00       	jmp    101efb <trap_dispatch+0x289>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
        if (tf->tf_cs != USER_CS) {
  101d5b:	8b 45 08             	mov    0x8(%ebp),%eax
  101d5e:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101d62:	83 f8 1b             	cmp    $0x1b,%eax
  101d65:	0f 84 8c 01 00 00    	je     101ef7 <trap_dispatch+0x285>
            switchk2u = *tf;
  101d6b:	8b 55 08             	mov    0x8(%ebp),%edx
  101d6e:	b8 40 f9 10 00       	mov    $0x10f940,%eax
  101d73:	bb 4c 00 00 00       	mov    $0x4c,%ebx
  101d78:	89 c1                	mov    %eax,%ecx
  101d7a:	83 e1 01             	and    $0x1,%ecx
  101d7d:	85 c9                	test   %ecx,%ecx
  101d7f:	74 0c                	je     101d8d <trap_dispatch+0x11b>
  101d81:	0f b6 0a             	movzbl (%edx),%ecx
  101d84:	88 08                	mov    %cl,(%eax)
  101d86:	8d 40 01             	lea    0x1(%eax),%eax
  101d89:	8d 52 01             	lea    0x1(%edx),%edx
  101d8c:	4b                   	dec    %ebx
  101d8d:	89 c1                	mov    %eax,%ecx
  101d8f:	83 e1 02             	and    $0x2,%ecx
  101d92:	85 c9                	test   %ecx,%ecx
  101d94:	74 0f                	je     101da5 <trap_dispatch+0x133>
  101d96:	0f b7 0a             	movzwl (%edx),%ecx
  101d99:	66 89 08             	mov    %cx,(%eax)
  101d9c:	8d 40 02             	lea    0x2(%eax),%eax
  101d9f:	8d 52 02             	lea    0x2(%edx),%edx
  101da2:	83 eb 02             	sub    $0x2,%ebx
  101da5:	89 df                	mov    %ebx,%edi
  101da7:	83 e7 fc             	and    $0xfffffffc,%edi
  101daa:	b9 00 00 00 00       	mov    $0x0,%ecx
  101daf:	8b 34 0a             	mov    (%edx,%ecx,1),%esi
  101db2:	89 34 08             	mov    %esi,(%eax,%ecx,1)
  101db5:	83 c1 04             	add    $0x4,%ecx
  101db8:	39 f9                	cmp    %edi,%ecx
  101dba:	72 f3                	jb     101daf <trap_dispatch+0x13d>
  101dbc:	01 c8                	add    %ecx,%eax
  101dbe:	01 ca                	add    %ecx,%edx
  101dc0:	b9 00 00 00 00       	mov    $0x0,%ecx
  101dc5:	89 de                	mov    %ebx,%esi
  101dc7:	83 e6 02             	and    $0x2,%esi
  101dca:	85 f6                	test   %esi,%esi
  101dcc:	74 0b                	je     101dd9 <trap_dispatch+0x167>
  101dce:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
  101dd2:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
  101dd6:	83 c1 02             	add    $0x2,%ecx
  101dd9:	83 e3 01             	and    $0x1,%ebx
  101ddc:	85 db                	test   %ebx,%ebx
  101dde:	74 07                	je     101de7 <trap_dispatch+0x175>
  101de0:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
  101de4:	88 14 08             	mov    %dl,(%eax,%ecx,1)
            switchk2u.tf_cs = USER_CS;
  101de7:	66 c7 05 7c f9 10 00 	movw   $0x1b,0x10f97c
  101dee:	1b 00 
            switchk2u.tf_ds = switchk2u.tf_es = switchk2u.tf_ss = USER_DS;
  101df0:	66 c7 05 88 f9 10 00 	movw   $0x23,0x10f988
  101df7:	23 00 
  101df9:	0f b7 05 88 f9 10 00 	movzwl 0x10f988,%eax
  101e00:	66 a3 68 f9 10 00    	mov    %ax,0x10f968
  101e06:	0f b7 05 68 f9 10 00 	movzwl 0x10f968,%eax
  101e0d:	66 a3 6c f9 10 00    	mov    %ax,0x10f96c
            switchk2u.tf_esp = (uint32_t)tf + sizeof(struct trapframe) - 8;
  101e13:	8b 45 08             	mov    0x8(%ebp),%eax
  101e16:	83 c0 44             	add    $0x44,%eax
  101e19:	a3 84 f9 10 00       	mov    %eax,0x10f984
		
            // set eflags, make sure ucore can use io under user mode.
            // if CPL > IOPL, then cpu will generate a general protection.
            switchk2u.tf_eflags |= FL_IOPL_MASK;
  101e1e:	a1 80 f9 10 00       	mov    0x10f980,%eax
  101e23:	0d 00 30 00 00       	or     $0x3000,%eax
  101e28:	a3 80 f9 10 00       	mov    %eax,0x10f980
		
            // set temporary stack
            // then iret will jump to the right stack
            *((uint32_t *)tf - 1) = (uint32_t)&switchk2u;
  101e2d:	8b 45 08             	mov    0x8(%ebp),%eax
  101e30:	83 e8 04             	sub    $0x4,%eax
  101e33:	ba 40 f9 10 00       	mov    $0x10f940,%edx
  101e38:	89 10                	mov    %edx,(%eax)
        }
        break;
  101e3a:	e9 b8 00 00 00       	jmp    101ef7 <trap_dispatch+0x285>
    case T_SWITCH_TOK:
        if (tf->tf_cs != KERNEL_CS) {
  101e3f:	8b 45 08             	mov    0x8(%ebp),%eax
  101e42:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e46:	83 f8 08             	cmp    $0x8,%eax
  101e49:	0f 84 ab 00 00 00    	je     101efa <trap_dispatch+0x288>
            tf->tf_cs = KERNEL_CS;
  101e4f:	8b 45 08             	mov    0x8(%ebp),%eax
  101e52:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
            tf->tf_ds = tf->tf_es = KERNEL_DS;
  101e58:	8b 45 08             	mov    0x8(%ebp),%eax
  101e5b:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101e61:	8b 45 08             	mov    0x8(%ebp),%eax
  101e64:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101e68:	8b 45 08             	mov    0x8(%ebp),%eax
  101e6b:	66 89 50 2c          	mov    %dx,0x2c(%eax)
            tf->tf_eflags |= 0x3000;
  101e6f:	8b 45 08             	mov    0x8(%ebp),%eax
  101e72:	8b 40 40             	mov    0x40(%eax),%eax
  101e75:	0d 00 30 00 00       	or     $0x3000,%eax
  101e7a:	89 c2                	mov    %eax,%edx
  101e7c:	8b 45 08             	mov    0x8(%ebp),%eax
  101e7f:	89 50 40             	mov    %edx,0x40(%eax)
            switchu2k = (struct trapframe *)(tf->tf_esp - (sizeof(struct trapframe) - 8));
  101e82:	8b 45 08             	mov    0x8(%ebp),%eax
  101e85:	8b 40 44             	mov    0x44(%eax),%eax
  101e88:	83 e8 44             	sub    $0x44,%eax
  101e8b:	a3 8c f9 10 00       	mov    %eax,0x10f98c
            memmove(switchu2k, tf, sizeof(struct trapframe) - 8);
  101e90:	a1 8c f9 10 00       	mov    0x10f98c,%eax
  101e95:	c7 44 24 08 44 00 00 	movl   $0x44,0x8(%esp)
  101e9c:	00 
  101e9d:	8b 55 08             	mov    0x8(%ebp),%edx
  101ea0:	89 54 24 04          	mov    %edx,0x4(%esp)
  101ea4:	89 04 24             	mov    %eax,(%esp)
  101ea7:	e8 9a 0f 00 00       	call   102e46 <memmove>
            *((uint32_t *)tf - 1) = (uint32_t)switchu2k;
  101eac:	8b 15 8c f9 10 00    	mov    0x10f98c,%edx
  101eb2:	8b 45 08             	mov    0x8(%ebp),%eax
  101eb5:	83 e8 04             	sub    $0x4,%eax
  101eb8:	89 10                	mov    %edx,(%eax)
        }
        break;
  101eba:	eb 3e                	jmp    101efa <trap_dispatch+0x288>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101ebc:	8b 45 08             	mov    0x8(%ebp),%eax
  101ebf:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101ec3:	83 e0 03             	and    $0x3,%eax
  101ec6:	85 c0                	test   %eax,%eax
  101ec8:	75 31                	jne    101efb <trap_dispatch+0x289>
            print_trapframe(tf);
  101eca:	8b 45 08             	mov    0x8(%ebp),%eax
  101ecd:	89 04 24             	mov    %eax,(%esp)
  101ed0:	e8 32 fb ff ff       	call   101a07 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101ed5:	c7 44 24 08 8a 3b 10 	movl   $0x103b8a,0x8(%esp)
  101edc:	00 
  101edd:	c7 44 24 04 d2 00 00 	movl   $0xd2,0x4(%esp)
  101ee4:	00 
  101ee5:	c7 04 24 ae 39 10 00 	movl   $0x1039ae,(%esp)
  101eec:	e8 d2 e4 ff ff       	call   1003c3 <__panic>
        break;
  101ef1:	90                   	nop
  101ef2:	eb 07                	jmp    101efb <trap_dispatch+0x289>
        break;
  101ef4:	90                   	nop
  101ef5:	eb 04                	jmp    101efb <trap_dispatch+0x289>
        break;
  101ef7:	90                   	nop
  101ef8:	eb 01                	jmp    101efb <trap_dispatch+0x289>
        break;
  101efa:	90                   	nop
        }
    }
}
  101efb:	90                   	nop
  101efc:	83 c4 2c             	add    $0x2c,%esp
  101eff:	5b                   	pop    %ebx
  101f00:	5e                   	pop    %esi
  101f01:	5f                   	pop    %edi
  101f02:	5d                   	pop    %ebp
  101f03:	c3                   	ret    

00101f04 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101f04:	55                   	push   %ebp
  101f05:	89 e5                	mov    %esp,%ebp
  101f07:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101f0a:	8b 45 08             	mov    0x8(%ebp),%eax
  101f0d:	89 04 24             	mov    %eax,(%esp)
  101f10:	e8 5d fd ff ff       	call   101c72 <trap_dispatch>
}
  101f15:	90                   	nop
  101f16:	c9                   	leave  
  101f17:	c3                   	ret    

00101f18 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101f18:	6a 00                	push   $0x0
  pushl $0
  101f1a:	6a 00                	push   $0x0
  jmp __alltraps
  101f1c:	e9 69 0a 00 00       	jmp    10298a <__alltraps>

00101f21 <vector1>:
.globl vector1
vector1:
  pushl $0
  101f21:	6a 00                	push   $0x0
  pushl $1
  101f23:	6a 01                	push   $0x1
  jmp __alltraps
  101f25:	e9 60 0a 00 00       	jmp    10298a <__alltraps>

00101f2a <vector2>:
.globl vector2
vector2:
  pushl $0
  101f2a:	6a 00                	push   $0x0
  pushl $2
  101f2c:	6a 02                	push   $0x2
  jmp __alltraps
  101f2e:	e9 57 0a 00 00       	jmp    10298a <__alltraps>

00101f33 <vector3>:
.globl vector3
vector3:
  pushl $0
  101f33:	6a 00                	push   $0x0
  pushl $3
  101f35:	6a 03                	push   $0x3
  jmp __alltraps
  101f37:	e9 4e 0a 00 00       	jmp    10298a <__alltraps>

00101f3c <vector4>:
.globl vector4
vector4:
  pushl $0
  101f3c:	6a 00                	push   $0x0
  pushl $4
  101f3e:	6a 04                	push   $0x4
  jmp __alltraps
  101f40:	e9 45 0a 00 00       	jmp    10298a <__alltraps>

00101f45 <vector5>:
.globl vector5
vector5:
  pushl $0
  101f45:	6a 00                	push   $0x0
  pushl $5
  101f47:	6a 05                	push   $0x5
  jmp __alltraps
  101f49:	e9 3c 0a 00 00       	jmp    10298a <__alltraps>

00101f4e <vector6>:
.globl vector6
vector6:
  pushl $0
  101f4e:	6a 00                	push   $0x0
  pushl $6
  101f50:	6a 06                	push   $0x6
  jmp __alltraps
  101f52:	e9 33 0a 00 00       	jmp    10298a <__alltraps>

00101f57 <vector7>:
.globl vector7
vector7:
  pushl $0
  101f57:	6a 00                	push   $0x0
  pushl $7
  101f59:	6a 07                	push   $0x7
  jmp __alltraps
  101f5b:	e9 2a 0a 00 00       	jmp    10298a <__alltraps>

00101f60 <vector8>:
.globl vector8
vector8:
  pushl $8
  101f60:	6a 08                	push   $0x8
  jmp __alltraps
  101f62:	e9 23 0a 00 00       	jmp    10298a <__alltraps>

00101f67 <vector9>:
.globl vector9
vector9:
  pushl $0
  101f67:	6a 00                	push   $0x0
  pushl $9
  101f69:	6a 09                	push   $0x9
  jmp __alltraps
  101f6b:	e9 1a 0a 00 00       	jmp    10298a <__alltraps>

00101f70 <vector10>:
.globl vector10
vector10:
  pushl $10
  101f70:	6a 0a                	push   $0xa
  jmp __alltraps
  101f72:	e9 13 0a 00 00       	jmp    10298a <__alltraps>

00101f77 <vector11>:
.globl vector11
vector11:
  pushl $11
  101f77:	6a 0b                	push   $0xb
  jmp __alltraps
  101f79:	e9 0c 0a 00 00       	jmp    10298a <__alltraps>

00101f7e <vector12>:
.globl vector12
vector12:
  pushl $12
  101f7e:	6a 0c                	push   $0xc
  jmp __alltraps
  101f80:	e9 05 0a 00 00       	jmp    10298a <__alltraps>

00101f85 <vector13>:
.globl vector13
vector13:
  pushl $13
  101f85:	6a 0d                	push   $0xd
  jmp __alltraps
  101f87:	e9 fe 09 00 00       	jmp    10298a <__alltraps>

00101f8c <vector14>:
.globl vector14
vector14:
  pushl $14
  101f8c:	6a 0e                	push   $0xe
  jmp __alltraps
  101f8e:	e9 f7 09 00 00       	jmp    10298a <__alltraps>

00101f93 <vector15>:
.globl vector15
vector15:
  pushl $0
  101f93:	6a 00                	push   $0x0
  pushl $15
  101f95:	6a 0f                	push   $0xf
  jmp __alltraps
  101f97:	e9 ee 09 00 00       	jmp    10298a <__alltraps>

00101f9c <vector16>:
.globl vector16
vector16:
  pushl $0
  101f9c:	6a 00                	push   $0x0
  pushl $16
  101f9e:	6a 10                	push   $0x10
  jmp __alltraps
  101fa0:	e9 e5 09 00 00       	jmp    10298a <__alltraps>

00101fa5 <vector17>:
.globl vector17
vector17:
  pushl $17
  101fa5:	6a 11                	push   $0x11
  jmp __alltraps
  101fa7:	e9 de 09 00 00       	jmp    10298a <__alltraps>

00101fac <vector18>:
.globl vector18
vector18:
  pushl $0
  101fac:	6a 00                	push   $0x0
  pushl $18
  101fae:	6a 12                	push   $0x12
  jmp __alltraps
  101fb0:	e9 d5 09 00 00       	jmp    10298a <__alltraps>

00101fb5 <vector19>:
.globl vector19
vector19:
  pushl $0
  101fb5:	6a 00                	push   $0x0
  pushl $19
  101fb7:	6a 13                	push   $0x13
  jmp __alltraps
  101fb9:	e9 cc 09 00 00       	jmp    10298a <__alltraps>

00101fbe <vector20>:
.globl vector20
vector20:
  pushl $0
  101fbe:	6a 00                	push   $0x0
  pushl $20
  101fc0:	6a 14                	push   $0x14
  jmp __alltraps
  101fc2:	e9 c3 09 00 00       	jmp    10298a <__alltraps>

00101fc7 <vector21>:
.globl vector21
vector21:
  pushl $0
  101fc7:	6a 00                	push   $0x0
  pushl $21
  101fc9:	6a 15                	push   $0x15
  jmp __alltraps
  101fcb:	e9 ba 09 00 00       	jmp    10298a <__alltraps>

00101fd0 <vector22>:
.globl vector22
vector22:
  pushl $0
  101fd0:	6a 00                	push   $0x0
  pushl $22
  101fd2:	6a 16                	push   $0x16
  jmp __alltraps
  101fd4:	e9 b1 09 00 00       	jmp    10298a <__alltraps>

00101fd9 <vector23>:
.globl vector23
vector23:
  pushl $0
  101fd9:	6a 00                	push   $0x0
  pushl $23
  101fdb:	6a 17                	push   $0x17
  jmp __alltraps
  101fdd:	e9 a8 09 00 00       	jmp    10298a <__alltraps>

00101fe2 <vector24>:
.globl vector24
vector24:
  pushl $0
  101fe2:	6a 00                	push   $0x0
  pushl $24
  101fe4:	6a 18                	push   $0x18
  jmp __alltraps
  101fe6:	e9 9f 09 00 00       	jmp    10298a <__alltraps>

00101feb <vector25>:
.globl vector25
vector25:
  pushl $0
  101feb:	6a 00                	push   $0x0
  pushl $25
  101fed:	6a 19                	push   $0x19
  jmp __alltraps
  101fef:	e9 96 09 00 00       	jmp    10298a <__alltraps>

00101ff4 <vector26>:
.globl vector26
vector26:
  pushl $0
  101ff4:	6a 00                	push   $0x0
  pushl $26
  101ff6:	6a 1a                	push   $0x1a
  jmp __alltraps
  101ff8:	e9 8d 09 00 00       	jmp    10298a <__alltraps>

00101ffd <vector27>:
.globl vector27
vector27:
  pushl $0
  101ffd:	6a 00                	push   $0x0
  pushl $27
  101fff:	6a 1b                	push   $0x1b
  jmp __alltraps
  102001:	e9 84 09 00 00       	jmp    10298a <__alltraps>

00102006 <vector28>:
.globl vector28
vector28:
  pushl $0
  102006:	6a 00                	push   $0x0
  pushl $28
  102008:	6a 1c                	push   $0x1c
  jmp __alltraps
  10200a:	e9 7b 09 00 00       	jmp    10298a <__alltraps>

0010200f <vector29>:
.globl vector29
vector29:
  pushl $0
  10200f:	6a 00                	push   $0x0
  pushl $29
  102011:	6a 1d                	push   $0x1d
  jmp __alltraps
  102013:	e9 72 09 00 00       	jmp    10298a <__alltraps>

00102018 <vector30>:
.globl vector30
vector30:
  pushl $0
  102018:	6a 00                	push   $0x0
  pushl $30
  10201a:	6a 1e                	push   $0x1e
  jmp __alltraps
  10201c:	e9 69 09 00 00       	jmp    10298a <__alltraps>

00102021 <vector31>:
.globl vector31
vector31:
  pushl $0
  102021:	6a 00                	push   $0x0
  pushl $31
  102023:	6a 1f                	push   $0x1f
  jmp __alltraps
  102025:	e9 60 09 00 00       	jmp    10298a <__alltraps>

0010202a <vector32>:
.globl vector32
vector32:
  pushl $0
  10202a:	6a 00                	push   $0x0
  pushl $32
  10202c:	6a 20                	push   $0x20
  jmp __alltraps
  10202e:	e9 57 09 00 00       	jmp    10298a <__alltraps>

00102033 <vector33>:
.globl vector33
vector33:
  pushl $0
  102033:	6a 00                	push   $0x0
  pushl $33
  102035:	6a 21                	push   $0x21
  jmp __alltraps
  102037:	e9 4e 09 00 00       	jmp    10298a <__alltraps>

0010203c <vector34>:
.globl vector34
vector34:
  pushl $0
  10203c:	6a 00                	push   $0x0
  pushl $34
  10203e:	6a 22                	push   $0x22
  jmp __alltraps
  102040:	e9 45 09 00 00       	jmp    10298a <__alltraps>

00102045 <vector35>:
.globl vector35
vector35:
  pushl $0
  102045:	6a 00                	push   $0x0
  pushl $35
  102047:	6a 23                	push   $0x23
  jmp __alltraps
  102049:	e9 3c 09 00 00       	jmp    10298a <__alltraps>

0010204e <vector36>:
.globl vector36
vector36:
  pushl $0
  10204e:	6a 00                	push   $0x0
  pushl $36
  102050:	6a 24                	push   $0x24
  jmp __alltraps
  102052:	e9 33 09 00 00       	jmp    10298a <__alltraps>

00102057 <vector37>:
.globl vector37
vector37:
  pushl $0
  102057:	6a 00                	push   $0x0
  pushl $37
  102059:	6a 25                	push   $0x25
  jmp __alltraps
  10205b:	e9 2a 09 00 00       	jmp    10298a <__alltraps>

00102060 <vector38>:
.globl vector38
vector38:
  pushl $0
  102060:	6a 00                	push   $0x0
  pushl $38
  102062:	6a 26                	push   $0x26
  jmp __alltraps
  102064:	e9 21 09 00 00       	jmp    10298a <__alltraps>

00102069 <vector39>:
.globl vector39
vector39:
  pushl $0
  102069:	6a 00                	push   $0x0
  pushl $39
  10206b:	6a 27                	push   $0x27
  jmp __alltraps
  10206d:	e9 18 09 00 00       	jmp    10298a <__alltraps>

00102072 <vector40>:
.globl vector40
vector40:
  pushl $0
  102072:	6a 00                	push   $0x0
  pushl $40
  102074:	6a 28                	push   $0x28
  jmp __alltraps
  102076:	e9 0f 09 00 00       	jmp    10298a <__alltraps>

0010207b <vector41>:
.globl vector41
vector41:
  pushl $0
  10207b:	6a 00                	push   $0x0
  pushl $41
  10207d:	6a 29                	push   $0x29
  jmp __alltraps
  10207f:	e9 06 09 00 00       	jmp    10298a <__alltraps>

00102084 <vector42>:
.globl vector42
vector42:
  pushl $0
  102084:	6a 00                	push   $0x0
  pushl $42
  102086:	6a 2a                	push   $0x2a
  jmp __alltraps
  102088:	e9 fd 08 00 00       	jmp    10298a <__alltraps>

0010208d <vector43>:
.globl vector43
vector43:
  pushl $0
  10208d:	6a 00                	push   $0x0
  pushl $43
  10208f:	6a 2b                	push   $0x2b
  jmp __alltraps
  102091:	e9 f4 08 00 00       	jmp    10298a <__alltraps>

00102096 <vector44>:
.globl vector44
vector44:
  pushl $0
  102096:	6a 00                	push   $0x0
  pushl $44
  102098:	6a 2c                	push   $0x2c
  jmp __alltraps
  10209a:	e9 eb 08 00 00       	jmp    10298a <__alltraps>

0010209f <vector45>:
.globl vector45
vector45:
  pushl $0
  10209f:	6a 00                	push   $0x0
  pushl $45
  1020a1:	6a 2d                	push   $0x2d
  jmp __alltraps
  1020a3:	e9 e2 08 00 00       	jmp    10298a <__alltraps>

001020a8 <vector46>:
.globl vector46
vector46:
  pushl $0
  1020a8:	6a 00                	push   $0x0
  pushl $46
  1020aa:	6a 2e                	push   $0x2e
  jmp __alltraps
  1020ac:	e9 d9 08 00 00       	jmp    10298a <__alltraps>

001020b1 <vector47>:
.globl vector47
vector47:
  pushl $0
  1020b1:	6a 00                	push   $0x0
  pushl $47
  1020b3:	6a 2f                	push   $0x2f
  jmp __alltraps
  1020b5:	e9 d0 08 00 00       	jmp    10298a <__alltraps>

001020ba <vector48>:
.globl vector48
vector48:
  pushl $0
  1020ba:	6a 00                	push   $0x0
  pushl $48
  1020bc:	6a 30                	push   $0x30
  jmp __alltraps
  1020be:	e9 c7 08 00 00       	jmp    10298a <__alltraps>

001020c3 <vector49>:
.globl vector49
vector49:
  pushl $0
  1020c3:	6a 00                	push   $0x0
  pushl $49
  1020c5:	6a 31                	push   $0x31
  jmp __alltraps
  1020c7:	e9 be 08 00 00       	jmp    10298a <__alltraps>

001020cc <vector50>:
.globl vector50
vector50:
  pushl $0
  1020cc:	6a 00                	push   $0x0
  pushl $50
  1020ce:	6a 32                	push   $0x32
  jmp __alltraps
  1020d0:	e9 b5 08 00 00       	jmp    10298a <__alltraps>

001020d5 <vector51>:
.globl vector51
vector51:
  pushl $0
  1020d5:	6a 00                	push   $0x0
  pushl $51
  1020d7:	6a 33                	push   $0x33
  jmp __alltraps
  1020d9:	e9 ac 08 00 00       	jmp    10298a <__alltraps>

001020de <vector52>:
.globl vector52
vector52:
  pushl $0
  1020de:	6a 00                	push   $0x0
  pushl $52
  1020e0:	6a 34                	push   $0x34
  jmp __alltraps
  1020e2:	e9 a3 08 00 00       	jmp    10298a <__alltraps>

001020e7 <vector53>:
.globl vector53
vector53:
  pushl $0
  1020e7:	6a 00                	push   $0x0
  pushl $53
  1020e9:	6a 35                	push   $0x35
  jmp __alltraps
  1020eb:	e9 9a 08 00 00       	jmp    10298a <__alltraps>

001020f0 <vector54>:
.globl vector54
vector54:
  pushl $0
  1020f0:	6a 00                	push   $0x0
  pushl $54
  1020f2:	6a 36                	push   $0x36
  jmp __alltraps
  1020f4:	e9 91 08 00 00       	jmp    10298a <__alltraps>

001020f9 <vector55>:
.globl vector55
vector55:
  pushl $0
  1020f9:	6a 00                	push   $0x0
  pushl $55
  1020fb:	6a 37                	push   $0x37
  jmp __alltraps
  1020fd:	e9 88 08 00 00       	jmp    10298a <__alltraps>

00102102 <vector56>:
.globl vector56
vector56:
  pushl $0
  102102:	6a 00                	push   $0x0
  pushl $56
  102104:	6a 38                	push   $0x38
  jmp __alltraps
  102106:	e9 7f 08 00 00       	jmp    10298a <__alltraps>

0010210b <vector57>:
.globl vector57
vector57:
  pushl $0
  10210b:	6a 00                	push   $0x0
  pushl $57
  10210d:	6a 39                	push   $0x39
  jmp __alltraps
  10210f:	e9 76 08 00 00       	jmp    10298a <__alltraps>

00102114 <vector58>:
.globl vector58
vector58:
  pushl $0
  102114:	6a 00                	push   $0x0
  pushl $58
  102116:	6a 3a                	push   $0x3a
  jmp __alltraps
  102118:	e9 6d 08 00 00       	jmp    10298a <__alltraps>

0010211d <vector59>:
.globl vector59
vector59:
  pushl $0
  10211d:	6a 00                	push   $0x0
  pushl $59
  10211f:	6a 3b                	push   $0x3b
  jmp __alltraps
  102121:	e9 64 08 00 00       	jmp    10298a <__alltraps>

00102126 <vector60>:
.globl vector60
vector60:
  pushl $0
  102126:	6a 00                	push   $0x0
  pushl $60
  102128:	6a 3c                	push   $0x3c
  jmp __alltraps
  10212a:	e9 5b 08 00 00       	jmp    10298a <__alltraps>

0010212f <vector61>:
.globl vector61
vector61:
  pushl $0
  10212f:	6a 00                	push   $0x0
  pushl $61
  102131:	6a 3d                	push   $0x3d
  jmp __alltraps
  102133:	e9 52 08 00 00       	jmp    10298a <__alltraps>

00102138 <vector62>:
.globl vector62
vector62:
  pushl $0
  102138:	6a 00                	push   $0x0
  pushl $62
  10213a:	6a 3e                	push   $0x3e
  jmp __alltraps
  10213c:	e9 49 08 00 00       	jmp    10298a <__alltraps>

00102141 <vector63>:
.globl vector63
vector63:
  pushl $0
  102141:	6a 00                	push   $0x0
  pushl $63
  102143:	6a 3f                	push   $0x3f
  jmp __alltraps
  102145:	e9 40 08 00 00       	jmp    10298a <__alltraps>

0010214a <vector64>:
.globl vector64
vector64:
  pushl $0
  10214a:	6a 00                	push   $0x0
  pushl $64
  10214c:	6a 40                	push   $0x40
  jmp __alltraps
  10214e:	e9 37 08 00 00       	jmp    10298a <__alltraps>

00102153 <vector65>:
.globl vector65
vector65:
  pushl $0
  102153:	6a 00                	push   $0x0
  pushl $65
  102155:	6a 41                	push   $0x41
  jmp __alltraps
  102157:	e9 2e 08 00 00       	jmp    10298a <__alltraps>

0010215c <vector66>:
.globl vector66
vector66:
  pushl $0
  10215c:	6a 00                	push   $0x0
  pushl $66
  10215e:	6a 42                	push   $0x42
  jmp __alltraps
  102160:	e9 25 08 00 00       	jmp    10298a <__alltraps>

00102165 <vector67>:
.globl vector67
vector67:
  pushl $0
  102165:	6a 00                	push   $0x0
  pushl $67
  102167:	6a 43                	push   $0x43
  jmp __alltraps
  102169:	e9 1c 08 00 00       	jmp    10298a <__alltraps>

0010216e <vector68>:
.globl vector68
vector68:
  pushl $0
  10216e:	6a 00                	push   $0x0
  pushl $68
  102170:	6a 44                	push   $0x44
  jmp __alltraps
  102172:	e9 13 08 00 00       	jmp    10298a <__alltraps>

00102177 <vector69>:
.globl vector69
vector69:
  pushl $0
  102177:	6a 00                	push   $0x0
  pushl $69
  102179:	6a 45                	push   $0x45
  jmp __alltraps
  10217b:	e9 0a 08 00 00       	jmp    10298a <__alltraps>

00102180 <vector70>:
.globl vector70
vector70:
  pushl $0
  102180:	6a 00                	push   $0x0
  pushl $70
  102182:	6a 46                	push   $0x46
  jmp __alltraps
  102184:	e9 01 08 00 00       	jmp    10298a <__alltraps>

00102189 <vector71>:
.globl vector71
vector71:
  pushl $0
  102189:	6a 00                	push   $0x0
  pushl $71
  10218b:	6a 47                	push   $0x47
  jmp __alltraps
  10218d:	e9 f8 07 00 00       	jmp    10298a <__alltraps>

00102192 <vector72>:
.globl vector72
vector72:
  pushl $0
  102192:	6a 00                	push   $0x0
  pushl $72
  102194:	6a 48                	push   $0x48
  jmp __alltraps
  102196:	e9 ef 07 00 00       	jmp    10298a <__alltraps>

0010219b <vector73>:
.globl vector73
vector73:
  pushl $0
  10219b:	6a 00                	push   $0x0
  pushl $73
  10219d:	6a 49                	push   $0x49
  jmp __alltraps
  10219f:	e9 e6 07 00 00       	jmp    10298a <__alltraps>

001021a4 <vector74>:
.globl vector74
vector74:
  pushl $0
  1021a4:	6a 00                	push   $0x0
  pushl $74
  1021a6:	6a 4a                	push   $0x4a
  jmp __alltraps
  1021a8:	e9 dd 07 00 00       	jmp    10298a <__alltraps>

001021ad <vector75>:
.globl vector75
vector75:
  pushl $0
  1021ad:	6a 00                	push   $0x0
  pushl $75
  1021af:	6a 4b                	push   $0x4b
  jmp __alltraps
  1021b1:	e9 d4 07 00 00       	jmp    10298a <__alltraps>

001021b6 <vector76>:
.globl vector76
vector76:
  pushl $0
  1021b6:	6a 00                	push   $0x0
  pushl $76
  1021b8:	6a 4c                	push   $0x4c
  jmp __alltraps
  1021ba:	e9 cb 07 00 00       	jmp    10298a <__alltraps>

001021bf <vector77>:
.globl vector77
vector77:
  pushl $0
  1021bf:	6a 00                	push   $0x0
  pushl $77
  1021c1:	6a 4d                	push   $0x4d
  jmp __alltraps
  1021c3:	e9 c2 07 00 00       	jmp    10298a <__alltraps>

001021c8 <vector78>:
.globl vector78
vector78:
  pushl $0
  1021c8:	6a 00                	push   $0x0
  pushl $78
  1021ca:	6a 4e                	push   $0x4e
  jmp __alltraps
  1021cc:	e9 b9 07 00 00       	jmp    10298a <__alltraps>

001021d1 <vector79>:
.globl vector79
vector79:
  pushl $0
  1021d1:	6a 00                	push   $0x0
  pushl $79
  1021d3:	6a 4f                	push   $0x4f
  jmp __alltraps
  1021d5:	e9 b0 07 00 00       	jmp    10298a <__alltraps>

001021da <vector80>:
.globl vector80
vector80:
  pushl $0
  1021da:	6a 00                	push   $0x0
  pushl $80
  1021dc:	6a 50                	push   $0x50
  jmp __alltraps
  1021de:	e9 a7 07 00 00       	jmp    10298a <__alltraps>

001021e3 <vector81>:
.globl vector81
vector81:
  pushl $0
  1021e3:	6a 00                	push   $0x0
  pushl $81
  1021e5:	6a 51                	push   $0x51
  jmp __alltraps
  1021e7:	e9 9e 07 00 00       	jmp    10298a <__alltraps>

001021ec <vector82>:
.globl vector82
vector82:
  pushl $0
  1021ec:	6a 00                	push   $0x0
  pushl $82
  1021ee:	6a 52                	push   $0x52
  jmp __alltraps
  1021f0:	e9 95 07 00 00       	jmp    10298a <__alltraps>

001021f5 <vector83>:
.globl vector83
vector83:
  pushl $0
  1021f5:	6a 00                	push   $0x0
  pushl $83
  1021f7:	6a 53                	push   $0x53
  jmp __alltraps
  1021f9:	e9 8c 07 00 00       	jmp    10298a <__alltraps>

001021fe <vector84>:
.globl vector84
vector84:
  pushl $0
  1021fe:	6a 00                	push   $0x0
  pushl $84
  102200:	6a 54                	push   $0x54
  jmp __alltraps
  102202:	e9 83 07 00 00       	jmp    10298a <__alltraps>

00102207 <vector85>:
.globl vector85
vector85:
  pushl $0
  102207:	6a 00                	push   $0x0
  pushl $85
  102209:	6a 55                	push   $0x55
  jmp __alltraps
  10220b:	e9 7a 07 00 00       	jmp    10298a <__alltraps>

00102210 <vector86>:
.globl vector86
vector86:
  pushl $0
  102210:	6a 00                	push   $0x0
  pushl $86
  102212:	6a 56                	push   $0x56
  jmp __alltraps
  102214:	e9 71 07 00 00       	jmp    10298a <__alltraps>

00102219 <vector87>:
.globl vector87
vector87:
  pushl $0
  102219:	6a 00                	push   $0x0
  pushl $87
  10221b:	6a 57                	push   $0x57
  jmp __alltraps
  10221d:	e9 68 07 00 00       	jmp    10298a <__alltraps>

00102222 <vector88>:
.globl vector88
vector88:
  pushl $0
  102222:	6a 00                	push   $0x0
  pushl $88
  102224:	6a 58                	push   $0x58
  jmp __alltraps
  102226:	e9 5f 07 00 00       	jmp    10298a <__alltraps>

0010222b <vector89>:
.globl vector89
vector89:
  pushl $0
  10222b:	6a 00                	push   $0x0
  pushl $89
  10222d:	6a 59                	push   $0x59
  jmp __alltraps
  10222f:	e9 56 07 00 00       	jmp    10298a <__alltraps>

00102234 <vector90>:
.globl vector90
vector90:
  pushl $0
  102234:	6a 00                	push   $0x0
  pushl $90
  102236:	6a 5a                	push   $0x5a
  jmp __alltraps
  102238:	e9 4d 07 00 00       	jmp    10298a <__alltraps>

0010223d <vector91>:
.globl vector91
vector91:
  pushl $0
  10223d:	6a 00                	push   $0x0
  pushl $91
  10223f:	6a 5b                	push   $0x5b
  jmp __alltraps
  102241:	e9 44 07 00 00       	jmp    10298a <__alltraps>

00102246 <vector92>:
.globl vector92
vector92:
  pushl $0
  102246:	6a 00                	push   $0x0
  pushl $92
  102248:	6a 5c                	push   $0x5c
  jmp __alltraps
  10224a:	e9 3b 07 00 00       	jmp    10298a <__alltraps>

0010224f <vector93>:
.globl vector93
vector93:
  pushl $0
  10224f:	6a 00                	push   $0x0
  pushl $93
  102251:	6a 5d                	push   $0x5d
  jmp __alltraps
  102253:	e9 32 07 00 00       	jmp    10298a <__alltraps>

00102258 <vector94>:
.globl vector94
vector94:
  pushl $0
  102258:	6a 00                	push   $0x0
  pushl $94
  10225a:	6a 5e                	push   $0x5e
  jmp __alltraps
  10225c:	e9 29 07 00 00       	jmp    10298a <__alltraps>

00102261 <vector95>:
.globl vector95
vector95:
  pushl $0
  102261:	6a 00                	push   $0x0
  pushl $95
  102263:	6a 5f                	push   $0x5f
  jmp __alltraps
  102265:	e9 20 07 00 00       	jmp    10298a <__alltraps>

0010226a <vector96>:
.globl vector96
vector96:
  pushl $0
  10226a:	6a 00                	push   $0x0
  pushl $96
  10226c:	6a 60                	push   $0x60
  jmp __alltraps
  10226e:	e9 17 07 00 00       	jmp    10298a <__alltraps>

00102273 <vector97>:
.globl vector97
vector97:
  pushl $0
  102273:	6a 00                	push   $0x0
  pushl $97
  102275:	6a 61                	push   $0x61
  jmp __alltraps
  102277:	e9 0e 07 00 00       	jmp    10298a <__alltraps>

0010227c <vector98>:
.globl vector98
vector98:
  pushl $0
  10227c:	6a 00                	push   $0x0
  pushl $98
  10227e:	6a 62                	push   $0x62
  jmp __alltraps
  102280:	e9 05 07 00 00       	jmp    10298a <__alltraps>

00102285 <vector99>:
.globl vector99
vector99:
  pushl $0
  102285:	6a 00                	push   $0x0
  pushl $99
  102287:	6a 63                	push   $0x63
  jmp __alltraps
  102289:	e9 fc 06 00 00       	jmp    10298a <__alltraps>

0010228e <vector100>:
.globl vector100
vector100:
  pushl $0
  10228e:	6a 00                	push   $0x0
  pushl $100
  102290:	6a 64                	push   $0x64
  jmp __alltraps
  102292:	e9 f3 06 00 00       	jmp    10298a <__alltraps>

00102297 <vector101>:
.globl vector101
vector101:
  pushl $0
  102297:	6a 00                	push   $0x0
  pushl $101
  102299:	6a 65                	push   $0x65
  jmp __alltraps
  10229b:	e9 ea 06 00 00       	jmp    10298a <__alltraps>

001022a0 <vector102>:
.globl vector102
vector102:
  pushl $0
  1022a0:	6a 00                	push   $0x0
  pushl $102
  1022a2:	6a 66                	push   $0x66
  jmp __alltraps
  1022a4:	e9 e1 06 00 00       	jmp    10298a <__alltraps>

001022a9 <vector103>:
.globl vector103
vector103:
  pushl $0
  1022a9:	6a 00                	push   $0x0
  pushl $103
  1022ab:	6a 67                	push   $0x67
  jmp __alltraps
  1022ad:	e9 d8 06 00 00       	jmp    10298a <__alltraps>

001022b2 <vector104>:
.globl vector104
vector104:
  pushl $0
  1022b2:	6a 00                	push   $0x0
  pushl $104
  1022b4:	6a 68                	push   $0x68
  jmp __alltraps
  1022b6:	e9 cf 06 00 00       	jmp    10298a <__alltraps>

001022bb <vector105>:
.globl vector105
vector105:
  pushl $0
  1022bb:	6a 00                	push   $0x0
  pushl $105
  1022bd:	6a 69                	push   $0x69
  jmp __alltraps
  1022bf:	e9 c6 06 00 00       	jmp    10298a <__alltraps>

001022c4 <vector106>:
.globl vector106
vector106:
  pushl $0
  1022c4:	6a 00                	push   $0x0
  pushl $106
  1022c6:	6a 6a                	push   $0x6a
  jmp __alltraps
  1022c8:	e9 bd 06 00 00       	jmp    10298a <__alltraps>

001022cd <vector107>:
.globl vector107
vector107:
  pushl $0
  1022cd:	6a 00                	push   $0x0
  pushl $107
  1022cf:	6a 6b                	push   $0x6b
  jmp __alltraps
  1022d1:	e9 b4 06 00 00       	jmp    10298a <__alltraps>

001022d6 <vector108>:
.globl vector108
vector108:
  pushl $0
  1022d6:	6a 00                	push   $0x0
  pushl $108
  1022d8:	6a 6c                	push   $0x6c
  jmp __alltraps
  1022da:	e9 ab 06 00 00       	jmp    10298a <__alltraps>

001022df <vector109>:
.globl vector109
vector109:
  pushl $0
  1022df:	6a 00                	push   $0x0
  pushl $109
  1022e1:	6a 6d                	push   $0x6d
  jmp __alltraps
  1022e3:	e9 a2 06 00 00       	jmp    10298a <__alltraps>

001022e8 <vector110>:
.globl vector110
vector110:
  pushl $0
  1022e8:	6a 00                	push   $0x0
  pushl $110
  1022ea:	6a 6e                	push   $0x6e
  jmp __alltraps
  1022ec:	e9 99 06 00 00       	jmp    10298a <__alltraps>

001022f1 <vector111>:
.globl vector111
vector111:
  pushl $0
  1022f1:	6a 00                	push   $0x0
  pushl $111
  1022f3:	6a 6f                	push   $0x6f
  jmp __alltraps
  1022f5:	e9 90 06 00 00       	jmp    10298a <__alltraps>

001022fa <vector112>:
.globl vector112
vector112:
  pushl $0
  1022fa:	6a 00                	push   $0x0
  pushl $112
  1022fc:	6a 70                	push   $0x70
  jmp __alltraps
  1022fe:	e9 87 06 00 00       	jmp    10298a <__alltraps>

00102303 <vector113>:
.globl vector113
vector113:
  pushl $0
  102303:	6a 00                	push   $0x0
  pushl $113
  102305:	6a 71                	push   $0x71
  jmp __alltraps
  102307:	e9 7e 06 00 00       	jmp    10298a <__alltraps>

0010230c <vector114>:
.globl vector114
vector114:
  pushl $0
  10230c:	6a 00                	push   $0x0
  pushl $114
  10230e:	6a 72                	push   $0x72
  jmp __alltraps
  102310:	e9 75 06 00 00       	jmp    10298a <__alltraps>

00102315 <vector115>:
.globl vector115
vector115:
  pushl $0
  102315:	6a 00                	push   $0x0
  pushl $115
  102317:	6a 73                	push   $0x73
  jmp __alltraps
  102319:	e9 6c 06 00 00       	jmp    10298a <__alltraps>

0010231e <vector116>:
.globl vector116
vector116:
  pushl $0
  10231e:	6a 00                	push   $0x0
  pushl $116
  102320:	6a 74                	push   $0x74
  jmp __alltraps
  102322:	e9 63 06 00 00       	jmp    10298a <__alltraps>

00102327 <vector117>:
.globl vector117
vector117:
  pushl $0
  102327:	6a 00                	push   $0x0
  pushl $117
  102329:	6a 75                	push   $0x75
  jmp __alltraps
  10232b:	e9 5a 06 00 00       	jmp    10298a <__alltraps>

00102330 <vector118>:
.globl vector118
vector118:
  pushl $0
  102330:	6a 00                	push   $0x0
  pushl $118
  102332:	6a 76                	push   $0x76
  jmp __alltraps
  102334:	e9 51 06 00 00       	jmp    10298a <__alltraps>

00102339 <vector119>:
.globl vector119
vector119:
  pushl $0
  102339:	6a 00                	push   $0x0
  pushl $119
  10233b:	6a 77                	push   $0x77
  jmp __alltraps
  10233d:	e9 48 06 00 00       	jmp    10298a <__alltraps>

00102342 <vector120>:
.globl vector120
vector120:
  pushl $0
  102342:	6a 00                	push   $0x0
  pushl $120
  102344:	6a 78                	push   $0x78
  jmp __alltraps
  102346:	e9 3f 06 00 00       	jmp    10298a <__alltraps>

0010234b <vector121>:
.globl vector121
vector121:
  pushl $0
  10234b:	6a 00                	push   $0x0
  pushl $121
  10234d:	6a 79                	push   $0x79
  jmp __alltraps
  10234f:	e9 36 06 00 00       	jmp    10298a <__alltraps>

00102354 <vector122>:
.globl vector122
vector122:
  pushl $0
  102354:	6a 00                	push   $0x0
  pushl $122
  102356:	6a 7a                	push   $0x7a
  jmp __alltraps
  102358:	e9 2d 06 00 00       	jmp    10298a <__alltraps>

0010235d <vector123>:
.globl vector123
vector123:
  pushl $0
  10235d:	6a 00                	push   $0x0
  pushl $123
  10235f:	6a 7b                	push   $0x7b
  jmp __alltraps
  102361:	e9 24 06 00 00       	jmp    10298a <__alltraps>

00102366 <vector124>:
.globl vector124
vector124:
  pushl $0
  102366:	6a 00                	push   $0x0
  pushl $124
  102368:	6a 7c                	push   $0x7c
  jmp __alltraps
  10236a:	e9 1b 06 00 00       	jmp    10298a <__alltraps>

0010236f <vector125>:
.globl vector125
vector125:
  pushl $0
  10236f:	6a 00                	push   $0x0
  pushl $125
  102371:	6a 7d                	push   $0x7d
  jmp __alltraps
  102373:	e9 12 06 00 00       	jmp    10298a <__alltraps>

00102378 <vector126>:
.globl vector126
vector126:
  pushl $0
  102378:	6a 00                	push   $0x0
  pushl $126
  10237a:	6a 7e                	push   $0x7e
  jmp __alltraps
  10237c:	e9 09 06 00 00       	jmp    10298a <__alltraps>

00102381 <vector127>:
.globl vector127
vector127:
  pushl $0
  102381:	6a 00                	push   $0x0
  pushl $127
  102383:	6a 7f                	push   $0x7f
  jmp __alltraps
  102385:	e9 00 06 00 00       	jmp    10298a <__alltraps>

0010238a <vector128>:
.globl vector128
vector128:
  pushl $0
  10238a:	6a 00                	push   $0x0
  pushl $128
  10238c:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102391:	e9 f4 05 00 00       	jmp    10298a <__alltraps>

00102396 <vector129>:
.globl vector129
vector129:
  pushl $0
  102396:	6a 00                	push   $0x0
  pushl $129
  102398:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  10239d:	e9 e8 05 00 00       	jmp    10298a <__alltraps>

001023a2 <vector130>:
.globl vector130
vector130:
  pushl $0
  1023a2:	6a 00                	push   $0x0
  pushl $130
  1023a4:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  1023a9:	e9 dc 05 00 00       	jmp    10298a <__alltraps>

001023ae <vector131>:
.globl vector131
vector131:
  pushl $0
  1023ae:	6a 00                	push   $0x0
  pushl $131
  1023b0:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  1023b5:	e9 d0 05 00 00       	jmp    10298a <__alltraps>

001023ba <vector132>:
.globl vector132
vector132:
  pushl $0
  1023ba:	6a 00                	push   $0x0
  pushl $132
  1023bc:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  1023c1:	e9 c4 05 00 00       	jmp    10298a <__alltraps>

001023c6 <vector133>:
.globl vector133
vector133:
  pushl $0
  1023c6:	6a 00                	push   $0x0
  pushl $133
  1023c8:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  1023cd:	e9 b8 05 00 00       	jmp    10298a <__alltraps>

001023d2 <vector134>:
.globl vector134
vector134:
  pushl $0
  1023d2:	6a 00                	push   $0x0
  pushl $134
  1023d4:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  1023d9:	e9 ac 05 00 00       	jmp    10298a <__alltraps>

001023de <vector135>:
.globl vector135
vector135:
  pushl $0
  1023de:	6a 00                	push   $0x0
  pushl $135
  1023e0:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  1023e5:	e9 a0 05 00 00       	jmp    10298a <__alltraps>

001023ea <vector136>:
.globl vector136
vector136:
  pushl $0
  1023ea:	6a 00                	push   $0x0
  pushl $136
  1023ec:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  1023f1:	e9 94 05 00 00       	jmp    10298a <__alltraps>

001023f6 <vector137>:
.globl vector137
vector137:
  pushl $0
  1023f6:	6a 00                	push   $0x0
  pushl $137
  1023f8:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1023fd:	e9 88 05 00 00       	jmp    10298a <__alltraps>

00102402 <vector138>:
.globl vector138
vector138:
  pushl $0
  102402:	6a 00                	push   $0x0
  pushl $138
  102404:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  102409:	e9 7c 05 00 00       	jmp    10298a <__alltraps>

0010240e <vector139>:
.globl vector139
vector139:
  pushl $0
  10240e:	6a 00                	push   $0x0
  pushl $139
  102410:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  102415:	e9 70 05 00 00       	jmp    10298a <__alltraps>

0010241a <vector140>:
.globl vector140
vector140:
  pushl $0
  10241a:	6a 00                	push   $0x0
  pushl $140
  10241c:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  102421:	e9 64 05 00 00       	jmp    10298a <__alltraps>

00102426 <vector141>:
.globl vector141
vector141:
  pushl $0
  102426:	6a 00                	push   $0x0
  pushl $141
  102428:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  10242d:	e9 58 05 00 00       	jmp    10298a <__alltraps>

00102432 <vector142>:
.globl vector142
vector142:
  pushl $0
  102432:	6a 00                	push   $0x0
  pushl $142
  102434:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  102439:	e9 4c 05 00 00       	jmp    10298a <__alltraps>

0010243e <vector143>:
.globl vector143
vector143:
  pushl $0
  10243e:	6a 00                	push   $0x0
  pushl $143
  102440:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  102445:	e9 40 05 00 00       	jmp    10298a <__alltraps>

0010244a <vector144>:
.globl vector144
vector144:
  pushl $0
  10244a:	6a 00                	push   $0x0
  pushl $144
  10244c:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  102451:	e9 34 05 00 00       	jmp    10298a <__alltraps>

00102456 <vector145>:
.globl vector145
vector145:
  pushl $0
  102456:	6a 00                	push   $0x0
  pushl $145
  102458:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  10245d:	e9 28 05 00 00       	jmp    10298a <__alltraps>

00102462 <vector146>:
.globl vector146
vector146:
  pushl $0
  102462:	6a 00                	push   $0x0
  pushl $146
  102464:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102469:	e9 1c 05 00 00       	jmp    10298a <__alltraps>

0010246e <vector147>:
.globl vector147
vector147:
  pushl $0
  10246e:	6a 00                	push   $0x0
  pushl $147
  102470:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102475:	e9 10 05 00 00       	jmp    10298a <__alltraps>

0010247a <vector148>:
.globl vector148
vector148:
  pushl $0
  10247a:	6a 00                	push   $0x0
  pushl $148
  10247c:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102481:	e9 04 05 00 00       	jmp    10298a <__alltraps>

00102486 <vector149>:
.globl vector149
vector149:
  pushl $0
  102486:	6a 00                	push   $0x0
  pushl $149
  102488:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  10248d:	e9 f8 04 00 00       	jmp    10298a <__alltraps>

00102492 <vector150>:
.globl vector150
vector150:
  pushl $0
  102492:	6a 00                	push   $0x0
  pushl $150
  102494:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102499:	e9 ec 04 00 00       	jmp    10298a <__alltraps>

0010249e <vector151>:
.globl vector151
vector151:
  pushl $0
  10249e:	6a 00                	push   $0x0
  pushl $151
  1024a0:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  1024a5:	e9 e0 04 00 00       	jmp    10298a <__alltraps>

001024aa <vector152>:
.globl vector152
vector152:
  pushl $0
  1024aa:	6a 00                	push   $0x0
  pushl $152
  1024ac:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  1024b1:	e9 d4 04 00 00       	jmp    10298a <__alltraps>

001024b6 <vector153>:
.globl vector153
vector153:
  pushl $0
  1024b6:	6a 00                	push   $0x0
  pushl $153
  1024b8:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  1024bd:	e9 c8 04 00 00       	jmp    10298a <__alltraps>

001024c2 <vector154>:
.globl vector154
vector154:
  pushl $0
  1024c2:	6a 00                	push   $0x0
  pushl $154
  1024c4:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  1024c9:	e9 bc 04 00 00       	jmp    10298a <__alltraps>

001024ce <vector155>:
.globl vector155
vector155:
  pushl $0
  1024ce:	6a 00                	push   $0x0
  pushl $155
  1024d0:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  1024d5:	e9 b0 04 00 00       	jmp    10298a <__alltraps>

001024da <vector156>:
.globl vector156
vector156:
  pushl $0
  1024da:	6a 00                	push   $0x0
  pushl $156
  1024dc:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  1024e1:	e9 a4 04 00 00       	jmp    10298a <__alltraps>

001024e6 <vector157>:
.globl vector157
vector157:
  pushl $0
  1024e6:	6a 00                	push   $0x0
  pushl $157
  1024e8:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  1024ed:	e9 98 04 00 00       	jmp    10298a <__alltraps>

001024f2 <vector158>:
.globl vector158
vector158:
  pushl $0
  1024f2:	6a 00                	push   $0x0
  pushl $158
  1024f4:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1024f9:	e9 8c 04 00 00       	jmp    10298a <__alltraps>

001024fe <vector159>:
.globl vector159
vector159:
  pushl $0
  1024fe:	6a 00                	push   $0x0
  pushl $159
  102500:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  102505:	e9 80 04 00 00       	jmp    10298a <__alltraps>

0010250a <vector160>:
.globl vector160
vector160:
  pushl $0
  10250a:	6a 00                	push   $0x0
  pushl $160
  10250c:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  102511:	e9 74 04 00 00       	jmp    10298a <__alltraps>

00102516 <vector161>:
.globl vector161
vector161:
  pushl $0
  102516:	6a 00                	push   $0x0
  pushl $161
  102518:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  10251d:	e9 68 04 00 00       	jmp    10298a <__alltraps>

00102522 <vector162>:
.globl vector162
vector162:
  pushl $0
  102522:	6a 00                	push   $0x0
  pushl $162
  102524:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  102529:	e9 5c 04 00 00       	jmp    10298a <__alltraps>

0010252e <vector163>:
.globl vector163
vector163:
  pushl $0
  10252e:	6a 00                	push   $0x0
  pushl $163
  102530:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  102535:	e9 50 04 00 00       	jmp    10298a <__alltraps>

0010253a <vector164>:
.globl vector164
vector164:
  pushl $0
  10253a:	6a 00                	push   $0x0
  pushl $164
  10253c:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  102541:	e9 44 04 00 00       	jmp    10298a <__alltraps>

00102546 <vector165>:
.globl vector165
vector165:
  pushl $0
  102546:	6a 00                	push   $0x0
  pushl $165
  102548:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  10254d:	e9 38 04 00 00       	jmp    10298a <__alltraps>

00102552 <vector166>:
.globl vector166
vector166:
  pushl $0
  102552:	6a 00                	push   $0x0
  pushl $166
  102554:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102559:	e9 2c 04 00 00       	jmp    10298a <__alltraps>

0010255e <vector167>:
.globl vector167
vector167:
  pushl $0
  10255e:	6a 00                	push   $0x0
  pushl $167
  102560:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102565:	e9 20 04 00 00       	jmp    10298a <__alltraps>

0010256a <vector168>:
.globl vector168
vector168:
  pushl $0
  10256a:	6a 00                	push   $0x0
  pushl $168
  10256c:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102571:	e9 14 04 00 00       	jmp    10298a <__alltraps>

00102576 <vector169>:
.globl vector169
vector169:
  pushl $0
  102576:	6a 00                	push   $0x0
  pushl $169
  102578:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  10257d:	e9 08 04 00 00       	jmp    10298a <__alltraps>

00102582 <vector170>:
.globl vector170
vector170:
  pushl $0
  102582:	6a 00                	push   $0x0
  pushl $170
  102584:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102589:	e9 fc 03 00 00       	jmp    10298a <__alltraps>

0010258e <vector171>:
.globl vector171
vector171:
  pushl $0
  10258e:	6a 00                	push   $0x0
  pushl $171
  102590:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102595:	e9 f0 03 00 00       	jmp    10298a <__alltraps>

0010259a <vector172>:
.globl vector172
vector172:
  pushl $0
  10259a:	6a 00                	push   $0x0
  pushl $172
  10259c:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  1025a1:	e9 e4 03 00 00       	jmp    10298a <__alltraps>

001025a6 <vector173>:
.globl vector173
vector173:
  pushl $0
  1025a6:	6a 00                	push   $0x0
  pushl $173
  1025a8:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  1025ad:	e9 d8 03 00 00       	jmp    10298a <__alltraps>

001025b2 <vector174>:
.globl vector174
vector174:
  pushl $0
  1025b2:	6a 00                	push   $0x0
  pushl $174
  1025b4:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  1025b9:	e9 cc 03 00 00       	jmp    10298a <__alltraps>

001025be <vector175>:
.globl vector175
vector175:
  pushl $0
  1025be:	6a 00                	push   $0x0
  pushl $175
  1025c0:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  1025c5:	e9 c0 03 00 00       	jmp    10298a <__alltraps>

001025ca <vector176>:
.globl vector176
vector176:
  pushl $0
  1025ca:	6a 00                	push   $0x0
  pushl $176
  1025cc:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  1025d1:	e9 b4 03 00 00       	jmp    10298a <__alltraps>

001025d6 <vector177>:
.globl vector177
vector177:
  pushl $0
  1025d6:	6a 00                	push   $0x0
  pushl $177
  1025d8:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  1025dd:	e9 a8 03 00 00       	jmp    10298a <__alltraps>

001025e2 <vector178>:
.globl vector178
vector178:
  pushl $0
  1025e2:	6a 00                	push   $0x0
  pushl $178
  1025e4:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  1025e9:	e9 9c 03 00 00       	jmp    10298a <__alltraps>

001025ee <vector179>:
.globl vector179
vector179:
  pushl $0
  1025ee:	6a 00                	push   $0x0
  pushl $179
  1025f0:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1025f5:	e9 90 03 00 00       	jmp    10298a <__alltraps>

001025fa <vector180>:
.globl vector180
vector180:
  pushl $0
  1025fa:	6a 00                	push   $0x0
  pushl $180
  1025fc:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  102601:	e9 84 03 00 00       	jmp    10298a <__alltraps>

00102606 <vector181>:
.globl vector181
vector181:
  pushl $0
  102606:	6a 00                	push   $0x0
  pushl $181
  102608:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  10260d:	e9 78 03 00 00       	jmp    10298a <__alltraps>

00102612 <vector182>:
.globl vector182
vector182:
  pushl $0
  102612:	6a 00                	push   $0x0
  pushl $182
  102614:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  102619:	e9 6c 03 00 00       	jmp    10298a <__alltraps>

0010261e <vector183>:
.globl vector183
vector183:
  pushl $0
  10261e:	6a 00                	push   $0x0
  pushl $183
  102620:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102625:	e9 60 03 00 00       	jmp    10298a <__alltraps>

0010262a <vector184>:
.globl vector184
vector184:
  pushl $0
  10262a:	6a 00                	push   $0x0
  pushl $184
  10262c:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  102631:	e9 54 03 00 00       	jmp    10298a <__alltraps>

00102636 <vector185>:
.globl vector185
vector185:
  pushl $0
  102636:	6a 00                	push   $0x0
  pushl $185
  102638:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  10263d:	e9 48 03 00 00       	jmp    10298a <__alltraps>

00102642 <vector186>:
.globl vector186
vector186:
  pushl $0
  102642:	6a 00                	push   $0x0
  pushl $186
  102644:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  102649:	e9 3c 03 00 00       	jmp    10298a <__alltraps>

0010264e <vector187>:
.globl vector187
vector187:
  pushl $0
  10264e:	6a 00                	push   $0x0
  pushl $187
  102650:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102655:	e9 30 03 00 00       	jmp    10298a <__alltraps>

0010265a <vector188>:
.globl vector188
vector188:
  pushl $0
  10265a:	6a 00                	push   $0x0
  pushl $188
  10265c:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102661:	e9 24 03 00 00       	jmp    10298a <__alltraps>

00102666 <vector189>:
.globl vector189
vector189:
  pushl $0
  102666:	6a 00                	push   $0x0
  pushl $189
  102668:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  10266d:	e9 18 03 00 00       	jmp    10298a <__alltraps>

00102672 <vector190>:
.globl vector190
vector190:
  pushl $0
  102672:	6a 00                	push   $0x0
  pushl $190
  102674:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102679:	e9 0c 03 00 00       	jmp    10298a <__alltraps>

0010267e <vector191>:
.globl vector191
vector191:
  pushl $0
  10267e:	6a 00                	push   $0x0
  pushl $191
  102680:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102685:	e9 00 03 00 00       	jmp    10298a <__alltraps>

0010268a <vector192>:
.globl vector192
vector192:
  pushl $0
  10268a:	6a 00                	push   $0x0
  pushl $192
  10268c:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102691:	e9 f4 02 00 00       	jmp    10298a <__alltraps>

00102696 <vector193>:
.globl vector193
vector193:
  pushl $0
  102696:	6a 00                	push   $0x0
  pushl $193
  102698:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  10269d:	e9 e8 02 00 00       	jmp    10298a <__alltraps>

001026a2 <vector194>:
.globl vector194
vector194:
  pushl $0
  1026a2:	6a 00                	push   $0x0
  pushl $194
  1026a4:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  1026a9:	e9 dc 02 00 00       	jmp    10298a <__alltraps>

001026ae <vector195>:
.globl vector195
vector195:
  pushl $0
  1026ae:	6a 00                	push   $0x0
  pushl $195
  1026b0:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  1026b5:	e9 d0 02 00 00       	jmp    10298a <__alltraps>

001026ba <vector196>:
.globl vector196
vector196:
  pushl $0
  1026ba:	6a 00                	push   $0x0
  pushl $196
  1026bc:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  1026c1:	e9 c4 02 00 00       	jmp    10298a <__alltraps>

001026c6 <vector197>:
.globl vector197
vector197:
  pushl $0
  1026c6:	6a 00                	push   $0x0
  pushl $197
  1026c8:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  1026cd:	e9 b8 02 00 00       	jmp    10298a <__alltraps>

001026d2 <vector198>:
.globl vector198
vector198:
  pushl $0
  1026d2:	6a 00                	push   $0x0
  pushl $198
  1026d4:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  1026d9:	e9 ac 02 00 00       	jmp    10298a <__alltraps>

001026de <vector199>:
.globl vector199
vector199:
  pushl $0
  1026de:	6a 00                	push   $0x0
  pushl $199
  1026e0:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  1026e5:	e9 a0 02 00 00       	jmp    10298a <__alltraps>

001026ea <vector200>:
.globl vector200
vector200:
  pushl $0
  1026ea:	6a 00                	push   $0x0
  pushl $200
  1026ec:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  1026f1:	e9 94 02 00 00       	jmp    10298a <__alltraps>

001026f6 <vector201>:
.globl vector201
vector201:
  pushl $0
  1026f6:	6a 00                	push   $0x0
  pushl $201
  1026f8:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1026fd:	e9 88 02 00 00       	jmp    10298a <__alltraps>

00102702 <vector202>:
.globl vector202
vector202:
  pushl $0
  102702:	6a 00                	push   $0x0
  pushl $202
  102704:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  102709:	e9 7c 02 00 00       	jmp    10298a <__alltraps>

0010270e <vector203>:
.globl vector203
vector203:
  pushl $0
  10270e:	6a 00                	push   $0x0
  pushl $203
  102710:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102715:	e9 70 02 00 00       	jmp    10298a <__alltraps>

0010271a <vector204>:
.globl vector204
vector204:
  pushl $0
  10271a:	6a 00                	push   $0x0
  pushl $204
  10271c:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  102721:	e9 64 02 00 00       	jmp    10298a <__alltraps>

00102726 <vector205>:
.globl vector205
vector205:
  pushl $0
  102726:	6a 00                	push   $0x0
  pushl $205
  102728:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  10272d:	e9 58 02 00 00       	jmp    10298a <__alltraps>

00102732 <vector206>:
.globl vector206
vector206:
  pushl $0
  102732:	6a 00                	push   $0x0
  pushl $206
  102734:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  102739:	e9 4c 02 00 00       	jmp    10298a <__alltraps>

0010273e <vector207>:
.globl vector207
vector207:
  pushl $0
  10273e:	6a 00                	push   $0x0
  pushl $207
  102740:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  102745:	e9 40 02 00 00       	jmp    10298a <__alltraps>

0010274a <vector208>:
.globl vector208
vector208:
  pushl $0
  10274a:	6a 00                	push   $0x0
  pushl $208
  10274c:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  102751:	e9 34 02 00 00       	jmp    10298a <__alltraps>

00102756 <vector209>:
.globl vector209
vector209:
  pushl $0
  102756:	6a 00                	push   $0x0
  pushl $209
  102758:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  10275d:	e9 28 02 00 00       	jmp    10298a <__alltraps>

00102762 <vector210>:
.globl vector210
vector210:
  pushl $0
  102762:	6a 00                	push   $0x0
  pushl $210
  102764:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102769:	e9 1c 02 00 00       	jmp    10298a <__alltraps>

0010276e <vector211>:
.globl vector211
vector211:
  pushl $0
  10276e:	6a 00                	push   $0x0
  pushl $211
  102770:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102775:	e9 10 02 00 00       	jmp    10298a <__alltraps>

0010277a <vector212>:
.globl vector212
vector212:
  pushl $0
  10277a:	6a 00                	push   $0x0
  pushl $212
  10277c:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102781:	e9 04 02 00 00       	jmp    10298a <__alltraps>

00102786 <vector213>:
.globl vector213
vector213:
  pushl $0
  102786:	6a 00                	push   $0x0
  pushl $213
  102788:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  10278d:	e9 f8 01 00 00       	jmp    10298a <__alltraps>

00102792 <vector214>:
.globl vector214
vector214:
  pushl $0
  102792:	6a 00                	push   $0x0
  pushl $214
  102794:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102799:	e9 ec 01 00 00       	jmp    10298a <__alltraps>

0010279e <vector215>:
.globl vector215
vector215:
  pushl $0
  10279e:	6a 00                	push   $0x0
  pushl $215
  1027a0:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  1027a5:	e9 e0 01 00 00       	jmp    10298a <__alltraps>

001027aa <vector216>:
.globl vector216
vector216:
  pushl $0
  1027aa:	6a 00                	push   $0x0
  pushl $216
  1027ac:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  1027b1:	e9 d4 01 00 00       	jmp    10298a <__alltraps>

001027b6 <vector217>:
.globl vector217
vector217:
  pushl $0
  1027b6:	6a 00                	push   $0x0
  pushl $217
  1027b8:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  1027bd:	e9 c8 01 00 00       	jmp    10298a <__alltraps>

001027c2 <vector218>:
.globl vector218
vector218:
  pushl $0
  1027c2:	6a 00                	push   $0x0
  pushl $218
  1027c4:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  1027c9:	e9 bc 01 00 00       	jmp    10298a <__alltraps>

001027ce <vector219>:
.globl vector219
vector219:
  pushl $0
  1027ce:	6a 00                	push   $0x0
  pushl $219
  1027d0:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  1027d5:	e9 b0 01 00 00       	jmp    10298a <__alltraps>

001027da <vector220>:
.globl vector220
vector220:
  pushl $0
  1027da:	6a 00                	push   $0x0
  pushl $220
  1027dc:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  1027e1:	e9 a4 01 00 00       	jmp    10298a <__alltraps>

001027e6 <vector221>:
.globl vector221
vector221:
  pushl $0
  1027e6:	6a 00                	push   $0x0
  pushl $221
  1027e8:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  1027ed:	e9 98 01 00 00       	jmp    10298a <__alltraps>

001027f2 <vector222>:
.globl vector222
vector222:
  pushl $0
  1027f2:	6a 00                	push   $0x0
  pushl $222
  1027f4:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1027f9:	e9 8c 01 00 00       	jmp    10298a <__alltraps>

001027fe <vector223>:
.globl vector223
vector223:
  pushl $0
  1027fe:	6a 00                	push   $0x0
  pushl $223
  102800:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102805:	e9 80 01 00 00       	jmp    10298a <__alltraps>

0010280a <vector224>:
.globl vector224
vector224:
  pushl $0
  10280a:	6a 00                	push   $0x0
  pushl $224
  10280c:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  102811:	e9 74 01 00 00       	jmp    10298a <__alltraps>

00102816 <vector225>:
.globl vector225
vector225:
  pushl $0
  102816:	6a 00                	push   $0x0
  pushl $225
  102818:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  10281d:	e9 68 01 00 00       	jmp    10298a <__alltraps>

00102822 <vector226>:
.globl vector226
vector226:
  pushl $0
  102822:	6a 00                	push   $0x0
  pushl $226
  102824:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  102829:	e9 5c 01 00 00       	jmp    10298a <__alltraps>

0010282e <vector227>:
.globl vector227
vector227:
  pushl $0
  10282e:	6a 00                	push   $0x0
  pushl $227
  102830:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102835:	e9 50 01 00 00       	jmp    10298a <__alltraps>

0010283a <vector228>:
.globl vector228
vector228:
  pushl $0
  10283a:	6a 00                	push   $0x0
  pushl $228
  10283c:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102841:	e9 44 01 00 00       	jmp    10298a <__alltraps>

00102846 <vector229>:
.globl vector229
vector229:
  pushl $0
  102846:	6a 00                	push   $0x0
  pushl $229
  102848:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  10284d:	e9 38 01 00 00       	jmp    10298a <__alltraps>

00102852 <vector230>:
.globl vector230
vector230:
  pushl $0
  102852:	6a 00                	push   $0x0
  pushl $230
  102854:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102859:	e9 2c 01 00 00       	jmp    10298a <__alltraps>

0010285e <vector231>:
.globl vector231
vector231:
  pushl $0
  10285e:	6a 00                	push   $0x0
  pushl $231
  102860:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102865:	e9 20 01 00 00       	jmp    10298a <__alltraps>

0010286a <vector232>:
.globl vector232
vector232:
  pushl $0
  10286a:	6a 00                	push   $0x0
  pushl $232
  10286c:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102871:	e9 14 01 00 00       	jmp    10298a <__alltraps>

00102876 <vector233>:
.globl vector233
vector233:
  pushl $0
  102876:	6a 00                	push   $0x0
  pushl $233
  102878:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  10287d:	e9 08 01 00 00       	jmp    10298a <__alltraps>

00102882 <vector234>:
.globl vector234
vector234:
  pushl $0
  102882:	6a 00                	push   $0x0
  pushl $234
  102884:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102889:	e9 fc 00 00 00       	jmp    10298a <__alltraps>

0010288e <vector235>:
.globl vector235
vector235:
  pushl $0
  10288e:	6a 00                	push   $0x0
  pushl $235
  102890:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102895:	e9 f0 00 00 00       	jmp    10298a <__alltraps>

0010289a <vector236>:
.globl vector236
vector236:
  pushl $0
  10289a:	6a 00                	push   $0x0
  pushl $236
  10289c:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  1028a1:	e9 e4 00 00 00       	jmp    10298a <__alltraps>

001028a6 <vector237>:
.globl vector237
vector237:
  pushl $0
  1028a6:	6a 00                	push   $0x0
  pushl $237
  1028a8:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  1028ad:	e9 d8 00 00 00       	jmp    10298a <__alltraps>

001028b2 <vector238>:
.globl vector238
vector238:
  pushl $0
  1028b2:	6a 00                	push   $0x0
  pushl $238
  1028b4:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  1028b9:	e9 cc 00 00 00       	jmp    10298a <__alltraps>

001028be <vector239>:
.globl vector239
vector239:
  pushl $0
  1028be:	6a 00                	push   $0x0
  pushl $239
  1028c0:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  1028c5:	e9 c0 00 00 00       	jmp    10298a <__alltraps>

001028ca <vector240>:
.globl vector240
vector240:
  pushl $0
  1028ca:	6a 00                	push   $0x0
  pushl $240
  1028cc:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  1028d1:	e9 b4 00 00 00       	jmp    10298a <__alltraps>

001028d6 <vector241>:
.globl vector241
vector241:
  pushl $0
  1028d6:	6a 00                	push   $0x0
  pushl $241
  1028d8:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  1028dd:	e9 a8 00 00 00       	jmp    10298a <__alltraps>

001028e2 <vector242>:
.globl vector242
vector242:
  pushl $0
  1028e2:	6a 00                	push   $0x0
  pushl $242
  1028e4:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  1028e9:	e9 9c 00 00 00       	jmp    10298a <__alltraps>

001028ee <vector243>:
.globl vector243
vector243:
  pushl $0
  1028ee:	6a 00                	push   $0x0
  pushl $243
  1028f0:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  1028f5:	e9 90 00 00 00       	jmp    10298a <__alltraps>

001028fa <vector244>:
.globl vector244
vector244:
  pushl $0
  1028fa:	6a 00                	push   $0x0
  pushl $244
  1028fc:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  102901:	e9 84 00 00 00       	jmp    10298a <__alltraps>

00102906 <vector245>:
.globl vector245
vector245:
  pushl $0
  102906:	6a 00                	push   $0x0
  pushl $245
  102908:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  10290d:	e9 78 00 00 00       	jmp    10298a <__alltraps>

00102912 <vector246>:
.globl vector246
vector246:
  pushl $0
  102912:	6a 00                	push   $0x0
  pushl $246
  102914:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  102919:	e9 6c 00 00 00       	jmp    10298a <__alltraps>

0010291e <vector247>:
.globl vector247
vector247:
  pushl $0
  10291e:	6a 00                	push   $0x0
  pushl $247
  102920:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102925:	e9 60 00 00 00       	jmp    10298a <__alltraps>

0010292a <vector248>:
.globl vector248
vector248:
  pushl $0
  10292a:	6a 00                	push   $0x0
  pushl $248
  10292c:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  102931:	e9 54 00 00 00       	jmp    10298a <__alltraps>

00102936 <vector249>:
.globl vector249
vector249:
  pushl $0
  102936:	6a 00                	push   $0x0
  pushl $249
  102938:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  10293d:	e9 48 00 00 00       	jmp    10298a <__alltraps>

00102942 <vector250>:
.globl vector250
vector250:
  pushl $0
  102942:	6a 00                	push   $0x0
  pushl $250
  102944:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102949:	e9 3c 00 00 00       	jmp    10298a <__alltraps>

0010294e <vector251>:
.globl vector251
vector251:
  pushl $0
  10294e:	6a 00                	push   $0x0
  pushl $251
  102950:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102955:	e9 30 00 00 00       	jmp    10298a <__alltraps>

0010295a <vector252>:
.globl vector252
vector252:
  pushl $0
  10295a:	6a 00                	push   $0x0
  pushl $252
  10295c:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102961:	e9 24 00 00 00       	jmp    10298a <__alltraps>

00102966 <vector253>:
.globl vector253
vector253:
  pushl $0
  102966:	6a 00                	push   $0x0
  pushl $253
  102968:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  10296d:	e9 18 00 00 00       	jmp    10298a <__alltraps>

00102972 <vector254>:
.globl vector254
vector254:
  pushl $0
  102972:	6a 00                	push   $0x0
  pushl $254
  102974:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102979:	e9 0c 00 00 00       	jmp    10298a <__alltraps>

0010297e <vector255>:
.globl vector255
vector255:
  pushl $0
  10297e:	6a 00                	push   $0x0
  pushl $255
  102980:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102985:	e9 00 00 00 00       	jmp    10298a <__alltraps>

0010298a <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  10298a:	1e                   	push   %ds
    pushl %es
  10298b:	06                   	push   %es
    pushl %fs
  10298c:	0f a0                	push   %fs
    pushl %gs
  10298e:	0f a8                	push   %gs
    pushal
  102990:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  102991:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  102996:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  102998:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  10299a:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  10299b:	e8 64 f5 ff ff       	call   101f04 <trap>

    # pop the pushed stack pointer
    popl %esp
  1029a0:	5c                   	pop    %esp

001029a1 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  1029a1:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  1029a2:	0f a9                	pop    %gs
    popl %fs
  1029a4:	0f a1                	pop    %fs
    popl %es
  1029a6:	07                   	pop    %es
    popl %ds
  1029a7:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  1029a8:	83 c4 08             	add    $0x8,%esp
    iret
  1029ab:	cf                   	iret   

001029ac <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  1029ac:	55                   	push   %ebp
  1029ad:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  1029af:	8b 45 08             	mov    0x8(%ebp),%eax
  1029b2:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  1029b5:	b8 23 00 00 00       	mov    $0x23,%eax
  1029ba:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  1029bc:	b8 23 00 00 00       	mov    $0x23,%eax
  1029c1:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  1029c3:	b8 10 00 00 00       	mov    $0x10,%eax
  1029c8:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  1029ca:	b8 10 00 00 00       	mov    $0x10,%eax
  1029cf:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  1029d1:	b8 10 00 00 00       	mov    $0x10,%eax
  1029d6:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  1029d8:	ea df 29 10 00 08 00 	ljmp   $0x8,$0x1029df
}
  1029df:	90                   	nop
  1029e0:	5d                   	pop    %ebp
  1029e1:	c3                   	ret    

001029e2 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  1029e2:	55                   	push   %ebp
  1029e3:	89 e5                	mov    %esp,%ebp
  1029e5:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  1029e8:	b8 a0 f9 10 00       	mov    $0x10f9a0,%eax
  1029ed:	05 00 04 00 00       	add    $0x400,%eax
  1029f2:	a3 c4 f8 10 00       	mov    %eax,0x10f8c4
    ts.ts_ss0 = KERNEL_DS;
  1029f7:	66 c7 05 c8 f8 10 00 	movw   $0x10,0x10f8c8
  1029fe:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102a00:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  102a07:	68 00 
  102a09:	b8 c0 f8 10 00       	mov    $0x10f8c0,%eax
  102a0e:	0f b7 c0             	movzwl %ax,%eax
  102a11:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  102a17:	b8 c0 f8 10 00       	mov    $0x10f8c0,%eax
  102a1c:	c1 e8 10             	shr    $0x10,%eax
  102a1f:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  102a24:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a2b:	24 f0                	and    $0xf0,%al
  102a2d:	0c 09                	or     $0x9,%al
  102a2f:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a34:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a3b:	0c 10                	or     $0x10,%al
  102a3d:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a42:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a49:	24 9f                	and    $0x9f,%al
  102a4b:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a50:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a57:	0c 80                	or     $0x80,%al
  102a59:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a5e:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a65:	24 f0                	and    $0xf0,%al
  102a67:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a6c:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a73:	24 ef                	and    $0xef,%al
  102a75:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a7a:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a81:	24 df                	and    $0xdf,%al
  102a83:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a88:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a8f:	0c 40                	or     $0x40,%al
  102a91:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a96:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a9d:	24 7f                	and    $0x7f,%al
  102a9f:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102aa4:	b8 c0 f8 10 00       	mov    $0x10f8c0,%eax
  102aa9:	c1 e8 18             	shr    $0x18,%eax
  102aac:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102ab1:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102ab8:	24 ef                	and    $0xef,%al
  102aba:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102abf:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  102ac6:	e8 e1 fe ff ff       	call   1029ac <lgdt>
  102acb:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102ad1:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102ad5:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102ad8:	90                   	nop
  102ad9:	c9                   	leave  
  102ada:	c3                   	ret    

00102adb <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102adb:	55                   	push   %ebp
  102adc:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102ade:	e8 ff fe ff ff       	call   1029e2 <gdt_init>
}
  102ae3:	90                   	nop
  102ae4:	5d                   	pop    %ebp
  102ae5:	c3                   	ret    

00102ae6 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102ae6:	55                   	push   %ebp
  102ae7:	89 e5                	mov    %esp,%ebp
  102ae9:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102aec:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102af3:	eb 03                	jmp    102af8 <strlen+0x12>
        cnt ++;
  102af5:	ff 45 fc             	incl   -0x4(%ebp)
    while (*s ++ != '\0') {
  102af8:	8b 45 08             	mov    0x8(%ebp),%eax
  102afb:	8d 50 01             	lea    0x1(%eax),%edx
  102afe:	89 55 08             	mov    %edx,0x8(%ebp)
  102b01:	0f b6 00             	movzbl (%eax),%eax
  102b04:	84 c0                	test   %al,%al
  102b06:	75 ed                	jne    102af5 <strlen+0xf>
    }
    return cnt;
  102b08:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102b0b:	c9                   	leave  
  102b0c:	c3                   	ret    

00102b0d <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102b0d:	55                   	push   %ebp
  102b0e:	89 e5                	mov    %esp,%ebp
  102b10:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102b13:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102b1a:	eb 03                	jmp    102b1f <strnlen+0x12>
        cnt ++;
  102b1c:	ff 45 fc             	incl   -0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102b1f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b22:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102b25:	73 10                	jae    102b37 <strnlen+0x2a>
  102b27:	8b 45 08             	mov    0x8(%ebp),%eax
  102b2a:	8d 50 01             	lea    0x1(%eax),%edx
  102b2d:	89 55 08             	mov    %edx,0x8(%ebp)
  102b30:	0f b6 00             	movzbl (%eax),%eax
  102b33:	84 c0                	test   %al,%al
  102b35:	75 e5                	jne    102b1c <strnlen+0xf>
    }
    return cnt;
  102b37:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102b3a:	c9                   	leave  
  102b3b:	c3                   	ret    

00102b3c <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102b3c:	55                   	push   %ebp
  102b3d:	89 e5                	mov    %esp,%ebp
  102b3f:	57                   	push   %edi
  102b40:	56                   	push   %esi
  102b41:	83 ec 20             	sub    $0x20,%esp
  102b44:	8b 45 08             	mov    0x8(%ebp),%eax
  102b47:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b4a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b4d:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102b50:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102b53:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b56:	89 d1                	mov    %edx,%ecx
  102b58:	89 c2                	mov    %eax,%edx
  102b5a:	89 ce                	mov    %ecx,%esi
  102b5c:	89 d7                	mov    %edx,%edi
  102b5e:	ac                   	lods   %ds:(%esi),%al
  102b5f:	aa                   	stos   %al,%es:(%edi)
  102b60:	84 c0                	test   %al,%al
  102b62:	75 fa                	jne    102b5e <strcpy+0x22>
  102b64:	89 fa                	mov    %edi,%edx
  102b66:	89 f1                	mov    %esi,%ecx
  102b68:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102b6b:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102b6e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102b71:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_STRCPY
    return __strcpy(dst, src);
  102b74:	90                   	nop
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102b75:	83 c4 20             	add    $0x20,%esp
  102b78:	5e                   	pop    %esi
  102b79:	5f                   	pop    %edi
  102b7a:	5d                   	pop    %ebp
  102b7b:	c3                   	ret    

00102b7c <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102b7c:	55                   	push   %ebp
  102b7d:	89 e5                	mov    %esp,%ebp
  102b7f:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102b82:	8b 45 08             	mov    0x8(%ebp),%eax
  102b85:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102b88:	eb 1e                	jmp    102ba8 <strncpy+0x2c>
        if ((*p = *src) != '\0') {
  102b8a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b8d:	0f b6 10             	movzbl (%eax),%edx
  102b90:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b93:	88 10                	mov    %dl,(%eax)
  102b95:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b98:	0f b6 00             	movzbl (%eax),%eax
  102b9b:	84 c0                	test   %al,%al
  102b9d:	74 03                	je     102ba2 <strncpy+0x26>
            src ++;
  102b9f:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  102ba2:	ff 45 fc             	incl   -0x4(%ebp)
  102ba5:	ff 4d 10             	decl   0x10(%ebp)
    while (len > 0) {
  102ba8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102bac:	75 dc                	jne    102b8a <strncpy+0xe>
    }
    return dst;
  102bae:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102bb1:	c9                   	leave  
  102bb2:	c3                   	ret    

00102bb3 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102bb3:	55                   	push   %ebp
  102bb4:	89 e5                	mov    %esp,%ebp
  102bb6:	57                   	push   %edi
  102bb7:	56                   	push   %esi
  102bb8:	83 ec 20             	sub    $0x20,%esp
  102bbb:	8b 45 08             	mov    0x8(%ebp),%eax
  102bbe:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102bc1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bc4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  102bc7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102bca:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bcd:	89 d1                	mov    %edx,%ecx
  102bcf:	89 c2                	mov    %eax,%edx
  102bd1:	89 ce                	mov    %ecx,%esi
  102bd3:	89 d7                	mov    %edx,%edi
  102bd5:	ac                   	lods   %ds:(%esi),%al
  102bd6:	ae                   	scas   %es:(%edi),%al
  102bd7:	75 08                	jne    102be1 <strcmp+0x2e>
  102bd9:	84 c0                	test   %al,%al
  102bdb:	75 f8                	jne    102bd5 <strcmp+0x22>
  102bdd:	31 c0                	xor    %eax,%eax
  102bdf:	eb 04                	jmp    102be5 <strcmp+0x32>
  102be1:	19 c0                	sbb    %eax,%eax
  102be3:	0c 01                	or     $0x1,%al
  102be5:	89 fa                	mov    %edi,%edx
  102be7:	89 f1                	mov    %esi,%ecx
  102be9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102bec:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102bef:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  102bf2:	8b 45 ec             	mov    -0x14(%ebp),%eax
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
  102bf5:	90                   	nop
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102bf6:	83 c4 20             	add    $0x20,%esp
  102bf9:	5e                   	pop    %esi
  102bfa:	5f                   	pop    %edi
  102bfb:	5d                   	pop    %ebp
  102bfc:	c3                   	ret    

00102bfd <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102bfd:	55                   	push   %ebp
  102bfe:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102c00:	eb 09                	jmp    102c0b <strncmp+0xe>
        n --, s1 ++, s2 ++;
  102c02:	ff 4d 10             	decl   0x10(%ebp)
  102c05:	ff 45 08             	incl   0x8(%ebp)
  102c08:	ff 45 0c             	incl   0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102c0b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102c0f:	74 1a                	je     102c2b <strncmp+0x2e>
  102c11:	8b 45 08             	mov    0x8(%ebp),%eax
  102c14:	0f b6 00             	movzbl (%eax),%eax
  102c17:	84 c0                	test   %al,%al
  102c19:	74 10                	je     102c2b <strncmp+0x2e>
  102c1b:	8b 45 08             	mov    0x8(%ebp),%eax
  102c1e:	0f b6 10             	movzbl (%eax),%edx
  102c21:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c24:	0f b6 00             	movzbl (%eax),%eax
  102c27:	38 c2                	cmp    %al,%dl
  102c29:	74 d7                	je     102c02 <strncmp+0x5>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102c2b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102c2f:	74 18                	je     102c49 <strncmp+0x4c>
  102c31:	8b 45 08             	mov    0x8(%ebp),%eax
  102c34:	0f b6 00             	movzbl (%eax),%eax
  102c37:	0f b6 d0             	movzbl %al,%edx
  102c3a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c3d:	0f b6 00             	movzbl (%eax),%eax
  102c40:	0f b6 c0             	movzbl %al,%eax
  102c43:	29 c2                	sub    %eax,%edx
  102c45:	89 d0                	mov    %edx,%eax
  102c47:	eb 05                	jmp    102c4e <strncmp+0x51>
  102c49:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c4e:	5d                   	pop    %ebp
  102c4f:	c3                   	ret    

00102c50 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102c50:	55                   	push   %ebp
  102c51:	89 e5                	mov    %esp,%ebp
  102c53:	83 ec 04             	sub    $0x4,%esp
  102c56:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c59:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102c5c:	eb 13                	jmp    102c71 <strchr+0x21>
        if (*s == c) {
  102c5e:	8b 45 08             	mov    0x8(%ebp),%eax
  102c61:	0f b6 00             	movzbl (%eax),%eax
  102c64:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102c67:	75 05                	jne    102c6e <strchr+0x1e>
            return (char *)s;
  102c69:	8b 45 08             	mov    0x8(%ebp),%eax
  102c6c:	eb 12                	jmp    102c80 <strchr+0x30>
        }
        s ++;
  102c6e:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102c71:	8b 45 08             	mov    0x8(%ebp),%eax
  102c74:	0f b6 00             	movzbl (%eax),%eax
  102c77:	84 c0                	test   %al,%al
  102c79:	75 e3                	jne    102c5e <strchr+0xe>
    }
    return NULL;
  102c7b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c80:	c9                   	leave  
  102c81:	c3                   	ret    

00102c82 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102c82:	55                   	push   %ebp
  102c83:	89 e5                	mov    %esp,%ebp
  102c85:	83 ec 04             	sub    $0x4,%esp
  102c88:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c8b:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102c8e:	eb 0e                	jmp    102c9e <strfind+0x1c>
        if (*s == c) {
  102c90:	8b 45 08             	mov    0x8(%ebp),%eax
  102c93:	0f b6 00             	movzbl (%eax),%eax
  102c96:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102c99:	74 0f                	je     102caa <strfind+0x28>
            break;
        }
        s ++;
  102c9b:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102c9e:	8b 45 08             	mov    0x8(%ebp),%eax
  102ca1:	0f b6 00             	movzbl (%eax),%eax
  102ca4:	84 c0                	test   %al,%al
  102ca6:	75 e8                	jne    102c90 <strfind+0xe>
  102ca8:	eb 01                	jmp    102cab <strfind+0x29>
            break;
  102caa:	90                   	nop
    }
    return (char *)s;
  102cab:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102cae:	c9                   	leave  
  102caf:	c3                   	ret    

00102cb0 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102cb0:	55                   	push   %ebp
  102cb1:	89 e5                	mov    %esp,%ebp
  102cb3:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102cb6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102cbd:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102cc4:	eb 03                	jmp    102cc9 <strtol+0x19>
        s ++;
  102cc6:	ff 45 08             	incl   0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  102cc9:	8b 45 08             	mov    0x8(%ebp),%eax
  102ccc:	0f b6 00             	movzbl (%eax),%eax
  102ccf:	3c 20                	cmp    $0x20,%al
  102cd1:	74 f3                	je     102cc6 <strtol+0x16>
  102cd3:	8b 45 08             	mov    0x8(%ebp),%eax
  102cd6:	0f b6 00             	movzbl (%eax),%eax
  102cd9:	3c 09                	cmp    $0x9,%al
  102cdb:	74 e9                	je     102cc6 <strtol+0x16>
    }

    // plus/minus sign
    if (*s == '+') {
  102cdd:	8b 45 08             	mov    0x8(%ebp),%eax
  102ce0:	0f b6 00             	movzbl (%eax),%eax
  102ce3:	3c 2b                	cmp    $0x2b,%al
  102ce5:	75 05                	jne    102cec <strtol+0x3c>
        s ++;
  102ce7:	ff 45 08             	incl   0x8(%ebp)
  102cea:	eb 14                	jmp    102d00 <strtol+0x50>
    }
    else if (*s == '-') {
  102cec:	8b 45 08             	mov    0x8(%ebp),%eax
  102cef:	0f b6 00             	movzbl (%eax),%eax
  102cf2:	3c 2d                	cmp    $0x2d,%al
  102cf4:	75 0a                	jne    102d00 <strtol+0x50>
        s ++, neg = 1;
  102cf6:	ff 45 08             	incl   0x8(%ebp)
  102cf9:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102d00:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d04:	74 06                	je     102d0c <strtol+0x5c>
  102d06:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102d0a:	75 22                	jne    102d2e <strtol+0x7e>
  102d0c:	8b 45 08             	mov    0x8(%ebp),%eax
  102d0f:	0f b6 00             	movzbl (%eax),%eax
  102d12:	3c 30                	cmp    $0x30,%al
  102d14:	75 18                	jne    102d2e <strtol+0x7e>
  102d16:	8b 45 08             	mov    0x8(%ebp),%eax
  102d19:	40                   	inc    %eax
  102d1a:	0f b6 00             	movzbl (%eax),%eax
  102d1d:	3c 78                	cmp    $0x78,%al
  102d1f:	75 0d                	jne    102d2e <strtol+0x7e>
        s += 2, base = 16;
  102d21:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102d25:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102d2c:	eb 29                	jmp    102d57 <strtol+0xa7>
    }
    else if (base == 0 && s[0] == '0') {
  102d2e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d32:	75 16                	jne    102d4a <strtol+0x9a>
  102d34:	8b 45 08             	mov    0x8(%ebp),%eax
  102d37:	0f b6 00             	movzbl (%eax),%eax
  102d3a:	3c 30                	cmp    $0x30,%al
  102d3c:	75 0c                	jne    102d4a <strtol+0x9a>
        s ++, base = 8;
  102d3e:	ff 45 08             	incl   0x8(%ebp)
  102d41:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102d48:	eb 0d                	jmp    102d57 <strtol+0xa7>
    }
    else if (base == 0) {
  102d4a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d4e:	75 07                	jne    102d57 <strtol+0xa7>
        base = 10;
  102d50:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102d57:	8b 45 08             	mov    0x8(%ebp),%eax
  102d5a:	0f b6 00             	movzbl (%eax),%eax
  102d5d:	3c 2f                	cmp    $0x2f,%al
  102d5f:	7e 1b                	jle    102d7c <strtol+0xcc>
  102d61:	8b 45 08             	mov    0x8(%ebp),%eax
  102d64:	0f b6 00             	movzbl (%eax),%eax
  102d67:	3c 39                	cmp    $0x39,%al
  102d69:	7f 11                	jg     102d7c <strtol+0xcc>
            dig = *s - '0';
  102d6b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d6e:	0f b6 00             	movzbl (%eax),%eax
  102d71:	0f be c0             	movsbl %al,%eax
  102d74:	83 e8 30             	sub    $0x30,%eax
  102d77:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d7a:	eb 48                	jmp    102dc4 <strtol+0x114>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102d7c:	8b 45 08             	mov    0x8(%ebp),%eax
  102d7f:	0f b6 00             	movzbl (%eax),%eax
  102d82:	3c 60                	cmp    $0x60,%al
  102d84:	7e 1b                	jle    102da1 <strtol+0xf1>
  102d86:	8b 45 08             	mov    0x8(%ebp),%eax
  102d89:	0f b6 00             	movzbl (%eax),%eax
  102d8c:	3c 7a                	cmp    $0x7a,%al
  102d8e:	7f 11                	jg     102da1 <strtol+0xf1>
            dig = *s - 'a' + 10;
  102d90:	8b 45 08             	mov    0x8(%ebp),%eax
  102d93:	0f b6 00             	movzbl (%eax),%eax
  102d96:	0f be c0             	movsbl %al,%eax
  102d99:	83 e8 57             	sub    $0x57,%eax
  102d9c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d9f:	eb 23                	jmp    102dc4 <strtol+0x114>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102da1:	8b 45 08             	mov    0x8(%ebp),%eax
  102da4:	0f b6 00             	movzbl (%eax),%eax
  102da7:	3c 40                	cmp    $0x40,%al
  102da9:	7e 3b                	jle    102de6 <strtol+0x136>
  102dab:	8b 45 08             	mov    0x8(%ebp),%eax
  102dae:	0f b6 00             	movzbl (%eax),%eax
  102db1:	3c 5a                	cmp    $0x5a,%al
  102db3:	7f 31                	jg     102de6 <strtol+0x136>
            dig = *s - 'A' + 10;
  102db5:	8b 45 08             	mov    0x8(%ebp),%eax
  102db8:	0f b6 00             	movzbl (%eax),%eax
  102dbb:	0f be c0             	movsbl %al,%eax
  102dbe:	83 e8 37             	sub    $0x37,%eax
  102dc1:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102dc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102dc7:	3b 45 10             	cmp    0x10(%ebp),%eax
  102dca:	7d 19                	jge    102de5 <strtol+0x135>
            break;
        }
        s ++, val = (val * base) + dig;
  102dcc:	ff 45 08             	incl   0x8(%ebp)
  102dcf:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102dd2:	0f af 45 10          	imul   0x10(%ebp),%eax
  102dd6:	89 c2                	mov    %eax,%edx
  102dd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ddb:	01 d0                	add    %edx,%eax
  102ddd:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  102de0:	e9 72 ff ff ff       	jmp    102d57 <strtol+0xa7>
            break;
  102de5:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  102de6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102dea:	74 08                	je     102df4 <strtol+0x144>
        *endptr = (char *) s;
  102dec:	8b 45 0c             	mov    0xc(%ebp),%eax
  102def:	8b 55 08             	mov    0x8(%ebp),%edx
  102df2:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102df4:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102df8:	74 07                	je     102e01 <strtol+0x151>
  102dfa:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102dfd:	f7 d8                	neg    %eax
  102dff:	eb 03                	jmp    102e04 <strtol+0x154>
  102e01:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102e04:	c9                   	leave  
  102e05:	c3                   	ret    

00102e06 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102e06:	55                   	push   %ebp
  102e07:	89 e5                	mov    %esp,%ebp
  102e09:	57                   	push   %edi
  102e0a:	83 ec 24             	sub    $0x24,%esp
  102e0d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e10:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102e13:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  102e17:	8b 55 08             	mov    0x8(%ebp),%edx
  102e1a:	89 55 f8             	mov    %edx,-0x8(%ebp)
  102e1d:	88 45 f7             	mov    %al,-0x9(%ebp)
  102e20:	8b 45 10             	mov    0x10(%ebp),%eax
  102e23:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102e26:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102e29:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102e2d:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102e30:	89 d7                	mov    %edx,%edi
  102e32:	f3 aa                	rep stos %al,%es:(%edi)
  102e34:	89 fa                	mov    %edi,%edx
  102e36:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102e39:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102e3c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102e3f:	90                   	nop
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102e40:	83 c4 24             	add    $0x24,%esp
  102e43:	5f                   	pop    %edi
  102e44:	5d                   	pop    %ebp
  102e45:	c3                   	ret    

00102e46 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102e46:	55                   	push   %ebp
  102e47:	89 e5                	mov    %esp,%ebp
  102e49:	57                   	push   %edi
  102e4a:	56                   	push   %esi
  102e4b:	53                   	push   %ebx
  102e4c:	83 ec 30             	sub    $0x30,%esp
  102e4f:	8b 45 08             	mov    0x8(%ebp),%eax
  102e52:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e55:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e58:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102e5b:	8b 45 10             	mov    0x10(%ebp),%eax
  102e5e:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102e61:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e64:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102e67:	73 42                	jae    102eab <memmove+0x65>
  102e69:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e6c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102e6f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e72:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102e75:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e78:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102e7b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102e7e:	c1 e8 02             	shr    $0x2,%eax
  102e81:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102e83:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102e86:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e89:	89 d7                	mov    %edx,%edi
  102e8b:	89 c6                	mov    %eax,%esi
  102e8d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102e8f:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102e92:	83 e1 03             	and    $0x3,%ecx
  102e95:	74 02                	je     102e99 <memmove+0x53>
  102e97:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102e99:	89 f0                	mov    %esi,%eax
  102e9b:	89 fa                	mov    %edi,%edx
  102e9d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102ea0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102ea3:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  102ea6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
#ifdef __HAVE_ARCH_MEMMOVE
    return __memmove(dst, src, n);
  102ea9:	eb 36                	jmp    102ee1 <memmove+0x9b>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102eab:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102eae:	8d 50 ff             	lea    -0x1(%eax),%edx
  102eb1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102eb4:	01 c2                	add    %eax,%edx
  102eb6:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102eb9:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102ebc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ebf:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  102ec2:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102ec5:	89 c1                	mov    %eax,%ecx
  102ec7:	89 d8                	mov    %ebx,%eax
  102ec9:	89 d6                	mov    %edx,%esi
  102ecb:	89 c7                	mov    %eax,%edi
  102ecd:	fd                   	std    
  102ece:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102ed0:	fc                   	cld    
  102ed1:	89 f8                	mov    %edi,%eax
  102ed3:	89 f2                	mov    %esi,%edx
  102ed5:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102ed8:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102edb:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  102ede:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102ee1:	83 c4 30             	add    $0x30,%esp
  102ee4:	5b                   	pop    %ebx
  102ee5:	5e                   	pop    %esi
  102ee6:	5f                   	pop    %edi
  102ee7:	5d                   	pop    %ebp
  102ee8:	c3                   	ret    

00102ee9 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102ee9:	55                   	push   %ebp
  102eea:	89 e5                	mov    %esp,%ebp
  102eec:	57                   	push   %edi
  102eed:	56                   	push   %esi
  102eee:	83 ec 20             	sub    $0x20,%esp
  102ef1:	8b 45 08             	mov    0x8(%ebp),%eax
  102ef4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102ef7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102efa:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102efd:	8b 45 10             	mov    0x10(%ebp),%eax
  102f00:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102f03:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102f06:	c1 e8 02             	shr    $0x2,%eax
  102f09:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102f0b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102f0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f11:	89 d7                	mov    %edx,%edi
  102f13:	89 c6                	mov    %eax,%esi
  102f15:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102f17:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102f1a:	83 e1 03             	and    $0x3,%ecx
  102f1d:	74 02                	je     102f21 <memcpy+0x38>
  102f1f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102f21:	89 f0                	mov    %esi,%eax
  102f23:	89 fa                	mov    %edi,%edx
  102f25:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102f28:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102f2b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  102f2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_MEMCPY
    return __memcpy(dst, src, n);
  102f31:	90                   	nop
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102f32:	83 c4 20             	add    $0x20,%esp
  102f35:	5e                   	pop    %esi
  102f36:	5f                   	pop    %edi
  102f37:	5d                   	pop    %ebp
  102f38:	c3                   	ret    

00102f39 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102f39:	55                   	push   %ebp
  102f3a:	89 e5                	mov    %esp,%ebp
  102f3c:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102f3f:	8b 45 08             	mov    0x8(%ebp),%eax
  102f42:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102f45:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f48:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102f4b:	eb 2e                	jmp    102f7b <memcmp+0x42>
        if (*s1 != *s2) {
  102f4d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f50:	0f b6 10             	movzbl (%eax),%edx
  102f53:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f56:	0f b6 00             	movzbl (%eax),%eax
  102f59:	38 c2                	cmp    %al,%dl
  102f5b:	74 18                	je     102f75 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102f5d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f60:	0f b6 00             	movzbl (%eax),%eax
  102f63:	0f b6 d0             	movzbl %al,%edx
  102f66:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f69:	0f b6 00             	movzbl (%eax),%eax
  102f6c:	0f b6 c0             	movzbl %al,%eax
  102f6f:	29 c2                	sub    %eax,%edx
  102f71:	89 d0                	mov    %edx,%eax
  102f73:	eb 18                	jmp    102f8d <memcmp+0x54>
        }
        s1 ++, s2 ++;
  102f75:	ff 45 fc             	incl   -0x4(%ebp)
  102f78:	ff 45 f8             	incl   -0x8(%ebp)
    while (n -- > 0) {
  102f7b:	8b 45 10             	mov    0x10(%ebp),%eax
  102f7e:	8d 50 ff             	lea    -0x1(%eax),%edx
  102f81:	89 55 10             	mov    %edx,0x10(%ebp)
  102f84:	85 c0                	test   %eax,%eax
  102f86:	75 c5                	jne    102f4d <memcmp+0x14>
    }
    return 0;
  102f88:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102f8d:	c9                   	leave  
  102f8e:	c3                   	ret    

00102f8f <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102f8f:	55                   	push   %ebp
  102f90:	89 e5                	mov    %esp,%ebp
  102f92:	83 ec 58             	sub    $0x58,%esp
  102f95:	8b 45 10             	mov    0x10(%ebp),%eax
  102f98:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102f9b:	8b 45 14             	mov    0x14(%ebp),%eax
  102f9e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102fa1:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102fa4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102fa7:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102faa:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102fad:	8b 45 18             	mov    0x18(%ebp),%eax
  102fb0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102fb3:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102fb6:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102fb9:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102fbc:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102fbf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fc2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102fc5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102fc9:	74 1c                	je     102fe7 <printnum+0x58>
  102fcb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fce:	ba 00 00 00 00       	mov    $0x0,%edx
  102fd3:	f7 75 e4             	divl   -0x1c(%ebp)
  102fd6:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102fd9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fdc:	ba 00 00 00 00       	mov    $0x0,%edx
  102fe1:	f7 75 e4             	divl   -0x1c(%ebp)
  102fe4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fe7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fea:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102fed:	f7 75 e4             	divl   -0x1c(%ebp)
  102ff0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102ff3:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102ff6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102ff9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102ffc:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102fff:	89 55 ec             	mov    %edx,-0x14(%ebp)
  103002:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103005:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  103008:	8b 45 18             	mov    0x18(%ebp),%eax
  10300b:	ba 00 00 00 00       	mov    $0x0,%edx
  103010:	39 55 d4             	cmp    %edx,-0x2c(%ebp)
  103013:	72 56                	jb     10306b <printnum+0xdc>
  103015:	39 55 d4             	cmp    %edx,-0x2c(%ebp)
  103018:	77 05                	ja     10301f <printnum+0x90>
  10301a:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  10301d:	72 4c                	jb     10306b <printnum+0xdc>
        printnum(putch, putdat, result, base, width - 1, padc);
  10301f:	8b 45 1c             	mov    0x1c(%ebp),%eax
  103022:	8d 50 ff             	lea    -0x1(%eax),%edx
  103025:	8b 45 20             	mov    0x20(%ebp),%eax
  103028:	89 44 24 18          	mov    %eax,0x18(%esp)
  10302c:	89 54 24 14          	mov    %edx,0x14(%esp)
  103030:	8b 45 18             	mov    0x18(%ebp),%eax
  103033:	89 44 24 10          	mov    %eax,0x10(%esp)
  103037:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10303a:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10303d:	89 44 24 08          	mov    %eax,0x8(%esp)
  103041:	89 54 24 0c          	mov    %edx,0xc(%esp)
  103045:	8b 45 0c             	mov    0xc(%ebp),%eax
  103048:	89 44 24 04          	mov    %eax,0x4(%esp)
  10304c:	8b 45 08             	mov    0x8(%ebp),%eax
  10304f:	89 04 24             	mov    %eax,(%esp)
  103052:	e8 38 ff ff ff       	call   102f8f <printnum>
  103057:	eb 1b                	jmp    103074 <printnum+0xe5>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  103059:	8b 45 0c             	mov    0xc(%ebp),%eax
  10305c:	89 44 24 04          	mov    %eax,0x4(%esp)
  103060:	8b 45 20             	mov    0x20(%ebp),%eax
  103063:	89 04 24             	mov    %eax,(%esp)
  103066:	8b 45 08             	mov    0x8(%ebp),%eax
  103069:	ff d0                	call   *%eax
        while (-- width > 0)
  10306b:	ff 4d 1c             	decl   0x1c(%ebp)
  10306e:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  103072:	7f e5                	jg     103059 <printnum+0xca>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  103074:	8b 45 d8             	mov    -0x28(%ebp),%eax
  103077:	05 d0 3d 10 00       	add    $0x103dd0,%eax
  10307c:	0f b6 00             	movzbl (%eax),%eax
  10307f:	0f be c0             	movsbl %al,%eax
  103082:	8b 55 0c             	mov    0xc(%ebp),%edx
  103085:	89 54 24 04          	mov    %edx,0x4(%esp)
  103089:	89 04 24             	mov    %eax,(%esp)
  10308c:	8b 45 08             	mov    0x8(%ebp),%eax
  10308f:	ff d0                	call   *%eax
}
  103091:	90                   	nop
  103092:	c9                   	leave  
  103093:	c3                   	ret    

00103094 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  103094:	55                   	push   %ebp
  103095:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  103097:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  10309b:	7e 14                	jle    1030b1 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  10309d:	8b 45 08             	mov    0x8(%ebp),%eax
  1030a0:	8b 00                	mov    (%eax),%eax
  1030a2:	8d 48 08             	lea    0x8(%eax),%ecx
  1030a5:	8b 55 08             	mov    0x8(%ebp),%edx
  1030a8:	89 0a                	mov    %ecx,(%edx)
  1030aa:	8b 50 04             	mov    0x4(%eax),%edx
  1030ad:	8b 00                	mov    (%eax),%eax
  1030af:	eb 30                	jmp    1030e1 <getuint+0x4d>
    }
    else if (lflag) {
  1030b1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1030b5:	74 16                	je     1030cd <getuint+0x39>
        return va_arg(*ap, unsigned long);
  1030b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ba:	8b 00                	mov    (%eax),%eax
  1030bc:	8d 48 04             	lea    0x4(%eax),%ecx
  1030bf:	8b 55 08             	mov    0x8(%ebp),%edx
  1030c2:	89 0a                	mov    %ecx,(%edx)
  1030c4:	8b 00                	mov    (%eax),%eax
  1030c6:	ba 00 00 00 00       	mov    $0x0,%edx
  1030cb:	eb 14                	jmp    1030e1 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  1030cd:	8b 45 08             	mov    0x8(%ebp),%eax
  1030d0:	8b 00                	mov    (%eax),%eax
  1030d2:	8d 48 04             	lea    0x4(%eax),%ecx
  1030d5:	8b 55 08             	mov    0x8(%ebp),%edx
  1030d8:	89 0a                	mov    %ecx,(%edx)
  1030da:	8b 00                	mov    (%eax),%eax
  1030dc:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  1030e1:	5d                   	pop    %ebp
  1030e2:	c3                   	ret    

001030e3 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  1030e3:	55                   	push   %ebp
  1030e4:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  1030e6:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1030ea:	7e 14                	jle    103100 <getint+0x1d>
        return va_arg(*ap, long long);
  1030ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ef:	8b 00                	mov    (%eax),%eax
  1030f1:	8d 48 08             	lea    0x8(%eax),%ecx
  1030f4:	8b 55 08             	mov    0x8(%ebp),%edx
  1030f7:	89 0a                	mov    %ecx,(%edx)
  1030f9:	8b 50 04             	mov    0x4(%eax),%edx
  1030fc:	8b 00                	mov    (%eax),%eax
  1030fe:	eb 28                	jmp    103128 <getint+0x45>
    }
    else if (lflag) {
  103100:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103104:	74 12                	je     103118 <getint+0x35>
        return va_arg(*ap, long);
  103106:	8b 45 08             	mov    0x8(%ebp),%eax
  103109:	8b 00                	mov    (%eax),%eax
  10310b:	8d 48 04             	lea    0x4(%eax),%ecx
  10310e:	8b 55 08             	mov    0x8(%ebp),%edx
  103111:	89 0a                	mov    %ecx,(%edx)
  103113:	8b 00                	mov    (%eax),%eax
  103115:	99                   	cltd   
  103116:	eb 10                	jmp    103128 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  103118:	8b 45 08             	mov    0x8(%ebp),%eax
  10311b:	8b 00                	mov    (%eax),%eax
  10311d:	8d 48 04             	lea    0x4(%eax),%ecx
  103120:	8b 55 08             	mov    0x8(%ebp),%edx
  103123:	89 0a                	mov    %ecx,(%edx)
  103125:	8b 00                	mov    (%eax),%eax
  103127:	99                   	cltd   
    }
}
  103128:	5d                   	pop    %ebp
  103129:	c3                   	ret    

0010312a <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  10312a:	55                   	push   %ebp
  10312b:	89 e5                	mov    %esp,%ebp
  10312d:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  103130:	8d 45 14             	lea    0x14(%ebp),%eax
  103133:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  103136:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103139:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10313d:	8b 45 10             	mov    0x10(%ebp),%eax
  103140:	89 44 24 08          	mov    %eax,0x8(%esp)
  103144:	8b 45 0c             	mov    0xc(%ebp),%eax
  103147:	89 44 24 04          	mov    %eax,0x4(%esp)
  10314b:	8b 45 08             	mov    0x8(%ebp),%eax
  10314e:	89 04 24             	mov    %eax,(%esp)
  103151:	e8 03 00 00 00       	call   103159 <vprintfmt>
    va_end(ap);
}
  103156:	90                   	nop
  103157:	c9                   	leave  
  103158:	c3                   	ret    

00103159 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  103159:	55                   	push   %ebp
  10315a:	89 e5                	mov    %esp,%ebp
  10315c:	56                   	push   %esi
  10315d:	53                   	push   %ebx
  10315e:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  103161:	eb 17                	jmp    10317a <vprintfmt+0x21>
            if (ch == '\0') {
  103163:	85 db                	test   %ebx,%ebx
  103165:	0f 84 bf 03 00 00    	je     10352a <vprintfmt+0x3d1>
                return;
            }
            putch(ch, putdat);
  10316b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10316e:	89 44 24 04          	mov    %eax,0x4(%esp)
  103172:	89 1c 24             	mov    %ebx,(%esp)
  103175:	8b 45 08             	mov    0x8(%ebp),%eax
  103178:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  10317a:	8b 45 10             	mov    0x10(%ebp),%eax
  10317d:	8d 50 01             	lea    0x1(%eax),%edx
  103180:	89 55 10             	mov    %edx,0x10(%ebp)
  103183:	0f b6 00             	movzbl (%eax),%eax
  103186:	0f b6 d8             	movzbl %al,%ebx
  103189:	83 fb 25             	cmp    $0x25,%ebx
  10318c:	75 d5                	jne    103163 <vprintfmt+0xa>
        }

        // Process a %-escape sequence
        char padc = ' ';
  10318e:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  103192:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  103199:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10319c:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  10319f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  1031a6:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1031a9:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  1031ac:	8b 45 10             	mov    0x10(%ebp),%eax
  1031af:	8d 50 01             	lea    0x1(%eax),%edx
  1031b2:	89 55 10             	mov    %edx,0x10(%ebp)
  1031b5:	0f b6 00             	movzbl (%eax),%eax
  1031b8:	0f b6 d8             	movzbl %al,%ebx
  1031bb:	8d 43 dd             	lea    -0x23(%ebx),%eax
  1031be:	83 f8 55             	cmp    $0x55,%eax
  1031c1:	0f 87 37 03 00 00    	ja     1034fe <vprintfmt+0x3a5>
  1031c7:	8b 04 85 f4 3d 10 00 	mov    0x103df4(,%eax,4),%eax
  1031ce:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  1031d0:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  1031d4:	eb d6                	jmp    1031ac <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  1031d6:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  1031da:	eb d0                	jmp    1031ac <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  1031dc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  1031e3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1031e6:	89 d0                	mov    %edx,%eax
  1031e8:	c1 e0 02             	shl    $0x2,%eax
  1031eb:	01 d0                	add    %edx,%eax
  1031ed:	01 c0                	add    %eax,%eax
  1031ef:	01 d8                	add    %ebx,%eax
  1031f1:	83 e8 30             	sub    $0x30,%eax
  1031f4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  1031f7:	8b 45 10             	mov    0x10(%ebp),%eax
  1031fa:	0f b6 00             	movzbl (%eax),%eax
  1031fd:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  103200:	83 fb 2f             	cmp    $0x2f,%ebx
  103203:	7e 38                	jle    10323d <vprintfmt+0xe4>
  103205:	83 fb 39             	cmp    $0x39,%ebx
  103208:	7f 33                	jg     10323d <vprintfmt+0xe4>
            for (precision = 0; ; ++ fmt) {
  10320a:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
  10320d:	eb d4                	jmp    1031e3 <vprintfmt+0x8a>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  10320f:	8b 45 14             	mov    0x14(%ebp),%eax
  103212:	8d 50 04             	lea    0x4(%eax),%edx
  103215:	89 55 14             	mov    %edx,0x14(%ebp)
  103218:	8b 00                	mov    (%eax),%eax
  10321a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  10321d:	eb 1f                	jmp    10323e <vprintfmt+0xe5>

        case '.':
            if (width < 0)
  10321f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103223:	79 87                	jns    1031ac <vprintfmt+0x53>
                width = 0;
  103225:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  10322c:	e9 7b ff ff ff       	jmp    1031ac <vprintfmt+0x53>

        case '#':
            altflag = 1;
  103231:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  103238:	e9 6f ff ff ff       	jmp    1031ac <vprintfmt+0x53>
            goto process_precision;
  10323d:	90                   	nop

        process_precision:
            if (width < 0)
  10323e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103242:	0f 89 64 ff ff ff    	jns    1031ac <vprintfmt+0x53>
                width = precision, precision = -1;
  103248:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10324b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10324e:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  103255:	e9 52 ff ff ff       	jmp    1031ac <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  10325a:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  10325d:	e9 4a ff ff ff       	jmp    1031ac <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  103262:	8b 45 14             	mov    0x14(%ebp),%eax
  103265:	8d 50 04             	lea    0x4(%eax),%edx
  103268:	89 55 14             	mov    %edx,0x14(%ebp)
  10326b:	8b 00                	mov    (%eax),%eax
  10326d:	8b 55 0c             	mov    0xc(%ebp),%edx
  103270:	89 54 24 04          	mov    %edx,0x4(%esp)
  103274:	89 04 24             	mov    %eax,(%esp)
  103277:	8b 45 08             	mov    0x8(%ebp),%eax
  10327a:	ff d0                	call   *%eax
            break;
  10327c:	e9 a4 02 00 00       	jmp    103525 <vprintfmt+0x3cc>

        // error message
        case 'e':
            err = va_arg(ap, int);
  103281:	8b 45 14             	mov    0x14(%ebp),%eax
  103284:	8d 50 04             	lea    0x4(%eax),%edx
  103287:	89 55 14             	mov    %edx,0x14(%ebp)
  10328a:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  10328c:	85 db                	test   %ebx,%ebx
  10328e:	79 02                	jns    103292 <vprintfmt+0x139>
                err = -err;
  103290:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  103292:	83 fb 06             	cmp    $0x6,%ebx
  103295:	7f 0b                	jg     1032a2 <vprintfmt+0x149>
  103297:	8b 34 9d b4 3d 10 00 	mov    0x103db4(,%ebx,4),%esi
  10329e:	85 f6                	test   %esi,%esi
  1032a0:	75 23                	jne    1032c5 <vprintfmt+0x16c>
                printfmt(putch, putdat, "error %d", err);
  1032a2:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1032a6:	c7 44 24 08 e1 3d 10 	movl   $0x103de1,0x8(%esp)
  1032ad:	00 
  1032ae:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032b1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032b5:	8b 45 08             	mov    0x8(%ebp),%eax
  1032b8:	89 04 24             	mov    %eax,(%esp)
  1032bb:	e8 6a fe ff ff       	call   10312a <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  1032c0:	e9 60 02 00 00       	jmp    103525 <vprintfmt+0x3cc>
                printfmt(putch, putdat, "%s", p);
  1032c5:	89 74 24 0c          	mov    %esi,0xc(%esp)
  1032c9:	c7 44 24 08 ea 3d 10 	movl   $0x103dea,0x8(%esp)
  1032d0:	00 
  1032d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032d4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1032db:	89 04 24             	mov    %eax,(%esp)
  1032de:	e8 47 fe ff ff       	call   10312a <printfmt>
            break;
  1032e3:	e9 3d 02 00 00       	jmp    103525 <vprintfmt+0x3cc>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  1032e8:	8b 45 14             	mov    0x14(%ebp),%eax
  1032eb:	8d 50 04             	lea    0x4(%eax),%edx
  1032ee:	89 55 14             	mov    %edx,0x14(%ebp)
  1032f1:	8b 30                	mov    (%eax),%esi
  1032f3:	85 f6                	test   %esi,%esi
  1032f5:	75 05                	jne    1032fc <vprintfmt+0x1a3>
                p = "(null)";
  1032f7:	be ed 3d 10 00       	mov    $0x103ded,%esi
            }
            if (width > 0 && padc != '-') {
  1032fc:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103300:	7e 76                	jle    103378 <vprintfmt+0x21f>
  103302:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  103306:	74 70                	je     103378 <vprintfmt+0x21f>
                for (width -= strnlen(p, precision); width > 0; width --) {
  103308:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10330b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10330f:	89 34 24             	mov    %esi,(%esp)
  103312:	e8 f6 f7 ff ff       	call   102b0d <strnlen>
  103317:	8b 55 e8             	mov    -0x18(%ebp),%edx
  10331a:	29 c2                	sub    %eax,%edx
  10331c:	89 d0                	mov    %edx,%eax
  10331e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103321:	eb 16                	jmp    103339 <vprintfmt+0x1e0>
                    putch(padc, putdat);
  103323:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  103327:	8b 55 0c             	mov    0xc(%ebp),%edx
  10332a:	89 54 24 04          	mov    %edx,0x4(%esp)
  10332e:	89 04 24             	mov    %eax,(%esp)
  103331:	8b 45 08             	mov    0x8(%ebp),%eax
  103334:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  103336:	ff 4d e8             	decl   -0x18(%ebp)
  103339:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10333d:	7f e4                	jg     103323 <vprintfmt+0x1ca>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  10333f:	eb 37                	jmp    103378 <vprintfmt+0x21f>
                if (altflag && (ch < ' ' || ch > '~')) {
  103341:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  103345:	74 1f                	je     103366 <vprintfmt+0x20d>
  103347:	83 fb 1f             	cmp    $0x1f,%ebx
  10334a:	7e 05                	jle    103351 <vprintfmt+0x1f8>
  10334c:	83 fb 7e             	cmp    $0x7e,%ebx
  10334f:	7e 15                	jle    103366 <vprintfmt+0x20d>
                    putch('?', putdat);
  103351:	8b 45 0c             	mov    0xc(%ebp),%eax
  103354:	89 44 24 04          	mov    %eax,0x4(%esp)
  103358:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  10335f:	8b 45 08             	mov    0x8(%ebp),%eax
  103362:	ff d0                	call   *%eax
  103364:	eb 0f                	jmp    103375 <vprintfmt+0x21c>
                }
                else {
                    putch(ch, putdat);
  103366:	8b 45 0c             	mov    0xc(%ebp),%eax
  103369:	89 44 24 04          	mov    %eax,0x4(%esp)
  10336d:	89 1c 24             	mov    %ebx,(%esp)
  103370:	8b 45 08             	mov    0x8(%ebp),%eax
  103373:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103375:	ff 4d e8             	decl   -0x18(%ebp)
  103378:	89 f0                	mov    %esi,%eax
  10337a:	8d 70 01             	lea    0x1(%eax),%esi
  10337d:	0f b6 00             	movzbl (%eax),%eax
  103380:	0f be d8             	movsbl %al,%ebx
  103383:	85 db                	test   %ebx,%ebx
  103385:	74 27                	je     1033ae <vprintfmt+0x255>
  103387:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  10338b:	78 b4                	js     103341 <vprintfmt+0x1e8>
  10338d:	ff 4d e4             	decl   -0x1c(%ebp)
  103390:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103394:	79 ab                	jns    103341 <vprintfmt+0x1e8>
                }
            }
            for (; width > 0; width --) {
  103396:	eb 16                	jmp    1033ae <vprintfmt+0x255>
                putch(' ', putdat);
  103398:	8b 45 0c             	mov    0xc(%ebp),%eax
  10339b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10339f:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1033a6:	8b 45 08             	mov    0x8(%ebp),%eax
  1033a9:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  1033ab:	ff 4d e8             	decl   -0x18(%ebp)
  1033ae:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1033b2:	7f e4                	jg     103398 <vprintfmt+0x23f>
            }
            break;
  1033b4:	e9 6c 01 00 00       	jmp    103525 <vprintfmt+0x3cc>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  1033b9:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1033bc:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033c0:	8d 45 14             	lea    0x14(%ebp),%eax
  1033c3:	89 04 24             	mov    %eax,(%esp)
  1033c6:	e8 18 fd ff ff       	call   1030e3 <getint>
  1033cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033ce:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  1033d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033d4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1033d7:	85 d2                	test   %edx,%edx
  1033d9:	79 26                	jns    103401 <vprintfmt+0x2a8>
                putch('-', putdat);
  1033db:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033de:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033e2:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  1033e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1033ec:	ff d0                	call   *%eax
                num = -(long long)num;
  1033ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033f1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1033f4:	f7 d8                	neg    %eax
  1033f6:	83 d2 00             	adc    $0x0,%edx
  1033f9:	f7 da                	neg    %edx
  1033fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033fe:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  103401:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103408:	e9 a8 00 00 00       	jmp    1034b5 <vprintfmt+0x35c>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  10340d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103410:	89 44 24 04          	mov    %eax,0x4(%esp)
  103414:	8d 45 14             	lea    0x14(%ebp),%eax
  103417:	89 04 24             	mov    %eax,(%esp)
  10341a:	e8 75 fc ff ff       	call   103094 <getuint>
  10341f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103422:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  103425:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  10342c:	e9 84 00 00 00       	jmp    1034b5 <vprintfmt+0x35c>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  103431:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103434:	89 44 24 04          	mov    %eax,0x4(%esp)
  103438:	8d 45 14             	lea    0x14(%ebp),%eax
  10343b:	89 04 24             	mov    %eax,(%esp)
  10343e:	e8 51 fc ff ff       	call   103094 <getuint>
  103443:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103446:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  103449:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  103450:	eb 63                	jmp    1034b5 <vprintfmt+0x35c>

        // pointer
        case 'p':
            putch('0', putdat);
  103452:	8b 45 0c             	mov    0xc(%ebp),%eax
  103455:	89 44 24 04          	mov    %eax,0x4(%esp)
  103459:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  103460:	8b 45 08             	mov    0x8(%ebp),%eax
  103463:	ff d0                	call   *%eax
            putch('x', putdat);
  103465:	8b 45 0c             	mov    0xc(%ebp),%eax
  103468:	89 44 24 04          	mov    %eax,0x4(%esp)
  10346c:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  103473:	8b 45 08             	mov    0x8(%ebp),%eax
  103476:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  103478:	8b 45 14             	mov    0x14(%ebp),%eax
  10347b:	8d 50 04             	lea    0x4(%eax),%edx
  10347e:	89 55 14             	mov    %edx,0x14(%ebp)
  103481:	8b 00                	mov    (%eax),%eax
  103483:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103486:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  10348d:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  103494:	eb 1f                	jmp    1034b5 <vprintfmt+0x35c>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  103496:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103499:	89 44 24 04          	mov    %eax,0x4(%esp)
  10349d:	8d 45 14             	lea    0x14(%ebp),%eax
  1034a0:	89 04 24             	mov    %eax,(%esp)
  1034a3:	e8 ec fb ff ff       	call   103094 <getuint>
  1034a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1034ab:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  1034ae:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  1034b5:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  1034b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1034bc:	89 54 24 18          	mov    %edx,0x18(%esp)
  1034c0:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1034c3:	89 54 24 14          	mov    %edx,0x14(%esp)
  1034c7:	89 44 24 10          	mov    %eax,0x10(%esp)
  1034cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1034ce:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1034d1:	89 44 24 08          	mov    %eax,0x8(%esp)
  1034d5:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1034d9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034dc:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034e0:	8b 45 08             	mov    0x8(%ebp),%eax
  1034e3:	89 04 24             	mov    %eax,(%esp)
  1034e6:	e8 a4 fa ff ff       	call   102f8f <printnum>
            break;
  1034eb:	eb 38                	jmp    103525 <vprintfmt+0x3cc>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  1034ed:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034f0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034f4:	89 1c 24             	mov    %ebx,(%esp)
  1034f7:	8b 45 08             	mov    0x8(%ebp),%eax
  1034fa:	ff d0                	call   *%eax
            break;
  1034fc:	eb 27                	jmp    103525 <vprintfmt+0x3cc>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  1034fe:	8b 45 0c             	mov    0xc(%ebp),%eax
  103501:	89 44 24 04          	mov    %eax,0x4(%esp)
  103505:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  10350c:	8b 45 08             	mov    0x8(%ebp),%eax
  10350f:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  103511:	ff 4d 10             	decl   0x10(%ebp)
  103514:	eb 03                	jmp    103519 <vprintfmt+0x3c0>
  103516:	ff 4d 10             	decl   0x10(%ebp)
  103519:	8b 45 10             	mov    0x10(%ebp),%eax
  10351c:	48                   	dec    %eax
  10351d:	0f b6 00             	movzbl (%eax),%eax
  103520:	3c 25                	cmp    $0x25,%al
  103522:	75 f2                	jne    103516 <vprintfmt+0x3bd>
                /* do nothing */;
            break;
  103524:	90                   	nop
    while (1) {
  103525:	e9 37 fc ff ff       	jmp    103161 <vprintfmt+0x8>
                return;
  10352a:	90                   	nop
        }
    }
}
  10352b:	83 c4 40             	add    $0x40,%esp
  10352e:	5b                   	pop    %ebx
  10352f:	5e                   	pop    %esi
  103530:	5d                   	pop    %ebp
  103531:	c3                   	ret    

00103532 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  103532:	55                   	push   %ebp
  103533:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  103535:	8b 45 0c             	mov    0xc(%ebp),%eax
  103538:	8b 40 08             	mov    0x8(%eax),%eax
  10353b:	8d 50 01             	lea    0x1(%eax),%edx
  10353e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103541:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  103544:	8b 45 0c             	mov    0xc(%ebp),%eax
  103547:	8b 10                	mov    (%eax),%edx
  103549:	8b 45 0c             	mov    0xc(%ebp),%eax
  10354c:	8b 40 04             	mov    0x4(%eax),%eax
  10354f:	39 c2                	cmp    %eax,%edx
  103551:	73 12                	jae    103565 <sprintputch+0x33>
        *b->buf ++ = ch;
  103553:	8b 45 0c             	mov    0xc(%ebp),%eax
  103556:	8b 00                	mov    (%eax),%eax
  103558:	8d 48 01             	lea    0x1(%eax),%ecx
  10355b:	8b 55 0c             	mov    0xc(%ebp),%edx
  10355e:	89 0a                	mov    %ecx,(%edx)
  103560:	8b 55 08             	mov    0x8(%ebp),%edx
  103563:	88 10                	mov    %dl,(%eax)
    }
}
  103565:	90                   	nop
  103566:	5d                   	pop    %ebp
  103567:	c3                   	ret    

00103568 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  103568:	55                   	push   %ebp
  103569:	89 e5                	mov    %esp,%ebp
  10356b:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10356e:	8d 45 14             	lea    0x14(%ebp),%eax
  103571:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  103574:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103577:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10357b:	8b 45 10             	mov    0x10(%ebp),%eax
  10357e:	89 44 24 08          	mov    %eax,0x8(%esp)
  103582:	8b 45 0c             	mov    0xc(%ebp),%eax
  103585:	89 44 24 04          	mov    %eax,0x4(%esp)
  103589:	8b 45 08             	mov    0x8(%ebp),%eax
  10358c:	89 04 24             	mov    %eax,(%esp)
  10358f:	e8 08 00 00 00       	call   10359c <vsnprintf>
  103594:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  103597:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10359a:	c9                   	leave  
  10359b:	c3                   	ret    

0010359c <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  10359c:	55                   	push   %ebp
  10359d:	89 e5                	mov    %esp,%ebp
  10359f:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  1035a2:	8b 45 08             	mov    0x8(%ebp),%eax
  1035a5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1035a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1035ab:	8d 50 ff             	lea    -0x1(%eax),%edx
  1035ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1035b1:	01 d0                	add    %edx,%eax
  1035b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1035b6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  1035bd:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1035c1:	74 0a                	je     1035cd <vsnprintf+0x31>
  1035c3:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1035c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1035c9:	39 c2                	cmp    %eax,%edx
  1035cb:	76 07                	jbe    1035d4 <vsnprintf+0x38>
        return -E_INVAL;
  1035cd:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  1035d2:	eb 2a                	jmp    1035fe <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  1035d4:	8b 45 14             	mov    0x14(%ebp),%eax
  1035d7:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1035db:	8b 45 10             	mov    0x10(%ebp),%eax
  1035de:	89 44 24 08          	mov    %eax,0x8(%esp)
  1035e2:	8d 45 ec             	lea    -0x14(%ebp),%eax
  1035e5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1035e9:	c7 04 24 32 35 10 00 	movl   $0x103532,(%esp)
  1035f0:	e8 64 fb ff ff       	call   103159 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  1035f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1035f8:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  1035fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1035fe:	c9                   	leave  
  1035ff:	c3                   	ret    
