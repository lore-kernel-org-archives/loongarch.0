Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C7235DA75
	for <loongarch@lists.linux.dev>; Sun, 26 Jul 2026 08:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785055021; cv=pass; b=G14wEzyZ07HbM4mvr9Bgg5/BEABr1AdOCRSBf/toce3oyZTXKxN2J1ttCW9t+c0ZPuRvOe4/vEbTMVpV52C9I5vnQo7s4cUOPYgToe6YRrlfW78sdRVQvFJv0iX87G2XpSS9jPVL+g+EjiT/+uiG3pHOq4EXK6JaQrabt8Oum6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785055021; c=relaxed/simple;
	bh=rmn2ecOhRTLO6zZsFLG40KuuGj21KujR3dAxEkWkneo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hg7bUGBpEI6ekCCIHzUA/5XWb+c7x/eTXhcuxU+nHTfDcym9Iv5p20qP0ZoSJ72KW4xUwY4DEKMdShfHRDjhVK40zLazqHrTvGtVwARPb5zZlebCkWJ63ZYzEhxqQkzPCXWZBpLsXOflHBmYgygK2FL2LcPFSdRQcs1AXdP0T+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EMjelnU+; arc=pass smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMjelnU+"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e9eaf04bfaso468924a34.1
        for <loongarch@lists.linux.dev>; Sun, 26 Jul 2026 01:36:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785055018; cv=none;
        d=google.com; s=arc-20260327;
        b=GjeI9JFGygKA4LBxZ4+SVEv1GX0u3+oKhtaMWeqo4TZxvuna0Zao1DQLGj+JIthKdh
         oAxoiT3tBOcdp72zKKYSBEqN/jd1j6HwfaVfAh8WS98IcC1FQeWTfgFjqVm+jKcHsYly
         0BgHRtMl/zxivcp3MyApACuqNWxZyk62RSgbWG4do6GyZ/iGORsMdfVm3+LAHOc2tY95
         LhoqHHcHCvgsKuJWx8YvGFNOX27H1Ex3lIU9l4iq12c6wSYHXFJrdgyZ1i9ThKSFgN2U
         4qa8bK/NN9Jsq8yd5pBvmj6SwuaRx7D4D9y5dP3Y1jZ+7HuaqUSAcH4qlQ/9p5QD6SnV
         8OJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3r5rSuJa2Lzq0CYs5fizgtYeBwnpeKSHwMn5ylN1Tng=;
        fh=8oH1j9fdcJZI9MtWD+Ff2Ff1H7VANflNDTkO/KagbG0=;
        b=OWJiD+UoBJgDqD+ORYrlKCYaW/pD6yL4kSpgeVGi+w9ilbvPEbL+k944qsgv+kcHgm
         66ov2Cw5lrBz6QWvAdDLtTIV7zdvO1IN57Ao4ipRwUnraBIbywb/laPmmlrG1M7mArK+
         Gqs+DTAJd24zzSo+iXR4jiKPN9QPBIPEDUUP8j+8NtFs9Qa8zbvuXjBo2WdtgKvx2QEO
         29S/6j4WIxHmh/MEMG4ishvVU+L/ivyW8X/LlLf/uEuM+chm3z/ZRSfxo2tq1s80FckV
         JHzTX8tjPcUCPbyOln0uFKBM0Q5pWXe1SxJJcpxjgtOmR+LEFtMHVAF6EPn/bbiunWLz
         5K9Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785055018; x=1785659818; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3r5rSuJa2Lzq0CYs5fizgtYeBwnpeKSHwMn5ylN1Tng=;
        b=EMjelnU+/WqXUYRkBfLzgMWH40fcoP2oW92lDTcsiVkvSzAbrKdcNrhSuo+POmpnWx
         l75lc8orCK4+034ED1gj0Y08vBhTq4NHHtlM1PqMlLTWhna8vO30hAzQKdnPaPML4zKk
         3yZlV4c3kqraokChO3PW7yjxL6tRcp0xWGYE1ilPqerbSb1pxZAregrApiJRp1Z5ttFP
         tQ1MXUgiLGYgQtElQT6Iaz+xa1m0jqAv0QrEuw8fekrDcKXkxCiJlXSjfJlLllRjkUgd
         hF7aVk1pu1LtH1FvuGwilajc37+3sQ5emc7x5Y+1wsDmF0B2DWt4fqXqlc2Y9HSI0btb
         3oZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785055018; x=1785659818;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3r5rSuJa2Lzq0CYs5fizgtYeBwnpeKSHwMn5ylN1Tng=;
        b=PfcmgWiEjNWRRahyY2gWtqsGIjmoIIx+9Qfl4ApcQG6SyEp4Cg2iqwN3+yQXnxCRU8
         zH2npsD9/clNX3rDRr/ANVqecMbQTH30cGpzT1OLfdrIu6egfRBdTM/CXIqA+6+0wDt4
         Zh5NME4zzEm2hU8Aufmq9SaQYjEG/sylRaGt3yEsVAu+JAep+qt8RvBcqP2igNMQ9Lnz
         LESAYsgaRiVO9XsgAZOj6aL71yM5gEGv9OouCkFfi1gdXQg75P5CJDv0kR4NFrgIr4w+
         f0GrYUPWBf/UaoRyq+DFI29SaKDQ7gURC3ArCrh/7Yndkz05AL/yDC6LL+E+tVP/qTLX
         lqlA==
