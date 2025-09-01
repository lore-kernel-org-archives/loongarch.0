Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09FE2FB99F
	for <loongarch@lists.linux.dev>; Mon,  1 Sep 2025 08:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756715977; cv=none; b=d0KWcuLKx5FF/jq6dh4XP9utk4OMh/a5GosXF4SyPPhKGFae1BW+M2l00BHNk4PnJFmxApFx+Qswq8dLKxU6dCwFmjrG9nKSscIkaMOV4sxtfb3PLkBu6J/1Dhu2nWX+8MF+OjDE5G0/tW+5p4GSTue+P7+A9i9RGr5h0aej/ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756715977; c=relaxed/simple;
	bh=GIftNVJjFgHrRrN7LUcZ2GN5PRbGvAM7Rm+3Sj9T2vI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ZTbRwRcYKOBapSGh88OUBBbSTY4Pvn+Xias+stzs8dqou0/H6pl7tK3e94TzQTEJqBufX+gwy/Bk0ietdMZR1xplvG+4+KQiTzVvx5KF5CZ38pU6VnshFCnJp9AvRlgvoyWj1ltz1yJmT6QmlsmQJLKthuAr6wTBjC7hcsm2z/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxT_DDW7VoWEwFAA--.10792S3;
	Mon, 01 Sep 2025 16:39:31 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxjcHCW7VotI52AA--.55959S3;
	Mon, 01 Sep 2025 16:39:31 +0800 (CST)
Subject: Re: [PATCH v1 2/3] objtool/LoongArch: Fix unreachable instruction
 warnings about EFISTUB
To: Peter Zijlstra <peterz@infradead.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250901072156.31361-1-yangtiezhu@loongson.cn>
 <20250901072156.31361-3-yangtiezhu@loongson.cn>
 <20250901081904.GB4067720@noisy.programming.kicks-ass.net>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <82c913b9-4403-cde9-0542-5bd6e04415f5@loongson.cn>
Date: Mon, 1 Sep 2025 16:39:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250901081904.GB4067720@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxjcHCW7VotI52AA--.55959S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZF45KF4UWw4DKFy3AFyfZrc_yoW5ZFy7pF
	47Cryjva90qF1qqw4DGr4ag34ava15Xr4qqF1UJa45K3yjv3Z7tanYyr17CFyqgr4Y9FW3
	XayUt34DCFyjk3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU92b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AK
	xVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVF
	xhVjvjDU0xZFpf9x07jY38nUUUUU=

On 2025/9/1 下午4:19, Peter Zijlstra wrote:
> On Mon, Sep 01, 2025 at 03:21:55PM +0800, Tiezhu Yang wrote:
>> When compiling with LLVM and CONFIG_LTO_CLANG is set, there exist the
>> following objtool warnings:
>>
>>    vmlinux.o: warning: objtool: .head.text+0x0: unreachable instruction
>>    vmlinux.o: warning: objtool: .head.text+0x18: unreachable instruction
>>    vmlinux.o: warning: objtool: .head.text+0x38: unreachable instruction
>>    vmlinux.o: warning: objtool: .head.text+0x3c: unreachable instruction
>>    vmlinux.o: warning: objtool: .head.text+0x40: unreachable instruction
>>    vmlinux.o: warning: objtool: .head.text+0x44: unreachable instruction
>>    vmlinux.o: warning: objtool: .head.text+0x54: unreachable instruction
>>    vmlinux.o: warning: objtool: .head.text+0x58: unreachable instruction
>>    vmlinux.o: warning: objtool: .head.text+0x6c: unreachable instruction
>>    vmlinux.o: warning: objtool: .head.text+0x84: unreachable instruction
>>    vmlinux.o: warning: objtool: .head.text+0x94: unreachable instruction
>>    vmlinux.o: warning: objtool: .head.text+0x9c: unreachable instruction
>>    vmlinux.o: warning: objtool: .head.text+0xc4: unreachable instruction
>>    vmlinux.o: warning: objtool: .head.text+0xf8: unreachable instruction
>>    vmlinux.o: warning: objtool: .head.text+0xfc: unreachable instruction
>>    vmlinux.o: warning: objtool: .head.text+0x104: unreachable instruction
>>    vmlinux.o: warning: objtool: .head.text+0x10c: unreachable instruction
>>    vmlinux.o: warning: objtool: .head.text+0x11c: unreachable instruction
>>    vmlinux.o: warning: objtool: .head.text+0x120: unreachable instruction
>>    vmlinux.o: warning: objtool: .head.text+0x124: unreachable instruction
>>    vmlinux.o: warning: objtool: .head.text+0x144: unreachable instruction
>>
>> The instructions in the .head.text section are related with EFISTUB,
>> they are image header and can be ignored by objtool, so just check the
>> section name in ignore_unreachable_insn() to ignore it.
> 
> I am confused; why do the efi/libstub functions generate this error?
> 
> Is this zboot-header.S perhaps? Why can't we properly annotate that
> file?

This is arch/loongarch/kernel/head.S.

There is "OBJECT_FILES_NON_STANDARD_head.o := y" in Makefile
to skip objtool checking for head.o, but OBJECT_FILES_NON_STANDARD
does not work for link time validation of vmlinux.o.

At the beginning, give UNWIND_HINT_UNDEFINED for these instructions,
but there is an argument in the previous RFC [1]:

"The efi header is completely not code, the annotations are very strange."

Josh suggested to do something to put these instructions in the data
section, but as said in the previous reply, it needs to modify the link
process and seems too complicated and expensive for this warning to some
extent.

So I did this change for objtool.

[1] 
https://lore.kernel.org/loongarch/CAAhV-H7NNtH-oaqMsN5=2c+EdF0-dy5mxcsO=_KFGWqb-FZj_w@mail.gmail.com/
[2] 
https://lore.kernel.org/loongarch/l7l2ik5b2inhwbxmlae7ozrlxi7hbdjbrhjsrykjgotlhflah6@jebephhvtxki/

Thanks,
Tiezhu

