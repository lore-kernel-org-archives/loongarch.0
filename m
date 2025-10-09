Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9831B4F1F
	for <loongarch@lists.linux.dev>; Thu,  9 Oct 2025 02:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759975340; cv=none; b=EPMqqvSuJvrkuC5cHB8D0W29TylaNIZpBfk6REtd/cVK4qqmhP7AbjqUN8Mub9rZ01v1t6JzsH3hvkZWJ0aBQkCftiDLHeAosUZiJwkWUUMcMVYLAXUT0ZGrmubfb+3w4/fLPh1YXvoRY5KpA660LfCXCRuREZ9VLW6Ysya3PC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759975340; c=relaxed/simple;
	bh=SCaF3VBkxXT9ELZ+E8OAXiT+v+Lm1z2IHUiUavtGkrQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=SvwqPAnQjRKuqPQzeNXWl4UqwIKErWhFQxYpdWbpk1kdkyKvM5bBcmescMJdvyctkvp8y0mp3j+CzbPoWAkd10mOFWuOD6eBHDHEu58ovbmgk7ehRV3IHTAC9zJXRYybuxnHtfSyEgDJexuHwxSzX49Z+QPNGZBReW5LJmv5u7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxRNCeF+doCh8UAA--.42546S3;
	Thu, 09 Oct 2025 10:02:07 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxfcGdF+doDvXVAA--.23635S3;
	Thu, 09 Oct 2025 10:02:06 +0800 (CST)
Subject: Re: [PATCH 1/7] LoongArch: BPF: Move sign_extend() upper
To: Hengqi Chen <hengqi.chen@gmail.com>, chenhuacai@kernel.org,
 vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev
References: <20251006053323.193581-1-hengqi.chen@gmail.com>
 <20251006053323.193581-2-hengqi.chen@gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <a06b3732-a341-907b-5b97-954ca31cc8a0@loongson.cn>
Date: Thu, 9 Oct 2025 10:02:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20251006053323.193581-2-hengqi.chen@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxfcGdF+doDvXVAA--.23635S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uFyfJw17JF4kZF4kJFWUAwc_yoW8AF18pr
	y3uFs3Crs2gasrJ347ta1Fgr4akFs7Wr42ga43C3y8JFW7Zry8Wr1rK39aqFWrA3yxZa1r
	WrZ09wn09FsrAacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UNvtZU
	UUUU=

On 2025/10/6 下午1:33, Hengqi Chen wrote:
> Move sign_extend() upper in bpf_jit.c so that it can be used
> in build_insn() without forward declaration. No functional
> change intended.
> 
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>   arch/loongarch/net/bpf_jit.c | 62 ++++++++++++++++++------------------
>   1 file changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 5a2fc56b1fe0..4e6ef93ab0d3 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -437,6 +437,37 @@ static bool is_signed_bpf_cond(u8 cond)
>   	       cond == BPF_JSGE || cond == BPF_JSLE;
>   }
>   
> +/*
> + * Sign-extend the register if necessary
> + */
> +static void sign_extend(struct jit_ctx *ctx, int rd, int rj, u8 size, bool sign)
> +{
> +	/* The ABI requires unsigned char/short to be zero-extended */
> +	if (!sign && (size == 1 || size == 2)) {
> +		if (rd != rj)
> +			move_reg(ctx, rd, rj);
> +		return;
> +	}
> +
> +	switch (size) {
> +	case 1:
> +		emit_insn(ctx, extwb, rd, rj);
> +		break;
> +	case 2:
> +		emit_insn(ctx, extwh, rd, rj);
> +		break;
> +	case 4:
> +		emit_insn(ctx, addiw, rd, rj, 0);
> +		break;
> +	case 8:
> +		if (rd != rj)
> +			move_reg(ctx, rd, rj);
> +		break;
> +	default:
> +		pr_warn("bpf_jit: invalid size %d for sign_extend\n", size);
> +	}
> +}

Is it better to move this function to arch/loongarch/net/bpf_jit.h?
Just put it next to emit_zext_32() and emit_sext_32() because they
are similar helper functions.

In my opinion, the function name is not proper because it contains not
only sign-extension but also zero-extension, maybe we can rename it to 
emit_extension(), then the patch #2 can be dropped.

Thanks,
Tiezhu

