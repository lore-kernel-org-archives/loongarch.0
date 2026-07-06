Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937BC3033D8
	for <loongarch@lists.linux.dev>; Mon,  6 Jul 2026 10:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783335539; cv=none; b=ejEQR9tAm1YkpAcCzMG6X/FPt6Lb9DfplZKC3N4PobDrFuPlfJ2OsO/CZ9f6f5FVE3S5hc+vwbzLD4ix/pKQTMhvRqaGijKjx+NmMP6DRu+3gDrpP5o2KHVRX/PD8vIht4tA65vkt8wkgJuuytnRadjfAWPxxSJ0wxQsKfskAT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783335539; c=relaxed/simple;
	bh=kD718AJ0Vt1XW7Dk6G41mWM+4GH5v6EBolZZmqzfP3I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JMI1/7erV5ovPJ6+/gt6CcY8ZyZRVDmzRXfmZqynxLb5y363EpsjC4YiAGeKs+d6g9Zru2mwpRrjnqM5ho2WVey21y28+pHcUVlCYzsnFBFZcoN1PvkJgSmTnaDwbwT47NSVER6SYW12fB/v0/OiWcyxHQmGZLwm8bsCd0I2+Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TTNcY8mA; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TTNcY8mA"
Message-ID: <933ffdbb474dfc38609a312a577877f69b3f1182.camel@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783335535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Aua22e9tavP6CuyD9vc6zlnuKfLM7skc8MFemPXO70=;
	b=TTNcY8mAiVnlezpdKefUZpGJXAZXUQP5fsg6O3bYApSYdxfe2RpwT2nTY43LtKbhkw/B2j
	/bfbGkYbliunoLeMGrr5xoH/F/Y7t2EoVWzH6VkY15VH14GfZr7GELwWZgIJ68rMwM3aqA
	naf3fY1ERoHs++qT+5TEV07fpef/91s=
Subject: Re: [PATCH bpf-next v7 1/2] bpf: Introduce jit_required flag and
 refactor kfunc path
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: KaFai Wan <kafai.wan@linux.dev>
To: Leon Hwang <leon.hwang@linux.dev>, Tiezhu Yang <yangtiezhu@loongson.cn>,
  Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard
 Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil
 Tsalapatis <emil@etsalapatis.com>
Cc: bpf@vger.kernel.org, loongarch@lists.linux.dev, Puranjay Mohan
	 <puranjay@kernel.org>, =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Date: Mon, 06 Jul 2026 18:58:44 +0800
In-Reply-To: <746b428a-a81f-4b8e-a767-109965959170@linux.dev>
References: <20260702143656.28845-1-yangtiezhu@loongson.cn>
	 <20260702143656.28845-2-yangtiezhu@loongson.cn>
	 <ba5679e744e0209ca10788c2c385c6727eddb8a5.camel@linux.dev>
	 <2d1babdf-a4d9-9902-77b0-3f5640871323@loongson.cn>
	 <2240908fb833182e502d1804b392874cccf17b6c.camel@linux.dev>
	 <aa26b3fc-9717-4273-dd76-a0dd6b15ff61@loongson.cn>
	 <746b428a-a81f-4b8e-a767-109965959170@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT

On Mon, 2026-07-06 at 11:59 +0800, Leon Hwang wrote:
> On 6/7/26 08:56, Tiezhu Yang wrote:
> > On 2026/7/4 =E4=B8=8A=E5=8D=889:57, KaFai Wan wrote:
> > > On Sat, 2026-07-04 at 00:14 +0800, Tiezhu Yang wrote:
> > > > On 7/3/26 21:55, KaFai Wan wrote:
> > > > > On Thu, 2026-07-02 at 22:36 +0800, Tiezhu Yang wrote:
> >=20
> > ...
> >=20
> > > >=20
> > > > IIUC, there are two places to modify so far:
> > > > (1) struct bpf_prog
> > >=20
> > > yes
> > >=20
> > > > (2) bpf_prog_has_kfunc_call()
> > >=20
> > > I think we can remove this func.
> > >=20
> > > actually, I feed your patch to dsv4-pro and gpt-5.4 yesterday, both
> > > point out the we should do this
> > > and change the log message.
> > >=20
> > > diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
> > > index 12a8a4eb757f..7fb92b5fa415 100644
> > > --- a/kernel/bpf/fixups.c
> > > +++ b/kernel/bpf/fixups.c
> > > @@ -1378,7 +1378,6 @@ int bpf_fixup_call_args(struct bpf_verifier_env
> > > *env)
> > > =C2=A0 #ifndef CONFIG_BPF_JIT_ALWAYS_ON
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct bpf_prog *prog =3D env->prog;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct bpf_insn *insn =3D prog->insnsi=
;
> > > -=C2=A0=C2=A0=C2=A0 bool has_kfunc_call =3D bpf_prog_has_kfunc_call(p=
rog);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int depth;
> > > =C2=A0 #endif
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int i, err =3D 0;
> > > @@ -1404,7 +1403,7 @@ int bpf_fixup_call_args(struct bpf_verifier_env
> > > *env)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return err;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0 #ifndef CONFIG_BPF_JIT_ALWAYS_ON
> > > -=C2=A0=C2=A0=C2=A0 if (has_kfunc_call) {
> > > +=C2=A0=C2=A0=C2=A0 if (prog->jit_required) {
>=20
>=20
> Agreed with this change.
>=20
> Then, think it harder, pls.
>=20
> Can we clean some code of __bpf_prog_select_runtime() btw?
>=20
> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> index 649cce41e13f..bad55e119cb5 100644
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c
> @@ -120,6 +120,9 @@ struct bpf_prog *bpf_prog_alloc_no_stats(unsigned
> int size, gfp_t gfp_extra_flag
> =C2=A0		return NULL;
> =C2=A0	}
>=20
> +#ifdef CONFIG_BPF_JIT_ALWAYS_ON
> +	fp->jit_required =3D true;
> +#endif

Don't need #ifdef, fp->jit_required =3D IS_ENABLED(CONFIG_BPF_JIT_ALWAYS_ON=
) is fine. :)

> =C2=A0	fp->pages =3D size / PAGE_SIZE;
> =C2=A0	fp->aux =3D aux;
> =C2=A0	fp->aux->main_prog_aux =3D aux;
> @@ -2614,15 +2617,11 @@ struct bpf_prog
> *__bpf_prog_select_runtime(struct bpf_verifier_env *env, struct
> =C2=A0	/* In case of BPF to BPF calls, verifier did all the prep
> =C2=A0	 * work with regards to JITing, etc.
> =C2=A0	 */
> -	bool jit_needed =3D false;
> +	bool jit_needed =3D fp->jit_required;
>=20
> =C2=A0	if (fp->bpf_func)
> =C2=A0		goto finalize;
>=20
> -	if (IS_ENABLED(CONFIG_BPF_JIT_ALWAYS_ON) ||
> -	=C2=A0=C2=A0=C2=A0 bpf_prog_has_kfunc_call(fp))
> -		jit_needed =3D true;
> -
> =C2=A0	if (!bpf_prog_select_interpreter(fp))
> =C2=A0		jit_needed =3D true;
>=20
> WDYT?
>=20
> Thanks,
> Leon
>=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 verbose(env, "=
calling kernel functions are not allowed in
> > > non-JITed programs\n");
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL=
;
> > > [...]

--=20
Thanks,
KaFai
