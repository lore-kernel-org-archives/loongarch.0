Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49008A2D
	for <loongarch@lists.linux.dev>; Sat,  9 Dec 2023 06:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvUHK8ct"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1f055438492so1892531fac.3
        for <loongarch@lists.linux.dev>; Fri, 08 Dec 2023 22:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702101840; x=1702706640; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EuHtUevushkllDsRgX2L0JmAYIUSbk8cfaFnmZYMhoM=;
        b=GvUHK8ct8xQ5Bl5GzDXLlkE+zAU/bIyzcb/dSlwcta9UmvDJwLyFWD80OkVDBSJl/d
         37A7FRCsIcaPulcQWjWcAhQnK9YUtmsAeS178ImFJ9PsMC2v8wnj1Tl04QLZdscCJt8T
         d9ka3W40ShOST6GwkQJt+2jkl8/daINpWuM108gjFrRSLrUIgHZYQ6SCFpacdM/cjpe7
         gJwtKHRGTdpCGQHnlUftqeM8mYoZabXkZTK/WbOSU7OpXfAJvPk0ceCVATsEohpRARMp
         bBQaOXxff8ZcOdrJP3wqR+6rNqQaNc5MtIsi6E0qz2lIhz0RxFJlNhYc2LQVmIHnCXR3
         YLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702101840; x=1702706640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EuHtUevushkllDsRgX2L0JmAYIUSbk8cfaFnmZYMhoM=;
        b=OuHbpQis+3TQQ9eQJIJrSL/h9d2daC4suMA3wOkuAop2Vb7a1wN7Bqi46nM5iu2vZf
         xPAxGXOGjsN061GyN2ZVzR2zTZ6vovGfi2gHn5ZFe9PQotJL07wyv6p4TLEukfUqMPgD
         6vAFiHy7DhFGfmc521GwoyUz/AsUTGswFJoKaq/Afv95K8n9kCi+39oEvylcDxQiFrqT
         4ab6KpX9JLlWK54qsg2YnKs7pH8ocDkbGwDIleTPd5vFn5+1880YIHeoAuUxbp2rs24U
         uBVWBdenM2iBIZ7bQcODroUstSl0HmscdIOv63jufsIudy7hiyanYJ3O7+LCm7Pug6WX
         PXCQ==
X-Gm-Message-State: AOJu0YwLen/PZL59xi9DIhlXqswWR3Nd8RElX+Hh1Q5gx41mouGqBJFM
	aDvnPtubT/YZQv9MzymCMn+1d4OZ2UaSw3V3F2o=
X-Google-Smtp-Source: AGHT+IEyWdcmoKa6dKNQw0agZUw7tuz2hhEMcIhGbESbM0SBuOfrWSsqAMv0s0BUJX3CMZJz9+OmAPO51bYwqV9kvG4=
X-Received: by 2002:a05:6870:b28d:b0:1fb:75b:12eb with SMTP id
 c13-20020a056870b28d00b001fb075b12ebmr1547657oao.61.1702101840001; Fri, 08
 Dec 2023 22:04:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231207032951.16334-1-yangtiezhu@loongson.cn>
 <20231207032951.16334-2-yangtiezhu@loongson.cn> <CAAhV-H40YTpJP0giD6Y9ekfaceimpzuxqJndoBJiMU89YLA3zw@mail.gmail.com>
In-Reply-To: <CAAhV-H40YTpJP0giD6Y9ekfaceimpzuxqJndoBJiMU89YLA3zw@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Sat, 9 Dec 2023 14:03:48 +0800
Message-ID: <CAEyhmHQOfs39cgKBb0VEdF6=pFodBYYkBichsxX_uBh30kNZXg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] LoongArch: BPF: Fix sign-extension mov instructions
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 12:12=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> On Thu, Dec 7, 2023 at 11:30=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.=
cn> wrote:
> >
> > We can see that "Short form of movsx, dst_reg =3D (s8,s16,s32)src_reg"
> > in include/linux/filter.h, additionally, for BPF_ALU64 the value of
> > the destination register is unchanged whereas for BPF_ALU the upper
> > 32 bits of the destination register are zeroed, so it should clear
> > the upper 32 bits for BPF_ALU.
> >
> > [root@linux fedora]# echo 1 > /proc/sys/net/core/bpf_jit_enable
> > [root@linux fedora]# modprobe test_bpf
> >
> > Before:
> > test_bpf: #81 ALU_MOVSX | BPF_B jited:1 ret 2 !=3D 1 (0x2 !=3D 0x1)FAIL=
 (1 times)
> > test_bpf: #82 ALU_MOVSX | BPF_H jited:1 ret 2 !=3D 1 (0x2 !=3D 0x1)FAIL=
 (1 times)
> >
> > After:
> > test_bpf: #81 ALU_MOVSX | BPF_B jited:1 6 PASS
> > test_bpf: #82 ALU_MOVSX | BPF_H jited:1 6 PASS
> >
> > By the way, the bpf selftest case "./test_progs -t verifier_movsx" can
> > also be fixed with this patch.
> Hmmm, it is a little strange that privileged verifier_movsx has no proble=
m.
>

I have found the differences between priv and unpriv mode.
The BPF verifier performs different optimizations for priv and upriv progs.
See the following commits:

https://github.com/torvalds/linux/commit/e2ae4ca266a1c
https://github.com/torvalds/linux/commit/52875a04f4b26
https://github.com/torvalds/linux/commit/a1b14abc009d9

