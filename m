Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEBD2DCC06
	for <loongarch@lists.linux.dev>; Tue,  4 Nov 2025 06:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762239198; cv=none; b=JN3XNEKiYRC5XDSdzsBTQkk68u2rfRIqYXOI86fr1PVcaT/OmIOJfQj6qiXXcwlr2hMhXLbXnTMMe+ng/BB3lKtABm6nxZLWrJQikBGpNwtmzlPPiAW3UX6lMeOrulGI5M0gujJjObce9AVEzCQTePa7+p+2mi5uFIED2PTyrmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762239198; c=relaxed/simple;
	bh=8p0MCf6z8owtO8dtPW0HAmvbfGUyTkXxQfEU6TFdLiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dUV193k+GJtI7tv1fsz6XsMf7HE/2AtM/fJG0dcXpvThC3Dzmpx/8Y7Ran+B1FlhFXytAjNZ4ANuH5i8R4kQBB/iLQv/Ie2WmJBeDlSU7YmnpE2wf2e47x2R+dJjvgHiYDXoWLqakITo4MRusH90EJOsj/9z7DpPEQVZVdkoRKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9/O0aA0; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9/O0aA0"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-44fa06c8975so1395889b6e.1
        for <loongarch@lists.linux.dev>; Mon, 03 Nov 2025 22:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762239196; x=1762843996; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yunsIVG2xwSWPJMISQ9png0ZDy6Yvl2IENc61OHh6yo=;
        b=e9/O0aA01zLWQ4YigN8BHrMquVecopd6RugAYnm7CWzNJLRgpe2+f80m8TjKYvvFnK
         vZdzsVAPuxiBv0NgaOmA/vWvBwjPaJEjHFXHCHy4vqjAnQxHVyc/scytWV/J3CF3tVy+
         xdlxomCpZWUWMRdGJmoB2gohp7IXCGBiMlOt/XWSeLDeLg/86EWiAbloQSO9yEWly4X8
         cLZGGNxPnKe/NK94YeBoa1+rNLbhKlx2f9NaW5j/zx3M9NDoRtrD4XEBMkat9BGZXZBM
         w5pL4WWzrbHWcOgU2OePqkbdV41BrKLHG51X3dprqbcSvFrOLBU+i7H7OJMbc/UN8g2M
         XvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762239196; x=1762843996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yunsIVG2xwSWPJMISQ9png0ZDy6Yvl2IENc61OHh6yo=;
        b=Q0Uq7+UWyVH7rGguLYvw89C8iKGhtGR0wkEyYzcJ45MDw7Ypo1irX1e7X3nuTTNA9B
         B9C4M0xbHLUTDr/rb2CsjrUG/LCUcugeLnGa5MUWvKsx6P661w3783IooSD5TEfOy3YD
         qYL2P5N0M0ExxuSXmMqEr6y5kajvTD1iUvXwa4ZcP+sqcON1yOdBUD8e2RynSBg9Qx7v
         OA0wJPBS2EwDq6GT9FLMMuBFhUZ0zVjiKpVUqLxg26SkFJMNMMWRVM5DHx/k+OV/2jtn
         ozEpom9qMGlB54g/JVvyoF9+VLbXBQNXPRfoRG/Izdllu1zx8cMuh0Vvf6jO2WafBYtK
         cFLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP6wknOdXi1H2VQL3Djpx5i/epRzNbvjcB2szaudUa3B6JfEtHCi1+uA1Jmkk57wv1FCyUkCyIk1U=@lists.linux.dev
X-Gm-Message-State: AOJu0YyG5u2ZBjwP2vCOsVGb5zjTzL0/FSX3fJFx5qs9HNvV+P8jY7xx
	DKelh4LEDXVikynIUxatlJUpz5e47TGxnPYMAylYaaxiI1yu72Mz6DWG+/8p29sATLMy/qXoMAl
	tEhcqKS+AWK13QTfMBXxZTcd0/9dE3rY=
