Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A8C199BC
	for <loongarch@lists.linux.dev>; Sun, 12 Oct 2025 03:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760239792; cv=none; b=Lu8+gflOD0663dCff/GFL0e8gdcJ3u5LbelZz6SBTzWp6rq6tDvWAaio92qcDUC+Vw1Er7NKW6e3Gq3QuEbegJ74dIXzMvE6cmrRXH5cN942Qa3CYq6OFw9LzKj9qvuAw3oAUmA+bBAWMCHKWPbmh1KbT7aWYDOlqAWlRyhT0/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760239792; c=relaxed/simple;
	bh=wohbLso/9qasD0TfExgKyMjkZOn7lRTAdb8KXQNe8lw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u91Dgins962Z8V5j13BGDE5RZZQEXi+e5a31rhVdZgkXEAgvA9N3BFBaYIIEigt/2pkEYfGS3ONDowZpU7/Aoi+pQrqBwUguTLm1yQCQvDCzLCovF/CiANkRJeL+95BIaJYOJYDIpYaXHHK5AtValnlLuqqUaWgLy6U9aOIHTMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fo+E4D8f; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fo+E4D8f"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-3c8f257b7e1so530611fac.1
        for <loongarch@lists.linux.dev>; Sat, 11 Oct 2025 20:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760239789; x=1760844589; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2DSPxMlK5vUJVJhYT5y5drO9Eqje14L+CXzN7YBrz0=;
        b=fo+E4D8fTefntmwkBax+XtKrJeM2NANTUl0opd7F3j54dmbB4+dURY82E4Rn9oIP9+
         ugbFl8vlG6xIjPgrx1bQGhw0obbNf5rRyAp7XO9TtP3vz/MLvypOKwX7tGJWnvOq0Dsd
         qHIpopujeZCxCxjG/4YSecNiRpKsWgXwKtUhqyvuTybimsN5ZIzo6olutN1AgOBeXClb
         kx0L8rPVQ8JOm3O/4q+clFx7xlPMHrF68Emi6zjy1HCDq5XtqB7WqpossCwHqgrl/bUx
         1S3AzS5mynFf/WWvrQiuTxxRJtOpuwBf5j48u4xkaD0tw/r//DVVyEed0fN0BmxXfyRU
         TPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760239789; x=1760844589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2DSPxMlK5vUJVJhYT5y5drO9Eqje14L+CXzN7YBrz0=;
        b=OKIUGGT/ZgoeMWt8EPGcD3dyodOFwAOsRaPCu/pmKKNozJQIfw+zNpjSHNZzUpAEx0
         HOg9PSEgpMrh4LyoScFEojDuHNeY95imMa+1kGElX67m5B8xkbSad+nXY9Xv6CgdCkNF
         mq1NfjedZmBR2GwtSNGEkWgrMkfH98dvoIhmAoG4sNMmm9Zd7c45Q9SQmza2EGFlMQnW
         BiHy0x75QajVPRDd0hw8abhvA2LSB4Q2p4LLrhy6Suzb7lVLvOIAUrsW8CC5RJKzQctk
         +4RKuiJwiTPfHWJGEnCVH3yJ00GtDwE3M7StIbA3TR9vzngQeXeOlVWpzZNS4+WfaPob
         yxGA==
X-Forwarded-Encrypted: i=1; AJvYcCV+t26hMsxdBRch7issvanLCuIvyaHKizEAOzXqQgBVU6elXcN2rBUl04zpbb9HRhvgH4ChG7aq+Pw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxW8T7j4f/+hYo2aFbRC5QSTvpLC041qCPxbJLTpIZWdQLJev27
	yP8mknzXds/Fu45JB3gFPGJyOTGghAdsWZ3Fdoi+RZ61Cds/mQzGvJl+dzzHEW11bqJZDdUUtB4
	tW91trr1ZWwwXDkVqokNBp6ZXAhEE3Ug=
