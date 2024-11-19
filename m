Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740361C4609
	for <loongarch@lists.linux.dev>; Tue, 19 Nov 2024 10:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732013244; cv=none; b=nHDosif5ct2qXo801/9SmIbHTrehsDm+IKue1hBSXU7wTK+gUvRnVRib3iyLCpKsjUYeecMsq1cRcwM7vU02hfmrEuJyJngJ/DwrPXFshZ3Tf1LqyHkWqzANC1kJLwQsS5rFKpvJ3w7YSDiy6IRUcNu83P4niaWCuQ4kF1YwSJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732013244; c=relaxed/simple;
	bh=iVXt9RUXK+WA+DLYFV6L3dVEMDca3n6pGxNaziolk9w=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=FI7f8DFG/YII9X+C8K5a4lqEiOejYbhyjLGdN3R47YIgyabPRD44osm5K44tJv+PcbCc37LouIQdq5yTNQZqVOS5AW+Ym9comKTfRw0+7fUMqAautFF7zC7wWyV+M07shRcdHcabtkYQlcTA0TwrFwvuuusNHwlSkMLIo27Ksuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8Axjq+4bDxnbWhCAA--.41436S3;
	Tue, 19 Nov 2024 18:47:20 +0800 (CST)
Received: from [10.136.12.26] (unknown [111.9.175.10])
	by front1 (Coremail) with SMTP id qMiowMCxdcC3bDxnXT5dAA--.26750S3;
	Tue, 19 Nov 2024 18:47:20 +0800 (CST)
Subject: Re: [PATCH v3 02/10] objtool: Handle special cases of dead end insn
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241119065655.21123-1-yangtiezhu@loongson.cn>
 <20241119065655.21123-3-yangtiezhu@loongson.cn>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <bc6dd2e7-ac1d-bee2-3796-6fe43a3db90b@loongson.cn>
Date: Tue, 19 Nov 2024 18:47:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241119065655.21123-3-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CM-TRANSID:qMiowMCxdcC3bDxnXT5dAA--.26750S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7CF4DKF4rGFyxtF18tF4fJFc_yoW8Zw15pF
	W3C3y5tF4qqr4xW3W7Crs5Wr9xKw4fJrWUWF93J34UG3yDXwn5KF97Ka4jy3Z0kw13W3Wa
	vFsIg34UXF1qyrbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU82g
	43UUUUU==


On 2024-11-19 14:56, Tiezhu Yang wrote:
> There are some "unreachable instruction" objtool warnings when compling
> with Clang on LoongArch, this is because the "break" instruction is set
> as dead end due to its type is INSN_BUG in decode_instructions() at the
> beginning, and it does not set insn->dead_end of the "break" instruction
> as false after checking ".rela.discard.reachable" in add_dead_ends(), so
> the next instruction of "break" is marked as unreachable.
>
> Actually, it can find the reachable instruction after parsing the section
> ".rela.discard.reachable", in some cases, the "break" instruction may not
> be the first previous instruction with scheduling by Machine Instruction
> Scheduler of LLVM, it should find more times and then set insn->dead_end
> of the "break" instruction as false.
>
> This is preparation for later patch on LoongArch, there is no effect for
> the other archs with this patch.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   tools/objtool/check.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index 9601235e908d..6607cd56459b 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -711,6 +711,18 @@ static int add_dead_ends(struct objtool_file *file)
>   		}
>   
>   		insn->dead_end = false;
> +
> +		/* Handle the special cases compiled with Clang on LoongArch */
> +		if (file->elf->ehdr.e_machine == EM_LOONGARCH &&
> +		    reloc->sym->type == STT_SECTION) {
> +			while (insn && insn_func(insn)) {
> +				insn = prev_insn_same_sym(file, insn);
> +				if (insn && insn->dead_end) {
> +					insn->dead_end = false;
> +					break;
> +				}
> +			}
> +		}
Does it cancel the previous instruction which has insn->dead_end?
Why the previous, and why just for LoongArch?
IMO if we annotate reachable, we should cancel all instructions which
are from the sym head to current insn, not only previous. Otherwise,
why it is previous but not the previous of previous.
>   	}
>   
>   	return 0;

