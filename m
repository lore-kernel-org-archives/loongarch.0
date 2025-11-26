Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97AF02E36F1
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 09:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764148171; cv=none; b=TRqkynrT/07amaX7aBxTMeQKVHxuRpBzYJWO+YxVjT8HeGNLPU61IUlqb2+lADTRz+lgO9bDA+iablMAQsKsWz0uPWc3lLeQwCcicFYf0fGlDHfXvnfuIJBH4UNxhM3mK7JAiwlDIZgwhWBaIZt0TJjnoLRSM8yLO9X87po7Ujo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764148171; c=relaxed/simple;
	bh=HyW5VS6whtFrr7rXYWEl12L627nX5pzF/VlpWlnB4kc=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=obFzQmDQ6TwOWBbQAiUqUnyXZpEE1p3auavSVeZU03gUj4a7LA5H5y7a+BTjorgBNHztCrZc23jVN0p87Lv9HlwV3yOqQDmxyevuxsKugHh+EtF+cQlUd+QUkEe5jZ+XfNaecu3iqmkQyAi6NjYG1p6SJgodHQDH7Dd18O9IdP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxndK+wyZpO0YoAA--.20546S3;
	Wed, 26 Nov 2025 17:09:18 +0800 (CST)
Received: from [10.130.40.41] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxqcC9wyZpZ+U_AQ--.18844S3;
	Wed, 26 Nov 2025 17:09:17 +0800 (CST)
Subject: Re: [PATCH v1] LoongArch: Handle special PC in unwind_next_frame()
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Jinyang He <hejinyang@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Xi Zhang <zhangxi@kylinos.cn>,
 Xianglai Li <lixianglai@loongson.cn>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Bibo Mao <maobibo@loongson.cn>
References: <20251125063327.31586-1-yangtiezhu@loongson.cn>
 <658bb477-b3f1-97c1-ab37-5dafcb6215f5@loongson.cn>
 <6cc59312-7cdc-19a5-4d18-e120ea9c7563@loongson.cn>
 <3c0602aa-a8bc-25b9-7d7a-467e04dbc519@loongson.cn>
Message-ID: <45cf4a09-8895-73fb-c019-1b1f88501eed@loongson.cn>
Date: Wed, 26 Nov 2025 17:09:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <3c0602aa-a8bc-25b9-7d7a-467e04dbc519@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxqcC9wyZpZ+U_AQ--.18844S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW3XFyfJw1rJw48JFy3CrWDJrc_yoWxXw43pa
	97AF17tr4IgF9Fqryqy3s5Xr98XrsrWw12qFs7KFy8u3W7JF1fXr10934DZFyqv3ykWF1F
	va4fJryqva1UZ3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jn
	UUUUUUUU=

Cc: Bibo Mao <maobibo@loongson.cn>

On 2025/11/26 下午2:28, Tiezhu Yang wrote:
> On 2025/11/26 下午2:08, Tiezhu Yang wrote:
>> On 2025/11/25 下午6:52, Jinyang He wrote:
>>> On 2025-11-25 14:33, Tiezhu Yang wrote:
>>>
>>>> When running virtual machine before testing the kernel live patching 
>>>> with
>>>> "modprobe livepatch-sample", there is a timeout over 15 seconds, the 
>>>> dmesg
>>>> command shows "unreliable stack" for user tasks in debug mode.
>>>>
>>>> The "unreliable stack" is because it can not unwind from 
>>>> kvm_handle_exit()
>>>> to its previous frame kvm_exc_entry() due to the PC is not a valid 
>>>> kernel
>>>> address, the root cause is that the code of kvm_exc_entry() was 
>>>> copied to
>>>> the DMW area in kvm_loongarch_env_init(), so it should check the PC 
>>>> range
>>>> and then finish unwinding for this special case.
>>>
>>> Hi, Tiezhu,
>>>
>>> Since kvm_loongarch_env_init copies kvm_exc_entry which similar to how
>>> trap_init copies the exception handler. We should apply the same
>>> offset-based adjustment to compute the shadow PC address:
>>>   shadow_pc = kvm_exc_entry + (cur_pc − copied_base_address)
>>> This allows the ORC unwinder to correctly locate the corresponding 
>>> unwind info.
>>
>> Thank you. I did some tests, it can unwind from kvm_handle_exit()
>> to its previous frame kvm_exc_entry() only when CONFIG_KVM=y,
>> but it can not unwind from kvm_handle_exit() to its previous frame 
>> kvm_exc_entry() when CONFIG_KVM=m because we can not get the two
>> kvm address (unsigned long)kvm_exc_entry and
>> (unsigned long)kvm_loongarch_ops->exc_entry
>> in arch/loongarch/kernel/unwind_orc.c.
> 
> Use function pointer can get get the two kvm address
> (unsigned long)kvm_exc_entry and
> (unsigned long)kvm_loongarch_ops->exc_entry
> in arch/loongarch/kernel/unwind_orc.c.
> 
> I will do more test and send v2 later.

Here are the draft changes:

----->8-----
diff --git a/arch/loongarch/kernel/unwind_guess.c 
b/arch/loongarch/kernel/unwind_guess.c
index 08d7951b2f60..64c50c483cbb 100644
--- a/arch/loongarch/kernel/unwind_guess.c
+++ b/arch/loongarch/kernel/unwind_guess.c
@@ -5,6 +5,11 @@
  #include <asm/unwind.h>
  #include <linux/export.h>

