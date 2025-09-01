Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E188E1482F2
	for <loongarch@lists.linux.dev>; Mon,  1 Sep 2025 03:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756696129; cv=none; b=tp0AlTcokpqhGRar/YZxSrgRoz2luMvWxWg2EJaMAoUb0BraS26nLI4T7fD/RYnvORCNBuQ7lXwkD/YLcROuRrbWtj0bqpTRRovP8xvwnbrHmQXfxEVlt8IwSqF/ZikIGTBlD4AIoVTWYrWx9T52DvhdCQzA1gcLmEpHx4Wv2tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756696129; c=relaxed/simple;
	bh=512Yw/HnELQYWi6VxT1FeWLO2eAuVR2mCZ5r0TNPMAQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=CunzIRyeEDktVdoY3sfz5RI1jmfB6uyTSjQkKkY/eZ4rK74dU3AJ3bzKvwTpEiKZ+1ySdTFiVCRy5Jv21GyLTMShbqwEJyPj25lqXaOCCDX1d2EyxxaHB0slcsjWsM8nlUkk8VgHgonZaFn1UAufLUgDVnVTGW2aCqglBxNu9UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cxf9MvDrVoLjUFAA--.10530S3;
	Mon, 01 Sep 2025 11:08:31 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxZOQsDrVomBN2AA--.41729S3;
	Mon, 01 Sep 2025 11:08:29 +0800 (CST)
Subject: Re: [PATCH v3 2/3] LoongArch: BPF: Sign extend struct ops return
 values properly
To: Hengqi Chen <hengqi.chen@gmail.com>, chenhuacai@kernel.org,
 vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev
References: <20250831234328.22440-1-hengqi.chen@gmail.com>
 <20250831234328.22440-3-hengqi.chen@gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <ee579b48-e6d1-22ba-c1b9-f6088c269664@loongson.cn>
Date: Mon, 1 Sep 2025 11:08:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250831234328.22440-3-hengqi.chen@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxZOQsDrVomBN2AA--.41729S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKw1UZr1UXF4fJw18Aw4DZFc_yoWkGrc_Ar
	n3KryxCr409rnY9w45KwnrZFZ3C3y5Wr10q390g3sIga45Xry5Cr4DXr92qr9rZ3srtF47
	C3sIqwsFyF1j9osvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70Pf
	DUUUU

On 2025/9/1 上午7:43, Hengqi Chen wrote:
> The ns_bpf_qdisc selftest triggers a kernel panic:

...

> So let's sign extend struct ops return values according to
> the return value spec in function model.

...

>   static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
>   					 const struct btf_func_model *m, struct bpf_tramp_links *tlinks,
>   					 void *func_addr, u32 flags)
> @@ -1654,6 +1677,8 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
>   	if (save_ret) {
>   		emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -retval_off);

If is_struct_ops is true, this operation is not necessary, because
LOONGARCH_GPR_A0 will be overwrote in the later code ...
>   		emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_GPR_FP, -(retval_off - 8));
> +		if (is_struct_ops)
> +			sign_extend(ctx, LOONGARCH_GPR_A0, regmap[BPF_REG_0], m->ret_size);

... in here, so it is better to write the code like this:

if (is_struct_ops) {
...
} else {
...
}

Maybe Huacai can adjust the code when applying.

Thanks,
Tiezhu

