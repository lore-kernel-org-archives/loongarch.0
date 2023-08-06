Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41084EDC;
	Sun,  6 Aug 2023 10:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1691317869; bh=sqi/+CXZcnCn6zMHYik83KCgTz71fg+XcMCrPM7cGG4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XVMqvcmwcjHIKCiBjxUw0RfEjTcTZQLaFNwZGIp9VawMif1D6C58eMyRsq8hsygYN
	 Y14Vs+JLbUeeuUeNLRbVO6uc/yjKHPGqBJrP3ew2xw5caurf6Ka88vW42zrdUDsWIZ
	 E/0dTZc+nuAYvQ36ofDukS7eMnSRBizssYKFHQto=
Received: from [192.168.9.172] (unknown [101.88.28.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id A9D5D600F8;
	Sun,  6 Aug 2023 18:31:09 +0800 (CST)
Message-ID: <d591bfef-9146-abf6-04d0-96600ebb7a15@xen0n.name>
Date: Sun, 6 Aug 2023 18:31:09 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] LoongArch: Replace -ffreestanding with finer-grained
 -fno-builtin's
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Xi Ruoyao <xry111@xry111.site>,
 loongarch@lists.linux.dev, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, WANG Xuerui <git@xen0n.name>,
 Nick Desaulniers <ndesaulniers@google.com>
References: <20230806083021.2243574-1-kernel@xen0n.name>
 <CAAhV-H4ypd-+z-KbeGM6C_mNk0aggk2yhdDik-XfPNWqsO=j=A@mail.gmail.com>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <CAAhV-H4ypd-+z-KbeGM6C_mNk0aggk2yhdDik-XfPNWqsO=j=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 8/6/23 17:16, Huacai Chen wrote:
> Hi, Xuerui,
>
> On Sun, Aug 6, 2023 at 4:30 PM WANG Xuerui <kernel@xen0n.name> wrote:
>> From: WANG Xuerui <git@xen0n.name>
>>
>> As explained by Nick in the original issue: the kernel usually does a
>> good job of providing library helpers that have similar semantics as
>> their ordinary userspace libc equivalents, but -ffreestanding disables
>> such libcall optimization and other related features in the compiler,
>> which can lead to unexpected things such as CONFIG_FORTIFY_SOURCE not
>> working (!).
>>
>> As it turns out to be the case, only the memory operations really need
>> to be prevented from expansion by the compiler, and this is doable with
>> finer-grained -fno-builtin-* toggles. So only disable memcpy, memmove
>> and memset, while leaving other builtins enabled, to fix source
>> fortification among others.
>>
>> Closes: https://github.com/ClangBuiltLinux/linux/issues/1897
>> Reported-by: Nathan Chancellor <nathan@kernel.org>
>> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
>> Signed-off-by: WANG Xuerui <git@xen0n.name>
>> ---
>>
>> Changes in v2:
>>
>> - Keep the memory operation builtins disabled, add comments, and tweak the
>>    commit message along the way.
>>
>>   arch/loongarch/Makefile | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
>> index b1e5db51b61c..34fc48df87f2 100644
>> --- a/arch/loongarch/Makefile
>> +++ b/arch/loongarch/Makefile
>> @@ -83,7 +83,14 @@ KBUILD_CFLAGS_KERNEL         += -fPIE
>>   LDFLAGS_vmlinux                        += -static -pie --no-dynamic-linker -z notext
>>   endif
>>
>> -cflags-y += -ffreestanding
>> +# Make sure the memory libcalls are not expanded by the compiler, for better
>> +# control over unaligned accesses with respect to CONFIG_ARCH_STRICT_ALIGN,
>> +# and also for avoiding https://gcc.gnu.org/PR109465.
>> +#
>> +# The overly broad -ffreestanding is undesirable as it disables *all* libcall
>> +# handling, that unfortunately includes proper FORTIFY_SOURCE instrumentation.
> I think these comments should go to commit message rather than here,
> because after this patch there is no -ffreestanding in Makefile.
Thanks for the advice, I'm fine either way and I'll send v3.
>
> Huacai
>
>> +cflags-y += -fno-builtin-memcpy -fno-builtin-memmove -fno-builtin-memset
>> +
>>   cflags-y += $(call cc-option, -mno-check-zero-division)
>>
>>   load-y         = 0x9000000000200000
>> --
>> 2.40.0
>>
>>
-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

