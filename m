Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA1C13DDB1
	for <loongarch@lists.linux.dev>; Wed, 29 May 2024 11:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716982430; cv=none; b=RzX41wxf+bP98RXHRrHF5L541ut06eKZrq3AzUMm3vTnKcydVvSjIOw1/fdCv03/mduXo00PjE5c4Wjm7V6bGN9a2AsVuNxRmTJ8iYoTAn8IGpwhKlkcYHicTiVkhvqq9SZ+x4MKHic8RRZ0B4jNmyTeYWIUhXREDhEzfRwYrS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716982430; c=relaxed/simple;
	bh=evjjkzTR/3To1yqEhpHwfOVeLIWR46VQF8OQ2sZczLo=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=j8EYcH7G9T23+TpGTry4DJTwO6u/K2WdkMx3FuVuQeHeKxkDfnZ3cj8rxZbHi9xrAIlv/K9CWJn2oRcDtulbZxdAut/KMMea812r2Cpx6S9Fu6oVSql3jX9QW1DHEVcbwbWuV1FSHRE7V3y6r8f1aijL1YZDVVFmAc4Y0GzPcPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8Bx7eqYEldmuR8BAA--.4886S3;
	Wed, 29 May 2024 19:33:45 +0800 (CST)
Received: from [10.136.12.26] (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxqsaREldm7O4MAA--.33944S3;
	Wed, 29 May 2024 19:33:43 +0800 (CST)
Subject: Re: [PATCH 2/3] LoongArch: Trigger user-space watchpoints correctly
To: Hui Li <lihui@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
References: <20240529013019.15235-1-lihui@loongson.cn>
 <20240529013019.15235-3-lihui@loongson.cn>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <883d526a-76c1-e93d-eac5-9152ebda5bfb@loongson.cn>
Date: Wed, 29 May 2024 19:33:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240529013019.15235-3-lihui@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8CxqsaREldm7O4MAA--.33944S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoWxZF1rGFWfWrykZw4DuF4xZrc_yoWrur4kpr
	WakrnYqr4DtrW7Ww13tw18Cw15ZwnF93y7uwn5G34YywsIgry5Kr10krWqqF45Cw1Sg34F
	vF1F9r109FWUZagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ36c02F40EFcxC0VAKzVAqx4xG6I80ewCIccxYrVCFb4Uv73VFW2AGmfu7
	bjvjm3AaLaJ3UjIYCTnIWjp_UUUYS7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4
	CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0
	c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2
	IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2
	jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
	AFwI0_JF0_Jw1lIxkvb40E47kJMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_
	JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBI
	daVFxhVjvjDU0xZFpf9x07briihUUUUU=

On 2024-05-29 09:30, Hui Li wrote:

> In the current code, gdb can successfully set the watchpoint through
> ptrace interface, But watchpoint will not be triggered.
>
> When debugging the following code using gdb,
>
> lihui@bogon:~$ cat test.c
>    #include <stdio.h>
>    int a = 0;
>    int main()
>    {
>      printf("start test\n");
>      a = 1;
>      printf("a = %d\n", a);
>      printf("end test\n");
>      return 0;
>    }
> lihui@bogon:~$ gcc -g test.c -o test
> lihui@bogon:~$ gdb test
> ...
> (gdb) start
> ...
> Temporary breakpoint 1, main () at test.c:5
> 5        printf("start test\n");
> (gdb) watch a
> Hardware watchpoint 2: a
> (gdb) c
> Continuing.
> start test
> a = 1
> end test
> [Inferior 1 (process 1154) exited normally]
>
> No watchpoints were triggered, the root causes are:
>
> 1. The kernel uses perf_event and hw_breakpoint framework to control
>     watchpoint. But the perf_event corresponding to watchpoint is not
>     enabled, it needs to be enabled according to watchpoint control register.
>
> 2. The global enable control for all watchpoints is the WE bit of CSR.CRMD,
>     and hardware sets the value to 0 when an exception is triggered. When
>     the ERTN instruction is executed to return, the hardware restores the
>     value of the PWE field of CSR.PRMD here. So, before a thread containing
>     watchpoints be scheduled, the PWE field of CSR.PRMD needs to be set to 1.
>
> Modify the relevant code to solve the above problem. Enable the watchpoints in
> the user-space thread.
>
> All changes according to the LoongArch Reference Manual:
> https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#control-and-status-registers-related-to-watchpoints
> https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#basic-control-and-status-registers
>
> with this patch:
>
> lihui@bogon:~$ gdb test
> ...
> (gdb) start
> ...
> Temporary breakpoint 1, main () at test.c:5
> 5        printf("start test\n");
> (gdb) watch a
> Hardware watchpoint 2: a
> (gdb) c
> Continuing.
> start test
>
> Hardware watchpoint 2: a
>
> Old value = 0
> New value = 1
> main () at test.c:7
> 7        printf("a = %d\n", a);
> (gdb) c
> Continuing.
> a = 1
> end test
>
> Signed-off-by: Hui Li <lihui@loongson.cn>
> ---
>   arch/loongarch/kernel/hw_breakpoint.c |  4 +++-
>   arch/loongarch/kernel/ptrace.c        | 16 +++++++++++++---
>   2 files changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kernel/hw_breakpoint.c
> index 2d311aff91af..01cd0b051225 100644
> --- a/arch/loongarch/kernel/hw_breakpoint.c
> +++ b/arch/loongarch/kernel/hw_breakpoint.c
> @@ -517,7 +517,9 @@ void hw_breakpoint_thread_switch(struct task_struct *next)
>   		if (!((regs->csr_era ^ addr) & ~mask))
>   			csr_write32(CSR_FWPC_SKIP, LOONGARCH_CSR_FWPS);
>   		regs->csr_prmd |= CSR_PRMD_PWE;
> -	} else {
> +	} else if (test_tsk_thread_flag(next, TIF_LOAD_WATCH))
> +                regs->csr_prmd |= CSR_PRMD_PWE;

