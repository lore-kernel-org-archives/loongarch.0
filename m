Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F521624DC
	for <loongarch@lists.linux.dev>; Mon, 17 Mar 2025 02:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742180328; cv=none; b=RZtdACFbbp1YHWUczdPpwraBXnvDAVgnkFNlcngAym6LIT1PbCGxv1dBel2ch+W9tZIwBXz1e8BPbSfiFUioaBUtDZFsVtvfeiToioe3g5ngoiQ+im4WB1oSYAbmprf1tFG0DMVdEqT6bQJdMWRwwHEVofNYo6k1DFzbGrGnet8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742180328; c=relaxed/simple;
	bh=13yvj5krrl6E9jnmMEhRzLUwYHXniRoOOiUU5IJiCWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C+w/wbXzDLdxMoD59h6FIKyuxIqzQnB9SA2aHzHVIq2FKCDAF4ncvX0GKzRv2NvphoA1xBem7OVm2eROhv8zwnj8g/ktw35JmPchV39obkWhBuFYseCOlbbe2AvGUqV1YmRcJQuJx0oZA2McPI19YZe86tzry7axcsanPzThjz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBZfcRbr; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBZfcRbr"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-476ab588f32so15111941cf.2
        for <loongarch@lists.linux.dev>; Sun, 16 Mar 2025 19:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742180325; x=1742785125; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJHOXmMHFhTPCZVIBP4tqeTzAQJ2H0JWwUkzr+VLRv8=;
        b=SBZfcRbrEuD18ImW3E4tKUu1WURWvXKMz1/XdEmDXx4btomtdwPJCfyl14HCLDc8Rn
         3ocOc++RZ3ZDPuAAaGNx8fZPbLgviZ16dqvYHM8U5qfyr4+H+MLYATdCcxJ/Ue5FZYsM
         Y7kKc6ajXSVmwu+qtQ15ozCiIn2LNgMJ1fHWChotwqw4cKKVplHa9L5ZGO9EEJ1IUMF5
         POYQCDTvz28J2Tw5h6PD8Axh5Wpq//45xpqyuLt4bgA9Xr4dfM3AmFaVeAjzuigH8oEI
         cNNiy6JqJYHFUoGntI8yC+uwJPMX8JQ+0BC4+pzwRbr04UuwdIG+oL22h5FIiXi1tkNM
         8TfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742180325; x=1742785125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJHOXmMHFhTPCZVIBP4tqeTzAQJ2H0JWwUkzr+VLRv8=;
        b=YYSkKY3sOVfTPJff0Jri5+hDAGmGH/0Ug5pq0v6Qp1jkwtdJ+/IgW9YW2ByLBMqL6R
         Cg3FJAlo6nPkZAnUYXmCBgUWjVEOGNGqkXjO3WRh3SEitdubAYTCd8HrNmqqazhkX0Oe
         UAZi0I75Dr2Pa9emoSL3JwNKDJmbmkjegOW5W3mHoxdGD9j3/UZmKL6mVXrQToQHXIZt
         MDcpjV2iyBQI913ZZr6S2wMCshugur25IgfUk78ednjb+mOgf2NplWyDTzO91kAu47Mt
         kg1OOUL45JwTMO1GyJe1pwdsvjuVkBYalLCoU/V48XfgU482zGY0/Xoe060BPCFVaAsv
         WKDw==
X-Gm-Message-State: AOJu0Yz68GrZQ7kNmyRYmMROWSf3NAbWTCJsCqCtfaIDScv6ybeLqFD9
	L7u/NZkG7GAZ8n8W0XFtO1h55LJpiFRZ8qHkTu72hRlC9eoaQczse8LmTtDNNAd0e8ktCcm3Kkc
	3BJJosa+qJpScWahT0Lms/H//vboz8A==
X-Gm-Gg: ASbGnctnqHlYu4srsBtzAnZuL9xTx9B4dD17j1zea+HaoBm0GlzxR96EKNOwq0JbruX
	6HntJgQ2mepapmxBTVyz/4FQyPNfE69n/WfdT6wzEL2AEYGZVhPYeCBjvyb6MW+OO/FnVIyQh0L
	G+Tpq7gKoQmJa5bkHahXLGrOiFAMEMAjJXzLVP/5GjGS7BaLHnxeLhafrBnGk=
X-Google-Smtp-Source: AGHT+IFISnow+315mUIhBfKvFnz3za89jozIfDqr6VRDIud+7dDHLSsYSLr4w2/sbTSYzDkgU9MXV5Wzwx/miDQEzBk=
X-Received: by 2002:a05:622a:6bca:b0:476:78a8:435c with SMTP id
 d75a77b69052e-476c8142f0dmr135701061cf.16.1742180325302; Sun, 16 Mar 2025
 19:58:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250317015755.2760716-1-hengqi.chen@gmail.com> <CAK3+h2z4AGA8ekAcz3q5bALp1S0hXjJEq2roMAdq6MdKdPhtmg@mail.gmail.com>
In-Reply-To: <CAK3+h2z4AGA8ekAcz3q5bALp1S0hXjJEq2roMAdq6MdKdPhtmg@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Sun, 16 Mar 2025 19:58:33 -0700
X-Gm-Features: AQ5f1JqKh0h6W9bWmDdx5y5oVefPnrWtyZ5y2zdIfKsYqKrIWnq5EqiBbH29kWg
Message-ID: <CAK3+h2zts0v7dGjL6P0Pr05bfLDyhn+kQEYVCMr0ShzxymFW5Q@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: BPF: Use move_addr() for BPF_PSEUDO_FUNC
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev, bpf@vger.kernel.org, chenhuacai@kernel.org, 
	yangtiezhu@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 16, 2025 at 7:41=E2=80=AFPM Vincent Li <vincent.mc.li@gmail.com=
