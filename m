Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068578;
	b=IHm6PyvOy82YbUvlToep5gjJ2JAKioSB6qntzDkj85z7RwPLbVSCttt4oxufyofz2+OZ
	 b9oX80m5BkkbC6zVj7HBJHR9Y/zKwqNwYf/66KRP2ITo3In52R0vPLKxJfU1NtfeGX/IQ
	 agahREs8ZPH71/5662JYxAbGymvr8WurJjJTSxSXRDo9ROwuG4Mq99u3Xg2MDJcpWjSQo
	 D2+5utVD0C8KpL5JrYoSUUhT/RLwI9+EGidPJXAhYHD5Tf6AlaQ9VDlMyKxMjDGGHPFXX
	 ThBDhSOFDh7+b9j5bGKgx/Nr6xIPGueapx+vKV4UVsHwLVYMdfLiezuc3WCaIvc9sOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068578;
	h=DMARC-Filter:Received:Received:Subject:From:To:Cc:References:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Language:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=GpYuoU+aasuR7NN/NWFtWUbqXAW4kE979egqrG9BW2I=;
	b=oGEvmn5/5ADDl0kZKmuv09WYuCd65x81s1VmqSDVizfy6Zz6EqmaaoTYf4uLHnxVkupI
	 Q2enggb0AmykcOaiA4Is9b5tymiLfhd28IYQyANgv6s6JS7i31X3k+PdeH0L8zQBc9PFF
	 JNfzmnLvvXvuzS9YQcBIWbYdZ0jvCDJrCTQ+vYQjAE0oIPe9AMEAbBfhpXThcLkXzqLrd
	 u8B2dlNw9By+EpCjVrxF5XqUL1Ob6diuprkTC7oupuGTWz6kBysfZREK6nooNq0JLleQH
	 XbHDGS1/BXUcLcU9d6ZR3XMLo5Gq4zCQcgTdNp93rk5YDEWCn0o0Ryc7TZqdd3aZTtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9455F606A330
	for <loongarch@lists.linux.dev>; Thu, 19 Nov 2026 06:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9455F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8CxPNKekv5q0w0hAA--.29687S3;
	Thu, 19 Nov 2026 14:09:34 +0800 (CST)
Received: from [127.0.0.1] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAx2c2ckv5qBc01AA--.42565S2;
	Thu, 19 Nov 2026 14:09:33 +0800 (CST)
Subject: Re: [PATCH v2] LoongArch: Fix preemptible warnings in cacheinfo and
 local TLB flush
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261119060503.4114-1-yangtiezhu@loongson.cn>
Message-ID: <4d58c06e-87a2-f01e-a669-d8bef1dec340@loongson.cn>
Date: Thu, 19 Nov 2026 14:09:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261119060503.4114-1-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJAx2c2ckv5qBc01AA--.42565S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxKF47ZF4UuFyrXrW3CF4UGFX_yoW7GrW7pF
	WI9F1UKw4rJ3WDJa42vr1DAryYq34DuF4Ika9xAryFqw4qyr1DJr43Kw1xury8ArWjgFWU
	uasFqF4F9w4UZ3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8w0
	eJUUUUU==

On 11/19/26 2:05 PM, Tiezhu Yang wrote:
> When CONFIG_DEBUG_PREEMPT is enabled on a Non-SMP kernel, calls to
> smp_processor_id() (including via current_cpu_data) in preemptible
> contexts trigger many "BUG: using smp_processor_id() in preemptible"
> warnings during cacheinfo setup and local TLB flushes.

...

