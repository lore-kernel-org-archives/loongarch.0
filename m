Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40DA6FC3;
	Sat, 20 Sep 2025 12:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758372854; cv=none; b=kqLkgnwXl7SNLTgG9q+w0pg2tqsiV+gUP1I25JaUliUp6/2KFeTDVD4znPvcraeJtGdj/V0ZCsbganbzUNjQudM6g/zZnhqujHzmruyJswDJghGM7JhU0UKeN2TPUV+pHoUPBjGEYt+bdaSwiP04QdDLZoeiV7XyiPgUCllqTo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758372854; c=relaxed/simple;
	bh=XFWF31OaEaIu/EFDwQs+yCVJV+x8UGU0em54WwiiiUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQspVpoNpY5q33kzmx/vkZuIQ7M4jtuO3GIonqYJjjRPpompb7lmENhloP2VlCAfHbIMg4Hqa7incfMEeRTsWKb8X6EOu608CHGvgU9c7EMufqw+QbITpEbQfi9OhRC6rLbmYs1Y/sihxiOvhrtyvGY82nCQO/Z2UEx/4+l/oe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [117.22.84.112])
	by gateway (Coremail) with SMTP id _____8Cx77+no85o3Y8MAA--.25612S3;
	Sat, 20 Sep 2025 20:52:56 +0800 (CST)
Received: from [192.168.0.111] (unknown [117.22.84.112])
	by front1 (Coremail) with SMTP id qMiowJCxG8Geo85o6IOhAA--.19002S3;
	Sat, 20 Sep 2025 20:52:51 +0800 (CST)
Message-ID: <750c907d-cc95-5116-4507-52dd48927cec@loongson.cn>
Date: Sat, 20 Sep 2025 20:52:47 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 1/2] LoongArch: Make LTO case independent in Makefile
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 WANG Rui <wangrui@loongson.cn>, rust-for-linux@vger.kernel.org,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20250909092707.3127-1-yangtiezhu@loongson.cn>
 <20250909092707.3127-2-yangtiezhu@loongson.cn>
 <20250920061536.GA1460394@ax162>
 <CAAhV-H5=w82CDx=1=PZjf4FVW_dGWe_e__QazwDTwE3kKXtPLQ@mail.gmail.com>
 <c9c4c0e6-946d-95de-9c03-a4b8e1636b81@loongson.cn>
 <7eafa4a6-55bf-2fcb-19ef-b18bd51bfd39@loongson.cn>
 <CAAhV-H4xx-C28-a8H7yJTK30+r90zL9XTSAb87Jr4zLc5ShBoA@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
In-Reply-To: <CAAhV-H4xx-C28-a8H7yJTK30+r90zL9XTSAb87Jr4zLc5ShBoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJCxG8Geo85o6IOhAA--.19002S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ur1xurWDAF1UZr15Zr17CFX_yoW8tr4rpF
	WkCFykKrs5Jr4kt3sFya18KF45Krs3Ar12q3W5Jr1kZF1qvrZaqw4fGr98WasrAr9rtrW2
	vFyrKw17WF4UJagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU8VwZ7UUUUU==

On 9/20/25 19:41, Huacai Chen wrote:
...

>>> We need to handle the other case to use -fno-jump-tables if llvm does
>>> not support -loongarch-annotate-tablejump.
>>>
>>> So, it is better to update the minimal version of llvm to 20, which
>>> includes the following two important commits:
>>>
>>> [LoongArch] Add options for annotate tablejump
>>> https://github.com/llvm/llvm-project/commit/4c2c17756739
>>>
>>> [LoongArch] Avoid indirect branch jumps using the ra register
>>> https://github.com/llvm/llvm-project/commit/21ef17c62645
>>>
>>> If you are OK, I will send a patch to modify the following file:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/min-tool-version.sh#n29
>>>
>>>
>>> and keep arch/loongarch/Makefile as is.
>>
>> The other way is to keep scripts/min-tool-version.sh as is, and only
>> modify arch/loongarch/Makefile, something like this (not tested):
>>
>> config LLD_HAS_ANNOTATE_TABLEJUMP
>>          def_bool LLD_VERSION >= 200000
>>
>> ifdef CONFIG_LTO_CLANG
>> ifdef CONFIG_LLD_HAS_ANNOTATE_TABLEJUMP
>> KBUILD_LDFLAGS                  += -mllvm --loongarch-annotate-tablejump
>> else
>> KBUILD_LDFLAGS                  += -mllvm --no-jump-tables
>> endif
> So complicated?
> 
> I think below is enough, no?
> ifdef CONFIG_LTO_CLANG
> # The annotate-tablejump option can not be passed to LLVM backend when
> LTO is enabled.
> # Ensure it is aware of linker with LTO,
> '--loongarch-annotate-tablejump' also needs to
> # be passed via '-mllvm' to ld.lld.
> KBUILD_LDFLAGS                  += $(call ld-option,-mllvm
> --loongarch-annotate-tablejump,-mllvm --no-jump-tables)
> endif

I do not know whether this is valid, you can test it with llvm 18
and llvm 20 if you think it is a proper way.

But IIRC, there is objtool warning with llvm 18, I reported to llvm
developer Wang Lei and he fixed it as the following commit:

[LoongArch] Avoid indirect branch jumps using the ra register
https://github.com/llvm/llvm-project/commit/21ef17c62645

Actually, the above commit solved a performance issue of llvm compiler,
so I prefer to update the minimal llvm version to 20 for LoongArch.

Thanks,
Tiezhu

