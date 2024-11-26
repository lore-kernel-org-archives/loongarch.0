Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552DD1B6CE6
	for <loongarch@lists.linux.dev>; Tue, 26 Nov 2024 10:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732617742; cv=none; b=jB879hGbumZAOfFwMEr/p2eALN2MLm2MHcDZl0L2nn3a3zAdgLGHLUoExde/9wNozPadMk1ZJgh9aAS7j2JAMTd1+YcU81vRxfrHWnj4UV7h4EKZcwKEew6E75dEGNZFd1BGg9EAPt3IpvE91l/9Wx7aE0JmMAqG+DsbWQlkyA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732617742; c=relaxed/simple;
	bh=GY571ipN4IC/7DIKMKZTGzIvBiV4jFXyz1rcN9yqAeQ=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=gs8lDAxU18prZJOMTw7xDmmJmykCsZP2nriBUhqetD0KW3uBOPrxVYkA+LF6OmAmZc/EKeiUSpkyAbCPIktTu9/GsMaF1gSDXpDHhY4aqH+F09O1S3QXBW16GbHlJIvs3YU/zDKaC4qe020v8G4jxtaSOxtzZvD9pb39NThcLWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxCeEIpkVnJw9JAA--.11745S3;
	Tue, 26 Nov 2024 18:42:16 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBxXUcHpkVnA25oAA--.42495S3;
	Tue, 26 Nov 2024 18:42:15 +0800 (CST)
Subject: Re: [PATCH v4 02/10] objtool: Handle special cases of dead end insn
To: Josh Poimboeuf <jpoimboe@kernel.org>
References: <20241122045005.14617-1-yangtiezhu@loongson.cn>
 <20241122045005.14617-3-yangtiezhu@loongson.cn>
 <20241126064513.bf6yq56eklyo4xvt@jpoimboe>
Cc: Huacai Chen <chenhuacai@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <bb36374e-aca2-92e1-209d-1524e31147ab@loongson.cn>
Date: Tue, 26 Nov 2024 18:42:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241126064513.bf6yq56eklyo4xvt@jpoimboe>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMBxXUcHpkVnA25oAA--.42495S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CF4fCrW5Wr17uF4DGFWxuFX_yoW8XryxpF
	ZxAay5AF4qvrWkWF17Zr48Zryftw4fJw4UXFn5J34fK3yUJwn3tF1kta1jyasxCr4S9F1a
	qF1Sg34DWFy5A3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8P5
	r7UUUUU==

On 11/26/2024 02:45 PM, Josh Poimboeuf wrote:
> On Fri, Nov 22, 2024 at 12:49:57PM +0800, Tiezhu Yang wrote:
>> There are some "unreachable instruction" objtool warnings when compling
>> with Clang on LoongArch, this is because the "break" instruction is set
>> as dead end due to its type is INSN_BUG in decode_instructions() at the
>> beginning, and it does not set insn->dead_end of the "break" instruction
>> as false after checking ".rela.discard.reachable" in add_dead_ends(), so
>> the next instruction of "break" is marked as unreachable.
>>
>> Actually, it can find the reachable instruction after parsing the section
>> ".rela.discard.reachable", in some cases, the "break" instruction may not
>> be the first previous instruction with scheduling by Machine Instruction
>> Scheduler of LLVM, it should find more times and then set insn->dead_end
>> of the "break" instruction as false.
>>
>> This is preparation for later patch on LoongArch, there is no effect for
>> the other archs with this patch.
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>
> I'm having trouble understanding this commit log, is the problem that
> the compiler is sometimes inserting code between 'break' and the
> unreachable() inline asm?
>
> If so, this sounds like a problem that was already solved for x86 with:
>
>   bfb1a7c91fb7 ("x86/bug: Merge annotate_reachable() into _BUG_FLAGS() asm")
>
> Can you check if that fixes it?

I will try, thank you.