>   void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>   	unsigned long end)
>   {
>   	struct mm_struct *mm = vma->vm_mm;
> -	int cpu = smp_processor_id();
> +	int cpu = raw_smp_processor_id();
>   
>   	if (asid_valid(mm, cpu)) {
>   		unsigned long size, flags;
> @@ -67,9 +61,9 @@ void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>   		start = round_down(start, PAGE_SIZE << 1);
>   		end = round_up(end, PAGE_SIZE << 1);
>   		size = (end - start) >> (PAGE_SHIFT + 1);
> -		if (size <= (current_cpu_data.tlbsizestlbsets ?
> -			     current_cpu_data.tlbsize / 8 :
> -			     current_cpu_data.tlbsize / 2)) {
> +		if (size <= (cpu_data[cpu].tlbsizestlbsets ?
> +			     cpu_data[cpu].tlbsize / 8 :
> +			     cpu_data[cpu].tlbsize / 2)) {
>   			int asid = cpu_asid(cpu, mm);
>   
>   			while (start < end) {

I tested this v2 patch on a !CONFIG_SMP && CONFIG_PREEMPT
&& CONFIG_DEBUG_PREEMPT kernel. While it eliminates the
"BUG: using smp_processor_id() in preemptible" warnings,
removing preemption protection introduces a real ASID
race on UP preemptible kernels.

On !CONFIG_SMP, flush_tlb_{mm,range,page}() are directly
defined as local_flush_tlb_{mm,range,page}() in the arch
asm/tlbflush.h, bypassing the preempt_disable() protection
in arch/loongarch/kernel/smp.c.

Although task migration is impossible on UP, preemption
can still occur between asid_valid() and local_irq_save(),
allowing other tasks to trigger an ASID generation rollover
and modify both cpu_context(cpu, mm) and hardware CSR_ASID
mid-operation.

To verify this, I added a small debug check with mdelay(5)
on top of v2:

diff --git a/arch/loongarch/mm/tlb.c b/arch/loongarch/mm/tlb.c
index 07a6a5e94120..e2b48f08a28a 100644
--- a/arch/loongarch/mm/tlb.c
+++ b/arch/loongarch/mm/tlb.c
@@ -8,6 +8,7 @@
  #include <linux/mm.h>
  #include <linux/hugetlb.h>
  #include <linux/export.h>
+#include <linux/delay.h>

  #include <asm/bootinfo.h>
  #include <asm/cpu.h>
@@ -56,8 +57,36 @@ void local_flush_tlb_range(struct vm_area_struct 
*vma, unsigned long start,

         if (asid_valid(mm, cpu)) {
                 unsigned long size, flags;
+               unsigned long mask = cpu_asid_mask(&cpu_data[cpu]);
+               unsigned long old_ctx = cpu_context(cpu, mm);
+               unsigned long old_cache = asid_cache(cpu);
+               unsigned long old_hw_asid = 
csr_read64(LOONGARCH_CSR_ASID) & mask;
+               unsigned long new_ctx, new_cache, new_hw_asid;
+
+               mdelay(5);

                 local_irq_save(flags);
+
+               new_ctx = cpu_context(cpu, mm);
+               new_cache = asid_cache(cpu);
+               new_hw_asid = csr_read64(LOONGARCH_CSR_ASID) & mask;
+
+               if (unlikely(!asid_valid(mm, cpu) ||
+                            old_ctx != new_ctx ||
+                            old_hw_asid != new_hw_asid)) {
+                       WARN_ONCE(1,
+                                 "ASID race!\n"
+                                 "  valid=%d, is_cur_mm=%d\n"
+                                 "  ctx: 0x%lx(asid=0x%lx) -> 
0x%lx(asid=0x%lx)\n"
+                                 "  cache: 0x%lx -> 0x%lx\n"
+                                 "  hw_csr_asid: 0x%lx -> 0x%lx\n",
+                                 asid_valid(mm, cpu), (current->mm == mm),
+                                 old_ctx, old_ctx & mask,
+                                 new_ctx, new_ctx & mask,
+                                 old_cache, new_cache,
+                                 old_hw_asid, new_hw_asid);
+               }
+
                 start = round_down(start, PAGE_SIZE << 1);
                 end = round_up(end, PAGE_SIZE << 1);
                 size = (end - start) >> (PAGE_SHIFT + 1);

Here is the captured warning during boot:

------------[ cut here ]------------
ASID race!
   valid=1, is_cur_mm=1
   ctx: 0xbfb(asid=0x3fb) -> 0xc02(asid=0x2)
   cache: 0xbff -> 0xc04
   hw_csr_asid: 0x3fb -> 0x2
WARNING: arch/loongarch/mm/tlb.c:77 at 
local_flush_tlb_range+0x280/0x2f0, CPU#0: abrt-server/810
...
CPU: 0 UID: 0 PID: 810 Comm: abrt-server Not tainted 7.4.0-rc2+ #2 
PREEMPT(full)
...
Call Trace:
[<9000000000d33de8>] show_stack+0xf8/0x1c0
[<9000000000d2fdac>] dump_stack_lvl+0x4c/0x78
[<9000000000d5aac4>] __warn+0x94/0x130
[<900000000241f888>] __report_bug+0x88/0x1b0
[<900000000241fa84>] report_bug+0x34/0xa0
[<90000000024568f8>] do_bp+0x2e8/0x370
[<9000000000d31f64>] handle_bp+0x124/0x1e0
[<9000000000d45610>] local_flush_tlb_range+0x280/0x2f0
[<9000000000febdc0>] tlb_flush+0x50/0xa0
[<9000000000fec838>] tlb_finish_mmu+0x58/0x160
[<9000000000fee584>] do_mprotect_pkey.constprop.0+0x3f4/0x450
[<9000000000fee5e8>] sys_mprotect+0x8/0x20
[<9000000002456eb8>] do_syscall+0x1b8/0x380
[<9000000000d314e4>] handle_syscall+0xc4/0x164

---[ end trace 0000000000000000 ]---

After switching back to get_cpu() / put_cpu() (as in v1), this ASID
race completely disappears under the exact same test.

So I think we should keep get_cpu() / put_cpu() in
local_flush_tlb_{mm,range,page}() (as in v1) to ensure preemption
safety, especially for UP preemptible kernels.

Thanks,
Tiezhu

