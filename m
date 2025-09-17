Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C346A285404
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 09:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758102444; cv=none; b=oGLyBeN+uNdXRL9IIK4oH/nT0dit/QdUsXHcqgJ8ROQyqehs+AwMEoX0EYdqpfL2qD8koYspsT52RUPUDWHUhtQoL+dwLeEsySpl8vOw7wYxLlM+MrDgwZeXSZl7xZITBj1hBD9QLySBXv3uXRtj90DPg0aTiq3QnlQKafdD1Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758102444; c=relaxed/simple;
	bh=UTIf4txpaImQ0cFB7zAgM6nm9pOQSd8jCc/j9BwiWaA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=TbQebSHq7MVOZZgZyrM6Xwd5pIUZ1e9i8mqkbx/76CYk0DDwd93h30HytBqn51QA9Lk/zlB8JDnqMOwQlhVm4MeYEoA5TbkFGaHP2X0H2SA7O0BDnbgGFiH/yt4zWus1wrgm7D4o9qt2saRKvOPl77NiNieTBNiFS+pwZwYp59Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxP_Cmg8poLU8LAA--.24142S3;
	Wed, 17 Sep 2025 17:47:19 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxpeSjg8po9DebAA--.36350S3;
	Wed, 17 Sep 2025 17:47:17 +0800 (CST)
Subject: Re: [PATCH v2 3/4] objtool/LoongArch: Fix unreachable instruction
 warnings about entry points
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250917011007.4540-1-yangtiezhu@loongson.cn>
 <20250917011007.4540-4-yangtiezhu@loongson.cn>
 <CAAhV-H6yKyqU+jQ=-RoOOc0fyRgjFfdorJAk1LashV0Gt=Y=AQ@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <bfd7035b-ca08-66d2-bdc5-d28743144128@loongson.cn>
Date: Wed, 17 Sep 2025 17:47:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6yKyqU+jQ=-RoOOc0fyRgjFfdorJAk1LashV0Gt=Y=AQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxpeSjg8po9DebAA--.36350S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kw47WF48CFy3tFWrWrW7trc_yoW5JF43pF
	WUC390y3yvyF1qva1DJ3yagrWrZFn3Wr4aqFnxGryrA39Fv3ZFqw40yr1UXFyDKw47W340
	qrWrtFZ0gayUA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jntxDUUUUU=

On 2025/9/17 下午3:07, Huacai Chen wrote:
> Hi, Tiezhu,
> 
> On Wed, Sep 17, 2025 at 9:10 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> When compiling with LLVM and CONFIG_LTO_CLANG is set, there exist the
>> following objtool warnings:
>>
>>    vmlinux.o: warning: objtool: kernel_entry+0x0: unreachable instruction
>>    vmlinux.o: warning: objtool: smpboot_entry+0x0: unreachable instruction
>>
>> kernel_entry() and smpboot_entry() are in arch/loongarch/kernel/head.S,
>> there is "OBJECT_FILES_NON_STANDARD_head.o := y" to skip objtool checking
>> for head.o, but the STACK_FRAME_NON_STANDARD macro does not work for link
>> time validation of vmlinux.o according to objtool documentation, just give
>> a proper unwind hint to fix the warnings.
>>
>> By the way, ASM_BUG() can be removed due to unnecessary, otherwise there
>> are following warnings:
>>
>>    kernel_entry+0xf4: start_kernel() missing __noreturn
>>    in .c/.h or NORETURN() in noreturns.h
>>
>>    smpboot_entry+0x68: start_secondary() missing __noreturn
>>    in .c/.h or NORETURN() in noreturns.h
>>
>> This is because the previous instructions of kernel_entry+0xf4 and
>> smpboot_entry+0x68 are the 'bl' instructions, start_kernel() and
>> start_secondary() are the respective call destination symbols which
>> are noreturn functions, then the 'bl' instructions are already marked
>> as dead end in annotate_call_site().
>>
>> For now, it is time to remove "OBJECT_FILES_NON_STANDARD_head.o := y"
>> in arch/loongarch/kernel/Makefile.

...

>> -OBJECT_FILES_NON_STANDARD_head.o := y
> This line should be kept, othewise we get:
> 
> arch/loongarch/kernel/head.o: warning: objtool: kernel_entry+0xf4:
> start_kernel() missing __noreturn in .c/.h or NORETURN() in
> noreturns.h
> 
> even without LTO. This is a regression, we can only remove it after
> the above warning be fixed.

As said in the commit message, ASM_BUG() needs to be removed
to fix the above warning.

I tested again with GCC and LLVM (with and without LTO),
there is no the warning what you said, please double check.

(1) GCC
make ARCH=loongarch defconfig
make ARCH=loongarch -j8

(2) LLVM without LTO
make ARCH=loongarch LLVM=1 clean defconfig
make ARCH=loongarch LLVM=1 olddefconfig all -j8

(3) LLVM with LTO
make ARCH=loongarch LLVM=1 clean defconfig
scripts/config -d LTO_NONE -e LTO_CLANG_THIN
make ARCH=loongarch LLVM=1 olddefconfig all -j8

Thanks,
Tiezhu

