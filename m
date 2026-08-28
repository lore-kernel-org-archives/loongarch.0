Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062B73C10A1
	for <loongarch@lists.linux.dev>; Fri, 28 Aug 2026 04:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892917; cv=none; b=LWGNrc2vybx6UYAfg5SqMrHN0fj/bsIuVizVJ04rBmEhFGujTI8Btxr2LMzRn0JnUxS8nyuHkQ4G6Ggp0F8kRTFfI3FtwpKSmsx7o7B2Zz9Kp1PEhb33TgTyOa/WDSVQlmG7asJD9xqndnh4Nt0EVV9djKlP1xBDJuEkmjSPkWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892917; c=relaxed/simple;
	bh=eF6OBhWfeTARX0S1RmtMMQxmH3vQMu2o3bia1PX5GKg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jUs9/+ONa6FbKgbxMPF46YbFh5eaBd2fZPKCVzDCgHLKTHsFPNEU8oxvXF7YEj2TsygXrOw5Vqyu/2fNW7YH1etjvkfxesaLai/xEH9XJfD2hNExVoMEjEPrNpoZV2DFLzFhTW7RGx7Oz5CeuPI0gBiZzVSHZX5fap05C3igysQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sPdPupMT; arc=none smtp.client-ip=74.125.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sPdPupMT"
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-49b90096ca2so665785e9.1
        for <loongarch@lists.linux.dev>; Thu, 27 Aug 2026 21:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787892912; x=1788497712; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PeEIgJD4CxeENCByZsmKy3/SXVGxa2uUNLnL9vishj4=;
        b=sPdPupMTMZT8D88S47jCOT1k/rb7da6kKVAU1wlzi+Lv27wrLrsJJ+d8BBDRi/enIy
         aZjNYsjaCiTyImeoDtpoASC53zJi6FCfB7jZjY0i8ApQsFTxbSyt9WAONkEnsfTf6OnG
         c56EM6f0uhHuDzcLnOIxeuE5Oi0pv0O9cDJ8j7YFXkNz0DQmdi/3pKQm0AN/2G1NMHyG
         7rKv/C95Y+etX3aJvL/D7uIqqBkU3eVSPxELXNQp0LpYra1lNziuAFoiFGJxSRS5WP1Z
         +oCuprjg0RG+7Y4gHR5tWWYqfFoOIGh7tIzkZd7U/auXFoWkQhalGpXaq/YUfulLUNmJ
         pa2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787892912; x=1788497712;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PeEIgJD4CxeENCByZsmKy3/SXVGxa2uUNLnL9vishj4=;
        b=V7t53AHlCxOaZz6krnijIxE24JuiiZEwvJ+vzpMIj55lP7em872wx2fdNu12oXHILC
         PG/375HxuuCYyh9GmELqqUJaVsyStiIZu9NkIKsxQ9dwRWHOJSsVJYhh3v+z2C7+KSDK
         9uNX3Cq2z3SwP2WpEqEE//T1r59QvUgPfQ6R1LYA5Y49UGLppEq+2/TfaxdfTxH7l5KH
         Jhr0ffDGrCVhT2eAXuO8SePRvfpZ7z3PjPOw9EQhIDV4fV+t4ajj2c0gQ7X2GlDbjrvi
         1IGarReVTJDdwRhXFG6l9dlgoHoj7Kwkjb6vA+UxRLhXTQ+Leo6QYfWpDM72jGLkkLZa
         ptQQ==
X-Forwarded-Encrypted: i=1; AHgh+RprLnAKaz/kY0SwijIIKnEBXSAfyv9NnE7FEjtX/WNdq4bb72of6HIF/EWK9ewa7v9wzLbddmWLqQ0=@lists.linux.dev
X-Gm-Message-State: AFuF++kWxdKlhM56JgXOks+DCPizCVWfvfPYMvwnf/bxMF+CGy3451px
	KEe2aPoLJyqVgvMhNIjGFG8H/CWn7cRwb7GjuuJJAbDqwMOCWtulGAn7
