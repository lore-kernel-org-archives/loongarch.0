Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A962F1FCB
	for <loongarch@lists.linux.dev>; Fri, 31 Oct 2025 02:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761878178; cv=none; b=FnrJW/YDFFYqRT5nmcE6vCgMZPA8uP8BAgGIsstvXCLD9HDmUcluvM331ASRYr+PB+3qX25DOJtqn2zKYygd5EtnXHohon1lF7mQZmIwIcVbH4D4y0LCFt3juS4R/e+kZIh4wjRWlVH0xezFpv5pXmWVIni5ZGWvgd5fFpbzW7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761878178; c=relaxed/simple;
	bh=lSACWfI3S8dhYvaK8l/2vpCI4pZHQwmLaguJg4fzQpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JCTckMq5+1T2xaf7aDuHyLIqF3/6kpv575ZQg76GfEAbmbnWARwxYLzen2IIEDhXztknmf0MkJReVmUtsXNx5qrD7aXh+hBNsCbBQD/JE+9m52WhD3nLJQSGZWIreXWAbZiemzsPT1dbgyI2KJ3trG6IHK00BguUX5Pt4p8WqF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTYuD1+z; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTYuD1+z"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-63e076e24f2so3300619a12.3
        for <loongarch@lists.linux.dev>; Thu, 30 Oct 2025 19:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761878172; x=1762482972; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8trR7+AtP7mv9r/Um2GS1F57AjZCSL0ikSu0/0WyT8=;
        b=BTYuD1+z44r60Z26eTJhEOAXnIxTYoROPNzzPx7a1knUmmJ1KYrU67PoQqL8nr5g7L
         UCAj4x96CHl9dh+gGuAgGb9+R1NIb6HJ7Vn0TfH7NL0/CDTAn7LQbPUYTVXap71VbKNK
         C7fZ7Z7XVh8iOUwIRpphKpAVP6wxigClEEcSjZtvIqMONH53sIDMnuEcATn6heZzPaMR
         4b5DvDE8t8Ufm9hCCdAQi9lb9Zdr6TijEO5iQdt8Ts11QQefgbOsaHmDfYuKArRNNLRV
         nuP/+Q0BAYENKFS0I1zZqegsHdligChvDJhO1N+eLSXn1bL/ebecBBm63GpfeqRisgvm
         z4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761878172; x=1762482972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8trR7+AtP7mv9r/Um2GS1F57AjZCSL0ikSu0/0WyT8=;
        b=pc2SyFaRh5AfSamQLHMA/hvUblrZSvHfVTBZMpV8qfarF43aiDJ5trWJRG/+Z9XRJm
         UT8gTbAKbIIfRW/C35lQnC9o28nAfVXpO9VAYxqTqiWVE8HQPCU1ubNl6E5mnp3fohZ8
         hTSKpnYWXE1WJ/IlwylgJvSND6jKDs5lsnG6lVHMkokefpLQheTFJkChXE4eGyrwQSSE
         qE84S2YkjSSrrnIZw47i0wgXsPxbIuFahs5/PTkIhehhpsC+6bDnWb8lTrrNvyy0A+lA
         anoLoHg7vvUAw3OQBCL/EJM5fRm/eKua8qnHoPjNwqzri0448gtJ3SAy88uyrq5DTRg3
         S/RA==
X-Forwarded-Encrypted: i=1; AJvYcCVt9wzmvtTj1z20biAD4gO6+8KNLH/W3NHCeV2mgLA8vsE6nAJKnUKs2E2EXGwly6UyrtY+K1BuJlk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOj/myQEIjRpo3cA6lsScdAHTJwyAk7nXR4iTYLTJVqP0vI8LY
	uXkWyXvAoCYazK1+UxRfMGcIg/Ces4MjeukDEk4uVpax1zcUW48Kj78zqXknztKCBN0LbZiRlBt
	yLzl0NxkJ4TGt7bhCQkGlHlz3qSwZX5M=
X-Gm-Gg: ASbGncsQ71/dt+B8TY/gpFMDj5XYY6MpDmYH0CAr8uV4OCyMXdDMI+kWP0LPMIBAYIN
	s0dy5Z5NblAEjARQpiOtXARW1VnNIifi3SpvHBIRmZYnhRxvMVT+FH4tgfnfj8n5so3XLuj7IUq
	zzWxdzQbsrjHbS1dNEPPDT8EvG/FDqTaBDiiL8Bb2uWLJvcN0v2vvA4qkgP8GCwJQp4S53CjA8F
	30OlR87lmNR3w5eZfMLvO75Ny57jl11tjcx45oWS3eBgtrP9wQtu+d8luYGs7w=
