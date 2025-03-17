Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700D313B7B3
	for <loongarch@lists.linux.dev>; Mon, 17 Mar 2025 02:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742179295; cv=none; b=jctDNleZcTu6gdx3dXrs7Ik8Ndj7+CKPDU5QlROTX9LMS1jroF2MKGcCVvXcf78Kg8OPzvDrbZ9NRqGAt+H8NqG9grM3cIHCnKKLWAlrEy13/svFGBpq0GvgmyjsyGF1m2djUtpcJRoQlBsUkJdhVAjF+T5zFdtmEgaz+aoXh+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742179295; c=relaxed/simple;
	bh=cqLFEvG1wxgpkBW7YgoWE3nJ16G7LJwwO5DFVPeKK7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JoiNfcuRsrihVkc7nFFnaCy986NpTsYSld2pZUHK49sIE2N+fC6UfJUG5PkgBEM1UZZQRCqkWH+6iwoRuHqHMJH6/6e+mkTMMceoW2hPj2+STq9EmJC0N7rJ7jpQh8UseIUW3LEjGlzB5DHgy1QUfGnsUS2HU/+U0OZ4QEJ2GvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fm3oKQMY; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fm3oKQMY"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47677b77725so39120601cf.3
        for <loongarch@lists.linux.dev>; Sun, 16 Mar 2025 19:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742179292; x=1742784092; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSGyPOqlFrFHPNN20qwckg91kjbzGdcRDUlqTQHsUYE=;
        b=Fm3oKQMY5FUhb/N1ruIFuR3aLsWG35n5pyFTW35UrRSkpG4/+QnSGtp+xuPs7ZTLfZ
         Fl5GNy0RFcm2MdWP+hT2JXZMaTE5sv6Bk/fZQchg45v4SZ3330IBtLQMNN5Nq4pyXuyJ
         CL3BK4VizmXwl6lvYLNT5f8mBnlDex0Bv+It7PferLsLReXKPPgLOtz5BSV6CyGEkRTR
         s7AMIym1xQ+E6IFaWGcbv1Xge7z52JZEAlX7QY6zKJpge/0RVYvuA5LGZ4wwINEVTq/Q
         GvmsaBx+DKtxydqw3/Tp8w9/w0FVOX1cErbV3ZUzLUHLbo6SRW0hWBhYns4AMyf1k6mA
         l3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742179292; x=1742784092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSGyPOqlFrFHPNN20qwckg91kjbzGdcRDUlqTQHsUYE=;
        b=sxcaWYLHJpiIip/PrCNwoT2QP/e7IgTFOxa9QJSHdt94f3aVIrEkUQCwayUZqUBsNQ
         JOuM5nvDtUX/LbMzE6Ujfs+r1EjGMQ9uzDsv805GjClezPopzPa2hY3dorlfasf1hj55
         Aagvyr/lZvmCruNX4qg26n1V182yPa3MdxkXDfGoPBTAbzW/n8cKB0stQdPMMUP4rrYd
         zEn2CgGteofnxvu9adgnQ3Ju+++m4ezJxPbNCmtMaooZfmTyXu1JkRNIVtlOzyINBXHu
         MoWoPB5W+OYXIIMkyF2Xr9DMK8FanYJosu6bDvXMMzOVH6eR23uIkGjT6oFUlMotAf7Y
         q15w==
X-Gm-Message-State: AOJu0YzOlE5XCNQ6UM/DwnEUV+q6lqwLmS7kDHy+pPv8spR248NqKh8G
	1ipphSFno2AALMLyqB/l/MczxUpqgb/DuMNUBHiBIylNSd4BegvIOckILqCE+TMvVpBmwg5lFQz
	amJWbFHZFzC1jBNHfd3281r6T3Uk=
X-Gm-Gg: ASbGncshOQaBgX7tX3/3RK52jQSHL07As2LxhoZ/ZlZqZcve88CUUk6yKZO1b14l4QG
	jWFIlWvxQMfs21rDJOFDdvIijEOnYi50CtsmkzZ7vHmv+lnQZiErrMURtBU3lcoGwhEQ277NtbP
	SSyO39GPW5Hf/kZ7OtmyAnRkuaZTIHhhMMoh6SLhLq2KAbMpI0teVQ7rctDw==
X-Google-Smtp-Source: AGHT+IH6qRJmi+iD5hw+hOKBliR9O//9T7+ZaQPgYEAntzWAc4cne+bz2Dd8PUzK9LVQ+S8twqS8DM/2BqVZ+1uL66I=
X-Received: by 2002:ac8:5716:0:b0:476:ad9d:d4e9 with SMTP id
 d75a77b69052e-476c815c75amr127687121cf.24.1742179292156; Sun, 16 Mar 2025
 19:41:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250317015755.2760716-1-hengqi.chen@gmail.com>
