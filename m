Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6163595A
	for <loongarch@lists.linux.dev>; Thu, 31 Jul 2025 01:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753926081; cv=none; b=aI0dKUTg4khmHnmVAVz+ARKHkAjBgUX/qg2mNeJY+mCWyBRRsQ/NYVauoAGlEFDBQJVk31dqZ3DuF3D6qzyKqwqi4JFiJGH/8BdHEgZuCqWB1JxNAdJ9muRv6vdCy/fWLDSjIIt6eXTqejOWtCgWJYcgQReW2tfmPv+JipYiQfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753926081; c=relaxed/simple;
	bh=tdhLpmgh+j5ElD6i+pbMjfeZfwTGuAl+Bo5yjdqEWDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FnnI6VLQrwq3fiqI/NYZmAFLyDCdehkHl3wjHTs3FRKO5AVY1lc1ZaGJ6ecs+smmXY5qIULCVy3em73OeWbnJs2/u2c4VlI9BCcDCejdsV+srqK1rehR7Qa/zvTSX+MIkVzbUVLg29ncbODKyrc+OtCsKwKjQLl2+SFV2+wJXpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6IUzwws; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6IUzwws"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2ea34731c5dso510437fac.0
        for <loongarch@lists.linux.dev>; Wed, 30 Jul 2025 18:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753926078; x=1754530878; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fW77B+NyilRLW9+EkEB0yd2VhBMeDvYnsChu9AayKN8=;
        b=a6IUzwws14JrhlP9fO8JABzR2I0NXqWY2Oxv22icj6zbdF6H+ty3/xPQwAmjqrWP6B
         SlgvKizJZcbM2toeQDneRWhrYioYblUGZa2uVTAirVu2TQxHkBYA9IhEV+AQcgPVmLOT
         s9ZcNHh4qEXACUAD2P6g2tT/e2axTdHr7nYvrHyQ3JXV/dWmH9YyEK9/xioxgEreAxHN
         92WRWg6nfPiuTDielroDZBlq1c0OMWwrZtOdPbWtoPDgYkrw73ZtnEspmh45iEr3NHXI
         OnGXEJddWm3bWv7xzcMVGOasukeB7hrUfYw77VPms1QB1BANnpvMViIJ1aKlE4RVDiKg
         yRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753926078; x=1754530878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fW77B+NyilRLW9+EkEB0yd2VhBMeDvYnsChu9AayKN8=;
        b=GUzNqnxbB0twmupUVo8/xJUvUiywZqDRE/OH9p5pydAp0saMSy+zkEIc0ci5ulCjRH
         L96H0yfG76/P369DqhTtA3ehavks4dQoRuVphn+7xP9E+zm4K+2+XMkxoAGi7jTlK5mT
         6NGlKZZ6IOqtdtSVBPAj+wNtpXI2vxhJLiQwQEz7SJXkzdIy6zUG/RVAAGPUKyoLF9Sh
         eulx2h8IvcVnTFIz7+9FRy8hC3eAIHKsHdGrNy5Nxh/9KREtQOVd6sH6yxnnF/1Zkaw8
         OwUoRizHbgYC1bsB+hPWSvrx8uk0SFBBeHi22HyyXl8My7vTi52lwR9ONtfql7Fht9wa
         lcrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKVhlg6fGgfNVFoJ+CTnvWUppGbEvYmH6n4rJyXLw6Xan65IoTrZ03KEhCBfsKvNgloTL4cTcnI0Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzAj7tgoKhoEUbdxRGP/It57K31y0VlRgXDvIU4mI87HX0YoQRf
	OQZlYBWEUAeuEslfW2pbd7RtZ4dDp3E2WVkIqgLL5txcWes2XV9eCwBwvwfT8LE3EbNva0uVrGQ
	cSUpdybVMzTeFTL/vLkcRREg8aySpQdg=
X-Gm-Gg: ASbGncs8zQ8CFdMagMoq2cLpnkhQTqEpKBZVjkKOeR5+mU4pEZpQVRZAJ+F/XCpvYPr
	nxlR7QpEt8wBtna9gB8BP/HL2GYfOfiZ0e+DNUNK43qolQgLMmlAdMl1J5xc51UGa3h82PBgBdM
	qtpzvsJdVoLvc0GX3RpWfveekcrKGkk1xUv+8+LqPj7HBZwxZfRmb0X2+r/T6ZK9BLm4ry5l/Xz
	PbZDkl0pANOa7BG2w==
X-Google-Smtp-Source: AGHT+IGrwETmgwM/eaomky8/DWT5UsMd/7GLoLVGdUW9DDENQdNs73QE10nEsfnkG9YeUG3EETFAYGo5/JXi9CTKOeo=
X-Received: by 2002:a05:6808:306d:b0:433:577c:cd3a with SMTP id
 5614622812f47-433577cd705mr91843b6e.3.1753926077634; Wed, 30 Jul 2025
 18:41:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730131257.124153-1-duanchenghao@kylinos.cn> <20250730131257.124153-2-duanchenghao@kylinos.cn>
In-Reply-To: <20250730131257.124153-2-duanchenghao@kylinos.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 31 Jul 2025 09:41:05 +0800
X-Gm-Features: Ac12FXwfHcYZyp7QvEszP3wp-X7El4czn0VKEBooVZAqU3sLFiaLx6SKAVVgtCs
Message-ID: <CAEyhmHRUn1_ot5LzZ1ir9hLVJsnBW8j-jFDX7-VwsOTtWAG+1A@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] LoongArch: Add larch_insn_gen_{beq,bne} helpers
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	yangtiezhu@loongson.cn, chenhuacai@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, kernel@xen0n.name, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	guodongtai@kylinos.cn, youling.tang@linux.dev, jianghaoran@kylinos.cn, 
	vincent.mc.li@gmail.com, geliang@kernel.org, 
	Youling Tang <tangyouling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 9:13=E2=80=AFPM Chenghao Duan <duanchenghao@kylinos=
.cn> wrote:
>
> Add larch_insn_gen_beq() and larch_insn_gen_bne() helpers which will
> be used in BPF trampoline implementation.
>

Reviewed-by: Hengqi Chen <hengqi.chen@gmail.com>

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
> 2.25.1
>
