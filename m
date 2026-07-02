Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F882334C1D
	for <loongarch@lists.linux.dev>; Thu,  2 Jul 2026 05:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782971155; cv=pass; b=LM18X6VZ+A0g1b0pvWVw/r3ZthJ/x2vqqwTSVqmAqwUTsKCUNqvaph/dn5Xp/1Cam2NwGWDu3zJpNv6XkfvUkVypdbXcqavCDjPohfdcMPNkD6jbVscIoBKQflzZ98pIxn41PW5kxbu+L34MYMUpZTwJwylOCG7TRSRuiiV1SaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782971155; c=relaxed/simple;
	bh=Us3lu8rsfoACo6kmNWJ4XBU97yH87OXVkzYnIs3HwPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPNZes+ChjNErbkuDAICwUcvfsznpOGx7GmoLft7l+FoOlVHEEcEa6ND5F+mLJazOo13jCcoHj64VPS3p8yzruQTDE9HXMvu1wSWbovt345k2ElhIa6AGJjQKh/b4VoCquvq/tcHdaZWXkvjAQeHSbKFeJqxmIeUBYdDPCQq5tI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mb/hGN9G; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mb/hGN9G"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-845537740ddso913242b3a.0
        for <loongarch@lists.linux.dev>; Wed, 01 Jul 2026 22:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782971153; cv=none;
        d=google.com; s=arc-20260327;
        b=KE/6g0b+ViN16WQIibYPs2e6YHLeca+jrDxKAtbWASA0N0DJFFBPFkyEzIqQnljUZp
         3XudqKX45poJ0O2C1QQaiB69s+uq/nvWLTAUb+/77Piok+6xRPEVxv14QrqLpjFSdEUN
         w5vp+5tK44djWwgaeqOSuvwLCHnFKJfDCbEW+x7Q9jr7efvhob2GdDv/AVw5PqMb19M3
         fzj1SBSWjIA/Vh/Wc/eGw2vKpRQDSd1KDBm87jLVMuzM7tTWEfRw/mglSWK/1RkskROK
         rBpHGiWehYwH4RGt9QqjziJtm2Y0IIlD7OpWCZLHi4GhE+RQ5J2GmAVUrNEsQC3i7uEm
         BtNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g0PcjHDH5/g1AUnjwMi1NoqoefhH/oCGnp5l0FHu/gY=;
        fh=iMEODk/JRIZwtd4lBSbvHLS1jyFZg8iCfx3IypYPUG0=;
        b=RX4KF5f+NlnugxrlxfMgjWAwE8qYej2wxSqGr2Q7IJoyxTVF27cf3JWsnTYs01Nl5O
         k30jfO/2ceZNY+vWS/A9CDlNZ6OdbzoLaiMJXaYWdJ6uUajfjVtiTHSQabcR9jHuoCue
         Tg5kQF6AZyDSJ16spPhTHwyCcdWdYnmrTSyMgjLDngtvhxAaPYOVNIXUGOa6Mb5lqX+X
         E1RTzHzGVk70b4Nlc0k7+DefBaSqqs4lZooSZy0DGYiixceMYgcyOSH+hhwEmnMBoKrh
         0Nhd4FRzaPAE0o2yqMMWbwdbeczHpMxeIoUtpWTnVLYrmMPeCWTHetqak299GbqErqI0
         bAGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782971153; x=1783575953; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g0PcjHDH5/g1AUnjwMi1NoqoefhH/oCGnp5l0FHu/gY=;
        b=Mb/hGN9GyHPuKsT+ZcNX9uSHpo6KgnRi6YINLeSLe6N0aV7e0jl7qUjrGVhFIkE3Vl
         bP4qmN1rr/Qro0rAVgvTPIHzVyBWD+nisydlIMT9vU3/iSGqSsLaHuWkdqERtltM2nNq
         mPuOm0TSS4J410jrhnorO0gZ5utqoWja3C1gSlnXFdyomvxKScNVf6Mc5C+kDqjGHdE9
         q14HVVX6YiYde2CXk6phR59zHHZ23wNW7843ppG3zk+bv0TtDp1Neu3m5iuvMrVBQc7N
         UXRy1Kmf5vp+IRrHNDGo8veAFNoL61Wq2j8KhLEgnyqM8+KpwIu4f7attbxZ7wz0Bm1M
         GkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782971153; x=1783575953;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g0PcjHDH5/g1AUnjwMi1NoqoefhH/oCGnp5l0FHu/gY=;
        b=OK2x75THfEYOfsm0d7jPOQnBMen8NbBiU4LIN5/x0pf23mDZRgbN4j1m0ISSJD4mc/
         +xjaiX+lyH50mJHGRhe8XbpGylVopVB0s5fSELCgk7t9pRgRLtRYnu/5KzCBN70VeJvc
         4mv5LStGz/I01ULsud8Rz8Z0FLH+Q2czCLcvf4NWEDksjE9zAyhYoHJILb1rfamVj9dv
         yKDHDXe0IZst3slb5rlvVXs/zk63H1cwPMecN4Oa9l2U7S3zrP6QSlNwB0/dwMl8HzOm
         JlJzBprAbtW0Vi2LTU0I07wVNt/FygUej7XfUMAuzXlwTC15kW1FHAnYoBAWBnLUqNhu
         Fn8w==
