Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3288D2AE77
	for <loongarch@lists.linux.dev>; Mon,  1 Sep 2025 04:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756699878; cv=none; b=odYGAl7V7rsqADWuCTGf+vY8rlAtOfs0AIsJYEYulvAiVWRSpDo7DMp6+QHLwLVh41P21WaMd7RZp69X+AndpDX66SDS5vxsglo7Kv1VZZyleI49OyPIljVIc+UoV+l9Hew1whW6PBzWYK+z9dIBNZ8KPSo8WL6tjb8dnfpu4ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756699878; c=relaxed/simple;
	bh=mwSSz6t1KNZDyyuS8ESTfh4vvpfEMcKun6PbJh1S4Wc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T+0TgvJRcNxyhMdeiXwPEeydplsKytCk31yAU9ZTu2R7DVqwu+LOW6fzrRJt4Y5XaxM0kR9WkwxSgYLbcZccOggueAnsVqn2ZTYHRBKolnFP5trMiHJQy12VWracDJ6HFL2qZNUB5x3qaMwaQ1Db14MbmdMSou7vJMiCDr7ffI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GCLGBYpW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GCLGBYpW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0783BC4CEF8
	for <loongarch@lists.linux.dev>; Mon,  1 Sep 2025 04:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756699878;
	bh=mwSSz6t1KNZDyyuS8ESTfh4vvpfEMcKun6PbJh1S4Wc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GCLGBYpWbxQ4pA/HQWbC2eFUrlQD4yBGg7EUkkDx+ZJ3AUNxob7BOVG1i2blR9hFl
	 3jt4Mc25X7A58NmxLMDRqH2mT3frafr/1D2SDYxZQnqrZXKW3BJZ3MJ0/FzF5yIzpc
	 HwVmKaLFc14U3pGgBKBgJRIEH3gms39P2HMFxcEZv2OalejtWwoa5FxZ8tZG8vuv9z
	 MOv5TJ9pJQLTHaQCVwDc+NKNTVHsEojVCOnDXP5+xaLvABqNjhLkNy3a7q5sA6hK5D
	 hN64NlTUWYtu2H3brdJ3zi7DFIOTe/Cwm+S2q5wiyIYL6p92CEvne9gY3RhPKWQPNf
	 LoB+CbvxvMKSQ==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61cebce2f78so6834874a12.1
        for <loongarch@lists.linux.dev>; Sun, 31 Aug 2025 21:11:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXtdDcbesJC4myggyVeMhYTzrUDwS6kAYlZBE7cEwbNIGF1geCrYwYBeGZuB8LdpOwi3wxmDPzUlHw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxG26j+szsheeM1eEnTRtgWc2L4rysEqMKS8DdOYOvB57b09YbT
	x+4XssQo1Y/tCc2qYJTnASlaM4IpS6Ef7SUpUxj5pauWKygcZ1BmL/f9rNLoKfdsM5/aRw1lHgP
	2f4EVbFAYswHESxPSNGlrHl6mZmfZdV0=
X-Google-Smtp-Source: AGHT+IEdhU/bG9hcKR3ZrPzxC8S750C4P7YIbCwtkQtABRzwagwjVOZboO3LiTpECr0mtOGFYwgZ/kMQTJBNQc5XvOg=
X-Received: by 2002:a05:6402:3812:b0:61a:1702:792a with SMTP id
 4fb4d7f45d1cf-61d269a6fb3mr5921149a12.9.1756699876614; Sun, 31 Aug 2025
 21:11:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250831234328.22440-1-hengqi.chen@gmail.com> <20250831234328.22440-3-hengqi.chen@gmail.com>
 <ee579b48-e6d1-22ba-c1b9-f6088c269664@loongson.cn>
In-Reply-To: <ee579b48-e6d1-22ba-c1b9-f6088c269664@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 1 Sep 2025 12:11:04 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5nG4RaOY+n327+4kdhhOLyNOOaoNcRiuRKSUcO7=nAvg@mail.gmail.com>
X-Gm-Features: Ac12FXy2lSAlNzoEv32wW9H7IXj9Hxgfg-GTLNLSYVEMSJ_nQxSCMGKLkFYxii0
Message-ID: <CAAhV-H5nG4RaOY+n327+4kdhhOLyNOOaoNcRiuRKSUcO7=nAvg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] LoongArch: BPF: Sign extend struct ops return
 values properly
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Hengqi Chen <hengqi.chen@gmail.com>, vincent.mc.li@gmail.com, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 11:08=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2025/9/1 =E4=B8=8A=E5=8D=887:43, Hengqi Chen wrote:
> > The ns_bpf_qdisc selftest triggers a kernel panic:
>
> ...
>
> > So let's sign extend struct ops return values according to
> > the return value spec in function model.
>
> ...
>
> >   static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struct =
bpf_tramp_image *im,
> >                                        const struct btf_func_model *m, =
struct bpf_tramp_links *tlinks,
> >                                        void *func_addr, u32 flags)
> > @@ -1654,6 +1677,8 @@ static int __arch_prepare_bpf_trampoline(struct j=
it_ctx *ctx, struct bpf_tramp_i
> >       if (save_ret) {
> >               emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP, -=
retval_off);
>
> If is_struct_ops is true, this operation is not necessary, because
> LOONGARCH_GPR_A0 will be overwrote in the later code ...
> >               emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_GPR_FP, =
-(retval_off - 8));
> > +             if (is_struct_ops)
> > +                     sign_extend(ctx, LOONGARCH_GPR_A0, regmap[BPF_REG=
_0], m->ret_size);
>
> ... in here, so it is better to write the code like this:
>
> if (is_struct_ops) {
> ...
> } else {
> ...
> }
>
> Maybe Huacai can adjust the code when applying.
No hurry, I will wait your series (and there is another patch from
Jiang Haoran, too), then apply together.

Huacai

>
> Thanks,
> Tiezhu
>
