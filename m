Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9D12AE68
	for <loongarch@lists.linux.dev>; Thu,  4 Sep 2025 02:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952349; cv=none; b=bDxIS44PAIeVIU49CtYIs9CFWrU+W/RoH5d4myWtnE1EzfVG93NMJx14WcvI0Q39qjBDCVJPRnrG0IpkjOvsDE/YyrGOZhtZUxO5T6BoK9uofmIDNqV3pVJGy9cq6meiBqc2DC5t5O8Tgs1rlLIlXoz+nVCt2IA9ZwobOCP+YeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952349; c=relaxed/simple;
	bh=Inj8aMnTcS/QnQITJFcfx8iv2rdiiR+5aFoRy02omSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=our104AoVeevT2PllD5eMAVWNoVz/ZJO2E3OK8+RNes8HLI8TrLe4ZhY3qzAY1fiCrZr908BODSOlRaTkJsLSXjHGISERoeut8FcsaMB8Ii7q4zWjIPXQhfIzX5+VF5zc/jtIfg2UAUcytVtAy8CQuX8NmAwzDaIQlwWfh1LXY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzVyjsyX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzVyjsyX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28515C4CEF7
	for <loongarch@lists.linux.dev>; Thu,  4 Sep 2025 02:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756952349;
	bh=Inj8aMnTcS/QnQITJFcfx8iv2rdiiR+5aFoRy02omSQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KzVyjsyXp+raMepq42Jn0Z6ra/ttib3SMfPOvD6tVExDWy1j/etzzy018d54Jww8R
	 pDDZtuAqbxswkm9s5m8hmJwrmDiS1VbMZr7O0LKMb0LxvLxuq9unNHjWH5BZDSRAT/
	 6sKJaHSHFR+icmMCIxKlfB498o8O3VBWhIRlRTQTeLDEQHNRpTTdo+YVm/QIz4MCYL
	 YbeE2OfCgtK4gUc3Qy9Byb3MsNRx6a0+I0lKtxlhS63lREMDoREozk2xxjQjreoRzM
	 zIutoEouuXUSS4qTFYCzrEDxqkLvSnVQthQt+i0diUGhPnrHjwT4GJHioRa1FT4UD3
	 T3bIx1JcMOWeA==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b045d56e181so74165866b.2
        for <loongarch@lists.linux.dev>; Wed, 03 Sep 2025 19:19:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWlnkSuoWSz+3UcetHU1nlGm/Wn9EeklZi4DieUEnewtPDhvj09fhCfrORiTCV7w3u+PnetPqwcIvI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzpghXbG/1iZRhdtN5w1BHQMmNFuDN120GFTPsvrwwNZwij5DDc
	X8AXEh6UMbplD7hbUZUMQSCrwsG9d338/JUjOgcNT6M4dmd8fOL42sfEEGKLO8GaC3w5ULstG/g
	/COuqsv0gY3nkvlF4eTS8g5l1TD+EqbI=
X-Google-Smtp-Source: AGHT+IHNHcs/jrOL2KMQSUMsE6X65x+5FphNvM52opWCcpp6PjqVfImnn/cKteJOlHeUGv9TYCkUVK9DNwheXYr3rGQ=
X-Received: by 2002:a17:907:7e82:b0:aeb:3df1:2e75 with SMTP id
 a640c23a62f3a-b01d975d12cmr1576596366b.46.1756952347729; Wed, 03 Sep 2025
 19:19:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250831234328.22440-1-hengqi.chen@gmail.com> <20250831234328.22440-3-hengqi.chen@gmail.com>
 <ee579b48-e6d1-22ba-c1b9-f6088c269664@loongson.cn> <CAAhV-H5nG4RaOY+n327+4kdhhOLyNOOaoNcRiuRKSUcO7=nAvg@mail.gmail.com>
 <CAEyhmHTDr8sejaaBUbyAK1Op2HKEzSjp8Rkg9TaU207r-QfQnQ@mail.gmail.com>
 <CAAhV-H7Eb4VTbe5ZCEB0S7tObs4xdbN8jJLa0PurjYd3bjguiA@mail.gmail.com> <CAEyhmHTCtjU31hwZ9OhAj1E5eFv9+efPppdD1LTFYy1XgmxU6Q@mail.gmail.com>
