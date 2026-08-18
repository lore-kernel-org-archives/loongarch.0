Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505E0477990
	for <loongarch@lists.linux.dev>; Tue, 18 Aug 2026 13:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787059727; cv=none; b=jgqfPsNcO5rx4VhF8G2m9P58S6GEs9VemRjpHNDgeRACZCl7jI98wu3OEqT0R+5Pvs6uhFb5xG45xK8ZZqI+zQu81AZVlyemgoRPynHYhNKGwvoD78tiNVCo57uBYP8tJwBEx6MvBw52WwplW916/LwX6zwSQpMLcv2DnHLpheg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787059727; c=relaxed/simple;
	bh=klmGtn9VhCzNI5mgxj5W69nBlloLDf8mVEJIrU4Gpjk=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=GK4I25G8bmfcrr2JYCqtCXntwPB00hEUN7EmF0tg1KMsp1I0vPg1NMl1nFZh1a7UXDSKmw3VKqGSu7MGCuBgYLR888wo7qG8L6M+rD64Nmrg5xGj0mxQKDvcG7JojNTvYuGoJuh5scG5GQu+BM4kEv94EEX6wgmw9Igc92l4juw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8AxXdIJXoRq4k8CAA--.6950S3;
	Tue, 18 Aug 2026 21:28:42 +0800 (CST)
Received: from [10.130.40.83] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAxFs0IXoRqr18JAA--.1765S2;
	Tue, 18 Aug 2026 21:28:41 +0800 (CST)
Subject: Re: [PATCH v1] LoongArch: Fix __smp_mb__{before,after}_atomic()
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 Vincent Li <vincent.mc.li@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org
References: <20260817035908.460-1-yangtiezhu@loongson.cn>
Message-ID: <3103b3b4-5c0d-ed87-2e15-31a4d2289ec5@loongson.cn>
Date: Tue, 18 Aug 2026 21:28:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260817035908.460-1-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxFs0IXoRqr18JAA--.1765S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxAF4kKr13uw1UCr1DWr4fXrc_yoW5Jw4DpF
	Z7AFn7tFWkW3WrZ34Dtan093Wfta1vk347Wr1Fgry8ZryY9r1IvF18Kr4fWFyDWws3JrWS
	vrWqg34ava4DW3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUc3kuDU
	UUU

On 2026/8/17 上午11:59, Tiezhu Yang wrote:
> When testing the BPF selftest "sudo ./test_progs -t timer_lockup", there
> is a kernel lockup and panic:

...

> With this patch, the lockless "store-before-load" ordering is enforced by
> the DBAR instruction. The BPF timer_lockup selftest was stressed for 5000
> consecutive loops on a physical LoongArch machine without encountering any
> further lockups or warnings:
> 
>    for i in {1..5000}; do sudo ./test_progs -t timer_lockup; done

...

> diff --git a/arch/loongarch/include/asm/barrier.h b/arch/loongarch/include/asm/barrier.h
> index 4b663f197706..adfe343dfa65 100644
> --- a/arch/loongarch/include/asm/barrier.h
> +++ b/arch/loongarch/include/asm/barrier.h
> @@ -57,8 +57,8 @@
>   #define __WEAK_LLSC_MB		"			\n"
>   #endif
>   
> -#define __smp_mb__before_atomic()	barrier()
> -#define __smp_mb__after_atomic()	barrier()
> +#define __smp_mb__before_atomic()	__smp_mb()
> +#define __smp_mb__after_atomic()	__smp_mb()
>   
>   /**
>    * array_index_mask_nospec() - generate a ~0 mask when index < size, 0 otherwise

Hi all,

To address the soft lockup while avoiding the performance overhead of
executing two separate instructions, I think there is a more elegant
way to fix this directly in the BPF core helper:

We can replace atomic_inc() and smp_mb__after_atomic() with a single
atomic_fetch_add() in bpf_timer_cancel(). This consolidates the logic
into a single native atomic operation with full ordering, which not
only guarantees the store-load order to eliminate the deadlock but
also improves the performance for weak memory model architectures.

Any thoughts on this approach?

```
diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index c18f1e16edee..ee2b3a4dcc05 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -1591,9 +1591,7 @@ BPF_CALL_1(bpf_timer_cancel, struct bpf_async_kern 
*, async)
          */
         if (!cur_t)
                 goto drop;
-       atomic_inc(&t->cancelling);
-       /* Need full barrier after relaxed atomic_inc */
-       smp_mb__after_atomic();
+       atomic_fetch_add(1, &t->cancelling);
         inc = true;
         if (atomic_read(&cur_t->cancelling)) {
                 /* We're cancelling timer t, while some other timer 
callback is
```

I tested the above diff, the BPF timer_lockup selftest was stressed
for 5000 consecutive loops on a physical LoongArch machine without
encountering any further lockups or warnings.

If you are OK with this change of bpf code, I will send a bpf patch
later.

Thanks,
Tiezhu

