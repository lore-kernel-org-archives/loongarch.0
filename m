Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6612D3DA5C0
	for <loongarch@lists.linux.dev>; Wed, 18 Mar 2026 13:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773842252; cv=none; b=G3OWjAnT6TT8aCe12XHz7fGYchHctDZMzAsGhQhNbihal+3/aVKgG5juU3zTHAm7xtdrClHD30tKJFmClgGa11QCUHog5uGfQlZG8SQFv30SK4oroBF1fokKnw+yM4y3pdoNaeuOyIqBrpzFMsBN9Bw/m83et9Nscs4DdxQE+n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773842252; c=relaxed/simple;
	bh=gnx7uWxAC+gLJ3Mdq7xy1t6BYYdm0AV9Cqp1s3NHoDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nvPSSbnymaIfhp/nW4k5GQCdND7iZspd3WnlcsiZSsO7sS1h2C5Hb4kDyhmr//asgwZeOeoJ35Y8ZVmERdAmEsev6Pe6mTNPMKCDWJU+of7GS76DiG2CLTOenOUwRgHdkxmSAmHmAXCMHQ+67RrAMlibWOO5DOO6+nAdl0xhUNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tG0m2dOB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tG0m2dOB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4731FC2BCB4
	for <loongarch@lists.linux.dev>; Wed, 18 Mar 2026 13:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773842252;
	bh=gnx7uWxAC+gLJ3Mdq7xy1t6BYYdm0AV9Cqp1s3NHoDM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tG0m2dOB3VF+KR4QsAaWd375AEAaHi6goPXz2Rb0W8MyzyhFIxZxh58hjbc5jMyXW
	 nHuf6T5X+HnlEOGoVuSeTmSRWkkTp27jM4oCIYekluJE1SI7Cv6HL9TgPdzGi4ngXT
	 4cu0OV5zU0n/tb17vWImKB40GheDd4ujEFRxbLTd1+Kfq3cKxyOH8pPAC5HwAyDk2t
	 ma0Oz6/AASaFYBJLVKB0qubSU/WVVM6a/L9X20mEqbir9lsr/kXNxv0R3nWCpVROBZ
	 yc14qUDHVkASgLhn83xOX5adYu/xkAmSE62gBJ8iGjR/mOcZWqtruibHfnuDGP4bYf
	 OWvXkCrubRKLQ==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b980b35534eso33481966b.1
        for <loongarch@lists.linux.dev>; Wed, 18 Mar 2026 06:57:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVyWxrAVQIcE2I6WSgQw1qAN+wR3LxIDU1OncPNJyxTNb6McQ63nhVyypwNBth7+9v7SiNvBpqGafU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAnJpcH835Vb3w+8lLchFvOy5ZOYSua0NC9bGS0GH/wOc5yr/a
	hr+NZz6PdIvu0X+RNabA/22mU7j+1VE1hm2uhhIqwBSyAYIZGNTTiQg515Yqw6UidHMh52yUYiP
	2qQxQFw5JEV+ENVEybVb0/00r92XP7eI=
X-Received: by 2002:a17:907:7244:b0:b93:f24a:127 with SMTP id
 a640c23a62f3a-b97d6de76a1mr489038566b.24.1773842250621; Wed, 18 Mar 2026
 06:57:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260314162828.1055188-1-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260314162828.1055188-1-zhengxingda@iscas.ac.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 18 Mar 2026 21:57:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4OYVB21jH3PSzOi4GPU+t4LY664Yp=CeDhjFRKf9V07Q@mail.gmail.com>
X-Gm-Features: AaiRm51L7NG5tsCrybND45L_NZrxxhNvUkDMnSa4KOQ_a2hgp11NA1VrtQjPUV4
Message-ID: <CAAhV-H4OYVB21jH3PSzOi4GPU+t4LY664Yp=CeDhjFRKf9V07Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Add support for LS7A LPC IRQ for MIPS Loongson systems
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Icenowy Zheng <uwu@icenowy.me>, Yao Zi <me@ziyao.cc>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Icenowy,

On Sun, Mar 15, 2026 at 12:28=E2=80=AFAM Icenowy Zheng <zhengxingda@iscas.a=
c.cn> wrote:
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
> integrated ones.
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
> Icenowy Zheng (8):
>   MIPS: loongson64: Override arch_dynirq_lower_bound to reserve LPC IRQs
>   LoongArch: Override arch_dynirq_lower_bound to reserve LPC IRQs
Use upper case for the first word, which means....

>   dt-bindings: interrupt-controller: add LS7A PCH LPC
s/add/Add/g

>   irqchip/loongson-pch-lpc: extract non-ACPI-related code from ACPI init
s/extract/Extract/g

>   irqchip/loongson-pch-lpc: add OF init code
s/add/Add/g

>   irqchip/loongson-pch-lpc: enable building on MIPS Loongson64
s/enable/Enable/g

>   MIPS: Loongson64: dts: sort nodes
s/sort/Sort/g

>   MIPS: Loongson64: dts: add node for LS7A PCH LPC
s/add/Add/g

In addition, I think the last two patches should be in another series
because they won't go to the irqchip tree.

Huacai

>
>  .../loongson,pch-lpc.yaml                     | 52 +++++++++++
>  arch/loongarch/kernel/irq.c                   |  6 ++
>  arch/mips/boot/dts/loongson/ls7a-pch.dtsi     | 17 +++-
>  arch/mips/loongson64/init.c                   |  6 ++
>  drivers/irqchip/Kconfig                       |  1 -
>  drivers/irqchip/irq-loongson-pch-lpc.c        | 87 ++++++++++++++-----
>  6 files changed, 144 insertions(+), 25 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/loongson,pch-lpc.yaml
>
> --
> 2.52.0
>
