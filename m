Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5096A2AB23
	for <loongarch@lists.linux.dev>; Tue, 20 Jun 2023 18:42:39 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-77de67139ccso231306339f.0
        for <loongarch@lists.linux.dev>; Tue, 20 Jun 2023 11:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687286558; x=1689878558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCtMr8ijFx2CrFh9ZGovTyfqeQbUmmEvN/2Rn9Z2qpQ=;
        b=iyPTc9bXMYyX6moN+B8SXQN7zkXJhjVq8UhZzE4Vp/f5rzrTZyWjoSVvfGgLH6+WlP
         6zq737NeHTnYSq4YZGjuxACeYaAbxUoRsVdzlmkOXxmzH+Q8DtSoHIJ+3UUAIJ6BRMmD
         iNBcD662Uaffr0llfJZpl7GUGuqGbuIdRq14COrTKP2f00+qhQZHDMTtXhFfT32ymUd5
         2qkwZOyyo4M70Uaqi1uz5p4ad5xrmzLnijyL/lO+BGpVc+Qnw5kEzSbW/rVkcsohrGvk
         cpXw0S+GKpoXf/SfwwbpPllcGEcrsOvd+5+ZgF3Vav4ZGxhe3rBqT6hwThIQhMMK0m71
         VRzg==
X-Gm-Message-State: AC+VfDxjdxEVh6iO/M3XF4gGJbi/GqwUM6T1YPCxHf2ljwrAzILWAc/k
	Yk/Qupq8FYY4+3EGEk7aCIgYWVB00aSOaB7saoE=
X-Google-Smtp-Source: ACHHUZ5UypJ0++pBV6Hqw8rqiWPP/lwWp2zQMiRMqtjM8mucthRU+AAM+/bTiYec3dtoQpaSXydIJ2YfK6X/YRv3cxA=
X-Received: by 2002:a6b:fd07:0:b0:777:ce47:6c5a with SMTP id
 c7-20020a6bfd07000000b00777ce476c5amr9165132ioi.21.1687286557979; Tue, 20 Jun
 2023 11:42:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230620132025.105563-1-wangrui@loongson.cn>
In-Reply-To: <20230620132025.105563-1-wangrui@loongson.cn>
From: Namhyung Kim <namhyung@kernel.org>
Date: Tue, 20 Jun 2023 11:42:26 -0700
Message-ID: <CAM9d7chjhFNjDMADJTTz5TNgCCuyPzy8VCDvZxw5K5girfWu1A@mail.gmail.com>
Subject: Re: [PATCH] perf annotate: Fix instruction association and parsing
 for LoongArch
To: WANG Rui <wangrui@loongson.cn>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Jun 20, 2023 at 6:21=E2=80=AFAM WANG Rui <wangrui@loongson.cn> wrot=
e:
>
> In the perf annotate view for LoongArch, there is no arrowed line
> pointing to the target from the branch instruction. This issue is
> caused by incorrect instruction association and parsing.
>
> $ perf record alloc-6276705c94ad1398 # rust benchmark
> $ perf report
>
>   0.28 =E2=94=82       ori        $a1, $zero, 0x63
>        =E2=94=82       move       $a2, $zero
>  10.55 =E2=94=82       addi.d     $a3, $a2, 1(0x1)
>        =E2=94=82       sltu       $a4, $a3, $s7
>   9.53 =E2=94=82       masknez    $a4, $s7, $a4
>        =E2=94=82       sub.d      $a3, $a3, $a4
>  12.12 =E2=94=82       st.d       $a1, $fp, 24(0x18)
>        =E2=94=82       st.d       $a3, $fp, 16(0x10)
>  16.29 =E2=94=82       slli.d     $a2, $a2, 0x2
>        =E2=94=82       ldx.w      $a2, $s8, $a2
>  12.77 =E2=94=82       st.w       $a2, $sp, 724(0x2d4)
>        =E2=94=82       st.w       $s0, $sp, 720(0x2d0)
>   7.03 =E2=94=82       addi.d     $a2, $sp, 720(0x2d0)
>        =E2=94=82       addi.d     $a1, $a1, -1(0xfff)
>  12.03 =E2=94=82       move       $a2, $a3
>        =E2=94=82     =E2=86=92 bne        $a1, $s3, -52(0x3ffcc)  # 82ce8=
 <test::bench::Bencher::iter+0x3f4>