X-Google-Smtp-Source: AGHT+IE+QLngqICAiEM+HUlJSvYq7nmL6/S09wht7nQiv3vb9PSNrUzcz3aNHw6Y3wMnN6BNrB7N6VhS5gFSPbGsAV0=
X-Received: by 2002:a17:907:1c0c:b0:b70:5aa6:1535 with SMTP id
 a640c23a62f3a-b7070137d1cmr210756466b.18.1761878172320; Thu, 30 Oct 2025
 19:36:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1760166651.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1760166651.git.zhoubinbin@loongson.cn>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 31 Oct 2025 10:36:00 +0800
X-Gm-Features: AWmQ_bltMKgxSSuK-0uSHoLq-bcM53GzFTfW7hnwT-5zIuS1qRI4O4sc53kyhU8
Message-ID: <CAMpQs4L4A5pPG0pAKiua_2q3rBQB3WETBjc8iG8mbz5U1tWR7g@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] uart: Introduce uart driver for the Loongson family
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Haowei Zheng <zhenghaowei@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	ilpo.jarvinen@linux.intel.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 11, 2025 at 3:17=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> Hi all:
>
> For various reasons, I will be taking over from Haowei and continuing to
> push forward with this patch set. Thanks to Haowei for his efforts so
> far.
>
> This patchset introduce a generic UART framework driver for Loongson fami=
ly.
> It can be found on Loongson3 series cpus, Loongson-2K series cpus and Loo=
ngson
> LS7A bridge chips.
>
> Thanks.
>
> ------
> V6:
> Patch-1:
>  - Add Conor's Acked-by tag, thanks.
>
> Patch-2:
>  - Add more missing #include;
>  - Convert mcr_invert/msr_invert from int to u8;
>  - Split serial_fixup() on a preceding line;
>  - Add macro definition to avoid magic numbers, such as
>    LOONGSON_QUOT_FRAC_MASK;
>  - Rework the relevant data structures, where `loongson_uart_ddata`
>    represents the Soc's driver_data;
>  - Drop `PORT_LOONGSON` and use PORT_16550A instead.
>  - devm_platform_get_and_ioremap_resource() instead of platform_get_resou=
rce();
>  - Use uart_read_port_properties() and parse the clock attributes;
>  - Use switch-case instead of if-else in serial_fixup().
>
> Link to V5:
> https://lore.kernel.org/all/cover.1758676290.git.zhoubinbin@loongson.cn/

Hi all:

Gentle ping.
Any comments about this patchset ?

>
> V5:
> Patch-1:
>  - Since the Loongson UART is NS8250A-compatible, simply add ls2k* compat=
ible to 8250.yaml.
>
> DTS{i} tested by `make dtbs_check W=3D1`
>
> Link to V4:
> https://lore.kernel.org/all/cover.1757318368.git.zhoubinbin@loongson.cn/
>
> V4:
> Patch-1:
>   - Rename binding name from loongson,uart.yaml to
>     loongson,ls2k0500-uart.yaml;
>   - Drop ls7a compatible;
>   - According to the manual, ls3a and ls2k uart are the same, so merge th=
eir
>     compatible.
>
> Patch-2:
>   - Format code;
>   - Add the LOONGSON_UART_DLF macro definition to avoid magic numbers;
>   - Simplify the code, merge flags and quirks, and remove struct
>     loongson_uart_config;
>   - Use DEFINE_SIMPLE_DEV_PM_OPS;
>   - Drop loongson,ls7a-uart compatible.
>
> Patch-3:
>   - Add ls2k* compatible string, and ns16550a as the fallback
>     compatible.
>
> Link to V3:
> https://lore.kernel.org/all/20240826024705.55474-1-zhenghaowei@loongson.c=
n/
>
> Binbin Zhou (3):
>   dt-bindings: serial: 8250: Add Loongson uart compatible
>   serial: 8250: Add Loongson uart driver support
>   LoongArch: dts: Add uart new compatible string
>
>  .../devicetree/bindings/serial/8250.yaml      |  14 ++
>  arch/loongarch/boot/dts/loongson-2k0500.dtsi  |   2 +-
>  arch/loongarch/boot/dts/loongson-2k1000.dtsi  |   2 +-
>  arch/loongarch/boot/dts/loongson-2k2000.dtsi  |   2 +-
>  drivers/tty/serial/8250/8250_loongson.c       | 238 ++++++++++++++++++
>  drivers/tty/serial/8250/Kconfig               |  10 +
>  drivers/tty/serial/8250/Makefile              |   1 +
>  7 files changed, 266 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/tty/serial/8250/8250_loongson.c
>
>
> base-commit: 0d97f2067c166eb495771fede9f7b73999c67f66
> --
> 2.47.3
>

--
Thanks.
Binbin