In-Reply-To: <20250317015755.2760716-1-hengqi.chen@gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Sun, 16 Mar 2025 19:41:21 -0700
X-Gm-Features: AQ5f1Jo9X4-WTXdC8K3aaojw_lagAanfpjbuAk62GOopvtFp_Gu1dOjsSj5Tshg
Message-ID: <CAK3+h2z4AGA8ekAcz3q5bALp1S0hXjJEq2roMAdq6MdKdPhtmg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: BPF: Use move_addr() for BPF_PSEUDO_FUNC
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev, bpf@vger.kernel.org, chenhuacai@kernel.org, 
	yangtiezhu@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 16, 2025 at 6:58=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> Vincent reported that running XDP synproxy program on LoongArch
> results in the following error:
>     JIT doesn't support bpf-to-bpf calls
> With dmesg:
>     multi-func JIT bug 1391 !=3D 1390
>
> The root cause is that verifier will refill the imm with the
> correct addresses of bpf_calls for BPF_PSEUDO_FUNC instructions
> and then run the last pass of JIT. So we generate different JIT
> code for the same instruction in two passes (one for placeholder
> and one for real address). Let's use move_addr() instead.
>
> See commit 64f50f657572 ("LoongArch, bpf: Use 4 instructions for
>  function address in JIT") for a similar fix.
>
> Fixes: 69c087ba6225 ("bpf: Add bpf_for_each_map_elem() helper")
> Fixes: bb035ef0cc91 ("LoongArch: BPF: Support mixing bpf2bpf and tailcall=
s")
> Reported-by: Vincent Li <vincent.mc.li@gmail.com>
> Closes: https://lore.kernel.org/loongarch/CAK3+h2yfM9FTNiXvEQBkvtuoJrvzmN=
4c_NZsFXqEk4Cj1tsBNA@mail.gmail.com/T/#u
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>  arch/loongarch/net/bpf_jit.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index ea357a3edc09..b25b0bb43428 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -930,7 +930,10 @@ static int build_insn(const struct bpf_insn *insn, s=
truct jit_ctx *ctx, bool ext
>         {
>                 const u64 imm64 =3D (u64)(insn + 1)->imm << 32 | (u32)ins=
n->imm;
>
> -               move_imm(ctx, dst, imm64, is32);
> +               if (bpf_pseudo_func(insn))
> +                       move_addr(ctx, dst, imm64);
> +               else
> +                       move_imm(ctx, dst, imm64, is32);
>                 return 1;
>         }
>
> --
> 2.43.5
>

Thanks Hengqi for the quick fix! tested and verified working now.

[root@fedora xdp-tools]# uname -a
Linux fedora 6.14.0-rc5 #2 SMP PREEMPT_DYNAMIC Sun Mar 16 17:16:21 PDT
2025 loongarch64 GNU/Linux

[root@fedora xdp-tools]# ./xdp-loader/xdp-loader load  -vvv lo -m skb
-P 80 -p /sys/fs/bpf/xdp-synproxy-tailcall -n synproxy_tailcall
./xdp-synproxy-tailcall/xdp_synproxy_tailcall.bpf.o
Current rlimit 8388608 already >=3D minimum 1048576
Loading 1 files on interface 'lo'.
  libbpf: loading object from
./xdp-synproxy-tailcall/xdp_synproxy_tailcall.bpf.o
...
  libbpf: map 'tail_call_tbl': created successfully, fd=3D4
  libbpf: pinned map '/sys/fs/bpf/xdp-synproxy-tailcall/tail_call_tbl'
  libbpf: found no pinned map to reuse at
'/sys/fs/bpf/xdp-synproxy-tailcall/values'
  libbpf: map 'values': created successfully, fd=3D5
  libbpf: pinned map '/sys/fs/bpf/xdp-synproxy-tailcall/values'
  libbpf: found no pinned map to reuse at
'/sys/fs/bpf/xdp-synproxy-tailcall/allowed_ports'
  libbpf: map 'allowed_ports': created successfully, fd=3D6
  libbpf: pinned map '/sys/fs/bpf/xdp-synproxy-tailcall/allowed_ports'
  libbpf: map 'xdp_synp.rodata': created successfully, fd=3D7
  libbpf: map 'tail_call_tbl': slot [0] set to prog 'syncookie_xdp' fd=3D65
 libxdp: Loaded XDP program synproxy_tailcall, got fd 66
 libxdp: Duplicated fd 66 to 3 for prog synproxy_tailcall
 libxdp: Replacing XDP fd -1 with 3 on ifindex 1

[root@fedora xdp-tools]# bpftool prog
...
55: xdp  name syncookie_xdp  tag 1426f5e6593da050  gpl
loaded_at 2025-03-16T19:38:49-0700  uid 0
xlated 8392B  jited 6412B  memlock 16384B  map_ids 11,10,12
btf_id 75

56: xdp  name synproxy_tailcall  tag 0433e599459b925f  gpl
loaded_at 2025-03-16T19:38:49-0700  uid 0
xlated 192B  jited 328B  memlock 16384B  map_ids 9,12
btf_id 75