>   2.50 =E2=94=82       addi.d     $a0, $a0, 1(0x1)
>
> This patch fixes instruction association issues, such as associating
> branch instructions with jump_ops instead of call_ops, and corrects
> false instruction matches. It also implements branch instruction parsing
> specifically for LoongArch. With this patch, we will be able to see the
> arrowed line.
>
>   0.79 =E2=94=823ec:   ori        $a1, $zero, 0x63
>        =E2=94=82       move       $a2, $zero
>  10.32 =E2=94=823f4:=E2=94=8C=E2=94=80=E2=86=92addi.d     $a3, $a2, 1(0x1=
)
>        =E2=94=82    =E2=94=82  sltu       $a4, $a3, $s7
>  10.44 =E2=94=82    =E2=94=82  masknez    $a4, $s7, $a4
>        =E2=94=82    =E2=94=82  sub.d      $a3, $a3, $a4
>  14.17 =E2=94=82    =E2=94=82  st.d       $a1, $fp, 24(0x18)
>        =E2=94=82    =E2=94=82  st.d       $a3, $fp, 16(0x10)
>  13.15 =E2=94=82    =E2=94=82  slli.d     $a2, $a2, 0x2
>        =E2=94=82    =E2=94=82  ldx.w      $a2, $s8, $a2
>  11.00 =E2=94=82    =E2=94=82  st.w       $a2, $sp, 724(0x2d4)
>        =E2=94=82    =E2=94=82  st.w       $s0, $sp, 720(0x2d0)
>   8.00 =E2=94=82    =E2=94=82  addi.d     $a2, $sp, 720(0x2d0)
>        =E2=94=82    =E2=94=82  addi.d     $a1, $a1, -1(0xfff)
>  11.99 =E2=94=82    =E2=94=82  move       $a2, $a3
>        =E2=94=82    =E2=94=94=E2=94=80=E2=94=80bne        $a1, $s3, 3f4
>   3.17 =E2=94=82       addi.d     $a0, $a0, 1(0x1)
>
> Signed-off-by: WANG Rui <wangrui@loongson.cn>

Just a nitpick.  Otherwise looks good.