X-Gm-Gg: ASbGnct+L1lyxhnOsLx5XJx8m8QW63T3pIHWTIomnaNoLUWsHzcMdpblPpQjTzhO/fo
	1Ta1ZwAEeScTDR1WVwF3kVkepY0Ae+U6io9CfvsQYl1BA13tQgWynA6dduKXhSsM66BY4HDDU+1
	HoTnjZfss6wITG3qyEmP+MqfNgmXsjFkU7ON0tIaC95gtCzHkhT+dbxbzd4nygQ/iM2L4VDGZqC
	glBVZ6yVUIeP9+tUObjG9YsyEz1FLw4FvmtaYAU3+Mx+VaKP73S/hoLn+yvcovS2BKmug==
X-Google-Smtp-Source: AGHT+IGbn2X2/1JEEhqo1wnJ78iL2FeGF989Bo4JAY/FmMP1S8eKH8fgHgNdc4dVIuvXBjYdomI/sa/SfD70vvNJUAI=
X-Received: by 2002:a05:6808:10c3:b0:43f:7dee:4693 with SMTP id
 5614622812f47-44f95e27868mr6890297b6e.14.1762239195781; Mon, 03 Nov 2025
 22:53:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251103-1-v1-1-20e6641a57da@linux.dev>
In-Reply-To: <20251103-1-v1-1-20e6641a57da@linux.dev>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Tue, 4 Nov 2025 14:53:04 +0800
X-Gm-Features: AWmQ_bnyRUlNuwLxwBl63QPbG926jSDDFvsN0rhY6T22CSGWWq6GN0Hkme8uPf4
Message-ID: <CAEyhmHQoLF9dcZ2CaasrpeH7RMiaQKyo0pFTrr7Nt1T64+dhuw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: BPF: Fix sign extension for 12-bit immediates
To: george <dongtai.guo@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Youling Tang <tangyouling@loongson.cn>, bpf@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, George Guo <guodongtai@kylinos.cn>, 
	Bing Huang <huangbing@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 3, 2025 at 4:42=E2=80=AFPM george <dongtai.guo@linux.dev> wrote=
:
>
> From: George Guo <guodongtai@kylinos.cn>
>
> When loading immediate values that fit within 12-bit signed range,
> the move_imm function incorrectly used zero extension instead of
> sign extension.
>
> The bug was exposed when scx_simple scheduler failed with -EINVAL
> in ops.init() after passing node =3D -1 to scx_bpf_create_dsq().
> Due to incorrect sign extension, `node >=3D (int)nr_node_ids`
> evaluated to true instead of false, causing BPF program failure.
>

Which bpf prog are you referring to?

> Verified by testing with the scx_simple scheduler (located in
> tools/sched_ext/). After building with `make` and running
> ./tools/sched_ext/build/bin/scx_simple, the scheduler now
> initializes successfully with this fix.
>
> Fix this by using sign extension (sext) instead of zero extension
> for signed immediate values in move_imm.
>
> Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
> Reported-by: Bing Huang <huangbing@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
> Signed-off-by: george <dongtai.guo@linux.dev>
> ---
>  arch/loongarch/net/bpf_jit.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bpf_jit.h
> index 5697158fd1645fdc3d83f598b00a9e20dfaa8f6d..f1398eb135b69ae61a27ed81f=
80b4bb0788cf0a0 100644
> --- a/arch/loongarch/net/bpf_jit.h
> +++ b/arch/loongarch/net/bpf_jit.h
> @@ -122,7 +122,8 @@ static inline void move_imm(struct jit_ctx *ctx, enum=
 loongarch_gpr rd, long imm
>         /* addiw rd, $zero, imm_11_0 */
>         if (is_signed_imm12(imm)) {
>                 emit_insn(ctx, addiw, rd, LOONGARCH_GPR_ZERO, imm);
> -               goto zext;
> +               emit_sext_32(ctx, rd, is32);
> +               return;
>         }

This causes kernel panic on existing bpf selftests.

>
>         /* ori rd, $zero, imm_11_0 */
>
> ---
> base-commit: 6146a0f1dfae5d37442a9ddcba012add260bceb0
> change-id: 20251103-1-96faa240e8f4
>
> Best regards,
> --
> george <dongtai.guo@linux.dev>
>
