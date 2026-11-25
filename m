Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573294;
	b=g+99dtbZU8/Hj+/fUcoce/wuXC9Udpfn1rLKUfOx2QukffHkdR8hmGFmxPjIl5B5s+GR
	 nV9/QUWVdKnHhktYry/7i0uYx9ANXyKbbEGC2/qwQC6Kk0SDZsn5ikX1EbR2C7+pHAO0P
	 MaXM9tk+EdXwfmAiUgPlj0MmNmS8AzVwWewmUpNMDoT8xl4/Lvirq3fYoXh4B9ABZbNfA
	 3FN7ObKvX2y8clJAlPQHaevAil5bysxE5xwrcwOfIqjhnni38RY4Izn0laM+X2qm8MIGU
	 PiW/BDKsxVf2/16RVKbgsMjE8dEkijygTTvL7cyATvGb4/bGoYbp0exu8XFZgRS3vXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573294;
	h=DMARC-Filter:Received:Received:Subject:To:Cc:References:From:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Language:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=Y17hgNWNA7kruKX7tewFtYjQBeTk6p6Hs0dO6G9YonQ=;
	b=nfJdrMZjuM55wkBm3O6QV0CfY1TUEyrA041bLEr+STp3pfpHS8ePZD0mLT+1hGYtXd8y
	 mAyigPNlIyMp4SIp9MlhRxXEI0ub1S8/8OqDFG6bbg385pBHxaABFtmfBTfnox1H14b2u
	 J39CK8rRw//zbwt6R3l+xBlBtGigBh5GIuE+9c1cR7KmyIvlHIagLNxLL0inBFHkUTNkM
	 2Wrg5iemxE5WWGQJbW59cs/wdeW/FEcsG0JlZ3wYBkiIlLYlFN9lIzv91wnavJoepQcpj
	 mmdQFH39kuBMkyqGuXRzGOuSgaMp+p23hoLRAQIOq/pYiWpoxXeTZXvBrbm87IcohCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889CB606A321
	for <loongarch@lists.linux.dev>; Wed, 25 Nov 2026 02:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 889CB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8AxHNApRgZrxsYiAA--.5518S3;
	Wed, 25 Nov 2026 10:21:29 +0800 (CST)
Received: from [127.0.0.1] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJBxpMwnRgZrfi03AA--.17634S2;
	Wed, 25 Nov 2026 10:21:28 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Fix off-by-one in bt_address() exception
 vector check
To: hanbings <hanbings@hanbings.io>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261115193107.571674-1-hanbings@hanbings.io>
 <CAAhV-H6ww3dObKa3zNxj4jv7JWoB_fukX+b-HYnb_31_=sPbEw@mail.gmail.com>
 <575cc834-aca1-a38d-3db9-deea93d0d2f6@loongson.cn>
 <20261121181328.1892266-1-hanbings@hanbings.io>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <b41eac12-ef10-41b4-8731-f057471ee11b@loongson.cn>
Date: Wed, 25 Nov 2026 10:21:27 +0800
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
In-Reply-To: <20261121181328.1892266-1-hanbings@hanbings.io>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJBxpMwnRgZrfi03AA--.17634S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uFyUAw4rArW5AF18Zr4DKFX_yoW8KFWxpa
	4Yya1UGr48Wr1DtFyxA34UZr9Fkan7uFWfurs7J34UZan5JFyftr18JayUXFy5ArWYgay8
	ZFy8Jw15Ka1UXagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UU
	UUU==

On 11/22/26 2:13 AM, hanbings wrote:
> Hi Tiezhu,
> 
> Thanks for looking at this.  I can reproduce it deterministically on
> QEMU with vanilla v7.2.9; the machine here runs 7.2.9, so I used the
> same version for the test.

I tested this patch on physical machines with the following small
debug code:

diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 20ce2c8d77a1..1dfeb8ecfb76 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -1113,6 +1113,11 @@ asmlinkage void noinstr do_vint(struct pt_regs 
*regs, unsigned long sp)
         register unsigned long stack;
         irqentry_state_t state = irqentry_enter(regs);

+       if (regs->csr_estat & BIT(INT_AVEC)) {
+               pr_info_once("AVEC interrupt triggered!\n");
+               DO_ONCE_LITE(dump_stack);
+       }
+
         cpu = smp_processor_id();

         if (on_irq_stack(cpu, sp))

I could not reproduce this issue on a Loongson-3A6000 where AVEC is
not enabled by firmware, but I reproduced it on a Loongson-3C6000
with AVEC enabled.

With this patch applied, the issue completely disappears under the
exact same test.

Before:
   $ dmesg -t | grep "AVEC interrupt triggered"
   AVEC interrupt triggered!
   $ dmesg -t | grep -A 4 "Call Trace"
   Call Trace:
   [<9000000000c97f48>] show_stack+0xf8/0x1c0
   [<9000000000c90b2c>] dump_stack_lvl+0x6c/0x9c
   [<900000000241b638>] do_vint+0xf8/0x120
   cannot find unwind pc at 9000000100979d54

After:
   $ dmesg -t | grep "AVEC interrupt triggered"
   AVEC interrupt triggered!
   $ dmesg -t | grep -A 11 "Call Trace"
   Call Trace:
   [<9000000000867f48>] show_stack+0xf8/0x1c0
   [<9000000000860b2c>] dump_stack_lvl+0x6c/0x9c
   [<9000000001feb638>] do_vint+0xf8/0x120
   [<9000000000865914>] handle_vint+0x154/0x1f4
   [<9000000001fee14c>] idle_exit+0x0/0x4
   [<9000000001fee158>] arch_cpu_idle+0x8/0x30
   [<9000000001fee218>] default_idle_call+0x18/0x60
   [<90000000008fceb8>] do_idle+0xb8/0x180
   [<90000000008fd1e4>] cpu_startup_entry+0x34/0x40
   [<9000000000874e30>] start_secondary+0xd0/0xe0
   [<9000000001fef1b4>] smpboot_entry+0x8c/0x98

Thanks for the fix! One small nit: please use your real name for
"From:" and "Signed-off-by:".

Other than that, feel free to add:

Reviewed-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Thanks,
Tiezhu

