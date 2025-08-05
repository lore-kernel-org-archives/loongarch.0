Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C8BA927;
	Tue,  5 Aug 2025 02:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754361699; cv=none; b=tZNkE1P8E3TpDrPQ8GHI+TUM/2uxrLIsazr3JJK7MIrJ346dWNJMxG1O+nxaRd3i2kNv/WYmZgWle1L4G7uZ000IGybPOrfP65iAeXtwI6hYUQbtw+iS4Hm4fgkJBWC58AKLSzshsR0nEiPY+k1hy8nmzBSQdIXykOQqOAydMPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754361699; c=relaxed/simple;
	bh=K6NfsFMXpi+7WkJDWs0pz65H58+JBsRTHdwan/dGbTw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=WhFr/gp/ekW/buSST7c9GEvDjc3j3/x6BYOdqo9mKMwSkHEnta6CQzN75PMKLRbguWe1Ej9gp6BjrR/Q1XL2YJzU4qF1DLGamD9RIUlJCglvDBBIOwMJcaVwUlwKTyc+B5zf+s0PHxwB3xBTmzC3iuIBReiBlNd3JR6Jq9K/uIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxquBXb5FoKrA4AQ--.6114S3;
	Tue, 05 Aug 2025 10:41:27 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxpeRWb5FoRoI2AA--.5838S3;
	Tue, 05 Aug 2025 10:41:27 +0800 (CST)
Subject: Re: objtool warnings "sibling call from callable instruction with
 modified stack frame" with CONFIG_LTO_CLANG_THIN
To: Nathan Chancellor <nathan@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 WANG Rui <wangrui@loongson.cn>
Cc: loongarch@lists.linux.dev, llvm@lists.linux.dev
References: <20250731175655.GA1455142@ax162>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <fa51cd09-8a53-04c1-3bfd-e63d4e603975@loongson.cn>
Date: Tue, 5 Aug 2025 10:41:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250731175655.GA1455142@ax162>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxpeRWb5FoRoI2AA--.5838S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uFWruw4xXw1kZFWrCw4rWFX_yoW8KrWDpF
	sxCrZ8Jrs5Grn7K3s7Ja17trZ0k39rGw15XFy7KFyUZF4DXr1Ivr40gFZFga45Xws3JrWI
	qryfKa9xJF4qyacCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU25Ef
	UUUUU

On 2025/8/1 上午1:56, Nathan Chancellor wrote:
> Hi LoongArch folks,
> 
> The kernel test robot recently generated several reports when building
> with LLVM that appear to be related (the "warning: objtool:" reports):

...

> x86_64 does not see these objtool warnings when LTO is enabled, is this
> a backend issue or does objtool need to account for something that LLVM
> does yet GCC does not?

I can reproduce this problem.

After a quick look, objdump and readelf shows that there is no generated
relocation section '.rela.discard.tablejump_annotate' for the table jump
instruction when compiling with optimization config LTO_CLANG_THIN, thus
objtool can not know that what is the actual destination address for the
dynamic jump instruction jirl.

It needs to do something on the LLVM side to make sure that there is the
relocation section '.rela.discard.tablejump_annotate' if LTO is enabled,
but it seems not so easy.

I disscussed with Wang Rui offline and he suggested that we should ensure
it is aware of linker with LTO, '--loongarch-annotate-tablejump' needs to
be passed via '-mllvm' to ld.lld.

For the above reasons, in order to maintain downward compatibility for the
current older LLVM compiler, it is safe to do the following changes in the
kernel Makefile for now:

-----8<-----
diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index b0703a4e02a2..6cdbcbbe730e 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -103,6 +103,12 @@ KBUILD_CFLAGS                      += $(call 
cc-option,-mthin-add-sub) $(call cc-option,-Wa$(comma)
  ifdef CONFIG_OBJTOOL
  ifdef CONFIG_CC_HAS_ANNOTATE_TABLEJUMP
  KBUILD_CFLAGS                  += -mannotate-tablejump
+# The annotate-tablejump option can not be passed to LLVM backend when 
LTO is enabled.
+# Ensure it is aware of linker with LTO, 
'--loongarch-annotate-tablejump' needs to be
+# passed via '-mllvm' to ld.lld.
+ifdef CONFIG_LTO_CLANG
+KBUILD_LDFLAGS                 += -mllvm --loongarch-annotate-tablejump
+endif
  else
  KBUILD_CFLAGS                  += -fno-jump-tables # keep 
compatibility with older compilers
  endif

With the above changes, there are still some other objtool warnings
and build errors if the config LTO_CLANG_THIN is set, maybe it needs
to adjust the objtool code too, I will take some time to analysis.

Thanks,
Tiezhu

