Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C762528EB
	for <loongarch@lists.linux.dev>; Wed, 27 Nov 2024 05:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732686366; cv=none; b=r4/m6ehvrryQVUGbYS/W9YleN67VJgwTu/fqmv1of/LGpy/1O+v5+jshtoMK8U9QH2N4bH2E/nut8fhLsw1UWxZ9shUAkRBSYjSmnNsn6wPhxGKDFFKmbTr0jb0laIDNz8bKxwGjp75ISLyjP3xaagXdnezDRVu/GYljRyfat6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732686366; c=relaxed/simple;
	bh=8fv1MB373KyTosRdU+u2ouvKsd0zalAEc8ZFd1eAENI=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ZM/H5BosYHckvyXOdfWxQTVDbCYh4YtrySlD5ZaX9ep1+4+6Sil08i2dPEkNP929z+5h+ovqmOHxlIzTxKVyNSBq2naE56SzDVpo+Ysy1R2xu6gTDCLLVQAjRP06tvLBW+jDoHE0HlHh9/DbRfV7RI/YCeYXQoclEvLTfxcYHX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxGeAWskZnQZ1JAA--.12294S3;
	Wed, 27 Nov 2024 13:45:58 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxS+AUskZny4BpAA--.23652S3;
	Wed, 27 Nov 2024 13:45:57 +0800 (CST)
Subject: Re: [PATCH v4 02/10] objtool: Handle special cases of dead end insn
To: Peter Zijlstra <peterz@infradead.org>
References: <20241122045005.14617-1-yangtiezhu@loongson.cn>
 <20241122045005.14617-3-yangtiezhu@loongson.cn>
 <20241126064513.bf6yq56eklyo4xvt@jpoimboe>
 <bb36374e-aca2-92e1-209d-1524e31147ab@loongson.cn>
 <20241126143243.GN38837@noisy.programming.kicks-ass.net>
 <20241126152207.GR38972@noisy.programming.kicks-ass.net>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <e05c2f25-c378-be47-1138-a1a86b03fad6@loongson.cn>
Date: Wed, 27 Nov 2024 13:45:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241126152207.GR38972@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxS+AUskZny4BpAA--.23652S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CFy8KFW3XFy7XF1ruw45Arc_yoW8Xw48pF
	Z7C3WkAF48WrW0y3ZFyryxWFW7Jr4xGr12ga48WrykA3WjqFnaqrsagws0kFy8WwnaqFy0
	qFyFg3s0qFyjy3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzsqW
	UUUUU

On 11/26/2024 11:22 PM, Peter Zijlstra wrote:
>
>> I was poking at the reachable annotations and ended up with this:
>
> Also see here:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=objtool/core
>
> Once the robots agree it all compiles, I'll post.

There are many changes of tools/objtool/check.c in your tree,
I assume the patches in objtool/core tree is to target 6.13-rc1,
it failed when compiling on LoongArch:

   arch/loongarch/include/asm/bug.h:49:60: error: expected ‘:’ or ‘)’ 
before ‘;’ token
   {standard input}:682: Error: no match insn: break	1.pushsection 
.discard.annotate_insn,"M",@progbits,8

I think it needs to do the following changes, please squash them to
your original commit if possible, thanks.

diff --git a/arch/loongarch/include/asm/bug.h 
b/arch/loongarch/include/asm/bug.h
index dfb0cfccf36e..e5d888cb738f 100644
--- a/arch/loongarch/include/asm/bug.h
+++ b/arch/loongarch/include/asm/bug.h
@@ -40,13 +40,14 @@

  #define __BUG_FLAGS(flags, extra)                                      \
         asm_inline volatile (__stringify(ASM_BUG_FLAGS(flags))          \
+                            "\n"                                       \
                              extra);

  #define __WARN_FLAGS(flags)                                    \
  do {                                                           \
         instrumentation_begin();                                \
         __BUG_FLAGS(BUGFLAG_WARNING|(flags),                    \
-                   __ANNOTATE_REACHABLE(__ASM_BREF(10001));    \
+                   __ANNOTATE_REACHABLE(__ASM_BREF(10001)));   \
         instrumentation_end();                                  \
  } while (0)

By the way, there are a lot of new objtool warnings

   Unkonwn annotation type: 8

on LoongArch when compiling the code of your tree.

Thanks,
Tiezhu

