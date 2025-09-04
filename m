Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1DB1C6B4
	for <loongarch@lists.linux.dev>; Thu,  4 Sep 2025 01:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756951061; cv=none; b=T+wJDSe1RXnn8MHiCKS4f8LjuPX8Z8IzcYJ1QqjE1iJlSqh/7G/z/w5ar+x2RvBY80Z44WlbFHqZiy68q9WDsUjqfzL/daW7xIgK2JnpTwGMKILR/Doktnml7pato5glM3UWQdfqLty3QHoRwpEG5LbWT1USkT6CYmBBk1YcQF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756951061; c=relaxed/simple;
	bh=NFhlNsMogn7Dm2M70snwdOuyuTXF+qHTp75paZ19OCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BhFuPrqX/oacz3rfREjh8f8cFS7NRJk8tO6cd50tqAg9eXGTOpc+Nfbc3M04rE/QfmGNJla6QCfS8pDjebSYr+ap7FbHW9PX2mpiarSL5j6cutkBK0DsxnnYsNa8ROrvEOcsfJjfiRrzfdbeI9KOoup6FxTkkQMCj+eKqq/ItaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ga7q50mp; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ga7q50mp"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-30cce86052cso385461fac.1
        for <loongarch@lists.linux.dev>; Wed, 03 Sep 2025 18:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756951059; x=1757555859; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJ8wZnLD36pGah+WjHJNFK1qa2u1HDEkGyjKkfpZ3nQ=;
        b=ga7q50mpaJD9oO5umKMz2kASU0qkFTnnZOgVGX4sSMFeAimfcQj/NkX6KTxyGAl9AS
         8V5DOLOdtPC2QCK2Dbc2aGwrVvIvawZx7RNeOcJW36Tlr7qoiOfVpHF3G7is5UCbvKpN
         MVY8pCfxNyU7hcexY4fDso5/T/NODyQ272dEx1xXKC65f2PVbCn4g8882q0MWzk8pDKB
         7/s6CqRQxVoPUJyDQIHtbQUkYo+tYHF04Yr02s8T2wZ5Dk0erjkMx3lMSPxmyg+XOpT+
         8WfJl3HN+ph4RYnqATekH6JR9lthH+ZjjRl9rRMLXppZzZVfs9vGu1Xu3R1lfQlTBz9t
         SJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756951059; x=1757555859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJ8wZnLD36pGah+WjHJNFK1qa2u1HDEkGyjKkfpZ3nQ=;
        b=a765uCU5QDSrQPSwWExLa7AtF3BZ0vBG1AvJbo6QW+QuJNgpXXoSAG/OtxzMPFSfm9
         GRLunXiwR7Ds0Bl0y/X0Onv4/GiV4iaTcGiMuyhBs4YMmku0R9o2YfVwHRJufA4UNHIf
         PIbg8AZHzbKSov1wf6qk0N1xVYzVXQGqp5vsXEJT69bRcF3Aqtpgk7l4bdPJZ5K5GiNg
         ji+sFEZKgBz5oFrl46jTi02IZUtLHp1HILQgYJxKMrybXDlttpPSiURlIHGz7uWwNk0Y
         zZzqkyjZjHtJhg4ppZpkYqakaKqkhLJOuDBlD9J2KqBbYaddngYjM4iz1v7TT5CuX68Z
         iFVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI915Vnue5w1acPOdoP5GJuWSpixcOHhIS5BCGDe2ucOwlQT8c+Oebn72e2RD+rjNb+x8cS+UWxzw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBxdUhQswwXC8qbHqLUOKmBACiBU4O8Fv6DgTJ8oO6YS1jVqlM
	srBzQAnOUfjpZJxRuURvmQwWoID0IBFKTfBOpIMbUC6AwauavcFGt6wYrIj5nQXNwH827mpNP4h
	jodl+fV8RsFpGfNa8jkSQHmqz2itIlLQKEl6MshehLA==
