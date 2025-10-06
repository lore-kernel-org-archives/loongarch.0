Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5BC189F5C
	for <loongarch@lists.linux.dev>; Mon,  6 Oct 2025 09:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759742509; cv=none; b=fyLXNZzPuTTjzMdB0tn2KXBWkQQSgiy98rN4Cz3dIYpBSVqxNSJ0UdkZ0vzNB1eR6PI+x9uy6trTfEUL9NclYVfZayDjadMvMlAEF2N2o/cFod9n0h+XLEB8G0IzBql2WtQoVzY6QhZOHr/K3DQy5ouh+OYZmRcMS+3noJFLzh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759742509; c=relaxed/simple;
	bh=WKNiEGyMKh60qeJZMb6zCyVQ/Fe+KaQt1LqjKHrhonE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNHJZ/jjSfX5oajs8nEhMkC/r2yx+Ux09OFhOn31raXiCkyfl4ebxlobnKO7I4r4LhW0XBQ5HUsTEC0tVh6Y87C1pk/xk2njk2Dhv5ONoP0UT7LH2e0b+D326YuUP2I09iMpMrP/EqZd72vbmWCeg40X0a5rBIR1HLDV8X75qaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AUZkrt/H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AUZkrt/H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C157C4CEF5
	for <loongarch@lists.linux.dev>; Mon,  6 Oct 2025 09:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759742509;
	bh=WKNiEGyMKh60qeJZMb6zCyVQ/Fe+KaQt1LqjKHrhonE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AUZkrt/HNRDDUkNwTFBgWnSs0c+p+p8doIYNyBRwkpLp6SbE4YFdNAM12MglpvkIV
	 yiXRJdR9v0apoMWlZ+ztzj1FO5g4ueZVxPWZ+grPNpdiMqsefcKDiHOwDKSJF4L8Pk
	 CpggMTZtu8YrZVGgm9xo/x8rKEMKwQ4+Mc3AQkSU+F++AXo1y+5QDKVahuL0WtngcA
	 u86sUVFn1kyIJ6jGPZsNrDQa7KnYRYWHyr6rKEtsJyy2UldtP+kjCL5jnCe+Emfllf
	 JxMU3qTrfQ77mLejyeU6h4HrYz8+sgoBKYqpPb3hiETpRJil9t/gv9ILLNboXx3MCH
	 QjaIuKqN6Ya3A==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3f5e0e2bf7so887881066b.3
        for <loongarch@lists.linux.dev>; Mon, 06 Oct 2025 02:21:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUUprIilOeTsvm4DNnphZq3xe6DyFnVCQP88f2k/Lj54WYGwQHOEQMCByy1CjEWzTUSYFf/cdTBbI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRfA2r4AuO1HbgStA9spZclplCXNtbPwj9ZS0d9oMu+oG5gI4/
	eevfH+smW8ummnZQhSoMwPAPzXvo7Dj5aapuwbWKh7tEI94ZXZrk6BauwSoSQxQsBnik2UyKfD9
	4uSVzi1W7LtOEHtcZoXtDZpy4U6HWwV8=
X-Google-Smtp-Source: AGHT+IETr32CoFMcVHb8uk3KF9ySaq+3DIWMpU9LNlUc/fiA55wqmBPJDMADE6ulWESRFsth361gMRfnXcds/q3K04c=
X-Received: by 2002:a17:907:7f25:b0:af9:eace:8a52 with SMTP id
 a640c23a62f3a-b49c3f7ed2amr1447626166b.50.1759742507755; Mon, 06 Oct 2025
 02:21:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251006053323.193581-1-hengqi.chen@gmail.com> <20251006053323.193581-6-hengqi.chen@gmail.com>
