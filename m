Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F127F
	for <loongarch@lists.linux.dev>; Tue, 22 Aug 2023 02:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58E8C433CB
	for <loongarch@lists.linux.dev>; Tue, 22 Aug 2023 02:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692671722;
	bh=ZekfsVoVhIPRzirF8nZZvDfMYc1kC1lXFro+vvpp/hE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rb/Qqv0Zf+U5t2GvdJ5pW/9BZi8s7D+S1sQCXRfNP4kzCeEP8nT+b785Z6JWvyZ7o
	 YYrKZDieGSxftGiF67foA/lOhrdF1gGzFzZ+qNM4YBdP3JpbE7BRY5S/qP8tpJ4dVm
	 uBv89bswn0vqDU1whTloeShi5mzZmtBOp3jatzGlM61ajSjmUojQzABqUFyCox19tJ
	 ZzXOGKx4+HFtydkDYQ9Uu5zvf7F3LBAgkFFoKLDmkG8hB7p799CvjPmQbvfy35ITEj
	 Na6aWPb3tpwZg3VpVZor9sUhZEtM+PProK5c5o7DtlZO/Ejc0AqVGBKsmngiVGKLcU
	 j3uHnxtgVD5DQ==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-99bf8e5ab39so535133066b.2
        for <loongarch@lists.linux.dev>; Mon, 21 Aug 2023 19:35:22 -0700 (PDT)
X-Gm-Message-State: AOJu0YxJEiUYb4LNIdhu+kbp1lMwDyWKb00BMmYG2tLTH82XpvTfHWDj
	NOiYDkVapPdn6rpEbPlbo0y8dN7EZPw1jKJ08dU=
X-Google-Smtp-Source: AGHT+IGCZe67JFumZ6cqJ1cF6ZtOG+6IEf7HIDVegKuXqT+vd7KLDQONuNnBlmTwlmOKrk2Nm6n/Me/oVAHV6S8/y/0=
X-Received: by 2002:a17:906:105d:b0:994:9ed:300b with SMTP id
 j29-20020a170906105d00b0099409ed300bmr7262682ejj.16.1692671720862; Mon, 21
 Aug 2023 19:35:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1692088562-4630-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1692088562-4630-1-git-send-email-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 22 Aug 2023 10:35:08 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6HxSYGmVoJs9u39biM=D1oa3-T2YSpXdpWkxvUVF-9KA@mail.gmail.com>
