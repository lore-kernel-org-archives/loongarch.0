Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3BE1863
	for <loongarch@lists.linux.dev>; Fri,  3 Feb 2023 09:34:41 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxOuov1dxj32ANAA--.26508S3;
	Fri, 03 Feb 2023 17:34:39 +0800 (CST)
Received: from [10.130.0.135] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxB70u1dxj35MoAA--.13351S3;
	Fri, 03 Feb 2023 17:34:38 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Add kprobe on ftrace support
To: Huacai Chen <chenhuacai@kernel.org>
References: <1675414264-28241-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H4tMC+y9enyvWj9hu0ngin6ND4DPKbcFybVzU=A-7tLSA@mail.gmail.com>
Cc: WANG Xuerui <kernel@xen0n.name>, Masami Hiramatsu <mhiramat@kernel.org>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <736bc691-feae-9d19-130e-4846cdd0a699@loongson.cn>
Date: Fri, 3 Feb 2023 17:34:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4tMC+y9enyvWj9hu0ngin6ND4DPKbcFybVzU=A-7tLSA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8BxB70u1dxj35MoAA--.13351S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxGF48KFWfKr18Aw1rWFWkXrb_yoW5Kr4kpF
	9rAan5tr4xJF42v3sIv3W5uFyYqrWkWry7W3WIka4Fyryqqw1UWr1xX34qgF1UGr4qg34I
	vF10kryak34xXa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bxAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
	0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
	GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI4
	8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
	8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j0sjUUUUUU=



On 02/03/2023 05:00 PM, Huacai Chen wrote:
> Hi, Tiezhu,
>
> On Fri, Feb 3, 2023 at 4:51 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> Add kprobe_ftrace_handler() and arch_prepare_kprobe_ftrace() to support
>> kprobe on ftrace, the code is similar with x86 and riscv.
>>
>> Here is a simple example:
>>
>>   # echo 'p:myprobe kernel_clone' > /sys/kernel/debug/tracing/kprobe_events
>>   # echo 'r:myretprobe kernel_clone $retval' >> /sys/kernel/debug/tracing/kprobe_events
>>   # echo 1 > /sys/kernel/debug/tracing/events/kprobes/myprobe/enable
>>   # echo 1 > /sys/kernel/debug/tracing/events/kprobes/myretprobe/enable
>>   # echo 1 > /sys/kernel/debug/tracing/tracing_on
>>   # cat /sys/kernel/debug/tracing/trace
>>   # tracer: nop
>>   #
>>   # entries-in-buffer/entries-written: 2/2   #P:4
>>   #
>>   #                                _-----=> irqs-off/BH-disabled
>>   #                               / _----=> need-resched
>>   #                              | / _---=> hardirq/softirq
>>   #                              || / _--=> preempt-depth
>>   #                              ||| / _-=> migrate-disable
>>   #                              |||| /     delay
>>   #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
>>   #              | |         |   |||||     |         |
>>               bash-488     [002] .....  2041.190681: myprobe: (kernel_clone+0x0/0x40c)
>>               bash-488     [002] .....  2041.190788: myretprobe: (__do_sys_clone+0x84/0xb8 <- kernel_clone) arg1=0x200
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>  arch/loongarch/Kconfig             |  1 +
>>  arch/loongarch/kernel/ftrace_dyn.c | 65 ++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 66 insertions(+)
>>
>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
>> index 134a2f8..22a3e77 100644
>> --- a/arch/loongarch/Kconfig
>> +++ b/arch/loongarch/Kconfig
>> @@ -104,6 +104,7 @@ config LOONGARCH
>>         select HAVE_IRQ_EXIT_ON_IRQ_STACK
>>         select HAVE_IRQ_TIME_ACCOUNTING
>>         select HAVE_KPROBES
>> +       select HAVE_KPROBES_ON_FTRACE
>>         select HAVE_KRETPROBES
>>         select HAVE_MOD_ARCH_SPECIFIC
>>         select HAVE_NMI
>> diff --git a/arch/loongarch/kernel/ftrace_dyn.c b/arch/loongarch/kernel/ftrace_dyn.c
>> index 0f07591..7b074c2 100644
>> --- a/arch/loongarch/kernel/ftrace_dyn.c
>> +++ b/arch/loongarch/kernel/ftrace_dyn.c
>> @@ -6,6 +6,7 @@
>>   */
>>
>>  #include <linux/ftrace.h>
>> +#include <linux/kprobes.h>
>>  #include <linux/uaccess.h>
>>
>>  #include <asm/inst.h>
>> @@ -271,3 +272,67 @@ int ftrace_disable_ftrace_graph_caller(void)
>>  }
>>  #endif /* CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS */
>>  #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
>> +
>> +#ifdef CONFIG_KPROBES_ON_FTRACE
>> +/* Ftrace callback handler for kprobes -- called under preepmt disabled */
>> +void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>> +                          struct ftrace_ops *ops, struct ftrace_regs *fregs)
>> +{
>> +       struct kprobe *p;
>> +       struct pt_regs *regs;
>> +       struct kprobe_ctlblk *kcb;
>> +       int bit;
>> +
>> +       bit = ftrace_test_recursion_trylock(ip, parent_ip);
>> +       if (bit < 0)
>> +               return;
>> +
> In the old version I see preempt_disable_notrace() here and
> preempt_enable_notrace() at the end.

In the latest upstream kernel code, no need to do it, here is
the related commit:

ftrace: disable preemption when recursion locked
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ce5e48036c9e

> And I prefer to add this one to
> the kprobes series rather than a separate patch.
>

Actually, this patch is based on the kprobe series, no conflicts,
sent it as a separate patch is to avoid resending the kprobe series.

Thanks,
Tiezhu