It means enable PWE without update bp regs when switch to another task.

Will there be any critical situations with other task having set HW 
breakpoints before?


> +	else {
>   		/* Update breakpoints */
>   		update_bp_registers(regs, 1, 0);
>   		/* Update watchpoints */
> diff --git a/arch/loongarch/kernel/ptrace.c b/arch/loongarch/kernel/ptrace.c
> index 16b756c6049b..328510bf60e1 100644
> --- a/arch/loongarch/kernel/ptrace.c
> +++ b/arch/loongarch/kernel/ptrace.c
> @@ -589,6 +589,8 @@ static int ptrace_hbp_set_ctrl(unsigned int note_type,
>   	struct perf_event *bp;
>   	struct perf_event_attr attr;
>   	struct arch_hw_breakpoint_ctrl ctrl;
> +        struct thread_info *ti = task_thread_info(tsk);
> +        int hbp_enable = uctrl & CTRL_PLV_ENABLE;

./scripts/checkpatch.pl


>   
>   	bp = ptrace_hbp_get_initialised_bp(note_type, tsk, idx);
>   	if (IS_ERR(bp))
> @@ -608,9 +610,17 @@ static int ptrace_hbp_set_ctrl(unsigned int note_type,
>   		return -EINVAL;
>   	}
>   
> -	err = ptrace_hbp_fill_attr_ctrl(note_type, ctrl, &attr);
> -	if (err)
> -		return err;
> +       if (hbp_enable == CTRL_PLV_ENABLE) {

The uctrl is comes form user_buf, here means the PLV{0,1,2,3} should all 
be 1?

That looks strange.


Thanks,

Jinyang

> +		err = ptrace_hbp_fill_attr_ctrl(note_type, ctrl, &attr);
> +		if (err)
> +			return err;
> +		attr.disabled = 0;
> +		set_ti_thread_flag(ti, TIF_LOAD_WATCH);
> +	}
> +	else {
> +		attr.disabled = 1;
> +		clear_ti_thread_flag(ti, TIF_LOAD_WATCH);
> +	}
>   
>   	return modify_user_hw_breakpoint(bp, &attr);
>   }

