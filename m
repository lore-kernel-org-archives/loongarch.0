Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FEBC745F2
	for <loongarch@lists.linux.dev>; Mon,  5 Aug 2024 06:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722839889; cv=none; b=IGWhlQ33a5b5bBbX+QQEaHTzSXL7SeUxppqyfu5SI6vqy0K/3Zj+PZ5w/rVOw1AllbEhDWGY8si+uAdxN2XpneaVnnVHqGar5KQ7nl2rTbqyDZkLVuLvKcKN9qkMrWFOrhnwN8zgiX7r6+8duSwq5+SHWHnCeBAWYO1UKzBqp5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722839889; c=relaxed/simple;
	bh=W2qjOM8zoMp8N6DTqnb2Rxdtdzr7Yge8cX0J/+C1Gbk=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=GXyg6mQdeIsYTZUmtYaXNWLScKThGVNY/no2D1GDaU9OIKwh+u46so8fM9kPNHAukU2Kk/Fj9tGVYkgOvFYYr0aBFe9cQD14LF8usSs123GeKnIs8rRa7A5Kjzf8DT5aEGPVAj+5O7dEDvmVpda8MJbKrZ9jvXAOKNgRKw3sujU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxnptGc7Bmyd8HAA--.510S3;
	Mon, 05 Aug 2024 14:37:58 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxA+JFc7BmJhQEAA--.21528S3;
	Mon, 05 Aug 2024 14:37:58 +0800 (CST)
Subject: Re: [PATCH v2 2/3] objtool: Handle secondary stack related
 instructions
To: Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
References: <20240805032700.16038-1-yangtiezhu@loongson.cn>
 <20240805032700.16038-3-yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <3bea8b7f-b783-ba85-1ed0-c6bd3f6af92b@loongson.cn>
Date: Mon, 5 Aug 2024 14:37:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240805032700.16038-3-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMCxA+JFc7BmJhQEAA--.21528S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXr13XrW8uw4xAFWDWFyfuFX_yoW5CFyxpF
	4xW3W5ZF98Krn8uwnFqFyDWFyDAw4kKr15WF15Gw18Gr9xKFn8uanIvFsxAF1xXwn5ua48
	tFWYqry7Aw42k3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
	0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8oG
	QDUUUUU==

On 08/05/2024 11:26 AM, Tiezhu Yang wrote:
> After commit a0f7085f6a63 ("LoongArch: Add RANDOMIZE_KSTACK_OFFSET
> support"), there is a new instruction "sub.d $sp, $sp, $t0" for the
> secondary stack in do_syscall(), then there exists a objtool warning
> "do_syscall+0x11c: return with modified stack frame" and there is no
> handle_syscall() which is the previous frame of do_syscall() in the
> call trace when executing the command "echo l > /proc/sysrq-trigger".

...

> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index 01237d167223..c7b9942fee29 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -2993,6 +2993,28 @@ static int update_cfi_state(struct instruction *insn,
>  				break;
>  			}
>
> +			if (op->dest.reg == CFI_BP && op->src.reg == CFI_SP) {
> +				/* addi.d fp,sp,imm for the secondary stack on LoongArch */
> +				if (cfa->base == CFI_SP && cfa->offset == op->src.offset) {
> +					if (insn->sym->secondary_stack) {
> +						cfa->base = CFI_BP;
> +						cfa->offset = 0;
> +					}
> +				}
> +				break;
> +			}
> +
> +			if (op->dest.reg == CFI_SP && op->src.reg == CFI_BP) {
> +				/* addi.d sp,fp,imm for the secondary stack on LoongArch */
> +				if (cfa->base == CFI_FP && cfa->offset == 0) {

Here should be CFI_BP instead of CFI_FP which is only defined
for LoongArch.

> +					if (insn->sym->secondary_stack) {
> +						cfa->base = CFI_SP;
> +						cfa->offset = -op->src.offset;
> +					}
> +				}
> +				break;
> +			}
> +
>  			if (op->dest.reg == CFI_SP && op->src.reg == CFI_BP) {
>
>  				/* lea disp(%rbp), %rsp */

Oh, sorry, I forgot to test this change on x86.

Here is the test info on x86: the cfa->base is CFI_BP
or CFI_BP_INDIRECT and the cfa->offset is not 0
if (op->dest.reg == CFI_SP && op->src.reg == CFI_BP),
thus it can check the following condition
if(cfa->base == CFI_BP && cfa->offset == 0)
to distinguish x86 and LoongArch.

So the correct change should be something like this
to make sure it works well for both x86 and LoongArch:

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 01237d167223..0832d20c95d2 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2993,10 +2993,28 @@ static int update_cfi_state(struct instruction 
*insn,
                                 break;
                         }

-                       if (op->dest.reg == CFI_SP && op->src.reg == 
CFI_BP) {
+                       if (op->dest.reg == CFI_BP && op->src.reg == 
CFI_SP) {
+                               /* addi.d fp,sp,imm for the secondary 
stack on LoongArch */
+                               if (cfa->base == CFI_SP && cfa->offset 
== op->src.offset) {
+                                       if (insn->sym->secondary_stack) {
+                                               cfa->base = CFI_BP;
+                                               cfa->offset = 0;
+                                       }
+                               }
+                               break;
+                       }

-                               /* lea disp(%rbp), %rsp */
-                               cfi->stack_size = -(op->src.offset + 
regs[CFI_BP].offset);
+                       if (op->dest.reg == CFI_SP && op->src.reg == 
CFI_BP) {
+                               /* addi.d sp,fp,imm for the secondary 
stack on LoongArch */
+                               if (cfa->base == CFI_BP && cfa->offset 
== 0) {
+                                       if (insn->sym->secondary_stack) {
+                                               cfa->base = CFI_SP;
+                                               cfa->offset = 
-op->src.offset;
+                                       }
+                               } else {
+                                       /* lea disp(%rbp), %rsp */
+                                       cfi->stack_size = 
-(op->src.offset + regs[CFI_BP].offset);
+                               }
                                 break;
                         }

I will wait for some days to get more review comments
and then send v3 later.

Thanks,
Tiezhu

