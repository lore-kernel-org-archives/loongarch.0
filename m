Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C551A1DDC0F
	for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 11:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752665647; cv=none; b=jxDKowJ6bu9PWwSMSmu3EcXJ8gE914ZA8tyFc+CCvtOrCGyRjmObJn3winKzZoaxdIt3I7AZq6QVkCnZV9OxyXx/TeckaBHFql3P9dCvAjvOOeO/SwcLqhWvXuxdxbFWvgliGd7LECnUVcu5LbmOF8C5xvXe8rXV6p1wI+fGUqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752665647; c=relaxed/simple;
	bh=KWyn0SNq2GNipqxpl7WVzEfJ1H93KzyTOZdOdF3jxY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hZjcHh474udHB4bMeFckL7SUX69l5Z6D13jLBCsMZ/lpD6RGK5vfUnxuOVqgxTWCYbVFKqY+U2z4dNFTGlfpbsFJvC7cHD8f2fZ8P+7GeO0stsubR6/MA7D2hmjB6TYqBfOMn0jIid4H6ccpuNPz37TdnKt9uoclrO034zL57Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dj7neCW+; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dj7neCW+"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6159e23a6dbso276725eaf.3
        for <loongarch@lists.linux.dev>; Wed, 16 Jul 2025 04:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752665645; x=1753270445; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAcVyiKfBCpz2acqj/YrO+QxAOg+5ZsQwlmATYrqxAY=;
        b=Dj7neCW+M5GZy2fXq9O0+Aw9d6Rgx47/pyKKH1BUxX4+K1cuGGW8ljysjK9mbVgofV
         xG5X7VM4PL0UN6uV6zUReOhSPLSSGF6osT30HahD8isBEfNaCcz1HvE9oNarYaPUvIqe
         TBAmqucxb774Na8gDl/ChKEBpC5osBDI7xg7UaGWOjtFRFN9PK6bSnVVgqf0xJh2ev9d
         p5ryde5rVDjlSjUZ12Mclx55h7lxQqBeAScgGXqakScAQ0+VG9uhGZBKjDLN7bLWvFen
         RaO4ytY+T5orgr81UjoI4dU6BjFhyG8NwkHaMeuoGA9u8ZGM735HAP4EiG1LSc5vtJNz
         XlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752665645; x=1753270445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAcVyiKfBCpz2acqj/YrO+QxAOg+5ZsQwlmATYrqxAY=;
        b=XRJsycIoljgK+wTEJOEuCF9IG26Z2Be452OUCk66XTD+ZOCknLv5QSIzJhvitz4IJ9
         pkm3Xa5GKVJSjOknDtnQXtMe3zlLHPoi40tH75QQDkKNHVJVF4BFKH0z+qReP3nOPCid
         tRUcc3NwDcl/w5hGeG+dPH7c/B9tF0PTEU+aj0Sfr3RTwEhRk6big+OoWe+yaF8yuo0W
         s41Z3dXH6dwlTj1zWcwscBBZ2Cxd4jdSy5YozpP23cm2iI/Xy7HLuKwWgYX2HRIcLS5/
         kjIKvuLmELxAqGuav2nS+nfK8hJAc5ZghsBgQQQpYOlOoRGABa18hrEcuhai+qDa9KsH
         qIZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV87HMeXmsdmBMyOo1TJ1b0H4Hr3L7qQjW/qf40nl+ZvRv5J05wyNz+OYCQ4+5Ld8Nj1xnZxnUbFdU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqK38yoaSn6vCJyQFDbatQYuvuCZtOxSOd0VKL9ePY7kti56Jj
	6sUm5rNv+xfI5/BAIjslAImt9+xl4YengJhC+FCqbWDC6X1YgqPXJKJyX6cKf0JrUvwinyBgu3C
	x3a3kLs7u4fGvx8zSF2AYqRp68xeNxcw=
X-Gm-Gg: ASbGncu61HkVG0ZvWEz+X5WRDrXR7dwH0hrVSKgxdYUKHaU+C8SLnl88KyQtTeQQ+78
	Omhl3bINbN8SGHyqfC+CJ6ypwJsWvjHV7NGfCkiZBtJKXGWOIFLTbSskMLN95cdRpzXNU2IGmSn
	hheFSCs/uAfMcyTpjGTkt7QcyWggoYjhxR8VkwFpql3BOQNtbTqm2pwP8FcUh+KCSqU8StEDqhc
	XlTCBo=