In-Reply-To: <20251006053323.193581-6-hengqi.chen@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 6 Oct 2025 17:21:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6-_xUm=DVHGavWerG4KqZStgJn4ZOKA3ByYoBVUQWHaQ@mail.gmail.com>
X-Gm-Features: AS18NWDySAr5qntD1J5o4FEV2zOHHbD4yxSTTGzRdG1QIVCCcKMJ4QrouOPVaV8
Message-ID: <CAAhV-H6-_xUm=DVHGavWerG4KqZStgJn4ZOKA3ByYoBVUQWHaQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] LoongArch: BPF: Use BPF prog pack allocator
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: yangtiezhu@loongson.cn, vincent.mc.li@gmail.com, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 1:33=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com> =
wrote:
>
> Use bpf_jit_binary_pack_alloc() for JIT binaries. The BPF
> prog pack allocator creates a pair of RW and RX buffers.
> The JIT writes the program into the RW buffer. When the JIT
> is done, the program is copied to the final RX buffer
> with bpf_jit_binary_pack_finalize.
>
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>  arch/loongarch/net/bpf_jit.c | 123 ++++++++++++++++++++++++-----------
>  arch/loongarch/net/bpf_jit.h |   2 +-
>  stxSxLQw                     |   0
>  3 files changed, 87 insertions(+), 38 deletions(-)
>  create mode 100644 stxSxLQw
???

