Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76F2C13774D
	for <loongarch@lists.linux.dev>; Thu,  9 Oct 2025 02:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759975795; cv=none; b=PQWhiDAR7qwf3VLJEg7EnnOPugdACuzanHJhSkIkUDp2fGIhtkqGqSHPgxY2rfZh9lUu9nWf5DNCbVQ61qWxLnBHFSgRhfRRI/yFDge3JNHWJsAx4Hmxr9gZB21N/7wBqj0wmMYt8l8wVDa+naN2ZDEz0CUIKGw1LkXavSomCpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759975795; c=relaxed/simple;
	bh=4zjm/rckoOz+34yiLEDrL3LGs3RbjDiar7TOMsAxO+8=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Qzhe819Wpwa7RvspO7SB+DGgOMELmX+ojLZaVM8yb84PRKW1JwV9nACxYn6i3NpLbsxgJM3SIpAB+m86+ji8kHuUKfR2sunx0iWUIdTD1sagh3Z7ihkIyKla0CvsJgC+SnQrMymLOD/H5SyWjzZI0H4hJ77pzFRzvXY0Lv0bUPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cxbb9sGedooB8UAA--.41983S3;
	Thu, 09 Oct 2025 10:09:48 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxE+RrGedoRffVAA--.14170S3;
	Thu, 09 Oct 2025 10:09:48 +0800 (CST)
Subject: Re: [PATCH 3/7] LoongArch: BPF: Sign extend kfunc call arguments
To: Hengqi Chen <hengqi.chen@gmail.com>, chenhuacai@kernel.org,
 vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev
References: <20251006053323.193581-1-hengqi.chen@gmail.com>
 <20251006053323.193581-4-hengqi.chen@gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <5dceffaa-1a86-b4f7-c7c0-07e08d43dcd7@loongson.cn>
Date: Thu, 9 Oct 2025 10:09:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20251006053323.193581-4-hengqi.chen@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxE+RrGedoRffVAA--.14170S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7urWrCw45JFW3Aw1rCr1xZwc_yoW8Ww4xpr
	sxCFn8CF4kGryIqFn3tF47WryrArn3GrW3W3W2yrW0k3sxZFyrXw4rKw13XFW5tw4rGay8
	urn0k3WFyF1q9acCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UMpBfU
	UUUU=

On 2025/10/6 下午1:33, Hengqi Chen wrote:
> The kfunc calls are native calls so they should follow
> LoongArch calling conventions. Sign extend its arguments
> properly to avoid kernel panic.
> 
> Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>   arch/loongarch/net/bpf_jit.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 579957b4d40a..83e623ce2908 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -983,6 +983,22 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
>   			emit_insn(ctx, ldd, REG_TCC, LOONGARCH_GPR_SP, tcc_ptr_off);
>   		}
>   
> +		if (insn->src_reg == BPF_PSEUDO_KFUNC_CALL) {
> +			const struct btf_func_model *fm;
> +			int idx;
> +
> +			fm = bpf_jit_find_kfunc_model(ctx->prog, insn);
> +			if (!fm)
> +				return -EINVAL;
> +
> +			for (idx = 0; idx < fm->nr_args; idx++) {
> +				u8 reg = regmap[BPF_REG_1 + idx];
> +
> +				sign_extend(ctx, reg, reg, fm->arg_size[idx],
> +					    fm->arg_flags[idx] & BTF_FMODEL_SIGNED_ARG);
> +			}
> +		}
> +
>   		move_addr(ctx, t1, func_addr);
>   		emit_insn(ctx, jirl, LOONGARCH_GPR_RA, t1, 0);

Without this patch, there are some failed test cases?
With this patch, the failed test cases can pass?

If so, please add the related test cases in the commit
message, then we can test this single patch with the
corresponding test cases and the git log can show what
problem this patch solves clearly.

Please add the related test cases in the commit message
for the patch #4 - #7 too.

Thanks,
Tiezhu

