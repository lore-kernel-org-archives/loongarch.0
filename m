Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1E314A60F;
	Thu, 13 Feb 2025 02:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739413252; cv=none; b=nPI/7TFN1B8Iesa56d0YvinXbhSVnegzxoXP186e+istdIRPhbg2BtegCyoifxGRtEPWe+4QndSNf5RclW7QPQH1SvU0s0J74Sg6G6OKqh6rWmJPgu8C1Sbojp2XfSvY/A0pBHwf4FWkkgsAsUUh0OCByMGH5178T4va1IFKaPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739413252; c=relaxed/simple;
	bh=7yOfSs4iMJZzUnntYhUmEAQd0afxVo7w4k64T6PK0LA=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=HU3lHJid0oTyaLp8dR/oY7jeJByvf5PAOoa41gQ+XWapX42ofJ9Q3jRkPEv8JbxBa8bRicxLGcLASTTbIzoq0N+/Sr7J8Y7cTEx88b5FiqEoiPFwCZddMlZe74aEuDCtrweYcBg7tyeMtrVzKGk0gGNgj+G0m42dQkkSgUhYSoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxHHL+Vq1nNrtzAA--.4744S3;
	Thu, 13 Feb 2025 10:20:46 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxPsf4Vq1nrhAPAA--.59606S3;
	Thu, 13 Feb 2025 10:20:41 +0800 (CST)
Subject: Re: [PATCH] compiler.h: Specify correct attribute for
 .rodata..c_jump_table
To: Josh Poimboeuf <jpoimboe@kernel.org>
References: <20240924062710.1243-1-yangtiezhu@loongson.cn>
 <20250212175023.rsxsw7pno57gsxps@jpoimboe>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 llvm@lists.linux.dev
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <b1e5e3ea-be4b-5dae-cc0d-34693429d060@loongson.cn>
Date: Thu, 13 Feb 2025 10:20:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250212175023.rsxsw7pno57gsxps@jpoimboe>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMCxPsf4Vq1nrhAPAA--.59606S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxGFykGFWrWF4fArWfGF47WrX_yoW5uw1fpr
	WDCFyqgFs5Zr1Y9a12qw1akr17tw42yF18WrWDKryjyw15Xr1vgF1ktrsxKayDKr1UJw10
	qw4Iqry5Ka4UZ3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUU
	U

On 02/13/2025 01:50 AM, Josh Poimboeuf wrote:
> On Tue, Sep 24, 2024 at 02:27:10PM +0800, Tiezhu Yang wrote:
>> Currently, there is an assembler message when generating kernel/bpf/core.o
>> under CONFIG_OBJTOOL with LoongArch compiler toolchain:
>>
>>   Warning: setting incorrect section attributes for .rodata..c_jump_table
>>
>> This is because the section ".rodata..c_jump_table" should be readonly,
>> but there is a "W" (writable) part of the flags:
>>
>>   $ readelf -S kernel/bpf/core.o | grep -A 1 "rodata..c"
>>   [34] .rodata..c_j[...] PROGBITS         0000000000000000  0000d2e0
>>        0000000000000800  0000000000000000  WA       0     0     8
>>
>> There is no above issue on x86 due to the generated section flag is only
>> "A" (allocatable). In order to silence the warning on LoongArch, specify
>> the attribute like ".rodata..c_jump_table,\"a\",@progbits #" explicitly,
>> then the section attribute of ".rodata..c_jump_table" must be readonly
>> in the kernel/bpf/core.o file.
>>
>> Before:
>>
>>   $ objdump -h kernel/bpf/core.o | grep -A 1 "rodata..c"
>>    21 .rodata..c_jump_table 00000800  0000000000000000  0000000000000000  0000d2e0  2**3
>>                   CONTENTS, ALLOC, LOAD, RELOC, DATA
>>
>> After:
>>
>>   $ objdump -h kernel/bpf/core.o | grep -A 1 "rodata..c"
>>    21 .rodata..c_jump_table 00000800  0000000000000000  0000000000000000  0000d2e0  2**3
>>                   CONTENTS, ALLOC, LOAD, RELOC, READONLY, DATA
>>
>> By the way, AFAICT, maybe the root cause is related with the different
>> compiler behavior of various archs, so to some extent this change is a
>> workaround for LoongArch, and also there is no effect for x86 which is
>> the only port supported by objtool before LoongArch with this patch.
>
> Right, this sounds like a bug in the GNU assembler.  It should default
> to the same section flags regardless of arch.

I agree with you.

>
>>
>> Cc: stable@vger.kernel.org # 6.9+
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>  include/linux/compiler.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
>> index ec55bcce4146..4d4e23b6e3e7 100644
>> --- a/include/linux/compiler.h
>> +++ b/include/linux/compiler.h
>> @@ -133,7 +133,7 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
>>  #define annotate_unreachable() __annotate_unreachable(__COUNTER__)
>>
>>  /* Annotate a C jump table to allow objtool to follow the code flow */
>> -#define __annotate_jump_table __section(".rodata..c_jump_table")
>> +#define __annotate_jump_table __section(".rodata..c_jump_table,\"a\",@progbits #")
>
> This caused a regression, this hack apparently doesn't work with Clang:
>
>   $ readelf -WS kernel/bpf/core.o | grep c_jump_table
>     [43] .rodata..c_jump_table,"a",@progbits # PROGBITS        0000000000000000 00d610 000800 00   A  0   0 16
>
> Notice the section name is literally:
>
>   .rodata..c_jump_table,"a",@progbits #

Yes, I noticed this section name which contains the original name
".rodata..c_jump_table" and the specified attribute compiled with
Clang, it should not contain the specified attribute.

That is strange but seems no effect due to only compare the first
few letters of the section name in objtool.

I will keep digging with the GNU and LLVM compiler developers.

Thanks,
Tiezhu

