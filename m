Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF7A3D3330
	for <loongarch@lists.linux.dev>; Tue, 20 Jan 2026 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768914548; cv=none; b=F/4CWv2MF60D5rCPXO5PuHjZx0wUTbxPEGJTIdKKpyMAeE0Eko+191tlYdYenW/p+eNPEzY2qFfWRhVszQOl3t6p89vxLUqzvdi4PjGPOujH9Al9bnnc9666o7U3+BSG28aqV9pSzVAGR7Ie+QURMOvLqgSV+ng+uXEJP7htyQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768914548; c=relaxed/simple;
	bh=PTFl+NB/QyQO8S98Hw/qwSBgJInRXMQTAh51IxzWUOg=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=DCM7UFPGmxie8X8R4GfC0V5csZc2ajELjMQartEKK0ikhKFeJrGhewZAJ8IxE98A63siC6V4nc2l6dRZfQ0keJTF+bKB1hNzFmR42pS/7Cwq2f4XskjXErxpbjWxTa8AETUsRwCWwq8vSRi7OIudxFGdiEO6DjonEGbgNzarEUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dx_8Nrfm9pHrsKAA--.35576S3;
	Tue, 20 Jan 2026 21:08:59 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxfcJqfm9pubYnAA--.12518S3;
	Tue, 20 Jan 2026 21:08:59 +0800 (CST)
Subject: Re: [PATCH v1 2/4] LoongArch: Handle percpu handler address in
 bt_address()
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260120092331.813-1-yangtiezhu@loongson.cn>
 <20260120092331.813-3-yangtiezhu@loongson.cn>
 <CAAhV-H5pxpEM=efhdF6C0t+p6DGHcr9zQPPDx3X_w_6K18dEGg@mail.gmail.com>
 <2a090dd9-3a24-236f-2a72-19d8567568c7@loongson.cn>
 <CAAhV-H4AYtOBtnPp5Y87tfrKNJU2NDM9yqONkKpAHmGNy-xhkg@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <6ec0962a-8ba1-1bb9-c07d-1c344adef7fa@loongson.cn>
Date: Tue, 20 Jan 2026 21:08:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4AYtOBtnPp5Y87tfrKNJU2NDM9yqONkKpAHmGNy-xhkg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxfcJqfm9pubYnAA--.12518S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CrWDAw1fXr4fGF4xtF1rZrc_yoW8urWDp3
	y2ka1DtF48WrWjqa4vva42qrnIyr1kJw17Wan8KryrCFn0qa4fCr10ywn8WFykJ34rXa10
	93ZYqFya9F4UJagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Sb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C2
	67AKxVW8ZVWrXwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWU
	CwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBI
	daVFxhVjvjDU0xZFpf9x07jOb18UUUUU=

On 2026/1/20 下午9:01, Huacai Chen wrote:
> On Tue, Jan 20, 2026 at 8:57 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> On 2026/1/20 下午8:04, Huacai Chen wrote:
>>> Hi, Tiezhu,
>>>
>>> On Tue, Jan 20, 2026 at 5:23 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>>>
>>>> After commit 4cd641a79e69 ("LoongArch: Remove unnecessary checks for
>>>> ORC unwinder"), the system can not boot normally under some configs,
>>>> there are many error messages "cannot find unwind pc at".
>>
>> ...
>>
>>>> +#if defined(CONFIG_NUMA) && !defined(CONFIG_PREEMPT_RT)
>>>> +       for (int cpu = 1; cpu < num_possible_cpus(); cpu++) {
>>> Use nr_cpu_ids instead of num_possible_cpus() can improve performance a little.
>>>
>>>> +               int vec_sz = sizeof(exception_handlers);
>>>> +
>>> It is better to add "if (!pcpu_handlers[cpu]) continue" here.
>>
>> If so, it can use for_each_possible_cpu(cpu) directly?
> It can, but I remember you want to skip CPU 0?

Yes, that is the intention to use the for loop, but if checking
!pcpu_handlers[cpu], I think no need to use for loop to skip cpu
0, just use for_each_possible_cpu(cpu) is more simple and direct.

The code looks like:

----->8-----
diff --git a/arch/loongarch/kernel/unwind_orc.c 
b/arch/loongarch/kernel/unwind_orc.c
index d6b3688a1ce9..a0ba4e416f99 100644
--- a/arch/loongarch/kernel/unwind_orc.c
+++ b/arch/loongarch/kernel/unwind_orc.c
@@ -352,6 +352,24 @@ static inline unsigned long bt_address(unsigned 
long ra)
  {
         extern unsigned long eentry;

+#if defined(CONFIG_NUMA) && !defined(CONFIG_PREEMPT_RT)
+       int cpu;
+       int vec_sz __maybe_unused;
+
+       for_each_possible_cpu(cpu) {
+               if (!pcpu_handlers[cpu])
+                       continue;
+
+               vec_sz = sizeof(exception_handlers);
+
+               if (ra >= pcpu_handlers[cpu] &&
+                   ra < pcpu_handlers[cpu] + vec_sz) {
+                       ra = eentry + (ra - pcpu_handlers[cpu]);
+                       break;
+               }
+       }
+#endif
+
         if (ra >= eentry && ra < eentry +  EXCCODE_INT_END * VECSIZE) {
                 unsigned long func;
                 unsigned long type = (ra - eentry) / VECSIZE;

Please let me know what is the better way.

Thanks,
Tiezhu