> wrote:
>
> On Sun, Mar 16, 2025 at 6:58=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.co=
m> wrote:
> >
> > Vincent reported that running XDP synproxy program on LoongArch
> > results in the following error:
> >     JIT doesn't support bpf-to-bpf calls
> > With dmesg:
> >     multi-func JIT bug 1391 !=3D 1390
> >
> > The root cause is that verifier will refill the imm with the
> > correct addresses of bpf_calls for BPF_PSEUDO_FUNC instructions
> > and then run the last pass of JIT. So we generate different JIT
> > code for the same instruction in two passes (one for placeholder
> > and one for real address). Let's use move_addr() instead.
> >
> > See commit 64f50f657572 ("LoongArch, bpf: Use 4 instructions for
> >  function address in JIT") for a similar fix.
> >
> > Fixes: 69c087ba6225 ("bpf: Add bpf_for_each_map_elem() helper")
> > Fixes: bb035ef0cc91 ("LoongArch: BPF: Support mixing bpf2bpf and tailca=
lls")
> > Reported-by: Vincent Li <vincent.mc.li@gmail.com>
> > Closes: https://lore.kernel.org/loongarch/CAK3+h2yfM9FTNiXvEQBkvtuoJrvz=
mN4c_NZsFXqEk4Cj1tsBNA@mail.gmail.com/T/#u
> > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> > ---
> >  arch/loongarch/net/bpf_jit.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.=
c
> > index ea357a3edc09..b25b0bb43428 100644
> > --- a/arch/loongarch/net/bpf_jit.c
> > +++ b/arch/loongarch/net/bpf_jit.c
> > @@ -930,7 +930,10 @@ static int build_insn(const struct bpf_insn *insn,=
 struct jit_ctx *ctx, bool ext
> >         {
> >                 const u64 imm64 =3D (u64)(insn + 1)->imm << 32 | (u32)i=
nsn->imm;
> >
> > -               move_imm(ctx, dst, imm64, is32);
> > +               if (bpf_pseudo_func(insn))
> > +                       move_addr(ctx, dst, imm64);
> > +               else
> > +                       move_imm(ctx, dst, imm64, is32);
> >                 return 1;
> >         }
> >
> > --
> > 2.43.5
> >
>
> Thanks Hengqi for the quick fix! tested and verified working now.
>
> [root@fedora xdp-tools]# uname -a
> Linux fedora 6.14.0-rc5 #2 SMP PREEMPT_DYNAMIC Sun Mar 16 17:16:21 PDT
> 2025 loongarch64 GNU/Linux
>
> [root@fedora xdp-tools]# ./xdp-loader/xdp-loader load  -vvv lo -m skb
> -P 80 -p /sys/fs/bpf/xdp-synproxy-tailcall -n synproxy_tailcall
> ./xdp-synproxy-tailcall/xdp_synproxy_tailcall.bpf.o
> Current rlimit 8388608 already >=3D minimum 1048576
> Loading 1 files on interface 'lo'.
>   libbpf: loading object from
> ./xdp-synproxy-tailcall/xdp_synproxy_tailcall.bpf.o
> ...
>   libbpf: map 'tail_call_tbl': created successfully, fd=3D4
>   libbpf: pinned map '/sys/fs/bpf/xdp-synproxy-tailcall/tail_call_tbl'
>   libbpf: found no pinned map to reuse at
> '/sys/fs/bpf/xdp-synproxy-tailcall/values'
>   libbpf: map 'values': created successfully, fd=3D5
>   libbpf: pinned map '/sys/fs/bpf/xdp-synproxy-tailcall/values'
>   libbpf: found no pinned map to reuse at
> '/sys/fs/bpf/xdp-synproxy-tailcall/allowed_ports'
>   libbpf: map 'allowed_ports': created successfully, fd=3D6
>   libbpf: pinned map '/sys/fs/bpf/xdp-synproxy-tailcall/allowed_ports'
>   libbpf: map 'xdp_synp.rodata': created successfully, fd=3D7
>   libbpf: map 'tail_call_tbl': slot [0] set to prog 'syncookie_xdp' fd=3D=
65
>  libxdp: Loaded XDP program synproxy_tailcall, got fd 66
>  libxdp: Duplicated fd 66 to 3 for prog synproxy_tailcall
>  libxdp: Replacing XDP fd -1 with 3 on ifindex 1
>
> [root@fedora xdp-tools]# bpftool prog
> ...
> 55: xdp  name syncookie_xdp  tag 1426f5e6593da050  gpl
> loaded_at 2025-03-16T19:38:49-0700  uid 0
> xlated 8392B  jited 6412B  memlock 16384B  map_ids 11,10,12
> btf_id 75
>
> 56: xdp  name synproxy_tailcall  tag 0433e599459b925f  gpl
> loaded_at 2025-03-16T19:38:49-0700  uid 0
> xlated 192B  jited 328B  memlock 16384B  map_ids 9,12
> btf_id 75

Sorry missed the Tested-by,  you can add:

Tested-by: Vincent Li <vincent.mc.li@gmail.com>