Message-ID: <CAAhV-H6HxSYGmVoJs9u39biM=D1oa3-T2YSpXdpWkxvUVF-9KA@mail.gmail.com>
Subject: Re: [PATCH] objtool: Check local label in is_sibling_call() and add_jump_destinations()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks good to me.

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Tue, Aug 15, 2023 at 4:36=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> When update the latest upstream gcc and binutils which enables linker
> relaxation by default, it generates more objtool warnings on LoongArch,
> like this:
>
>   init/version.o: warning: objtool: early_hostname+0x20: sibling call fro=
m callable instruction with modified stack frame
>
> We can see that the branch and jump operation about local label ".L2"
> is not sibling call, because a sibling call is a tail-call to another
> symbol. In this case, make is_sibling_call() return false, set dest_sec
> and dest_off to calculate jump_dest in add_jump_destinations().
>
> Here are some detailed info:
> [fedora@linux 6.5.test]$ gcc --version
> gcc (GCC) 14.0.0 20230803 (experimental)
> [fedora@linux 6.5.test]$ as --version
> GNU assembler (GNU Binutils) 2.41.50.20230803
> [fedora@linux 6.5.test]$ objdump -M no-aliases -D init/version.o
> 0000000000000000 <early_hostname>:
>    0:   00150085        or              $a1, $a0, $zero
>    4:   1a000004        pcalau12i       $a0, 0
>    8:   02ffc063        addi.d          $sp, $sp, -16
>    c:   02810406        addi.w          $a2, $zero, 65
>   10:   02c00084        addi.d          $a0, $a0, 0
>   14:   29c02061        st.d            $ra, $sp, 8
>   18:   54000000        bl              0       # 18 <early_hostname+0x18=
>
>   1c:   0281000c        addi.w          $t0, $zero, 64
>   20:   6c001584        bgeu            $t0, $a0, 20    # 34 <.L2>
>   24:   1a000004        pcalau12i       $a0, 0
>   28:   02810005        addi.w          $a1, $zero, 64
>   2c:   02c00084        addi.d          $a0, $a0, 0
>   30:   54000000        bl              0       # 30 <early_hostname+0x30=
>
>
> 0000000000000034 <.L2>:
>   34:   28c02061        ld.d            $ra, $sp, 8
>   38:   00150004        or              $a0, $zero, $zero
>   3c:   02c04063        addi.d          $sp, $sp, 16
>   40:   4c000020        jirl            $zero, $ra, 0
>
> By the way, it need to move insn_reloc() before is_sibling_call()
> to avoid implicit declaration build error.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  tools/objtool/check.c | 69 ++++++++++++++++++++++++++++++---------------=
------
>  1 file changed, 41 insertions(+), 28 deletions(-)
>
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index 8936a05..fea3675 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -161,12 +161,39 @@ static bool is_jump_table_jump(struct instruction *=
insn)
>                insn_jump_table(alt_group->orig_group->first_insn);
>  }
>
> -static bool is_sibling_call(struct instruction *insn)
> +static struct reloc *insn_reloc(struct objtool_file *file, struct instru=
ction *insn)
> +{
> +       struct reloc *reloc;
> +
> +       if (insn->no_reloc)
> +               return NULL;
> +
> +       if (!file)
> +               return NULL;
> +
> +       reloc =3D find_reloc_by_dest_range(file->elf, insn->sec,
> +                                        insn->offset, insn->len);
> +       if (!reloc) {
> +               insn->no_reloc =3D 1;
> +               return NULL;
> +       }
> +
> +       return reloc;
> +}
> +
> +static bool is_sibling_call(struct objtool_file *file, struct instructio=
n *insn)
>  {
>         /*
>          * Assume only STT_FUNC calls have jump-tables.
>          */
>         if (insn_func(insn)) {
> +               struct reloc *reloc =3D insn_reloc(file, insn);
> +
> +               /* Disallow sibling calls into STT_NOTYPE if it is local =
lable */
> +               if (reloc && reloc->sym->type =3D=3D STT_NOTYPE &&
> +                   strncmp(reloc->sym->name, ".L", 2) =3D=3D 0)
> +                       return false;
> +
>                 /* An indirect jump is either a sibling call or a jump to=
 a table. */
>                 if (insn->type =3D=3D INSN_JUMP_DYNAMIC)
>                         return !is_jump_table_jump(insn);
> @@ -232,7 +259,7 @@ static bool __dead_end_function(struct objtool_file *=
file, struct symbol *func,
>          * of the sibling call returns.
>          */
>         func_for_each_insn(file, func, insn) {
> -               if (is_sibling_call(insn)) {
> +               if (is_sibling_call(file, insn)) {
>                         struct instruction *dest =3D insn->jump_dest;
>
>                         if (!dest)
> @@ -743,7 +770,7 @@ static int create_static_call_sections(struct objtool=
_file *file)
>                 if (!elf_init_reloc_data_sym(file->elf, sec,
>                                              idx * sizeof(*site) + 4,
>                                              (idx * 2) + 1, key_sym,
> -                                            is_sibling_call(insn) * STAT=
IC_CALL_SITE_TAIL))
> +                                            is_sibling_call(file, insn) =
* STATIC_CALL_SITE_TAIL))
>                         return -1;
>
>                 idx++;
> @@ -1298,26 +1325,6 @@ __weak bool arch_is_rethunk(struct symbol *sym)
>         return false;
>  }
>
> -static struct reloc *insn_reloc(struct objtool_file *file, struct instru=
ction *insn)
> -{
> -       struct reloc *reloc;
> -
> -       if (insn->no_reloc)
> -               return NULL;
> -
> -       if (!file)
> -               return NULL;
> -
> -       reloc =3D find_reloc_by_dest_range(file->elf, insn->sec,
> -                                        insn->offset, insn->len);
> -       if (!reloc) {
> -               insn->no_reloc =3D 1;
> -               return NULL;
> -       }
> -
> -       return reloc;
> -}
> -
>  static void remove_insn_ops(struct instruction *insn)
>  {
>         struct stack_op *op, *next;
> @@ -1560,8 +1567,14 @@ static int add_jump_destinations(struct objtool_fi=
le *file)
>                          * External sibling call or internal sibling call=
 with
>                          * STT_FUNC reloc.
>                          */
> -                       add_call_dest(file, insn, reloc->sym, true);
> -                       continue;
> +                       if (reloc->sym->type =3D=3D STT_NOTYPE &&
> +                           strncmp(reloc->sym->name, ".L", 2) =3D=3D 0) =
{
> +                               dest_sec =3D insn->sec;
> +                               dest_off =3D arch_jump_destination(insn);
> +                       } else {
> +                               add_call_dest(file, insn, reloc->sym, tru=
e);
> +                               continue;
> +                       }
>                 } else if (reloc->sym->sec->idx) {
>                         dest_sec =3D reloc->sym->sec;
>                         dest_off =3D reloc->sym->sym.st_value +
> @@ -3649,7 +3662,7 @@ static int validate_branch(struct objtool_file *fil=
e, struct symbol *func,
>
>                 case INSN_JUMP_CONDITIONAL:
>                 case INSN_JUMP_UNCONDITIONAL:
> -                       if (is_sibling_call(insn)) {
> +                       if (is_sibling_call(file, insn)) {
>                                 ret =3D validate_sibling_call(file, insn,=
 &state);
>                                 if (ret)
>                                         return ret;
> @@ -3670,7 +3683,7 @@ static int validate_branch(struct objtool_file *fil=
e, struct symbol *func,
>
>                 case INSN_JUMP_DYNAMIC:
>                 case INSN_JUMP_DYNAMIC_CONDITIONAL:
> -                       if (is_sibling_call(insn)) {
> +                       if (is_sibling_call(file, insn)) {
>                                 ret =3D validate_sibling_call(file, insn,=
 &state);
>                                 if (ret)
>                                         return ret;
> @@ -3834,7 +3847,7 @@ static int validate_unret(struct objtool_file *file=
, struct instruction *insn)
>
>                 case INSN_JUMP_UNCONDITIONAL:
>                 case INSN_JUMP_CONDITIONAL:
> -                       if (!is_sibling_call(insn)) {
> +                       if (!is_sibling_call(file, insn)) {
>                                 if (!insn->jump_dest) {
>                                         WARN_INSN(insn, "unresolved jump =
target after linking?!?");
>                                         return -1;
> --
> 2.1.0
>
>
