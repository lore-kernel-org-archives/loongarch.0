Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810B5347C7
	for <loongarch@lists.linux.dev>; Fri, 11 Apr 2025 02:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744339646; cv=none; b=smu6h/b/3IZ1fCRlPOsPhy1PTqgqXpzyWB/nohECt6exGjPxazT8WLqibbe9i9CnfryoFzBQk8lh0sGvSiEQyY3qUE2I0Y5r91WaJigrFSfwZ8BZqfwR3d5QjtT0s78yK1bnA8X/JEZTQNlzxtZ7Ir9Tzuj6guDCDmtHLKre+mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744339646; c=relaxed/simple;
	bh=bTyR4xbeIuIV2k+SYHoVRkW4JkBMOCjGrTDld2aXbsQ=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=F96vf7Uk5ZswVH6YN5Ca2elISi2/rZ3lIacWD1L7krooxJFtn+4laWINoxuA2lzDp967xzWiP7+Du7NsEZL0NJVSkpAZLNZ94Mz6Z4WV4p/N5LlibWKvdatQngLK7/Hkjp++0jVW259siecGCj61VeoqlKOgtHd29XSS445jRfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxlmmzgvhnBi+4AA--.44085S3;
	Fri, 11 Apr 2025 10:47:16 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBxb8evgvhn8sB5AA--.34844S3;
	Fri, 11 Apr 2025 10:47:13 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Handle fp, lsx, lasx and lbt assembly symbols
To: Wentao Guan <guanwentao@uniontech.com>
References: <20250408092907.22856-1-yangtiezhu@loongson.cn>
 <20250408161239.1023788-1-guanwentao@uniontech.com>
Cc: chenhuacai@kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <3019eada-7496-ca11-b645-f5efd7d215f4@loongson.cn>
Date: Fri, 11 Apr 2025 10:47:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250408161239.1023788-1-guanwentao@uniontech.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMBxb8evgvhn8sB5AA--.34844S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cr17KF45Cw17uw4xtryDXFc_yoW8AF43pa
	srCrnxGr4kCrs7uFn5G3y0vF47JasFyFW2qryDtr9rAas0vw1qgw42gwsxCFyxWa1kA3y8
	JF47Aws8Cr9YkacCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Eb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU88Ma5UUUUU==

On 04/09/2025 12:12 AM, Wentao Guan wrote:
> Hello Yang,
>
> I don`t know why change it defination remove "asmlinkage",
> why not explain it in commit message?

$ grep -rnw "define asmlinkage" .
./arch/x86/include/asm/linkage.h:20:#define asmlinkage CPP_ASMLINKAGE 
__attribute__((regparm(0)))
./include/linux/linkage.h:22:#define asmlinkage CPP_ASMLINKAGE

include/linux/linkage.h

#ifdef __cplusplus
#define CPP_ASMLINKAGE extern "C"
#else
#define CPP_ASMLINKAGE
#endif

#ifndef asmlinkage
#define asmlinkage CPP_ASMLINKAGE
#endif

So for LoongArch, asmlinkage means extern "C" or NULL, there is no
need to use asmlinkage for these prototypes because they are not put
in uapi headers, that is to say, they will be called and built only
by C compiler rather than C++ compiler, so asmlinkage is actually
NULL in this case.

Furthermore, there are no asmlinkage for the other exist prototypes
such as _save_fp, _restore_fp in arch/loongarch/include/asm/fpu.h,
so in my opinion, just keep them consistent.

But according to Documentation/process/coding-style.rst, it seems
asmlinkage should be used.

"Large, non-trivial assembly functions should go in .S files, with 
corresponding
C prototypes defined in C header files.  The C prototypes for assembly
functions should use ``asmlinkage``."

There are two ways:
(1) no need to use asmlinkage for these new added prototypes for
     assembly functions in asm/fpu.h and asm/lbt.h to keep consistent.

(2) use asmlinkage for these new added prototypes for assembly functions
     in asm/fpu.h and asm/lbt.h according to Documentation, and then add
     asmlinkage for the other exist prototypes if necessary.

That's up to the arch maintainer Huacai.

Thanks,
Tiezhu

