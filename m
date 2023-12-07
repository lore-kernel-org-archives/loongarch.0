Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784815670
	for <loongarch@lists.linux.dev>; Thu,  7 Dec 2023 04:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlS5viHc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE22DC433C7
	for <loongarch@lists.linux.dev>; Thu,  7 Dec 2023 04:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701922344;
	bh=0RjgV47unZBqHuDbjr4/VkAWoqZn4Tl76xtyIEWOyh0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nlS5viHch/RcAiCqRdfO+367ziRpUvnEvaoVtrJObtLC1jnMJI7FLhQLyHzrcIG/j
	 4fjUN5D4eTHuQOxE4OYY95R+GBA955UkmHTrIXEmLtUl6iXa8rUSP9LnBN3Hd7uIsP
	 Tw/RruHlM9j98uMOxtPgmfflwiBAyRyF2bUX7pPYLqjYyll6bZkMaGcmC3RUp45aXQ
	 qVe5PbpQhWf1MBB73vppPkNXf6ZUP1cYriT6D3Wwot8LEUIhJy9PwbayYi18VdAHB/
	 /FSIDDQuSDo9poqx/CvIYEPdq4QidgNQl62XfbtdtUZOtcOSQtQ4s2j3wWS4nMpSJh
	 yt5fCTtZZAX9A==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c9ee6fed3eso3644481fa.0
        for <loongarch@lists.linux.dev>; Wed, 06 Dec 2023 20:12:24 -0800 (PST)
X-Gm-Message-State: AOJu0Yz9m9jTUyqh73l5oxWb+3V9DkCh+PE2Z4DRaaOQ5kgGNiP6P2II
	6k5GRwZ+JrsCmPQCRyLLZhwlk5y/2jaWg95e9vg=
X-Google-Smtp-Source: AGHT+IHIPS1wDHWq56C+Y7X9N9a98eDKbLbm/xzE+PEo9oZw5MW4RGUFCfyRcPDXO2ej6s2EL9iNms2IOp97Li1iwrQ=
X-Received: by 2002:a05:651c:1030:b0:2c9:d872:e7b3 with SMTP id
 w16-20020a05651c103000b002c9d872e7b3mr1141856ljm.106.1701922343104; Wed, 06
 Dec 2023 20:12:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231207032951.16334-1-yangtiezhu@loongson.cn> <20231207032951.16334-2-yangtiezhu@loongson.cn>
In-Reply-To: <20231207032951.16334-2-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 7 Dec 2023 12:12:10 +0800
X-Gmail-Original-Message-ID: <CAAhV-H40YTpJP0giD6Y9ekfaceimpzuxqJndoBJiMU89YLA3zw@mail.gmail.com>
Message-ID: <CAAhV-H40YTpJP0giD6Y9ekfaceimpzuxqJndoBJiMU89YLA3zw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] LoongArch: BPF: Fix sign-extension mov instructions
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Hengqi Chen <hengqi.chen@gmail.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 11:30=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> We can see that "Short form of movsx, dst_reg =3D (s8,s16,s32)src_reg"
> in include/linux/filter.h, additionally, for BPF_ALU64 the value of
> the destination register is unchanged whereas for BPF_ALU the upper
> 32 bits of the destination register are zeroed, so it should clear
> the upper 32 bits for BPF_ALU.
>
> [root@linux fedora]# echo 1 > /proc/sys/net/core/bpf_jit_enable
> [root@linux fedora]# modprobe test_bpf
>
> Before:
> test_bpf: #81 ALU_MOVSX | BPF_B jited:1 ret 2 !=3D 1 (0x2 !=3D 0x1)FAIL (=
1 times)
> test_bpf: #82 ALU_MOVSX | BPF_H jited:1 ret 2 !=3D 1 (0x2 !=3D 0x1)FAIL (=
1 times)
>
> After:
> test_bpf: #81 ALU_MOVSX | BPF_B jited:1 6 PASS
> test_bpf: #82 ALU_MOVSX | BPF_H jited:1 6 PASS
>
> By the way, the bpf selftest case "./test_progs -t verifier_movsx" can
> also be fixed with this patch.
Hmmm, it is a little strange that privileged verifier_movsx has no problem.

Huacai

>
> Fixes: f48012f16150 ("LoongArch: BPF: Support sign-extension mov instruct=
ions")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/net/bpf_jit.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 169ff8b3915e..8c907c2c42f7 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -480,10 +480,12 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx, bool ext
>                 case 8:
>                         move_reg(ctx, t1, src);
>                         emit_insn(ctx, extwb, dst, t1);
> +                       emit_zext_32(ctx, dst, is32);
>                         break;
>                 case 16:
>                         move_reg(ctx, t1, src);
>                         emit_insn(ctx, extwh, dst, t1);
> +                       emit_zext_32(ctx, dst, is32);
>                         break;
>                 case 32:
>                         emit_insn(ctx, addw, dst, src, LOONGARCH_GPR_ZERO=
);
> --
> 2.42.0
>
>