X-Google-Smtp-Source: AGHT+IHjUVB8DeJdmYYw68fY49A7S/gg5agMGiXYQe6PaBXLkFDQIAda+1U9vHi8M4p8rSdTkAvaO5Tapl1Fhp1drXM=
X-Received: by 2002:a05:6808:7003:b0:41b:3d20:a094 with SMTP id
 5614622812f47-41d049968dbmr1654821b6e.25.1752665644606; Wed, 16 Jul 2025
 04:34:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250709055029.723243-1-duanchenghao@kylinos.cn> <20250709055029.723243-2-duanchenghao@kylinos.cn>
In-Reply-To: <20250709055029.723243-2-duanchenghao@kylinos.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 16 Jul 2025 19:33:51 +0800
X-Gm-Features: Ac12FXweD0Sx1J-1wZxPububLXCVBHc4Mt7YozKGWOCrJj4wKvG6dPBm5LpT0qo
Message-ID: <CAEyhmHSB32tPYbUKqqxFWQqnyDGcNPQsCqBKGdNRrn+U+jMimw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] LoongArch: Add the function to generate the beq
 and bne assembly instructions.
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	yangtiezhu@loongson.cn, chenhuacai@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, kernel@xen0n.name, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	guodongtai@kylinos.cn, youling.tang@linux.dev, jianghaoran@kylinos.cn, 
	Youling Tang <tangyouling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 1:50=E2=80=AFPM Chenghao Duan <duanchenghao@kylinos.=
cn> wrote:
>
> Add branch jump function:
> larch_insn_gen_beq
> larch_insn_gen_bne
>

Please drop the period from subject line.
The commit message is kind of vague...

Maybe:
    LoongArch: Add larch_insn_gen_{beq,bne} helpers

    Add larch_insn_gen_beq() and larch_insn_gen_bne() helpers
    which will be used in BPF trampoline implementation.


> Co-developed-by: George Guo <guodongtai@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> Co-developed-by: Youling Tang <tangyouling@kylinos.cn>
> Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
> Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
> ---
>  arch/loongarch/include/asm/inst.h |  2 ++
>  arch/loongarch/kernel/inst.c      | 28 ++++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/a=
sm/inst.h
> index 3089785ca..2ae96a35d 100644
> --- a/arch/loongarch/include/asm/inst.h
> +++ b/arch/loongarch/include/asm/inst.h
> @@ -511,6 +511,8 @@ u32 larch_insn_gen_lu12iw(enum loongarch_gpr rd, int =
imm);
>  u32 larch_insn_gen_lu32id(enum loongarch_gpr rd, int imm);
>  u32 larch_insn_gen_lu52id(enum loongarch_gpr rd, enum loongarch_gpr rj, =
int imm);
>  u32 larch_insn_gen_jirl(enum loongarch_gpr rd, enum loongarch_gpr rj, in=
t imm);
> +u32 larch_insn_gen_beq(enum loongarch_gpr rd, enum loongarch_gpr rj, int=
 imm);
> +u32 larch_insn_gen_bne(enum loongarch_gpr rd, enum loongarch_gpr rj, int=
 imm);
>
>  static inline bool signed_imm_check(long val, unsigned int bit)
>  {
> diff --git a/arch/loongarch/kernel/inst.c b/arch/loongarch/kernel/inst.c
> index 14d7d700b..674e3b322 100644
> --- a/arch/loongarch/kernel/inst.c
> +++ b/arch/loongarch/kernel/inst.c
> @@ -336,3 +336,31 @@ u32 larch_insn_gen_jirl(enum loongarch_gpr rd, enum =
loongarch_gpr rj, int imm)
>
>         return insn.word;
>  }
> +
> +u32 larch_insn_gen_beq(enum loongarch_gpr rd, enum loongarch_gpr rj, int=
 imm)
> +{
> +       union loongarch_instruction insn;
> +
> +       if ((imm & 3) || imm < -SZ_128K || imm >=3D SZ_128K) {
> +               pr_warn("The generated beq instruction is out of range.\n=
");
> +               return INSN_BREAK;
> +       }
> +
> +       emit_beq(&insn, rj, rd, imm >> 2);
> +
> +       return insn.word;
> +}
> +
> +u32 larch_insn_gen_bne(enum loongarch_gpr rd, enum loongarch_gpr rj, int=
 imm)
> +{
> +       union loongarch_instruction insn;
> +
> +       if ((imm & 3) || imm < -SZ_128K || imm >=3D SZ_128K) {
> +               pr_warn("The generated bne instruction is out of range.\n=
");
> +               return INSN_BREAK;
> +       }
> +
> +       emit_bne(&insn, rj, rd, imm >> 2);
> +
> +       return insn.word;
> +}
> --
> 2.43.0
>