+#if IS_ENABLED(CONFIG_KVM)
+void (*get_kvm_entry_info)(unsigned long *old, unsigned long *new, 
unsigned long *size);
+EXPORT_SYMBOL_GPL(get_kvm_entry_info);
+#endif
+
  unsigned long unwind_get_return_address(struct unwind_state *state)
  {
         return __unwind_get_return_address(state);
diff --git a/arch/loongarch/kernel/unwind_orc.c 
b/arch/loongarch/kernel/unwind_orc.c
index 1d60a593479a..ef8bb6cd7af8 100644
--- a/arch/loongarch/kernel/unwind_orc.c
+++ b/arch/loongarch/kernel/unwind_orc.c
@@ -356,6 +356,11 @@ static bool is_entry_func(unsigned long addr)
         return addr >= (unsigned long)&kernel_entry && addr < (unsigned 
long)&kernel_entry_end;
  }

+#if IS_ENABLED(CONFIG_KVM)
+void (*get_kvm_entry_info)(unsigned long *old, unsigned long *new, 
unsigned long *size);
+EXPORT_SYMBOL_GPL(get_kvm_entry_info);
+#endif
+
  static inline unsigned long bt_address(unsigned long ra)
  {
         extern unsigned long eentry;
@@ -386,6 +391,16 @@ static inline unsigned long bt_address(unsigned 
long ra)
                 return func + offset;
         }

+#if IS_ENABLED(CONFIG_KVM)
+       unsigned long old, new, size;
+
+       if (get_kvm_entry_info) {
+               get_kvm_entry_info(&old, &new, &size);
+               if (ra >= new && ra < new + size)
+                       return old + (ra - new);
+       }
+#endif
+
         return ra;
  }

diff --git a/arch/loongarch/kernel/unwind_prologue.c 
b/arch/loongarch/kernel/unwind_prologue.c
index 729e775bd40d..42c210b0a378 100644
--- a/arch/loongarch/kernel/unwind_prologue.c
+++ b/arch/loongarch/kernel/unwind_prologue.c
@@ -28,6 +28,11 @@ extern unsigned long eentry;
  extern unsigned long pcpu_handlers[NR_CPUS];
  #endif

+#if IS_ENABLED(CONFIG_KVM)
+void (*get_kvm_entry_info)(unsigned long *old, unsigned long *new, 
unsigned long *size);
+EXPORT_SYMBOL_GPL(get_kvm_entry_info);
+#endif
+
  static inline bool scan_handlers(unsigned long entry_offset)
  {
         int idx, offset;
diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
index 80ea63d465b8..3606554e43e0 100644
--- a/arch/loongarch/kvm/main.c
+++ b/arch/loongarch/kvm/main.c
@@ -338,6 +338,13 @@ void kvm_arch_disable_virtualization_cpu(void)
         kvm_flush_tlb_all();
  }

+static void kvm_entry_info(unsigned long *old, unsigned long *new, 
unsigned long *size)
+{
+       *old = (unsigned long)kvm_exc_entry;
+       *new = (unsigned long)kvm_loongarch_ops->exc_entry;
+       *size = kvm_exception_size;
+}
+
  static int kvm_loongarch_env_init(void)
  {
         int cpu, order, ret;
@@ -430,6 +437,7 @@ static void kvm_loongarch_env_exit(void)
         kvm_unregister_perf_callbacks();
  }

+extern void (*get_kvm_entry_info)(unsigned long *old, unsigned long 
*new, unsigned long *size);
  static int kvm_loongarch_init(void)
  {
         int r;
@@ -442,6 +450,8 @@ static int kvm_loongarch_init(void)
         if (r)
                 return r;

+       get_kvm_entry_info = kvm_entry_info;
+
         return kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
  }

diff --git a/arch/loongarch/kvm/switch.S b/arch/loongarch/kvm/switch.S
index f1768b7a6194..9eaad5dbed91 100644
--- a/arch/loongarch/kvm/switch.S
+++ b/arch/loongarch/kvm/switch.S
@@ -104,7 +104,7 @@
         .text
         .cfi_sections   .debug_frame
  SYM_CODE_START(kvm_exc_entry)
-       UNWIND_HINT_UNDEFINED
+       UNWIND_HINT_END_OF_STACK
         csrwr   a2,   KVM_TEMP_KS
         csrrd   a2,   KVM_VCPU_KS
         addi.d  a2,   a2, KVM_VCPU_ARCH
----->8-----

I tested with config UNWINDER_ORC, it can unwind from kvm_handle_exit()
to its previous frame kvm_exc_entry() which is the end of stack, there
is no "unreliable stack" in debug mode and also no timeout for kernel
livepatching.

I also tested with config UNWINDER_PROLOGUE and config UNWINDER_GUESS,
no build errors and the virtual machine can boot normally.

I would like to receive comments for the draft changes first and then
send the formal v2, the function and variable name may be not proper,
so any comments are welcome.

Since the merge window is coming soon and I am busy with the other
higher priority stuff, so maybe I will send v2 after the merge window.

Thanks,
Tiezhu

