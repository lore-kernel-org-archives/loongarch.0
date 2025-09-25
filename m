Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6548420ED
	for <loongarch@lists.linux.dev>; Thu, 25 Sep 2025 02:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758768377; cv=none; b=NuBXj43AtZnoSyBsp2dlFR979YLLtOur6XNzjZbZmPqeQdCZwWPnsFHyPFRGYsxVBH6HuRHp2r577M/ZudjnCBz2W76mFZi2+hgfJy7j2NqMKNKvlzKOrFeIkHXTaFVWIqUEb1W/rVv32xVFMbJbJ5dTK0e/nSibF95hEFbiytw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758768377; c=relaxed/simple;
	bh=qZJ56txTnTBrCjtnQdYqmKA071Y/aHl30ZR+GOyWVoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lsr476ujlo3JA4ZhpKvwomvyg+z0QsFhegewJxgQWDAGuJZ8TE3gLZSThEZbwUNHwSBNOXRuCigW3x0NTYUOeN3uxpdtWEfVnntxv5ZaBeojPDDmK5xbAOCJSbdJq7V8DRxvg0FaQOiXufu00G5AcXDc+Oe7QZXalIF3d5mxL5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fyFT1MSZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fyFT1MSZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8961C113CF
	for <loongarch@lists.linux.dev>; Thu, 25 Sep 2025 02:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758768376;
	bh=qZJ56txTnTBrCjtnQdYqmKA071Y/aHl30ZR+GOyWVoM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fyFT1MSZtxXue976G59Ja6hsv6nktgzi38h/Ski7HTC05i08PVnRcNkh7F6GNvNtY
	 f0pSHNpGoptGx//yVrn0LaOKLGN0lgSapzOvn/+WPTUjp8oJEiPv9BUCCmxZSE/FLJ
	 8tf31R50heJFEIiaAS0BwALsqQRPQyQyyPAXbA8KCjaovbHx7grDGN6XJaL5AuC4y4
	 3qqhO2pjZrRY/Fqa6xIfG6IYgvW501GkOzXPuAVYuO2MBAueMAWVIUoVxyz/oPl9j9
	 ZuAcqRgJ5qWX823HlVSwA5t6NliqqYcZf1QI35qYQ5nVIUAUYYMHmQB5gc5KKh7qdJ
	 FBTbfWS0usbFw==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b2e0513433bso76076566b.1
        for <loongarch@lists.linux.dev>; Wed, 24 Sep 2025 19:46:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVU8g1HR9+SHvAYrpZnR9CsIDyaTHAy1i1DiC/kcCSZgxwX4dQH9983L+xqC4VZVQsECxYDtD33qDE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yya34fA9vO5rN/PSidMNYR9fV6cEj4/kyawKKXjIRfBfVFsZjt0
	lyEbltOMmJa5jskrSBNvWbBqBmL65Tx3VhcSuBgIu351O6nOC4D/1CDxO8TNP3ke5jnzTCnxept
	JCHlPHNgoXagvlLezG/gVZXU7hj8liVY=
X-Google-Smtp-Source: AGHT+IEAhoS9PJ3r94+cySZIDL8IA0W5HIItnqS2SG48L01/vcSzoMJXQ55jWAfjjkFzB3xdWmBeHsT0fl+uENJNoso=
X-Received: by 2002:a17:907:94c1:b0:b2c:fa32:51d3 with SMTP id
 a640c23a62f3a-b34b91a8803mr218621366b.3.1758768375567; Wed, 24 Sep 2025
 19:46:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250923085450.140602-1-hengqi.chen@gmail.com>
In-Reply-To: <20250923085450.140602-1-hengqi.chen@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 25 Sep 2025 10:46:02 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7Q_f5fFAaJMHexh9vnjWPy0y-1N2DX5VqTqrtiASsxew@mail.gmail.com>
X-Gm-Features: AS18NWDUZjf_aL6svseQCu1xq7gRMI2MAsd5Zi5UVYBCe1OI98bNui1oPKzmgA0
Message-ID: <CAAhV-H7Q_f5fFAaJMHexh9vnjWPy0y-1N2DX5VqTqrtiASsxew@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] LoongArch: Fix BPF trampoline related issues
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: yangtiezhu@loongson.cn, vincent.mc.li@gmail.com, hejinyang@loongson.cn, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Tue, Sep 23, 2025 at 4:55=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> The following two selftest cases triggers oops on LoongArch:
>
>     $ ./test_progs -a ns_bpf_qdisc -a tracing_struct
>
> This series tries to fix/workaround these issues.
> See individual commit for details.
>
> v5 -> v6:
> * Rework patch 8 as suggested by Huacai and Tiezhu
>
> Hengqi Chen (8):
>   LoongArch: BPF: Remove duplicated flags check
>   LoongArch: BPF: Remove duplicated bpf_flush_icache()
>   LoongArch: BPF: No support of struct argument in trampoline programs
>   LoongArch: BPF: No text_poke() for kernel text
>   LoongArch: BPF: Don't assume trampoline size is page aligned
>   LoongArch: BPF: Make trampoline size stable
>   LoongArch: BPF: Make error handling robust in
>     arch_prepare_bpf_trampoline()
>   LoongArch: BPF: Sign extend struct ops return values properly
>
>  arch/loongarch/net/bpf_jit.c | 72 ++++++++++++++++++++++++++++--------
>  1 file changed, 56 insertions(+), 16 deletions(-)
>
> --
> 2.43.5