X-Gm-Gg: ASbGncvX68+98bwdwacQOfiBqx5OaVxqPDYu/gWqGU/LJXJViXeZuYFkfReErkiRR2Q
	205enmaMuq9poeqh+cKl1Lqv5wqBIukTls6pBgYoPUebNt2WkxBtEaNZFNHkj92XYnhmfb9rJj2
	XcP4UK2IIHSvcVf3drKp6eCorOelEsR9Ab4AHdBgzVPQry7vNWzibWQhFDNxTqATmFZdckBhCE9
	4899tQ=
X-Google-Smtp-Source: AGHT+IE4SRMY7OqaU0AWfSMSK+XRUt7wDNuGa4my4KC18Kc5k4yJZIKRj78AGe6y//0WwwhDdZITjjtUn9mpjndYN0k=
X-Received: by 2002:a05:6870:1603:b0:315:9f40:2af1 with SMTP id
 586e51a60fabf-319633de679mr9477940fac.41.1756951059103; Wed, 03 Sep 2025
 18:57:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250831234328.22440-1-hengqi.chen@gmail.com> <20250831234328.22440-3-hengqi.chen@gmail.com>
 <ee579b48-e6d1-22ba-c1b9-f6088c269664@loongson.cn> <CAAhV-H5nG4RaOY+n327+4kdhhOLyNOOaoNcRiuRKSUcO7=nAvg@mail.gmail.com>
In-Reply-To: <CAAhV-H5nG4RaOY+n327+4kdhhOLyNOOaoNcRiuRKSUcO7=nAvg@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 4 Sep 2025 09:57:28 +0800
X-Gm-Features: Ac12FXwLit7annWlUHNsfMbBXBDwCVi35y6w5DKoVymmWdyP7jzEBfORgRm584w
Message-ID: <CAEyhmHTDr8sejaaBUbyAK1Op2HKEzSjp8Rkg9TaU207r-QfQnQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] LoongArch: BPF: Sign extend struct ops return
 values properly
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, vincent.mc.li@gmail.com, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 12:11=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> On Mon, Sep 1, 2025 at 11:08=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.=
cn> wrote:
> >
> > On 2025/9/1 =E4=B8=8A=E5=8D=887:43, Hengqi Chen wrote:
> > > The ns_bpf_qdisc selftest triggers a kernel panic:
> >
> > ...
> >
> > > So let's sign extend struct ops return values according to
> > > the return value spec in function model.
> >
> > ...
> >
> > >   static int __arch_prepare_bpf_trampoline(struct jit_ctx *ctx, struc=
t bpf_tramp_image *im,
> > >                                        const struct btf_func_model *m=
, struct bpf_tramp_links *tlinks,
> > >                                        void *func_addr, u32 flags)
> > > @@ -1654,6 +1677,8 @@ static int __arch_prepare_bpf_trampoline(struct=
 jit_ctx *ctx, struct bpf_tramp_i
> > >       if (save_ret) {
> > >               emit_insn(ctx, ldd, LOONGARCH_GPR_A0, LOONGARCH_GPR_FP,=
 -retval_off);
> >
> > If is_struct_ops is true, this operation is not necessary, because
> > LOONGARCH_GPR_A0 will be overwrote in the later code ...
> > >               emit_insn(ctx, ldd, regmap[BPF_REG_0], LOONGARCH_GPR_FP=
, -(retval_off - 8));
> > > +             if (is_struct_ops)
> > > +                     sign_extend(ctx, LOONGARCH_GPR_A0, regmap[BPF_R=
EG_0], m->ret_size);
> >
> > ... in here, so it is better to write the code like this:
> >
> > if (is_struct_ops) {
> > ...
> > } else {
> > ...
> > }
> >
> > Maybe Huacai can adjust the code when applying.
> No hurry, I will wait your series (and there is another patch from
> Jiang Haoran, too), then apply together.
>

Do you mean https://lore.kernel.org/loongarch/20250815082931.875216-1-jiang=
haoran@kylinos.cn/
?

> Huacai
>
> >
> > Thanks,
> > Tiezhu
> >