As a result, with unprivileged_bpf_disabled on, we have:

  # bpftool p d x i 55
  void mov32sx_s16_range_2():
  ; asm volatile ("                    \
     0: (b7) r1 =3D 65535
     1: (bc) w2 =3D w1
     2: (77) r2 >>=3D 1
     3: (b7) r0 =3D 1
     4: (95) exit

  # bpftool p d j i 55
  void mov32sx_s16_range_2():
  0xffff800002416238:
  ; asm volatile ("                    \
     0:    addi.d          $a6, $zero, 33(0x21)
     4:    addi.d          $sp, $sp, -64(0xfc0)
     8:    st.d            $ra, $sp, 56(0x38)
     c:    st.d            $fp, $sp, 48(0x30)
    10:    st.d            $s0, $sp, 40(0x28)
    14:    st.d            $s1, $sp, 32(0x20)
    18:    st.d            $s2, $sp, 24(0x18)
    1c:    st.d            $s3, $sp, 16(0x10)
    20:    st.d            $s4, $sp, 8(0x8)
    24:    st.d            $s5, $sp, 0
    28:    addi.d          $fp, $sp, 64(0x40)
    2c:    lu12i.w         $a0, 15(0xf)
    30:    ori             $a0, $a0, 0xfff
    34:    move            $t1, $a0
    38:    ext.w.h         $a1, $t1
    3c:    srli.d          $a1, $a1, 0x1
    40:    addi.w          $a5, $zero, 1(0x1)
    44:    ld.d            $ra, $sp, 56(0x38)
    48:    ld.d            $fp, $sp, 48(0x30)
    4c:    ld.d            $s0, $sp, 40(0x28)
    50:    ld.d            $s1, $sp, 32(0x20)
    54:    ld.d            $s2, $sp, 24(0x18)
    58:    ld.d            $s3, $sp, 16(0x10)
    5c:    ld.d            $s4, $sp, 8(0x8)
    60:    ld.d            $s5, $sp, 0
    64:    addi.d          $sp, $sp, 64(0x40)
    68:    move            $a0, $a5
    6c:    jirl            $zero, $ra, 0

With unprivileged_bpf_disabled off, we have:

  # bpftool p d x i 59
     0: (b7) r1 =3D 65535
     1: (bc) w2 =3D w1
     2: (77) r2 >>=3D 1
     3: (55) if r2 !=3D 0x7fffffff goto pc+2
     4: (b7) r0 =3D 1
     5: (95) exit
     6: (05) goto pc-1
     7: (05) goto pc-1

  # bpftool p d j i 59
  0xffff8000024146a0:
     0:    addi.d          $a6, $zero, 33(0x21)
     4:    addi.d          $sp, $sp, -64(0xfc0)
     8:    st.d            $ra, $sp, 56(0x38)
     c:    st.d            $fp, $sp, 48(0x30)
    10:    st.d            $s0, $sp, 40(0x28)
    14:    st.d            $s1, $sp, 32(0x20)
    18:    st.d            $s2, $sp, 24(0x18)
    1c:    st.d            $s3, $sp, 16(0x10)
    20:    st.d            $s4, $sp, 8(0x8)
    24:    st.d            $s5, $sp, 0
    28:    addi.d          $fp, $sp, 64(0x40)
    2c:    lu12i.w         $a0, 15(0xf)
    30:    ori             $a0, $a0, 0xfff
    34:    move            $t1, $a0
    38:    ext.w.h         $a1, $t1
    3c:    srli.d          $a1, $a1, 0x1
    40:    lu12i.w         $t1, 524287(0x7ffff)
    44:    ori             $t1, $t1, 0xfff
    48:    move            $t2, $a1
    4c:    beq             $t2, $t1, 8(0x8)    # 0x0000000000000054
    50:    b               12(0xc)    # 0x000000000000005c
    54:    addi.w          $a5, $zero, 1(0x1)
    58:    b               12(0xc)    # 0x0000000000000064
    5c:    b               0    # 0x000000000000005c
    60:    b               0    # 0x0000000000000060
    64:    ld.d            $ra, $sp, 56(0x38)
    68:    ld.d            $fp, $sp, 48(0x30)
    6c:    ld.d            $s0, $sp, 40(0x28)
    70:    ld.d            $s1, $sp, 32(0x20)
    74:    ld.d            $s2, $sp, 24(0x18)
    78:    ld.d            $s3, $sp, 16(0x10)
    7c:    ld.d            $s4, $sp, 8(0x8)
    80:    ld.d            $s5, $sp, 0
    84:    addi.d          $sp, $sp, 64(0x40)
    88:    move            $a0, $a5
    8c:    jirl            $zero, $ra, 0

Without this fix, it seems like the prog is trapped in an infinite loop.

This patch looks good to me, so I am going to offer:

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

Cheers,
--
Hengqi

> Huacai
>
> >
> > Fixes: f48012f16150 ("LoongArch: BPF: Support sign-extension mov instru=
ctions")
> > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > ---
> >  arch/loongarch/net/bpf_jit.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.=
c
> > index 169ff8b3915e..8c907c2c42f7 100644
> > --- a/arch/loongarch/net/bpf_jit.c
> > +++ b/arch/loongarch/net/bpf_jit.c
> > @@ -480,10 +480,12 @@ static int build_insn(const struct bpf_insn *insn=
, struct jit_ctx *ctx, bool ext
> >                 case 8:
> >                         move_reg(ctx, t1, src);
> >                         emit_insn(ctx, extwb, dst, t1);
> > +                       emit_zext_32(ctx, dst, is32);
> >                         break;
> >                 case 16:
> >                         move_reg(ctx, t1, src);
> >                         emit_insn(ctx, extwh, dst, t1);
> > +                       emit_zext_32(ctx, dst, is32);
> >                         break;
> >                 case 32:
> >                         emit_insn(ctx, addw, dst, src, LOONGARCH_GPR_ZE=
RO);
> > --
> > 2.42.0
> >
> >
