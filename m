Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCF92C028F
	for <loongarch@lists.linux.dev>; Sat, 21 Mar 2026 12:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774095054; cv=none; b=LcNghbChl6cybC7YiZVacWgUg40oV/ASMyAjxhUQleSupcINFFvmk924KE9T9X6QraLQ0889DuBgyvQTr3Put0SQYwU1QGuNA+bIxfv3ZZtTnKzxOr2wkIkhaNHqAxaL9uqczvOCGX9766jyN867yE7vr9YSsFwJ3YjcDqtpSjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774095054; c=relaxed/simple;
	bh=Me8RHncuorU5Bnt1FGpeDdkHmkRj0Akc3sb0Vai9Ye8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XWB0W5X0ufouhMEVE5b16duxAyLCHAnbRKOPdZayOyYC6T6s7ndwCG9WbZWwL5qHD1fVtXsuvLeakjnxNaOSYa1LNsvRtLMocNdd8UAj9Xpdlf5eqWoaA4w9YpCxjbukDIydbBXZ+FG5pXbpMD5c+kg6D7d0NPtqbUPONp/tN6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YElIJbbT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YElIJbbT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC276C2BCB7
	for <loongarch@lists.linux.dev>; Sat, 21 Mar 2026 12:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774095053;
	bh=Me8RHncuorU5Bnt1FGpeDdkHmkRj0Akc3sb0Vai9Ye8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YElIJbbTM4SUHYA3k3q3h3OFGJq44TdRrR7BfwD3RsTmbuhE3ljw4Cdcsok/zv1N4
	 M/+lijNybtEVbPTIwQBqJeZfeJkhJZJAQEKu9Pq7laYy1bKxUXkTmzbOKUb1BdHm9g
	 vyhoWrJv62U1IZqqH0Row2GFdXVwIB9nGr2zaKqaBPiZtUt+2Ig74F6sTvIzM88OaL
	 slM8d81Xi9R8zZ/cnUFz0kmi7MoXuIMjmM+EdBMwTgnqj1B9e9q735uqhGqC6UJ1RJ
	 cCeV740581Gsf2i6897bCl+TWf19IhinkLsjGELaxvEcLj673KgfZj09bJAlIrf2l6
	 0XD9bAdsfGL7Q==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66970715adbso196607a12.3
        for <loongarch@lists.linux.dev>; Sat, 21 Mar 2026 05:10:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUe7sUZuR7Xuy8imrChcFCumTC1ZmJs7TepewTTKTk73OmJTE0TKaeBsda8M61JQN8siQDrGxYKYr4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyG6Ly/Vov2jbRl+qHcRRsD0dQEOglr2cB0ya2/JMMSDI3B/GZI
	nOIXsfQQ9JBpeh6dzgj9jw5kBGVJ6rfeGviYt4ukRAN+bL+v/mC66ajnvNtfTQTf/5whLwXDdhJ
	CLT5ToNrZG4Tk2nMKwr4MVr2IWtVkm58=
X-Received: by 2002:a17:906:13c2:b0:b97:61d7:793f with SMTP id
 a640c23a62f3a-b982f282a9fmr347730566b.24.1774095052107; Sat, 21 Mar 2026
 05:10:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260321092032.3502701-1-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260321092032.3502701-1-zhengxingda@iscas.ac.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 21 Mar 2026 20:10:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6pcwfFPK_FRaXMa-h=aqEmJoLv7wUtG43WrbfHDZGYuw@mail.gmail.com>
X-Gm-Features: AaiRm508So21GaidqT3MorXZv8b1sxmEw5OwaNquBRDd5F5Ghrpf6T2HDO4BAPo
Message-ID: <CAAhV-H6pcwfFPK_FRaXMa-h=aqEmJoLv7wUtG43WrbfHDZGYuw@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Add support for LS7A LPC IRQ for MIPS Loongson systems
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Icenowy Zheng <uwu@icenowy.me>, Yao Zi <me@ziyao.cc>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For the whole series:

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>


On Sat, Mar 21, 2026 at 5:20=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac=
.cn> wrote:
>
> From: Icenowy Zheng <uwu@icenowy.me>
>
> This patchset tries to add support for Loongson 7A1000 PCH's LPC
> interrupt controller to MIPS-based Loongson systems.
>
> LPC, from software's perspective of view, is just ISA, so the interrupts
> should be handled as legacy ones occupying the lowest 0-15 IRQ numbers.
> Despite the current PCH LPC driver for ACPI-based LoongArch Loongson
> machines handled it, the setup is fragile and depends on its specific
> setup sequence (allocating the LPC IRQs first, and then allocate the
> parent IRQ at PCH PIC). The refactor of extracting parent IRQ allocation
> breaks this fragile sequence, so the first two commits is created to
> address this issue (by reserving ISA interrupts from the dynamic
> allocation space).
>
> Then the remaining commits are just adding OF(DT) based initialization
> of PCH LPC interrupt controller, like what happened on PCH PIC.
>
> Tested on a Haier Boyue G51 system with legacy i8042 keyboard/mouse as
> integrated ones, with some additional patches adding the PCH LPC device
> node to the ls7a-pch.dtsi file.
>
> Changes in v4:
> - Removed "IRQ" acronym from detailed commit messages (but still kept
>   in summary phrases for the length constraint).
> - Re-format some patch to utilize 100 columns instead of 80.
> - Temporarily removed the DT patches for fitting the whole patchset into
>   the irqchip tree.
>
> Changes in v3:
> - Override arch_dynirq_lower_bound() in MIPS Loongson64 / LoongArch
>   instead of modifying the global version of function.
> - Added Rob's R-b to the binding patch.
>
> Changes in v2:
> - Rebased on top of `irq-drivers-2026-02-09` tag.
> - Compatible changed to `loongson,ls7a-lpc` .
> - Merged the patch for conditionally build of ACPI code to the patch
>   introducing OF code.
> - Sorted function variable definitions.
> - Reworded some commit messages as Thomas Glexiner suggests.
> - Added __init to the LPC irqchip OF initialization code to prevent
>   section mismatch.
>
> Icenowy Zheng (6):
>   MIPS: loongson64: Override arch_dynirq_lower_bound to reserve LPC IRQs
>   LoongArch: Override arch_dynirq_lower_bound to reserve LPC IRQs
>   dt-bindings: interrupt-controller: add LS7A PCH LPC
>   irqchip/loongson-pch-lpc: Extract non-ACPI-related code from ACPI init
>   irqchip/loongson-pch-lpc: Add OF init code
>   irqchip/loongson-pch-lpc: Enable building on MIPS Loongson64
>
>  .../loongson,pch-lpc.yaml                     | 52 +++++++++++
>  arch/loongarch/kernel/irq.c                   |  6 ++
>  arch/mips/loongson64/init.c                   |  6 ++
>  drivers/irqchip/Kconfig                       |  1 -
>  drivers/irqchip/irq-loongson-pch-lpc.c        | 92 +++++++++++++++----
>  5 files changed, 136 insertions(+), 21 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/loongson,pch-lpc.yaml
>
> --
> 2.52.0
>
>
