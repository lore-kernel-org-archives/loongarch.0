Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024267EE
	for <loongarch@lists.linux.dev>; Thu,  1 Sep 2022 02:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1661999416; bh=KJnjnuj9UwZ584xvjShdAEAAYkFgZpBSk25gP37xpaU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c17EwY9J77leNbKYcmpkMYnMqZmQJEYMOGp4Sgpkahg6Rf+ZGMYUmInueKbKd926Q
	 FYhh5jbxcgQ3qLh1zd+2vwmwVxkDKxtCDygWXyXXJoJE36LhhQv3G1ZLCdp/34MBQv
	 lF877lOpugJsurrQHVl5wHY29gSvUnYTjJZ9smqQ=
Received: from [100.100.57.219] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id F30C8600A9;
	Thu,  1 Sep 2022 10:30:15 +0800 (CST)
Message-ID: <e805e3c4-ea66-a438-9def-bc90bbffa14e@xen0n.name>
Date: Thu, 1 Sep 2022 10:30:15 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:106.0)
 Gecko/20100101 Thunderbird/106.0a1
Subject: Re: [PATCH v2] LoongArch: Add safer signal handler for TLS access
To: Mao Bibo <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220831074846.3565542-1-maobibo@loongson.cn>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20220831074846.3565542-1-maobibo@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/8/31 15:48, Mao Bibo wrote:
> LoongArch uses general purpose register R2 as thread pointer(TP)
> register, signal hanlder also uses TP register to access variables
> in TLS area, such as errno and variable in TLS.
> 
> If GPR R2 is modified with wrong value, signal handler still uses
> the wrong TP register, so signal hanlder is insafe to access TLS
> variable.
> 
> This patch adds one arch specific syscall set_thread_area, and
> restore previoud TP value before signal handler, so that signal
> handler is safe to access TLS variable.
> 
> It passes to run with the following test case.
> =======8<======
>   #define _GNU_SOURCE
>   #include <stdio.h>
>   #include <stdlib.h>
>   #include <unistd.h>
>   #include <string.h>
>   #include <sys/syscall.h>
>   #include <sys/types.h>
>   #include <signal.h>
>   #include <pthread.h>
>   #include <asm/ucontext.h>
>   #include <asm/sigcontext.h>
> 
>   #define ILL_INSN ".word 0x000001f0"
> static inline long test_sigill(unsigned long fid)
> {
>          register long ret __asm__("$r4");
>          register unsigned long fun __asm__("$r4") = fid;
> 
>          __asm__ __volatile__("move $r2, $r0 \r\n");
>          __asm__ __volatile__(
>                          ILL_INSN
>                          : "=r" (ret)
>                          : "r" (fun)
>                          : "memory"
>                          );
> 
>          return ret;
> }
> 
> static void set_sigill_handler(void (*fn) (int, siginfo_t *, void *))
> {
>          struct sigaction sa;
>          memset(&sa, 0, sizeof(struct sigaction));
> 
>          sa.sa_sigaction = fn;
>          sa.sa_flags = SA_SIGINFO;
>          sigemptyset(&sa.sa_mask);
>          if (sigaction(SIGILL, &sa, 0) != 0) {
>                  perror("sigaction");
>          }
> }
> 
> void catch_sig(int sig, siginfo_t *si, void *vuc)
> {
>          struct ucontext *uc = vuc;
>          register unsigned long tls  __asm__("$r2");
> 
>          uc->uc_mcontext.sc_pc +=4;
>          uc->uc_mcontext.sc_regs[2] = tls;
>          printf("catched signal %d\n", sig);
> }
> 
> void *print_message_function( void *ptr )
> {
>          char *message;
>          message = (char *) ptr;
>          printf("%s \n", message);
>          test_sigill(1);
> }
> 
> void pthread_test(void)
> {
>          pthread_t thread1, thread2;
>          char *message1 = "Thread 1";
>          char *message2 = "Thread 2";
>          int  iret1, iret2;
> 
>          iret1 = pthread_create( &thread1, NULL, print_message_function,
> 				(void*) message1);
>          iret2 = pthread_create( &thread2, NULL, print_message_function,
> 				(void*) message2);
>          pthread_join( thread1, NULL);
>          pthread_join( thread2, NULL);
>          printf("Thread 1 returns: %d\n",iret1);
>          printf("Thread 2 returns: %d\n",iret2);
>          exit(0);
> }
> 
> void exec_test(void) {
>          test_sigill(1);
> }
> 
> void main() {
>          register unsigned long tls  __asm__("$r2");
>          int val;
> 
>          val = syscall(244, tls);
>          set_sigill_handler(&catch_sig);
>          pthread_test();
>          //exec_test();
>          return;
> }
> =======8<======

Sorry, but what is the concrete use case you have in mind? arch/riscv 
for example doesn't have set_thread_area but is apparently doing fine. I 
haven't studied their code in great detail to find out myself though.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