>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 9f868bf85960..57a9774affad 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -490,11 +490,11 @@ static int add_exception_handler(const struct bpf_i=
nsn *insn,
>                                  struct jit_ctx *ctx,
>                                  int dst_reg)
>  {
> -       unsigned long pc;
> -       off_t offset;
>         struct exception_table_entry *ex;
> +       off_t ins_offset, fixup_offset;
> +       unsigned long pc;
>
> -       if (!ctx->image || !ctx->prog->aux->extable)
> +       if (!ctx->image || !ctx->ro_image || !ctx->prog->aux->extable)
>                 return 0;
>
>         if (BPF_MODE(insn->code) !=3D BPF_PROBE_MEM &&
> @@ -505,14 +505,18 @@ static int add_exception_handler(const struct bpf_i=
nsn *insn,
>                 return -EINVAL;
>
>         ex =3D &ctx->prog->aux->extable[ctx->num_exentries];
> -       pc =3D (unsigned long)&ctx->image[ctx->idx - 1];
> +       pc =3D (unsigned long)&ctx->ro_image[ctx->idx - 1];
>
> -       offset =3D pc - (long)&ex->insn;
> -       if (WARN_ON_ONCE(offset >=3D 0 || offset < INT_MIN))
> +       /*
> +        * This is the relative offset of the instruction that may fault =
from
> +        * the exception table itself. This will be written to the except=
ion
> +        * table and if this instruction faults, the destination register=
 will
> +        * be set to '0' and the execution will jump to the next instruct=
ion.
> +        */
> +       ins_offset =3D pc - (long)&ex->insn;
> +       if (WARN_ON_ONCE(ins_offset >=3D 0 || ins_offset < INT_MIN))
>                 return -ERANGE;
>
> -       ex->insn =3D offset;
> -
>         /*
>          * Since the extable follows the program, the fixup offset is alw=
ays
>          * negative and limited to BPF_JIT_REGION_SIZE. Store a positive =
value
> @@ -520,13 +524,25 @@ static int add_exception_handler(const struct bpf_i=
nsn *insn,
>          * bits. We don't need to worry about buildtime or runtime sort
>          * modifying the upper bits because the table is already sorted, =
and
>          * isn't part of the main exception table.
> +        *
> +        * The fixup_offset is set to the next instruction from the instr=
uction
> +        * that may fault. The execution will jump to this after handling=
 the
> +        * fault.
>          */
> -       offset =3D (long)&ex->fixup - (pc + LOONGARCH_INSN_SIZE);
> -       if (!FIELD_FIT(BPF_FIXUP_OFFSET_MASK, offset))
> +       fixup_offset =3D (long)&ex->fixup - (pc + LOONGARCH_INSN_SIZE);
> +       if (!FIELD_FIT(BPF_FIXUP_OFFSET_MASK, fixup_offset))
>                 return -ERANGE;
>
> +       /*
> +        * The offsets above have been calculated using the RO buffer but=
 we
> +        * need to use the R/W buffer for writes.
> +        * switch ex to rw buffer for writing.
> +        */
> +       ex =3D (void *)ctx->image + ((void *)ex - (void *)ctx->ro_image);
> +       ex->insn =3D ins_offset;
> +       ex->fixup =3D FIELD_PREP(BPF_FIXUP_OFFSET_MASK, fixup_offset) |
> +                   FIELD_PREP(BPF_FIXUP_REG_MASK, dst_reg);
>         ex->type =3D EX_TYPE_BPF;
> -       ex->fixup =3D FIELD_PREP(BPF_FIXUP_OFFSET_MASK, offset) | FIELD_P=
REP(BPF_FIXUP_REG_MASK, dst_reg);
>
>         ctx->num_exentries++;
>
> @@ -1809,11 +1825,12 @@ int arch_bpf_trampoline_size(const struct btf_fun=
c_model *m, u32 flags,
>  struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>  {
>         bool tmp_blinded =3D false, extra_pass =3D false;
> -       u8 *image_ptr;
> +       u8 *image_ptr, *ro_image_ptr;
>         int image_size, prog_size, extable_size;
>         struct jit_ctx ctx;
>         struct jit_data *jit_data;
>         struct bpf_binary_header *header;
> +       struct bpf_binary_header *ro_header;
>         struct bpf_prog *tmp, *orig_prog =3D prog;
>
>         /*
> @@ -1848,8 +1865,10 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pr=
og *prog)
>         }
>         if (jit_data->ctx.offset) {
>                 ctx =3D jit_data->ctx;
> -               image_ptr =3D jit_data->image;
> +               ro_image_ptr =3D (void *)ctx.ro_image;
> +               ro_header =3D jit_data->ro_header;
>                 header =3D jit_data->header;
> +               image_ptr =3D (void *)header + ((void *)ro_image_ptr - (v=
oid *)ro_header);
>                 extra_pass =3D true;
>                 prog_size =3D sizeof(u32) * ctx.idx;
>                 goto skip_init_ctx;
> @@ -1883,17 +1902,26 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_p=
rog *prog)
>         prog_size =3D sizeof(u32) * ctx.idx;
>         image_size =3D prog_size + extable_size;
>         /* Now we know the size of the structure to make */
> -       header =3D bpf_jit_binary_alloc(image_size, &image_ptr,
> -                                     sizeof(u32), jit_fill_hole);
> -       if (header =3D=3D NULL) {
> +       ro_header =3D bpf_jit_binary_pack_alloc(image_size, &ro_image_ptr=
,
> +                                             sizeof(u32), &header, &imag=
e_ptr,
> +                                             jit_fill_hole);
> +       if (!ro_header) {
>                 prog =3D orig_prog;
>                 goto out_offset;
>         }
>
>         /* 2. Now, the actual pass to generate final JIT code */
> +       /*
> +        * Use the image(RW) for writing the JITed instructions. But also=
 save
> +        * the ro_image(RX) for calculating the offsets in the image. The=
 RW
> +        * image will be later copied to the RX image from where the prog=
ram
> +        * will run. The bpf_jit_binary_pack_finalize() will do this copy=
 in the
> +        * final step.
> +        */
>         ctx.image =3D (union loongarch_instruction *)image_ptr;
> +       ctx.ro_image =3D (union loongarch_instruction *)ro_image_ptr;
>         if (extable_size)
> -               prog->aux->extable =3D (void *)image_ptr + prog_size;
> +               prog->aux->extable =3D (void *)ro_image_ptr + prog_size;
>
>  skip_init_ctx:
>         ctx.idx =3D 0;
> @@ -1901,48 +1929,47 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_p=
rog *prog)
>
>         build_prologue(&ctx);
>         if (build_body(&ctx, extra_pass)) {
> -               bpf_jit_binary_free(header);
>                 prog =3D orig_prog;
> -               goto out_offset;
> +               goto out_free;
>         }
>         build_epilogue(&ctx);
>
>         /* 3. Extra pass to validate JITed code */
>         if (validate_ctx(&ctx)) {
> -               bpf_jit_binary_free(header);
>                 prog =3D orig_prog;
> -               goto out_offset;
> +               goto out_free;
>         }
>
>         /* And we're done */
>         if (bpf_jit_enable > 1)
>                 bpf_jit_dump(prog->len, prog_size, 2, ctx.image);
>
> -       /* Update the icache */
> -       flush_icache_range((unsigned long)header, (unsigned long)(ctx.ima=
ge + ctx.idx));
> -
>         if (!prog->is_func || extra_pass) {
> -               int err;
> -
>                 if (extra_pass && ctx.idx !=3D jit_data->ctx.idx) {
>                         pr_err_once("multi-func JIT bug %d !=3D %d\n",
>                                     ctx.idx, jit_data->ctx.idx);
>                         goto out_free;
>                 }
> -               err =3D bpf_jit_binary_lock_ro(header);
> -               if (err) {
> -                       pr_err_once("bpf_jit_binary_lock_ro() returned %d=
\n",
> -                                   err);
> +               if (WARN_ON(bpf_jit_binary_pack_finalize(ro_header, heade=
r))) {
> +                       /* ro_header has been freed */
> +                       ro_header =3D NULL;
> +                       prog =3D orig_prog;
>                         goto out_free;
>                 }
> +               /*
> +                * The instructions have now been copied to the ROX regio=
n from
> +                * where they will execute. Now the data cache has to be =
cleaned to
> +                * the PoU and the I-cache has to be invalidated for the =
VAs.
> +                */
> +               bpf_flush_icache(ro_header, ctx.ro_image + ctx.idx);
>         } else {
>                 jit_data->ctx =3D ctx;
> -               jit_data->image =3D image_ptr;
>                 jit_data->header =3D header;
> +               jit_data->ro_header =3D ro_header;
>         }
>         prog->jited =3D 1;
>         prog->jited_len =3D prog_size;
> -       prog->bpf_func =3D (void *)ctx.image;
> +       prog->bpf_func =3D (void *)ctx.ro_image;
>
>         if (!prog->is_func || extra_pass) {
>                 int i;
> @@ -1962,17 +1989,39 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_p=
rog *prog)
>         if (tmp_blinded)
>                 bpf_jit_prog_release_other(prog, prog =3D=3D orig_prog ? =
tmp : orig_prog);
>
> -
>         return prog;
>
>  out_free:
> -       bpf_jit_binary_free(header);
> -       prog->bpf_func =3D NULL;
> -       prog->jited =3D 0;
> -       prog->jited_len =3D 0;
> +       if (header) {
> +               bpf_arch_text_copy(&ro_header->size, &header->size, sizeo=
f(header->size));
> +               bpf_jit_binary_pack_free(ro_header, header);
> +       }
>         goto out_offset;
>  }
>
> +void bpf_jit_free(struct bpf_prog *prog)
> +{
> +       if (prog->jited) {
> +               struct jit_data *jit_data =3D prog->aux->jit_data;
> +               struct bpf_binary_header *hdr;
> +
> +               /*
> +                * If we fail the final pass of JIT (from jit_subprogs),
> +                * the program may not be finalized yet. Call finalize he=
re
> +                * before freeing it.
> +                */
> +               if (jit_data) {
> +                       bpf_jit_binary_pack_finalize(jit_data->ro_header,=
 jit_data->header);
> +                       kfree(jit_data);
> +               }
> +               hdr =3D bpf_jit_binary_pack_hdr(prog);
> +               bpf_jit_binary_pack_free(hdr, NULL);
> +               WARN_ON_ONCE(!bpf_prog_kallsyms_verify_off(prog));
> +       }
> +
> +       bpf_prog_unlock_free(prog);
> +}
> +
>  bool bpf_jit_bypass_spec_v1(void)
>  {
>         return true;
> diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bpf_jit.h
> index 5697158fd164..e76819a157ca 100644
> --- a/arch/loongarch/net/bpf_jit.h
> +++ b/arch/loongarch/net/bpf_jit.h
> @@ -24,7 +24,7 @@ struct jit_ctx {
>
>  struct jit_data {
>         struct bpf_binary_header *header;
> -       u8 *image;
> +       struct bpf_binary_header *ro_header;
>         struct jit_ctx ctx;
>  };
>
> diff --git a/stxSxLQw b/stxSxLQw
> new file mode 100644
> index 000000000000..e69de29bb2d1
> --
> 2.43.5
>
