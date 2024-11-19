Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452741C4A0D
	for <loongarch@lists.linux.dev>; Tue, 19 Nov 2024 10:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732013249; cv=none; b=XFNbFZQpLeBvdRdab3seFPBlUJ8r+s6I5UV2D2z9ZQ9VziuXO70l2BLX9Y9lQcwxClNVbOePKeiKEK6hA4DxE0gUSTVHFbbvn9Lqq9tKGxgNIkYlJZCrWvJHbd6m4hZ0H47ooDal/hUSbCULXs69bLPt4j68EUYkgZLi4z/ZsS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732013249; c=relaxed/simple;
	bh=5rpcXBUkk0hH95ce7Mwc1Odxo5W+XfECRy//P/4gLjE=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=TxxvlzVwJpHmYHLuhroS6/sQThVk2EN1Ywqv588RGd4z6Z5Ys1LF/WrY50iT1WoCzGs2/gksT26DhSxChW/s0weWA2/ypUTdS6g0lR2Ty8sN1GZy+Befrhs/M7bnxeeTm7XrMq5X1ydgzkshC++SzUpdLhfwnlIU4KcjTIg4h9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8Dx2uG9bDxndGhCAA--.1326S3;
	Tue, 19 Nov 2024 18:47:25 +0800 (CST)
Received: from [10.136.12.26] (unknown [111.9.175.10])
	by front1 (Coremail) with SMTP id qMiowMBx30e7bDxnYD5dAA--.28277S3;
	Tue, 19 Nov 2024 18:47:24 +0800 (CST)
Subject: Re: [PATCH v3 03/10] objtool: Handle different entry size of rodata
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241119065655.21123-1-yangtiezhu@loongson.cn>
 <20241119065655.21123-4-yangtiezhu@loongson.cn>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <ede02c68-9a1b-8cd1-ae05-a1106b435e93@loongson.cn>
Date: Tue, 19 Nov 2024 18:47:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241119065655.21123-4-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-TRANSID:qMiowMBx30e7bDxnYD5dAA--.28277S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ur13tF1kXw4Uur4UJry7urX_yoW8CFy5pF
	13G348trsYqry7WanrK3Z8uryru3yIgry8GFZ7Kry0ywnIqrn5JFWSk34YkFWUZ3sYg3Wx
	Za98KFy8CF4qy3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jo
	sjUUUUUU=


On 2024-11-19 14:56, Tiezhu Yang wrote:
> In the most cases, the entry size of rodata is 8 bytes because the
> relocation type is 64 bit, but when compling with Clang on LoongArch,
> there exists 32 bit relocation type, the entry size of rodata should
> be 4 bytes in this case.
>
> This is preparation for later patch on LoongArch, there is no effect
> for the other archs with this patch.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   tools/objtool/check.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index 6607cd56459b..af824bfd0973 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -2092,6 +2092,7 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
>   	struct reloc *reloc = table;
>   	struct alternative *alt;
>   	unsigned long offset;
> +	unsigned long rodata_entry_size;
>   
>   	/*
>   	 * Each @reloc is a switch table relocation which points to the target
> @@ -2103,8 +2104,15 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
>   		if (reloc != table && reloc == next_table)
>   			break;
>   
> +		/* Handle the special cases compiled with Clang on LoongArch */
> +		if (file->elf->ehdr.e_machine == EM_LOONGARCH &&
> +		    reloc_type(reloc) == R_LARCH_32_PCREL)
It is arch-specific. I'd prefer to rewrite an interface in arch directory
to get the entry size in rodata by arch different relocation types.
And I think this patch should merge to other patches e.g. [07/10].
> +			rodata_entry_size = 4;
> +		else
> +			rodata_entry_size = 8;
> +
>   		/* Make sure the table entries are consecutive: */
> -		if (prev_offset && reloc_offset(reloc) != prev_offset + 8)
> +		if (prev_offset && reloc_offset(reloc) != prev_offset + rodata_entry_size)
>   			break;
>   
>   		if (reloc->sym->type == STT_SECTION) {

