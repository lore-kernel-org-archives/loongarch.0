Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFAF61BC58
	for <loongarch@lists.linux.dev>; Mon,  1 Sep 2025 06:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756708789; cv=none; b=S9kw/M2mcLvY5eh1gSJ0O7dJulB9RSzkmn99q97pbG5Hj5biXtYElWk+7FmW+07PJX8VD0iZy8pOqHjc/ihULgKTrV9jk9XTHZR/osEGWSavGn2PTKZWgyHigQxOxrmKXwhSoR8aGYfH6OGqp7h/aoBBNSqR7ZdrUbjKga2EO7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756708789; c=relaxed/simple;
	bh=ep7CxjoR4Vdlkh6+FrQg4TsVKtFCH5KzD2KlzbTBQWM=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=pyrBrho11Bn+BcKDn0fhApLv+4UXESQ6RhsiMUmONZX5m0NSkerZk3Qn5ob6xk02uJFrmQy4we+swax7HkB85jas34vhOe2U8o066JOoSffbGrHGK6kE+Id9pYEEDxXPMUfpVzbMvrnkVEyr7hjQt2TPtiP31YFj1j3Q3Vn/aMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dx_tKqP7VofkEFAA--.10795S3;
	Mon, 01 Sep 2025 14:39:38 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxH8KoP7VoSmJ2AA--.55750S3;
	Mon, 01 Sep 2025 14:39:36 +0800 (CST)
Subject: Re: [PATCH v3 2/3] LoongArch: BPF: Sign extend struct ops return
 values properly
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Hengqi Chen <hengqi.chen@gmail.com>, vincent.mc.li@gmail.com,
 loongarch@lists.linux.dev
References: <20250831234328.22440-1-hengqi.chen@gmail.com>
 <20250831234328.22440-3-hengqi.chen@gmail.com>
 <ee579b48-e6d1-22ba-c1b9-f6088c269664@loongson.cn>
 <CAAhV-H5nG4RaOY+n327+4kdhhOLyNOOaoNcRiuRKSUcO7=nAvg@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <1eca1b7b-14db-bcfa-184a-2668a408d7da@loongson.cn>
Date: Mon, 1 Sep 2025 14:39:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5nG4RaOY+n327+4kdhhOLyNOOaoNcRiuRKSUcO7=nAvg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxH8KoP7VoSmJ2AA--.55750S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZFWfZrWrXF1DXFWxZF43urX_yoW8Aw18pF
	W8Aa1YkF48GF4jgan2qw40vFyak39xtryUGr95trZ0939xXryrJF40qr4YkFWYvF1YkF1I
	yanYvryvvF17JagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UE-erU
	UUUU=

Hi Hengqi,

On 2025/9/1 下午12:11, Huacai Chen wrote:
> On Mon, Sep 1, 2025 at 11:08 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> On 2025/9/1 上午7:43, Hengqi Chen wrote:
>>> The ns_bpf_qdisc selftest triggers a kernel panic:
>>
>> ...
>>
>>> So let's sign extend struct ops return values according to
>>> the return value spec in function model.
>>
>> ...
>>
>>>    static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
>>>                                         const struct btf_func_model *m, struct bpf_tramp_links *tlinks,
>>>                                         void *func_addr, u32 flags)
>>> @@ -1654,6 +1677,8 @@ static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct bpf_tramp_i
>>>        if (save_ret) {
>>>                emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -retval_off);
>>
>> If is_struct_ops is true, this operation is not necessary, because
>> LOONGARCH_GPR_A0 will be overwrote in the later code ...
>>>                emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_GPR_FP, -(retval_off - 8));
>>> +             if (is_struct_ops)
>>> +                     sign_extend(ctx, LOONGARCH_GPR_A0, regmap[BPF_REG_0], m->ret_size);
>>
>> ... in here, so it is better to write the code like this:
>>
>> if (is_struct_ops) {
>> ...
>> } else {
>> ...
>> }
>>
>> Maybe Huacai can adjust the code when applying.
> No hurry, I will wait your series (and there is another patch from
> Jiang Haoran, too), then apply together.

If there is a new version for this patch, please consider removing
duplicated "stack_size = 0;" in __arch_prepare_bpf_trampoline() in
patch #1 while you are at it, probably not worth sending a single
patch just for that.

Here is the previous comment for v1:

https://lore.kernel.org/loongarch/800cfa7a-ecaf-94bc-a44f-3ee83acc9d3a@loongson.cn/

Thanks,
Tiezhu

