Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38AE30E85E
	for <loongarch@lists.linux.dev>; Wed, 21 Jan 2026 01:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768960054; cv=none; b=Od8fgaSfpVJ926S3izW9tFT8NOuubeUjAcaNr93PqPmzLOZU2TOVI18TFv/DlUuzZQMy+/+lj9UNgz2tywIiWNKcO8tZMQzHxiVBADL47c3V+n+ZtgLW9gO2noxi7rkQxUIVHan+E4vcFrYNZv0jBo+Stmok5dVfiIrXDzi9bxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768960054; c=relaxed/simple;
	bh=3HcFXezRqzep6eeB8yuKJoCYhoUCx5zIgM5K5YWJGGo=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=RgGiDjcR3JRym9FVrUCpe1XaYChAlWaYOQ8Jj+Wp2olJ0GAnJQiac+HDo766kuyVm5MNEK+g6XQek/qxOoGwNi7k6Hjhfi1IzRjWp+hMumFppVVXNHYxqY7ETfYuEwKso0lILWZCON86LtZ8F0CVBg856h0ApLZm7yZ7X51XCcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxDMMsMHBp5fkKAA--.36113S3;
	Wed, 21 Jan 2026 09:47:25 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxSMEqMHBpEKIoAA--.2660S3;
	Wed, 21 Jan 2026 09:47:23 +0800 (CST)
Subject: Re: [PATCH v1 2/4] LoongArch: Handle percpu handler address in
 bt_address()
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260120092331.813-1-yangtiezhu@loongson.cn>
 <20260120092331.813-3-yangtiezhu@loongson.cn>
 <CAAhV-H5pxpEM=efhdF6C0t+p6DGHcr9zQPPDx3X_w_6K18dEGg@mail.gmail.com>
 <2a090dd9-3a24-236f-2a72-19d8567568c7@loongson.cn>
 <CAAhV-H4AYtOBtnPp5Y87tfrKNJU2NDM9yqONkKpAHmGNy-xhkg@mail.gmail.com>
 <6ec0962a-8ba1-1bb9-c07d-1c344adef7fa@loongson.cn>
Message-ID: <0059c5f2-afe3-3100-4f9e-023ddf5c1fe9@loongson.cn>
Date: Wed, 21 Jan 2026 09:46:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <6ec0962a-8ba1-1bb9-c07d-1c344adef7fa@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxSMEqMHBpEKIoAA--.2660S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxGr17KFy3Zr15uF1DCFyxCrX_yoW5Xw4Dpr
	92k3WDtFW8Kr40qayq93W7Xr9Iyrn7tw12ga98KFy5CFn0qFyS9r10v34qgFWDGrW8Xa10
	vrn5XFZI9F4UXacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1QVy3UU
	UUU==

On 2026/1/20 下午9:08, Tiezhu Yang wrote:
> On 2026/1/20 下午9:01, Huacai Chen wrote:
>> On Tue, Jan 20, 2026 at 8:57 PM Tiezhu Yang <yangtiezhu@loongson.cn> 
>> wrote:
>>>
>>> On 2026/1/20 下午8:04, Huacai Chen wrote:
>>>> Hi, Tiezhu,
>>>>
>>>> On Tue, Jan 20, 2026 at 5:23 PM Tiezhu Yang <yangtiezhu@loongson.cn> 
>>>> wrote:
>>>>>
>>>>> After commit 4cd641a79e69 ("LoongArch: Remove unnecessary checks for
>>>>> ORC unwinder"), the system can not boot normally under some configs,
>>>>> there are many error messages "cannot find unwind pc at".
>>>
>>> ...
>>>
>>>>> +#if defined(CONFIG_NUMA) && !defined(CONFIG_PREEMPT_RT)
>>>>> +       for (int cpu = 1; cpu < num_possible_cpus(); cpu++) {
>>>> Use nr_cpu_ids instead of num_possible_cpus() can improve 
>>>> performance a little.
>>>>
>>>>> +               int vec_sz = sizeof(exception_handlers);
>>>>> +
>>>> It is better to add "if (!pcpu_handlers[cpu]) continue" here.
>>>
>>> If so, it can use for_each_possible_cpu(cpu) directly?
>> It can, but I remember you want to skip CPU 0?
> 
> Yes, that is the intention to use the for loop, but if checking
> !pcpu_handlers[cpu], I think no need to use for loop to skip cpu
> 0, just use for_each_possible_cpu(cpu) is more simple and direct.

Handle this special case only if bt_address() returns 0 to avoid
affecting performance for the normal address.

Here is the draft change:

----->8-----
diff --git a/arch/loongarch/kernel/unwind_orc.c 
b/arch/loongarch/kernel/unwind_orc.c
index d6b3688a1ce9..1ce10701f3c3 100644
--- a/arch/loongarch/kernel/unwind_orc.c
+++ b/arch/loongarch/kernel/unwind_orc.c
@@ -378,6 +378,28 @@ static inline unsigned long bt_address(unsigned 
long ra)
         return 0;
  }

+static inline unsigned long handle_pcpu_handlers(unsigned long ra)
+{
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
+       return ra;
+}
+
  bool unwind_next_frame(struct unwind_state *state)
  {
         unsigned long *p, pc;
@@ -494,8 +516,11 @@ bool unwind_next_frame(struct unwind_state *state)

         state->pc = bt_address(pc);
         if (!state->pc) {
-               pr_err("cannot find unwind pc at %px\n", (void *)pc);
-               goto err;
+               state->pc = bt_address(handle_pcpu_handlers(pc));
+               if (!state->pc) {
+                       pr_err("cannot find unwind pc at %px\n", (void 
*)pc);
+                       goto err;
+               }
         }

         return true;

I will test it, if it works well I will wait for more comments and
submit v2 later.

Thanks,
Tiezhu