> ---
>  .../arch/loongarch/annotate/instructions.c    | 116 ++++++++++++++++--
>  tools/perf/arch/s390/annotate/instructions.c  |   3 -
>  tools/perf/util/annotate.c                    |   8 +-
>  3 files changed, 109 insertions(+), 18 deletions(-)
>
> diff --git a/tools/perf/arch/loongarch/annotate/instructions.c b/tools/pe=
rf/arch/loongarch/annotate/instructions.c
> index ab21bf122135..98e19c5366ac 100644
> --- a/tools/perf/arch/loongarch/annotate/instructions.c
> +++ b/tools/perf/arch/loongarch/annotate/instructions.c
> @@ -5,25 +5,115 @@
>   * Copyright (C) 2020-2023 Loongson Technology Corporation Limited
>   */
>
> +static int loongarch_call__parse(struct arch *arch, struct ins_operands =
*ops, struct map_symbol *ms)
> +{
> +       char *c, *endptr, *tok, *name;
> +       struct map *map =3D ms->map;
> +       struct addr_map_symbol target =3D {
> +               .ms =3D { .map =3D map, },

Looking here...

> +       };
> +
> +       c =3D strchr(ops->raw, '#');
> +       if (c++ =3D=3D NULL)
> +               return -1;
> +
> +       ops->target.addr =3D strtoull(c, &endptr, 16);
> +
> +       name =3D strchr(endptr, '<');
> +       name++;
> +
> +       if (arch->objdump.skip_functions_char &&
> +           strchr(name, arch->objdump.skip_functions_char))
> +               return -1;
> +
> +       tok =3D strchr(name, '>');
> +       if (tok =3D=3D NULL)
> +               return -1;
> +
> +       *tok =3D '\0';
> +       ops->target.name =3D strdup(name);
> +       *tok =3D '>';
> +
> +       if (ops->target.name =3D=3D NULL)
> +               return -1;
> +
> +       target.addr =3D map__objdump_2mem(map, ops->target.addr);
> +
> +       if (maps__find_ams(ms->maps, &target) =3D=3D 0 &&
> +           map__rip_2objdump(target.ms.map, map__map_ip(target.ms.map, t=
arget.addr)) =3D=3D ops->target.addr)

So the target.ms.map is 'map', right?  Then we can reduce the line.


> +               ops->target.sym =3D target.ms.sym;
> +
> +       return 0;
> +}
> +
> +static struct ins_ops loongarch_call_ops =3D {
> +       .parse     =3D loongarch_call__parse,
> +       .scnprintf =3D call__scnprintf,
> +};
> +
> +static int loongarch_jump__parse(struct arch *arch, struct ins_operands =
*ops, struct map_symbol *ms)
> +{
> +       struct map *map =3D ms->map;
> +       struct symbol *sym =3D ms->sym;
> +       struct addr_map_symbol target =3D {
> +               .ms =3D { .map =3D map, },
> +       };
> +       const char *c =3D strchr(ops->raw, '#');
> +       u64 start, end;
> +
> +       ops->raw_comment =3D strchr(ops->raw, arch->objdump.comment_char)=
;
> +       ops->raw_func_start =3D strchr(ops->raw, '<');
> +
> +       if (ops->raw_func_start && c > ops->raw_func_start)
> +               c =3D NULL;
> +
> +       if (c++ !=3D NULL)
> +               ops->target.addr =3D strtoull(c, NULL, 16);
> +       else
> +               ops->target.addr =3D strtoull(ops->raw, NULL, 16);
> +
> +       target.addr =3D map__objdump_2mem(map, ops->target.addr);
> +       start =3D map__unmap_ip(map, sym->start);
> +       end =3D map__unmap_ip(map, sym->end);
> +
> +       ops->target.outside =3D target.addr < start || target.addr > end;
> +
> +       if (maps__find_ams(ms->maps, &target) =3D=3D 0 &&
> +           map__rip_2objdump(target.ms.map, map__map_ip(target.ms.map, t=
arget.addr)) =3D=3D ops->target.addr)

Ditto.

Thanks,
Namhyung


> +               ops->target.sym =3D target.ms.sym;
> +
> +       if (!ops->target.outside) {
> +               ops->target.offset =3D target.addr - start;
> +               ops->target.offset_avail =3D true;
> +       } else {
> +               ops->target.offset_avail =3D false;
> +       }
> +
> +       return 0;
> +}
> +
> +static struct ins_ops loongarch_jump_ops =3D {
> +       .parse     =3D loongarch_jump__parse,
> +       .scnprintf =3D jump__scnprintf,
> +};
> +
>  static
>  struct ins_ops *loongarch__associate_ins_ops(struct arch *arch, const ch=
ar *name)
>  {
>         struct ins_ops *ops =3D NULL;
>
> -       if (!strncmp(name, "beqz", 4) ||
> -           !strncmp(name, "bnez", 4) ||
> -           !strncmp(name, "beq", 3) ||
> -           !strncmp(name, "bne", 3) ||
> -           !strncmp(name, "blt", 3) ||
> -           !strncmp(name, "bge", 3) ||
> -           !strncmp(name, "bltu", 4) ||
> -           !strncmp(name, "bgeu", 4) ||
> -           !strncmp(name, "bl", 2))
> -               ops =3D &call_ops;
> -       else if (!strncmp(name, "jirl", 4))
> +       if (!strcmp(name, "bl"))
> +               ops =3D &loongarch_call_ops;
> +       else if (!strcmp(name, "jirl"))
>                 ops =3D &ret_ops;
> -       else if (name[0] =3D=3D 'b')
> -               ops =3D &jump_ops;
> +       else if (!strcmp(name, "b") ||
> +                !strncmp(name, "beq", 3) ||
> +                !strncmp(name, "bne", 3) ||
> +                !strncmp(name, "blt", 3) ||
> +                !strncmp(name, "bge", 3) ||
> +                !strncmp(name, "bltu", 4) ||
> +                !strncmp(name, "bgeu", 4))
> +               ops =3D &loongarch_jump_ops;
>         else
>                 return NULL;
>
> diff --git a/tools/perf/arch/s390/annotate/instructions.c b/tools/perf/ar=
ch/s390/annotate/instructions.c
> index de925b0e35ce..da5aa3e1f04c 100644
> --- a/tools/perf/arch/s390/annotate/instructions.c
> +++ b/tools/perf/arch/s390/annotate/instructions.c
> @@ -45,9 +45,6 @@ static int s390_call__parse(struct arch *arch, struct i=
ns_operands *ops,
>         return 0;
>  }
>
> -static int call__scnprintf(struct ins *ins, char *bf, size_t size,
> -                          struct ins_operands *ops, int max_ins_name);
> -
>  static struct ins_ops s390_call_ops =3D {
>         .parse     =3D s390_call__parse,
>         .scnprintf =3D call__scnprintf,
> diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
> index cdd1924a4418..ad40adbd8895 100644
> --- a/tools/perf/util/annotate.c
> +++ b/tools/perf/util/annotate.c
> @@ -61,6 +61,10 @@ static regex_t        file_lineno;
>  static struct ins_ops *ins__find(struct arch *arch, const char *name);
>  static void ins__sort(struct arch *arch);
>  static int disasm_line__parse(char *line, const char **namep, char **raw=
p);
> +static int call__scnprintf(struct ins *ins, char *bf, size_t size,
> +                         struct ins_operands *ops, int max_ins_name);
> +static int jump__scnprintf(struct ins *ins, char *bf, size_t size,
> +                         struct ins_operands *ops, int max_ins_name);
>
>  struct arch {
>         const char      *name;
> @@ -323,7 +327,7 @@ static struct ins_ops call_ops =3D {
>
>  bool ins__is_call(const struct ins *ins)
>  {
> -       return ins->ops =3D=3D &call_ops || ins->ops =3D=3D &s390_call_op=
s;
> +       return ins->ops =3D=3D &call_ops || ins->ops =3D=3D &s390_call_op=
s || ins->ops =3D=3D &loongarch_call_ops;
>  }
>
>  /*
> @@ -464,7 +468,7 @@ static struct ins_ops jump_ops =3D {
>
>  bool ins__is_jump(const struct ins *ins)
>  {
> -       return ins->ops =3D=3D &jump_ops;
> +       return ins->ops =3D=3D &jump_ops || ins->ops =3D=3D &loongarch_ju=
mp_ops;
>  }
>
>  static int comment__symbol(char *raw, char *comment, u64 *addrp, char **=
namep)
> --
> 2.41.0
>