X-Gm-Gg: ASbGncurTLNGQ+fh0TgNGUe6tBqQIDHm0dCVlFbhs22K+aoEND4OYkJFm89xZl9BZ+b
	rezsttdmLsJOczD9Rco057bOYBl7+NKcQiIhUD4TY/B8Rc3jYWrCDMI7uwBy2YOQfgDVGIes29N
	dJ8YrELR+PUeopVV4PpyxRdA4zaym/mNMOIOB4LYWNBkOwfEgwSHiiN8ESUD2cssYS93Fs+Q0zZ
	Pp+sw4p0BSIr3eF5vPW4mk+6QZqomYzSgaV
X-Google-Smtp-Source: AGHT+IFZpeHLJDOkMcDAZQ1PcIWLMt3UpOGWbl+Q5L4wWDejQfFHc1Cs5P4sbiVYvvT7HiQq7Nm5m4lMZSiJlwKbnmE=
X-Received: by 2002:a05:6871:1c1:b0:346:24fc:77de with SMTP id
 586e51a60fabf-3be6d8f491amr9402053fac.12.1760239788975; Sat, 11 Oct 2025
 20:29:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251006053323.193581-1-hengqi.chen@gmail.com>
 <20251006053323.193581-6-hengqi.chen@gmail.com> <CAAhV-H6-_xUm=DVHGavWerG4KqZStgJn4ZOKA3ByYoBVUQWHaQ@mail.gmail.com>
In-Reply-To: <CAAhV-H6-_xUm=DVHGavWerG4KqZStgJn4ZOKA3ByYoBVUQWHaQ@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Sun, 12 Oct 2025 11:29:37 +0800
X-Gm-Features: AS18NWAqRqhojLmQfD1r2Qjb-pR1rYWkqYpJjNCEMsq6hZCDeRWOGP411uYmFWE
Message-ID: <CAEyhmHSAOaYNM078i24vpJFgqA9SqcRhMQAc0-MFiB8s_gD59g@mail.gmail.com>
Subject: Re: [PATCH 5/7] LoongArch: BPF: Use BPF prog pack allocator
To: Huacai Chen <chenhuacai@kernel.org>
Cc: yangtiezhu@loongson.cn, vincent.mc.li@gmail.com, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 5:21=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org> =
wrote:
>
> On Mon, Oct 6, 2025 at 1:33=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com=
> wrote:
> >
> > Use bpf_jit_binary_pack_alloc() for JIT binaries. The BPF
> > prog pack allocator creates a pair of RW and RX buffers.
> > The JIT writes the program into the RW buffer. When the JIT
> > is done, the program is copied to the final RX buffer
> > with bpf_jit_binary_pack_finalize.
> >
> > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> > ---
> >  arch/loongarch/net/bpf_jit.c | 123 ++++++++++++++++++++++++-----------
> >  arch/loongarch/net/bpf_jit.h |   2 +-
> >  stxSxLQw                     |   0
> >  3 files changed, 87 insertions(+), 38 deletions(-)
> >  create mode 100644 stxSxLQw
> ???

Sorry, this slipped in probably due to disk full and leftover during
my local build.
Will remove and resend.