In-Reply-To: <CAEyhmHTCtjU31hwZ9OhAj1E5eFv9+efPppdD1LTFYy1XgmxU6Q@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 4 Sep 2025 10:18:55 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7cVSgV+jpKoOMsN__FtPGYrdbnBoMgCONAYU9x8ucLzw@mail.gmail.com>
X-Gm-Features: Ac12FXxsFgjcoRejfSFSV9I1l6E0IGzUPMJP24pDscwtxyjspiGGCKSlPatx-oY
Message-ID: <CAAhV-H7cVSgV+jpKoOMsN__FtPGYrdbnBoMgCONAYU9x8ucLzw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] LoongArch: BPF: Sign extend struct ops return
 values properly
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, vincent.mc.li@gmail.com, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 10:15=E2=80=AFAM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> On Thu, Sep 4, 2025 at 10:04=E2=80=AFAM Huacai Chen <chenhuacai@kernel.or=
g> wrote:
> >
> > On Thu, Sep 4, 2025 at 9:57=E2=80=AFAM Hengqi Chen <hengqi.chen@gmail.c=
om> wrote:
> > >
> > > On Mon, Sep 1, 2025 at 12:11=E2=80=AFPM Huacai Chen <chenhuacai@kerne=
l.org> wrote:
> > > >
> > > > On Mon, Sep 1, 2025 at 11:08=E2=80=AFAM Tiezhu Yang <yangtiezhu@loo=
ngson.cn> wrote:
> > > > >
> > > > > On 2025/9/1 =E4=B8=8A=E5=8D=887:43, Hengqi Chen wrote:
> > > > > > The ns_bpf_qdisc selftest triggers a kernel panic:
> > > > >
> > > > > ...
> > > > >
> > > > > > So let's sign extend struct ops return values according to
> > > > > > the return value spec in function model.
> > > > >
> > > > > ...
> > > > >
> > > > > >   static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx,=
 struct bpf_tramp_image *im,
> > > > > >                                        const struct btf_func_mo=
del *m, struct bpf_tramp_links *tlinks,
> > > > > >                                        void *func_addr, u32 fla=
gs)
> > > > > > @@ -1654,6 +1677,8 @@ static int __arch_prepare_bpf_trampoline(=
struct jit_ctx *ctx, struct bpf_tramp_i
> > > > > >       if (save_ret) {
> > > > > >               emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_G=
PR_FP, -retval_off);
> > > > >
> > > > > If is_struct_ops is true, this operation is not necessary, becaus=
e
> > > > > LOONGARCH_GPR_A0 will be overwrote in the later code ...
> > > > > >               emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_=
GPR_FP, -(retval_off - 8));
> > > > > > +             if (is_struct_ops)
> > > > > > +                     sign_extend(ctx, LOONGARCH_GPR_A0, regmap=
[BPF_REG_0], m->ret_size);
> > > > >
> > > > > ... in here, so it is better to write the code like this:
> > > > >
> > > > > if (is_struct_ops) {
> > > > > ...
> > > > > } else {
> > > > > ...
> > > > > }
> > > > >
> > > > > Maybe Huacai can adjust the code when applying.
> > > > No hurry, I will wait your series (and there is another patch from
> > > > Jiang Haoran, too), then apply together.
> > > >
> > >
> > > Do you mean https://lore.kernel.org/loongarch/20250815082931.875216-1=
-jianghaoran@kylinos.cn/
> > > ?
> > Yes, is it replaced by your or  Tiezhu's patch?
> >
>
> The code is not sane (It tries to guess return values of random bpf
> progs), so the patch should not go in.
I know, but the problem exists. So I hope there will be an updated version.

Huacai

>
> > Huacai
> >
> > >
> > > > Huacai
> > > >
> > > > >
> > > > > Thanks,
> > > > > Tiezhu
> > > > >
