Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E261AC44C
	for <loongarch@lists.linux.dev>; Tue, 26 Nov 2024 13:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732627708; cv=none; b=OOjZ0tAHJLEd1ZHb07dlaLotPAn1DXaphBxjzxLSEOQFFYBYo77lS3fVNaXKvGvk9n7/F9Qr8flenJQYEnY+UcyYE4LgqR5urh2XhylsCZd1iexGwu+xlbGEgXiOg79KjBjBxK8c4bzrEi/dRJLbSC4rMFIzKFjvqgYQ3N3RYJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732627708; c=relaxed/simple;
	bh=UUN3gOvLpf58dKTpbNxydZfnuewhbHmOk4miccwmw44=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=HU+JQp1+dvNlgmiCkyBQNOBIZk/n18ot+qY3ZkadaSjT5SjEMJSzJDdyqBQJMBp/4YBIGFtPbIN3Hr9ZqZgTOxWR84LdImSKxZqfU4YmL6+4h5W3+7gAPn7aQKKzIDX2aqcYGE6zIzhpxCnsuGlZ4VAU6mw7eDU+ecSwwiA2K/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxLOL1zEVngiNJAA--.11140S3;
	Tue, 26 Nov 2024 21:28:21 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCx98DzzEVnWJZoAA--.42998S3;
	Tue, 26 Nov 2024 21:28:20 +0800 (CST)
Subject: Re: [PATCH v4 06/10] objtool: Handle unsorted table offset of rodata
To: Huacai Chen <chenhuacai@kernel.org>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>
References: <20241122045005.14617-1-yangtiezhu@loongson.cn>
 <20241122045005.14617-7-yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <8cb35ab7-56d0-8e8d-5e18-1bc2b94aeeeb@loongson.cn>
Date: Tue, 26 Nov 2024 21:28:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241122045005.14617-7-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMCx98DzzEVnWJZoAA--.42998S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KF1kWrWxur47Xr4Uur45Jwc_yoW8CF4xpF
	15CayUtrs0qryxK3Zrt3W0k343Gw47GryxJr4xtry8t34qvrnYqFW3Cay2kFyDWw4Y9a1I
	va98KFyxCF4kAFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
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
	4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jo
	sjUUUUUU=

On 11/22/2024 12:50 PM, Tiezhu Yang wrote:
> When compling with Clang on LoongArch, there are unsorted table offset
> of rodata if there exist many jump tables, it will get the wrong table
> end and find the wrong jump destination instructions in add_jump_table(),
> so it needs to check the table size of rodata to break the process when
> parsing the relocation section of rodata.
>
> This is preparation for later patch on LoongArch, there is no effect for
> the other archs with this patch.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  tools/objtool/check.c                 | 7 +++++++
>  tools/objtool/include/objtool/check.h | 1 +
>  2 files changed, 8 insertions(+)
>
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index b21e47d8d3d1..3b2d94c90011 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -2101,6 +2101,7 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
>  	struct alternative *alt;
>  	unsigned long offset;
>  	unsigned long rodata_entry_size;
> +	unsigned long rodata_table_size = insn->table_size;
>
>  	/*
>  	 * Each @reloc is a switch table relocation which points to the target
> @@ -2112,6 +2113,12 @@ static int add_jump_table(struct objtool_file *file, struct instruction *insn,
>  		if (reloc != table && reloc == next_table)
>  			break;
>
> +		/* Handle the special cases compiled with Clang on LoongArch */
> +		if (file->elf->ehdr.e_machine == EM_LOONGARCH &&
> +		    reloc->sym->type == STT_SECTION && reloc != table &&
> +		    reloc_offset(reloc) == reloc_offset(table) + rodata_table_size)
> +			break;

I think it can be generic, like this:

                 /* Check for the end of the table: */
                 if (reloc != table && reloc == next_table)
                         break;

                 if (reloc != table &&
                     reloc_offset(reloc) == reloc_offset(table) + 
rodata_table_size)
                         break;

What do you think?

Thanks,
Tiezhu