X-Forwarded-Encrypted: i=1; AHgh+RrPLRsqBxQo7kIkpZDJBZSPQnzMXx+lcCMnIwTyXtlJOATgwUsTX6tXeQcPiTg+9p4Cfe+WztDD7Ts=@lists.linux.dev
X-Gm-Message-State: AOJu0YxyUDkfHGhCCeGA+h8A+BDM+ChqEpeo1Sjhgxe4EDgWjUbM6Lf7
	+6NL0GT8g8jq4zSRRHMxirGtE8WhEwz5ailXNkv3taNzeugcIYV5PrnZt/2O8snFug3M7kJ9mcn
	2rFkZcw2EztD93XhUB422WTfFp7l+CLc=
X-Gm-Gg: AfdE7ckEbOM4sgHWlQuM1XcJ9x2ku44KAmX+OOc51KJkUXlgPrg/ZN2Y8RDh0++IIqx
	/9TcEKvjNhV3+5TP4hCHoMUjjMoEspycewLrrl1ednJ5jh3DznOPiGDPOYCMn0+rddFsLeQe5Fb
	sUr+PSQslpeRBXvCdeWi+tJghCFReJqSPwvF/t+hZ7Entc48++v2DCsRofM7aecjA265EiVdb+r
	2Kt8tvIxY3EnEYE/sWLU90TJN5nZYAaIWofRshRlVinLUkkCVTxRm/Gl2EIWLv8rL3tikjDynDM
	lqt5LZ2MhgvI9cjnGpvA1MurbEYcmy2jPjzjdYcaBISd+nNRYKTTavh/TUCdcjSNrGmbpuzvu7H
	MxoQd2OrJ4MxILg==
X-Received: by 2002:a05:6a00:4b47:b0:845:44c7:2fdd with SMTP id
 d2e1a72fcca58-847c5130544mr3668709b3a.34.1782971153059; Wed, 01 Jul 2026
 22:45:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260702053127.23599-1-yangtiezhu@loongson.cn>
In-Reply-To: <20260702053127.23599-1-yangtiezhu@loongson.cn>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 1 Jul 2026 22:45:41 -0700
X-Gm-Features: AVVi8CfJEaFhpmz9Qe-b-2hBo1s2crIx9Qi4j5yRvwaaHjxO4nI2WoWc3T7AS5Q
Message-ID: <CAADnVQJodzDppDUjSYXra-jCo3J32t7=h32bHm4tQei-+5P72w@mail.gmail.com>
Subject: Re: [PATCH bpf-next v6] bpf: Reject programs with inlined helpers if
 JIT is unavailable
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, KaFai Wan <kafai.wan@linux.dev>, bpf <bpf@vger.kernel.org>, 
	loongarch@lists.linux.dev, Leon Hwang <leon.hwang@linux.dev>, 
	Puranjay Mohan <puranjay@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 10:31=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> When an architecture implements bpf_jit_inlines_helper_call(), such as
> LoongArch, ARM64, PowerPC, and RISC-V, the verifier skips rewriting the
> helper call offset (insn->imm) during the bpf_do_misc_fixups() phase,
> because the helper is expected to be inlined by the JIT compiler. As a
> result, insn->imm remains as the raw helper enum ID.
>
> However, if JIT is disabled at runtime (net.core.bpf_jit_enable=3D0) or
> if the JIT compilation later dynamically fails (e.g., due to OOM), the
> core BPF subsystem falls back to the BPF interpreter.
>
> When the interpreter executes (__bpf_call_base + insn->imm) with the
> unpatched raw helper ID, it jumps into an unaligned invalid address
> space, triggering an instruction alignment fault or a memory access
> panic.
>
> To avoid modifying the BPF interpreter's complexity for JIT-specific
> paths, just introduce a 'jit_required' flag in struct bpf_prog. When
> a program contains helper calls that skip rewriting for JIT inlining,
> set this flag to 1. During runtime selection, if JIT compilation is
> not available, explicitly reject loading with -ENOTSUPP instead of
> falling back to the interpreter, safely preventing the kernel panic.
>
> Fixes: 2ddec2c80b44 ("riscv, bpf: inline bpf_get_smp_processor_id()")
> Suggested-by: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
> v6:
>   - Place 'jit_required' as a standalone u8 field right before 'stats'
>     to reuse the existing 4-byte struct hole (offset 52) based on pahole
>     analysis, avoiding the u16->u32 bitfield conversion in v5 which
>     unintentionally changed the layout/alignment of subsequent fields.

v5 had AI written all over it. v6 is not any better.
Please ask AI whether your v6 is any better than v5 ?
Then analyze replies as a human.

pw-bot: cr
