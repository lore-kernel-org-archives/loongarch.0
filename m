Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2CDEEAB
	for <loongarch@lists.linux.dev>; Mon, 24 Mar 2025 01:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742780659; cv=none; b=PnGN0Jy6bFdgrAy1kE9UObpz4RRMFYm+hFD//17haKMMKzr0lQkiwuU9utYYbNxOigr3MmqUTO8s8sl8LMjUXWppz1g3meWutYfB/3X3AhA+pb5p3I1M74D+lNIf2WQsw1WdNN7e2WUcFK1nYTqAL50uEgEj9HGP4i8bfGTbAtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742780659; c=relaxed/simple;
	bh=xRbrfHOuddHYdxNvjKjVq6wM8tNLSTWFvbiXOpOeo8w=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=lT/2+M8DTgrjZ489vIc6rW/0nH1uXBh0m9GpJnkbd2QAzO3hbjPlvF8FiBRzRqGBtspbikkSHXuw0SBD8BX4LBtSWQBg9qAD57ba9p/FLNKoEeAay/2SUtKAmfyVXawrfRfdWs6LIkN8lpyyJYwDn4Hv4Jh0FAWqb5cK/P7MrCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8AxmnGVuOBnIZmjAA--.12523S3;
	Mon, 24 Mar 2025 09:42:45 +0800 (CST)
Received: from [10.136.12.26] (unknown [111.9.175.10])
	by front1 (Coremail) with SMTP id qMiowMDxu8SPuOBnTflcAA--.9800S3;
	Mon, 24 Mar 2025 09:42:41 +0800 (CST)
Subject: Re: [PATCH v2] LoongArch: KGDB: Rework arch_kgdb_breakpoint()
 implementation
To: Huacai Chen <chenhuacai@kernel.org>, WangYuli <wangyuli@uniontech.com>
Cc: kernel@xen0n.name, guanwentao@uniontech.com, wentao@uniontech.com,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 zhoubinbin@loongson.cn, lihui@loongson.cn, rdunlap@infradead.org,
 chenhuacai@loongson.cn, zhanjun@uniontech.com, niecheng1@uniontech.com,
 Tiezhu Yang <yangtiezhu@loongson.cn>
References: <943E06D656E4E707+20250321141001.109916-1-wangyuli@uniontech.com>
 <CAAhV-H71aEKj2V8mAqbUuAe1JiHngWHW3rSaJ_Dx_CzoQC7TgQ@mail.gmail.com>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <545ed081-bec3-395c-e0dd-a45146e00cd1@loongson.cn>
Date: Mon, 24 Mar 2025 09:42:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H71aEKj2V8mAqbUuAe1JiHngWHW3rSaJ_Dx_CzoQC7TgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMDxu8SPuOBnTflcAA--.9800S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGF4UGFyxtr1fKF13WF43XFc_yoW5WFW3pF
	48Ca4qkF48Jry8C39xK3y3Zr15Aws7Ww4xZ3Z8Ka4fCayDX3W5tr1IkFn7Wa4jgw1xK3W0
	vF90gF92q3W5J3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1Ek
	sDUUUUU==

On 2025-03-22 20:51, Huacai Chen wrote:

> Hi, Tiezhu & Jinyang,
>
> On Fri, Mar 21, 2025 at 10:11 PM WangYuli <wangyuli@uniontech.com> wrote:
>> The arch_kgdb_breakpoint() function defines the kgdb_breakinst
>> symbol using inline assembly.
>>
>> There's a potential issue where the compiler might inline
>> arch_kgdb_breakpoint(), which would then define the kgdb_breakinst
>> symbol multiple times, leading to a linker error.
>>
>> To prevent this, declare arch_kgdb_breakpoint() as noline.
>>
>> Fix follow error with LLVM-19 *only* when LTO_CLANG_FULL:
>>      LD      vmlinux.o
>>    ld.lld-19: error: ld-temp.o <inline asm>:3:1: symbol 'kgdb_breakinst' is already defined
>>    kgdb_breakinst: break 2
>>    ^
>>
>> Additionally, remove "nop" here because it's meaningless for LoongArch
>> here.
>>
>> Fixes: e14dd076964e ("LoongArch: Add basic KGDB & KDB support")
>> Co-developed-by: Winston Wen <wentao@uniontech.com>
>> Signed-off-by: Winston Wen <wentao@uniontech.com>
>> Co-developed-by: Wentao Guan <guanwentao@uniontech.com>
>> Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
>> Co-developed-by: Huacai Chen <chenhuacai@loongson.cn>
>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>> Tested-by: Yuli Wang <wangyuli@uniontech.com>
>> Tested-by: Binbin Zhou <zhoubinbin@loongson.cn>
>> Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
>> ---
>> Changelog:
>>   *v1->v2:
>>      1. Drop the nop which is no effect for LoongArch here.
>>      2. Add "STACK_FRAME_NON_STANDARD" for arch_kgdb_breakpoint() to
>> avoid the objtool warning.
>> ---
>>   arch/loongarch/kernel/kgdb.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/loongarch/kernel/kgdb.c b/arch/loongarch/kernel/kgdb.c
>> index 445c452d72a7..38bd0561d7d5 100644
>> --- a/arch/loongarch/kernel/kgdb.c
>> +++ b/arch/loongarch/kernel/kgdb.c
>> @@ -224,13 +224,13 @@ void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
>>          regs->csr_era = pc;
>>   }
>>
>> -void arch_kgdb_breakpoint(void)
>> +noinline void arch_kgdb_breakpoint(void)
>>   {
>>          __asm__ __volatile__ (                  \
>>                  ".globl kgdb_breakinst\n\t"     \
>> -               "nop\n"                         \
>>                  "kgdb_breakinst:\tbreak 2\n\t"); /* BRK_KDB = 2 */
>>   }
>> +STACK_FRAME_NON_STANDARD(arch_kgdb_breakpoint);
> Is there a better solution than STACK_FRAME_NON_STANDARD()? In the
> past we can use annotate_reachable() in arch_kgdb_breakpoint(), but
> annotate_reachable() is no longer exist.

Maybe we can parse the imm-code of `break` and set diffrent insn_type in 
objtool.
The BRK_KDB imply the PC will go head, while the BRK_BUG imply PC stop.
(arch/loongarch/include/uapi/asm/break.h)

Tiezhu, how do you think?


>
> Huacai
>
>>   /*
>>    * Calls linux_debug_hook before the kernel dies. If KGDB is enabled,
>> --
>> 2.49.0
>>

