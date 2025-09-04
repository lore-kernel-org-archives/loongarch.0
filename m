Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D122566
	for <loongarch@lists.linux.dev>; Thu,  4 Sep 2025 02:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756951462; cv=none; b=Oezveg/Km7MUL2uhgSBZANE0x3WW8KQOE6xQMUHhapbktAO9HfiT71TyRvswYLOFf6VB3+7N1+dh0c5T1dhjo3zd6QAVPaSGybev7IlXN6mo5RtX6fXw1eyryPX4Groc6g487YoEND0Jn/WtAVGiX9krld1ahY/mk7xeo7JmmCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756951462; c=relaxed/simple;
	bh=tAN+n6NRF+VdyIMMzczLPQc3mCuJM0jBaDMSlqEHY74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wr5Y4Eno4TUbAh+Ag75Rf4WPaYKjQSmGEM3eEy3oq2n2WfcM+VUe1Fn0iPy1i1ozv9f2x7PMXcOcKK3xfaV0Flda5I6AFHjXsTIVPXVGsGVFz4Z+eCc3jSjV4+O3bx3nnyGSYMeMzGvr7simprsHHsq/1nTs3mhKc+S8GASsqds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oh2PGxxs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oh2PGxxs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618A6C4CEF0
	for <loongarch@lists.linux.dev>; Thu,  4 Sep 2025 02:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756951460;
	bh=tAN+n6NRF+VdyIMMzczLPQc3mCuJM0jBaDMSlqEHY74=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Oh2PGxxs918AADL/l9a4wy9GOiRhIJ+AxcjUpb3tL7qeYnTWD04QgTVY6Xc+vHJUK
	 s0nesS8sbCU5BkwRmrmOW8fKIAbP/qvl9X04OvECB2nNcrSrBvLDVi5SlOG8SRhD1X
	 oOJmG5sIVv5iDF5eGNFqKuIZlyMdTrfU/iTryUwxiD7zDjgRS7qq2tIkmC4VIjhex0
	 3i+3ZSIESweXBQpcRPS8OJCuVbygij8tcbocltW6CiWYc9q9vzIFabdPeXT/BdxmRw
	 zWAViBrcbguSUYZkRdhwOZ8ItVNfAP+zruge2qah+SDRlYRiA94IJHSl8SoLbukArN
	 9aWIilP03dfGg==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb7a16441so72127266b.2
        for <loongarch@lists.linux.dev>; Wed, 03 Sep 2025 19:04:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXE95J7wWG6t91SDVw0qMGp33X9/JJkwsQnfCgnWueCBmu530LXdPf726ccm0yz4bojpy+4u49Qga4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5xuUZJQP8HZC6kRYl4l6145sAPohVpBRqAJhg97DEdRVXnaAc
	pqjZ8pWy8DnQK7W9FNNDRpEZJKNfzhLeLFd1dJvkrENwWmRIUn+0IsSxG0I0ke965Up+2cUDraQ
	UQIlHbDOWSqz1qPHL3Ur8k2Ulft5f0FU=
X-Google-Smtp-Source: AGHT+IH/e/+HfDe9Dq7YWc9vOmbAn2XvqneaqBRfV2RSvEaUH/DtRZps9QAwci/q5reZy2qtHzDqKKLv/Zgh2X0WNXM=
X-Received: by 2002:a17:906:eecc:b0:afe:7ba0:df58 with SMTP id
 a640c23a62f3a-b01d976b603mr1789848266b.46.1756951458902; Wed, 03 Sep 2025
 19:04:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250831234328.22440-1-hengqi.chen@gmail.com> <20250831234328.22440-3-hengqi.chen@gmail.com>
 <ee579b48-e6d1-22ba-c1b9-f6088c269664@loongson.cn> <CAAhV-H5nG4RaOY+n327+4kdhhOLyNOOaoNcRiuRKSUcO7=nAvg@mail.gmail.com>
 <CAEyhmHTDr8sejaaBUbyAK1Op2HKEzSjp8Rkg9TaU207r-QfQnQ@mail.gmail.com>
In-Reply-To: <CAEyhmHTDr8sejaaBUbyAK1Op2HKEzSjp8Rkg9TaU207r-QfQnQ@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 4 Sep 2025 10:04:06 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7Eb4VTbe5ZCEB0S7tObs4xdbN8jJLa0PurjYd3bjguiA@mail.gmail.com>
X-Gm-Features: Ac12FXzWKl4XPXkH7MRJdp-Cvi8rvDV_EXdqEBUqh0_pLoYdMe1g-3IklKfM4eI
Message-ID: <CAAhV-H7Eb4VTbe5ZCEB0S7tObs4xdbN8jJLa0PurjYd3bjguiA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] LoongArch: BPF: Sign extend struct ops return
 values properly
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, vincent.mc.li@gmail.com, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 9:57=E2=80=AFAM Hengqi Chen <hengqi.chen@gmail.com> =
wrote:
>
> On Mon, Sep 1, 2025 at 12:11=E2=80=AFPM Huacai Chen <chenhuacai@kernel.or=
g> wrote:
> >
> > On Mon, Sep 1, 2025 at 11:08=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongso=
n.cn> wrote:
> > >
> > > On 2025/9/1 =E4=B8=8A=E5=8D=887:43, Hengqi Chen wrote:
> > > > The ns_bpf_qdisc selftest triggers a kernel panic:
> > >
> > > ...
> > >
> > > > So let's sign extend struct ops return values according to
> > > > the return value spec in function model.
> > >
> > > ...
> > >
> > > >   static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, str=
uct bpf_tramp_image *im,
> > > >                                        const struct btf_func_model =
*m, struct bpf_tramp_links *tlinks,
> > > >                                        void *func_addr, u32 flags)
> > > > @@ -1654,6 +1677,8 @@ static int __arch_prepare_bpf_trampoline(stru=
ct jit_ctx *ctx, struct bpf_tramp_i
> > > >       if (save_ret) {
> > > >               emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_GPR_F=
P, -retval_off);
> > >
> > > If is_struct_ops is true, this operation is not necessary, because
> > > LOONGARCH_GPR_A0 will be overwrote in the later code ...
> > > >               emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_GPR_=
FP, -(retval_off - 8));
> > > > +             if (is_struct_ops)
> > > > +                     sign_extend(ctx, LOONGARCH_GPR_A0, regmap[BPF=
_REG_0], m->ret_size);
> > >
> > > ... in here, so it is better to write the code like this:
> > >
> > > if (is_struct_ops) {
> > > ...
> > > } else {
> > > ...
> > > }
> > >
> > > Maybe Huacai can adjust the code when applying.
> > No hurry, I will wait your series (and there is another patch from
> > Jiang Haoran, too), then apply together.
> >
>
> Do you mean https://lore.kernel.org/loongarch/20250815082931.875216-1-jia=
nghaoran@kylinos.cn/
> ?
Yes, is it replaced by your or  Tiezhu's patch?

Huacai

>
> > Huacai
> >
> > >
> > > Thanks,
> > > Tiezhu
> > >