X-Gm-Gg: AR+sD12jMPp+u8zyF9h5vDCyK6yOC/u0bcVuCY/R7OguvqKSeTHwxfh0GVPUwnv87SI
	BXfZbG78mSPoxh0gIpmvjj87KEpyXtkD/xCy5xPSxNQ39SSy3be8qOzvseJO3vPQPPWkRRJK1qi
	AsvLMbu2bHY+CiLLrNJG05+7jhQi94hQT1n3XUqhuZXI2v0o7LPd2WmR35CE0zfuolBG8v96v8N
	QrKUWQ3BXQFL6q+1hp4AYiYrdRZ8MWEDnhRGMVAKABK6FV5yrJVm+T1vfyJCjYVQFnuY4pBbY99
	UypzhzPObS9C8hh0PpXuo2Gdj1Z1Yh479+Xm5P7oL5apbQZQmmTlz0mokd9Ewn5/4xGNxnX7tZc
	3P0HOKxvVrVnnojjgBTMhqjGm9Nw4dnlGJSX+XEB8RE/UDiy47hecolZQYKcloY5t5Fuh4ezBys
	nyav+6/AJj2GVgk7GcchlTkmnQsNaVvhG5AoJMHqW+QsiHXycKjDNqNPkE1eTtSW06b/XNThwTu
	KCx1NKvsTeHCQ6P/RWHMsLVYyrTB4U29l/Y9dNiuS8V0PtbF5xr/MoLz6UhGNPgn/0SZgeBgMMc
	NzRKAifBZn1dUKrg1rEKI9DW6z0=
X-Received: by 2002:a05:600c:3b1a:b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-49b91c2d8f3mr48930095e9.7.1787892911905;
        Thu, 27 Aug 2026 21:55:11 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm25202185e9.2.2026.08.27.21.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 21:55:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Aug 2026 06:55:10 +0200
Message-Id: <DL0B54EEQXAL.FL6Z0UXMR3SX@gmail.com>
Cc: "Huacai Chen" <chenhuacai@kernel.org>, "Alexei Starovoitov"
 <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Eduard Zingerman" <eddyz87@gmail.com>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, <kkd@meta.com>, <kernel-team@meta.com>,
 <loongarch@lists.linux.dev>, "Hengqi Chen" <hengqi.chen@gmail.com>
Subject: Re: [PATCH bpf-next v1 07/14] bpf, loongarch: Fix stack arguments
 for indirect trampolines
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Tiezhu Yang" <yangtiezhu@loongson.cn>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260821233516.3426127-1-memxor@gmail.com>
 <20260821233516.3426127-8-memxor@gmail.com>
 <a5d4c26c-6735-8af1-1d3f-fe7f1898b285@loongson.cn>
In-Reply-To: <a5d4c26c-6735-8af1-1d3f-fe7f1898b285@loongson.cn>

