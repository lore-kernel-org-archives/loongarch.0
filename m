Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE11748C
	for <loongarch@lists.linux.dev>; Sat,  9 Dec 2023 12:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MaU+cL8F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5189C433CA
	for <loongarch@lists.linux.dev>; Sat,  9 Dec 2023 12:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702123315;
	bh=ivFsOSgwviRbxCdV/HZOaDIko5Llynvw15OE80tETss=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MaU+cL8FnSJCL5k2K8QhOzLor81yo9ImCRnWMnhPcP1bxO2ljA/GZq0lZWvN7pzRH
	 NTPgdqW2qq1eO4N4AYGJtj9uJ6HZURtre7ySk28wk9m5iYp1TkidGV9+CNOafNP4B2
	 +yaQN/59F5s8MzSTsJENWzj46FEwFmaNd7uSdsq8/SP+Z3kshnJJxf7B3af8vt+xgW
	 AZ0FWZKv2uZgVhUxpdJ9Tp6qI8r+6AQ1e1CmdBs0MVZ437A3F2OdvP3Fwbb5ZbeqcA
	 5/aMKX20yTq9d6TxsMYgeBS/3qgo4RpyCVNvgCsBk6FhHeCudQGWZcC8S1Hn8cTO6y
	 eg6qBiB5SeTEA==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-54f4f7d082cso2101015a12.0
        for <loongarch@lists.linux.dev>; Sat, 09 Dec 2023 04:01:55 -0800 (PST)
X-Gm-Message-State: AOJu0Yxp06u1hOb9for7iwvAv5Obqq+Newh6YOUU07wblX3jknv2Ni2E
	aHa99+/q8PTG+pt3n9+mJcRDKmQzo92kKz7q3P4=
X-Google-Smtp-Source: AGHT+IHyvMsUFvPg2VTnl9SYqVZLp2t4+7XqzZsBzz6PBP5lSDwXKnWjYvHkbN1WosxnVz60tLIV3jDoe8KP85A1WJ8=
X-Received: by 2002:a17:907:7663:b0:a18:b889:d453 with SMTP id
 kk3-20020a170907766300b00a18b889d453mr793925ejc.2.1702123314320; Sat, 09 Dec
 2023 04:01:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231207032951.16334-1-yangtiezhu@loongson.cn>
 <20231207032951.16334-3-yangtiezhu@loongson.cn> <CAEyhmHRs-bJ7Pd9t1wqs4H8FBYZg27gi7gXWZjpEqzLT+naAHA@mail.gmail.com>
In-Reply-To: <CAEyhmHRs-bJ7Pd9t1wqs4H8FBYZg27gi7gXWZjpEqzLT+naAHA@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 9 Dec 2023 20:01:44 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5ysu4FhFsrY6iof1WtAHJno1Jfx+g0FD5Ah66au_1m5Q@mail.gmail.com>
Message-ID: <CAAhV-H5ysu4FhFsrY6iof1WtAHJno1Jfx+g0FD5Ah66au_1m5Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] LoongArch: BPF: Fix unconditional bswap instructions
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Sat, Dec 9, 2023 at 2:06=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com> =
wrote:
>
> On Thu, Dec 7, 2023 at 11:30=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.=
cn> wrote:
> >
> > We can see that "bswap32: Takes an unsigned 32-bit number in either
> > big- or little-endian format and returns the equivalent number with
> > the same bit width but opposite endianness" in BPF Instruction Set
> > Specification, so it should clear the upper 32 bits in the case 32
> > for BPF_ALU and BPF_ALU64.
> >
> > [root@linux fedora]# echo 1 > /proc/sys/net/core/bpf_jit_enable
> > [root@linux fedora]# modprobe test_bpf
> >
> > Before:
> > test_bpf: #313 BSWAP 32: 0x0123456789abcdef -> 0xefcdab89 jited:1 ret 1=
460850314 !=3D -271733879 (0x5712ce8a !=3D 0xefcdab89)FAIL (1 times)
> > test_bpf: #317 BSWAP 32: 0xfedcba9876543210 -> 0x10325476 jited:1 ret -=
1460850316 !=3D 271733878 (0xa8ed3174 !=3D 0x10325476)FAIL (1 times)
> >
> > After:
> > test_bpf: #313 BSWAP 32: 0x0123456789abcdef -> 0xefcdab89 jited:1 4 PAS=
S
> > test_bpf: #317 BSWAP 32: 0xfedcba9876543210 -> 0x10325476 jited:1 4 PAS=
S
> >
>
> Nice catch. I wasn't aware of test_bpf before. For the patch:
>
> Acked-by: Hengqi Chen <hengqi.chen@gmail.com>
>
> > Fixes: 4ebf9216e7df ("LoongArch: BPF: Support unconditional bswap instr=
uctions")
> > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > ---
> >  arch/loongarch/net/bpf_jit.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.=
c
> > index 8c907c2c42f7..da48398e8794 100644
> > --- a/arch/loongarch/net/bpf_jit.c
> > +++ b/arch/loongarch/net/bpf_jit.c
> > @@ -774,8 +774,8 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
> >                         break;
> >                 case 32:
> >                         emit_insn(ctx, revb2w, dst, dst);
> > -                       /* zero-extend 32 bits into 64 bits */
> > -                       emit_zext_32(ctx, dst, is32);
> > +                       /* clear the upper 32 bits */
> > +                       emit_zext_32(ctx, dst, true);
> >                         break;
> >                 case 64:
> >                         emit_insn(ctx, revbd, dst, dst);
> > --
> > 2.42.0
> >