>
> >
> > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.=
c
> > index 9f868bf85960..57a9774affad 100644
> > --- a/arch/loongarch/net/bpf_jit.c
> > +++ b/arch/loongarch/net/bpf_jit.c
> > @@ -490,11 +490,11 @@ static int add_exception_handler(const struct bpf=
_insn *insn,
> >                                  struct jit_ctx *ctx,
> >                                  int dst_reg)
> >  {
> > -       unsigned long pc;
> > -       off_t offset;
> >         struct exception_table_entry *ex;
> > +       off_t ins_offset, fixup_offset;
> > +       unsigned long pc;
> >
> > -       if (!ctx->image || !ctx->prog->aux->extable)
> > +       if (!ctx->image || !ctx->ro_image || !ctx->prog->aux->extable)
> >                 return 0;
> >
> >         if (BPF_MODE(insn->code) !=3D BPF_PROBE_MEM &&
> > @@ -505,14 +505,18 @@ static int add_exception_handler(const struct bpf=
_insn *insn,
> >                 return -EINVAL;
> >
> >         ex =3D &ctx->prog->aux->extable[ctx->num_exentries];
> > -       pc =3D (unsigned long)&ctx->image[ctx->idx - 1];
> > +       pc =3D (unsigned long)&ctx->ro_image[ctx->idx - 1];
> >
> > -       offset =3D pc - (long)&ex->insn;
> > -       if (WARN_ON_ONCE(offset >=3D 0 || offset < INT_MIN))
> > +       /*
> > +        * This is the relative offset of the instruction that may faul=
t from
> > +        * the exception table itself. This will be written to the exce=
ption
> > +        * table and if this instruction faults, the destination regist=
er will
> > +        * be set to '0' and the execution will jump to the next instru=
ction.
> > +        */
> > +       ins_offset =3D pc - (long)&ex->insn;
> > +       if (WARN_ON_ONCE(ins_offset >=3D 0 || ins_offset < INT_MIN))
> >                 return -ERANGE;
> >
> > -       ex->insn =3D offset;
> > -
> >         /*
> >          * Since the extable follows the program, the fixup offset is a=
lways
> >          * negative and limited to BPF_JIT_REGION_SIZE. Store a positiv=
e value
> > @@ -520,13 +524,25 @@ static int add_exception_handler(const struct bpf=
_insn *insn,
> >          * bits. We don't need to worry about buildtime or runtime sort
> >          * modifying the upper bits because the table is already sorted=
, and
> >          * isn't part of the main exception table.
> > +        *
> > +        * The fixup_offset is set to the next instruction from the ins=
truction
> > +        * that may fault. The execution will jump to this after handli=
ng the
> > +        * fault.
> >          */
> > -       offset =3D (long)&ex->fixup - (pc + LOONGARCH_INSN_SIZE);
> > -       if (!FIELD_FIT(BPF_FIXUP_OFFSET_MASK, offset))
> > +       fixup_offset =3D (long)&ex->fixup - (pc + LOONGARCH_INSN_SIZE);
> > +       if (!FIELD_FIT(BPF_FIXUP_OFFSET_MASK, fixup_offset))
> >                 return -ERANGE;
> >
> > +       /*
> > +        * The offsets above have been calculated using the RO buffer b=
ut we
> > +        * need to use the R/W buffer for writes.
> > +        * switch ex to rw buffer for writing.
> > +        */
> > +       ex =3D (void *)ctx->image + ((void *)ex - (void *)ctx->ro_image=
);
> > +       ex->insn =3D ins_offset;
> > +       ex->fixup =3D FIELD_PREP(BPF_FIXUP_OFFSET_MASK, fixup_offset) |
> > +                   FIELD_PREP(BPF_FIXUP_REG_MASK, dst_reg);
> >         ex->type =3D EX_TYPE_BPF;
> > -       ex->fixup =3D FIELD_PREP(BPF_FIXUP_OFFSET_MASK, offset) | FIELD=
_PREP(BPF_FIXUP_REG_MASK, dst_reg);
> >
> >         ctx->num_exentries++;
> >
> > @@ -1809,11 +1825,12 @@ int arch_bpf_trampoline_size(const struct btf_f=
unc_model *m, u32 flags,
> >  struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> >  {
> >         bool tmp_blinded =3D false, extra_pass =3D false;
> > -       u8 *image_ptr;
> > +       u8 *image_ptr, *ro_image_ptr;
> >         int image_size, prog_size, extable_size;
> >         struct jit_ctx ctx;
> >         struct jit_data *jit_data;
> >         struct bpf_binary_header *header;
> > +       struct bpf_binary_header *ro_header;
> >         struct bpf_prog *tmp, *orig_prog =3D prog;
> >
> >         /*
> > @@ -1848,8 +1865,10 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_=
prog *prog)
> >         }
> >         if (jit_data->ctx.offset) {
> >                 ctx =3D jit_data->ctx;
> > -               image_ptr =3D jit_data->image;
> > +               ro_image_ptr =3D (void *)ctx.ro_image;
> > +               ro_header =3D jit_data->ro_header;
> >                 header =3D jit_data->header;
> > +               image_ptr =3D (void *)header + ((void *)ro_image_ptr - =
(void *)ro_header);
> >                 extra_pass =3D true;
> >                 prog_size =3D sizeof(u32) * ctx.idx;
> >                 goto skip_init_ctx;
> > @@ -1883,17 +1902,26 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf=
_prog *prog)
> >         prog_size =3D sizeof(u32) * ctx.idx;
> >         image_size =3D prog_size + extable_size;
> >         /* Now we know the size of the structure to make */
> > -       header =3D bpf_jit_binary_alloc(image_size, &image_ptr,
> > -                                     sizeof(u32), jit_fill_hole);
> > -       if (header =3D=3D NULL) {
> > +       ro_header =3D bpf_jit_binary_pack_alloc(image_size, &ro_image_p=
tr,
> > +                                             sizeof(u32), &header, &im=
age_ptr,
> > +                                             jit_fill_hole);
> > +       if (!ro_header) {
> >                 prog =3D orig_prog;
> >                 goto out_offset;
> >         }
> >
> >         /* 2. Now, the actual pass to generate final JIT code */
> > +       /*
> > +        * Use the image(RW) for writing the JITed instructions. But al=
so save
> > +        * the ro_image(RX) for calculating the offsets in the image. T=
he RW
> > +        * image will be later copied to the RX image from where the pr=
ogram
> > +        * will run. The bpf_jit_binary_pack_finalize() will do this co=
py in the
> > +        * final step.
> > +        */
> >         ctx.image =3D (union loongarch_instruction *)image_ptr;
> > +       ctx.ro_image =3D (union loongarch_instruction *)ro_image_ptr;
> >         if (extable_size)
> > -               prog->aux->extable =3D (void *)image_ptr + prog_size;
> > +               prog->aux->extable =3D (void *)ro_image_ptr + prog_size=
;
> >
> >  skip_init_ctx:
> >         ctx.idx =3D 0;
> > @@ -1901,48 +1929,47 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf=
_prog *prog)
> >
> >         build_prologue(&ctx);
> >         if (build_body(&ctx, extra_pass)) {
> > -               bpf_jit_binary_free(header);
> >                 prog =3D orig_prog;
> > -               goto out_offset;
> > +               goto out_free;
> >         }
> >         build_epilogue(&ctx);
> >
> >         /* 3. Extra pass to validate JITed code */
> >         if (validate_ctx(&ctx)) {
> > -               bpf_jit_binary_free(header);
> >                 prog =3D orig_prog;
> > -               goto out_offset;
> > +               goto out_free;
> >         }
> >
> >         /* And we're done */
> >         if (bpf_jit_enable > 1)
> >                 bpf_jit_dump(prog->len, prog_size, 2, ctx.image);
> >
> > -       /* Update the icache */
> > -       flush_icache_range((unsigned long)header, (unsigned long)(ctx.i=
mage + ctx.idx));
> > -
> >         if (!prog->is_func || extra_pass) {
> > -               int err;
> > -
> >                 if (extra_pass && ctx.idx !=3D jit_data->ctx.idx) {
> >                         pr_err_once("multi-func JIT bug %d !=3D %d\n",
> >                                     ctx.idx, jit_data->ctx.idx);
> >                         goto out_free;
> >                 }
> > -               err =3D bpf_jit_binary_lock_ro(header);
> > -               if (err) {
> > -                       pr_err_once("bpf_jit_binary_lock_ro() returned =
%d\n",
> > -                                   err);
> > +               if (WARN_ON(bpf_jit_binary_pack_finalize(ro_header, hea=
der))) {
> > +                       /* ro_header has been freed */
> > +                       ro_header =3D NULL;
> > +                       prog =3D orig_prog;
> >                         goto out_free;
> >                 }
> > +               /*
> > +                * The instructions have now been copied to the ROX reg=
ion from
> > +                * where they will execute. Now the data cache has to b=
e cleaned to
> > +                * the PoU and the I-cache has to be invalidated for th=
e VAs.
> > +                */
> > +               bpf_flush_icache(ro_header, ctx.ro_image + ctx.idx);
> >         } else {
> >                 jit_data->ctx =3D ctx;
> > -               jit_data->image =3D image_ptr;
> >                 jit_data->header =3D header;
> > +               jit_data->ro_header =3D ro_header;
> >         }
> >         prog->jited =3D 1;
> >         prog->jited_len =3D prog_size;
> > -       prog->bpf_func =3D (void *)ctx.image;
> > +       prog->bpf_func =3D (void *)ctx.ro_image;
> >
> >         if (!prog->is_func || extra_pass) {
> >                 int i;
> > @@ -1962,17 +1989,39 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf=
_prog *prog)
> >         if (tmp_blinded)
> >                 bpf_jit_prog_release_other(prog, prog =3D=3D orig_prog =
? tmp : orig_prog);
> >
> > -
> >         return prog;
> >
> >  out_free:
> > -       bpf_jit_binary_free(header);
> > -       prog->bpf_func =3D NULL;
> > -       prog->jited =3D 0;
> > -       prog->jited_len =3D 0;
> > +       if (header) {
> > +               bpf_arch_text_copy(&ro_header->size, &header->size, siz=
eof(header->size));
> > +               bpf_jit_binary_pack_free(ro_header, header);
> > +       }
> >         goto out_offset;
> >  }
> >
> > +void bpf_jit_free(struct bpf_prog *prog)
> > +{
> > +       if (prog->jited) {
> > +               struct jit_data *jit_data =3D prog->aux->jit_data;
> > +               struct bpf_binary_header *hdr;
> > +
> > +               /*
> > +                * If we fail the final pass of JIT (from jit_subprogs)=
,
> > +                * the program may not be finalized yet. Call finalize =
here
> > +                * before freeing it.
> > +                */
> > +               if (jit_data) {
> > +                       bpf_jit_binary_pack_finalize(jit_data->ro_heade=
r, jit_data->header);
> > +                       kfree(jit_data);
> > +               }
> > +               hdr =3D bpf_jit_binary_pack_hdr(prog);
> > +               bpf_jit_binary_pack_free(hdr, NULL);
> > +               WARN_ON_ONCE(!bpf_prog_kallsyms_verify_off(prog));
> > +       }
> > +
> > +       bpf_prog_unlock_free(prog);
> > +}
> > +
> >  bool bpf_jit_bypass_spec_v1(void)
> >  {
> >         return true;
> > diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bpf_jit.=
h
> > index 5697158fd164..e76819a157ca 100644
> > --- a/arch/loongarch/net/bpf_jit.h
> > +++ b/arch/loongarch/net/bpf_jit.h
> > @@ -24,7 +24,7 @@ struct jit_ctx {
> >
> >  struct jit_data {
> >         struct bpf_binary_header *header;
> > -       u8 *image;
> > +       struct bpf_binary_header *ro_header;
> >         struct jit_ctx ctx;
> >  };
> >
> > diff --git a/stxSxLQw b/stxSxLQw
> > new file mode 100644
> > index 000000000000..e69de29bb2d1
> > --
> > 2.43.5
> >