X-Forwarded-Encrypted: i=1; AHgh+RqdAEquVYdeN80/GW+YI7T5P1z8sydlJmi8YnlMmGN8+3VtqjBscoHp9TM3uNF99phqhRvG6mMfmkQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz2QOWWKu7wsDSHFB8tQByKF3xIoN8LTdgUdKvPmu6B+yKWS8l
	Pbdrc3EeAbOX5Xo+MOff8nytkbrUvtD14m8cjSr9Vyk7TtB/k8HzwWLqXh+7r39XFAAmK/0kJAp
	8rNC2UFi57ftZJmS/iEz/HoOCrp6mUSim661MY7c=
X-Gm-Gg: AR+sD1318VBoctW/5z4qzzRUaMG8vvkSgK82eitBcIgGbx2oNbXgHAWRLVzLJrCKUIu
	XC8UYgPRhuTXyUV5j0zyi/kH+BdUYuE1L2X4F0Ft7B0kLG+PN483aVZINcY8ClNe9s7BYIu9buf
	0agFPOdU8hUFcdieEK11zmNY6s3JaiP3cQjU2TXcbSDnSr6bEVq/ZdhPKU9Z7frO4DRezeC2h7Z
	mLcLxqB9eD6F00pl01COzqL/Df/aecDns4a1ox6y0wBoCeZOjibZFMcyGdI1ME=
X-Received: by 2002:a05:6820:f013:b0:6aa:ff23:190 with SMTP id
 006d021491bc7-6aaffb13b8dmr3261108eaf.51.1785055018285; Sun, 26 Jul 2026
 01:36:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260711100956.4351-1-yangtiezhu@loongson.cn> <20260711100956.4351-3-yangtiezhu@loongson.cn>
In-Reply-To: <20260711100956.4351-3-yangtiezhu@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Sun, 26 Jul 2026 16:36:47 +0800
X-Gm-Features: AUfX_mxocj0yJ8qj0TxOQ3B1mc7jK5ZzM6dkY3EPo74I1cqQZ8PLkCG9BI5Rnoc
Message-ID: <CAEyhmHRcGHgG5Xyd7hDzUpwTwNKDKcwsABcEZ5TH5xaKAzmabw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] LoongArch: BPF: Remove dead move_imm() call in
 BPF_NEG path
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 11, 2026 at 6:10=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> The BPF_NEG operation is a unary operator that performs `dst =3D -dst`.
> The current code unconditionally executes a move_imm() call before the
> subtraction, generating useless JITted instructions to load data into
> the temporary register `t1`. This `t1` register is never used anywhere
> else in the entire BPF_NEG path.
>
> Remove this dead `move_imm()` call to avoid useless instructions.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/net/bpf_jit.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 2738b4db1165..5f32b205a6ac 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -894,7 +894,6 @@ static int build_insn(const struct bpf_insn *insn, st=
ruct jit_ctx *ctx, bool ext
>         /* dst =3D -dst */
>         case BPF_ALU | BPF_NEG:
>         case BPF_ALU64 | BPF_NEG:
> -               move_imm(ctx, t1, imm, is32);
>                 emit_insn(ctx, subd, dst, LOONGARCH_GPR_ZERO, dst);
>                 emit_zext_32(ctx, dst, is32);
>                 break;
> --

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

> 2.42.0
>