On Fri Aug 28, 2026 at 6:33 AM CEST, Tiezhu Yang wrote:
> Cc: loongarch@lists.linux.dev
> Cc: Hengqi Chen <hengqi.chen@gmail.com>
>
> On 2026/8/22 =E4=B8=8A=E5=8D=887:35, Kumar Kartikeya Dwivedi wrote:
>> LoongArch passes arguments beyond a0-a7 at the caller stack pointer. The
>> trampoline store_args() helper always reads those arguments at FP + 16,
>> which is correct for an fentry trampoline: its prologue leaves FP 16 byt=
es
>> below the stack pointer at trampoline entry after accounting for the sav=
ed
>> parent and traced-function frames.
>>
>> A struct_ops indirect trampoline is entered through a function pointer a=
nd
>> only saves its own RA and FP before setting FP to the entry stack pointe=
r.
>> Its stack arguments therefore start at FP, not FP + 16. As a result, eve=
ry
>> stack-passed struct_ops argument is currently read two slots late.
>>
>> Select the source offset based on whether the trampoline is indirect. Th=
is
>> also prepares the stack-passed arena argument path to consume the actual
>> pointer slot.
>>
>> Fixes: c9ebe2016de9 ("LoongArch: BPF: Support up to 12 function argument=
s for trampoline")
>> Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
>> Cc: Huacai Chen <chenhuacai@kernel.org>
>> Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>> ---
>>   arch/loongarch/net/bpf_jit.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
>> index 29c281bef28e..d193293a0fd2 100644
>> --- a/arch/loongarch/net/bpf_jit.c
>> +++ b/arch/loongarch/net/bpf_jit.c
>> @@ -1662,17 +1662,18 @@ int bpf_arch_text_invalidate(void *dst, size_t l=
en)
>>   	return ret;
>>   }
>>
>> -static void store_args(struct jit_ctx *ctx, int nr_arg_slots, int args_=
off)
>> +static void store_args(struct jit_ctx *ctx, int nr_arg_slots, int args_=
off, bool is_struct_ops)
>>   {
>> +	int stack_args_off =3D is_struct_ops ? 0 : 16;
>>   	int i;
>>
>>   	for (i =3D 0; i < nr_arg_slots; i++) {
>>   		if (i < LOONGARCH_MAX_REG_ARGS)
>>   			emit_insn(ctx, std, LOONGARCH_GPR_A0 + i, LOONGARCH_GPR_FP, -args_o=
ff);
>>   		else {
>> -			/* Skip slots for T0 and FP of traced function */
>> +			/* Skip the saved T0 and FP slots for a traced function. */
>>   			emit_insn(ctx, ldd, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP,
>> -				  16 + (i - LOONGARCH_MAX_REG_ARGS) * 8);
>> +				  stack_args_off + (i - LOONGARCH_MAX_REG_ARGS) * 8);
>>   			emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_GPR_FP, -args_off);
>>   		}
>>   		args_off -=3D 8;
>> @@ -1995,7 +1996,7 @@ static int __arch_prepare_bpf_trampoline(struct ji=
t_ctx *ctx, struct bpf_tramp_i
>>   	func_meta =3D nr_arg_slots;
>>   	emit_store_stack_imm64(ctx, LOONGARCH_GPR_T1, -func_meta_off, func_me=
ta);
>>
>> -	store_args(ctx, nr_arg_slots, args_off);
>> +	store_args(ctx, nr_arg_slots, args_off, is_struct_ops);
>>
>>   	if (bpf_fsession_cnt(tnodes)) {
>>   		/* clear all session cookies' value */
>
> According to the suggestion from bot+bpf-ci, adding the following
> comment before "int stack_args_off =3D is_struct_ops ? 0 : 16;" and
> removing the pre-existing comment inside the else branch would be
> much better:
>
> /*
>   * Regular fentry trampolines need to skip the 16-byte saved T0 and FP
>   * slots of the traced function. Indirect struct_ops trampolines place
>   * incoming stack arguments directly at FP.
>   */
>
> This clarifies both frame layouts without causing any ambiguity
> inside the loop.
>
> Other than that, the code looks good to me:
>
> Acked-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>
> By the way, I wrote a selftest for this patch:
>
>    selftests/bpf: Add test for indirect struct_ops trampoline
>
> https://lore.kernel.org/bpf/20260828042715.16546-1-yangtiezhu@loongson.cn=
/
>
> Without this patch:
>
>    $ sudo ./test_progs -t struct_ops_trampoline
>    ...
>    run_struct_ops_trampoline:FAIL:check_stack_passed_arg9 unexpected
> check_stack_passed_arg9: actual 69570864 !=3D expected 9999
>    #471     struct_ops_trampoline:FAIL
>    Summary: 0/0 PASSED, 0 SKIPPED, 1 FAILED
>
> With this patch:
>
>    $ sudo ./test_progs -t struct_ops_trampoline
>    #471     struct_ops_trampoline:OK
>    Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED
>
> Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Thanks a lot for the test. Please also take a look at the argument rebase
patches once you folks have more cycles. Will definitely need your help and
reviews since they are mostly vibe coded.

>
> Thanks,
> Tiezhu

