Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08088369D61
	for <loongarch@lists.linux.dev>; Thu, 13 Aug 2026 10:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786616782; cv=none; b=g7a3roZRAnqazt11GWka0A3ibSrfuPWm/qtDtRWtiplRCgyGqkYLupyNDaK/pSQAN5Evpuzgko8TZ/ULv9B3o+kCN6LCJq0GErkUUDsH0J9AeQP5o3XT4McBbtOI5/ZDuNZwn1dACC+serh1E+DFFEph/gbwlcbuI0UuGaWgdL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786616782; c=relaxed/simple;
	bh=9rSsdIC/129SZ1WHfCEReTwxxw/QdoL6Qp0KAKAWByI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ns9x3McXGkqrbkK0iMlg3cAW+2hbtE2uhenkuNYmQacCLWsX/xdsiUL//iG4O9Efjhs18IrCbqA6s6UEDr0BdSswRfNwORuggMlsLxdiGhjGhQswVgu1MZmAlDhZFakjvRx1mM6p4I7Q+qxzQy5qZCd3U38UJ8/URQQvYSuG6oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=t3Bl2ZPs; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="t3Bl2ZPs"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67C49153B;
	Thu, 13 Aug 2026 03:26:15 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 857E03F632;
	Thu, 13 Aug 2026 03:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786616779; bh=9rSsdIC/129SZ1WHfCEReTwxxw/QdoL6Qp0KAKAWByI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t3Bl2ZPsyAgEEtp/RWgJ8wXhch92sf7Fi5Jn2n/O3IysUP737x3khQusWpkRkl6eQ
	 zgRInDgxOP9mgG2K33Z9LX0OBE6OkE3R/c7KtrhRZ8Lbyh+7Ha8Wxc+nyIspdacYNd
	 uBFE5ImQ3gH51ksby5neG6vjeN5JuVHGSJHpHE0k=
Message-ID: <f88baccf-6acb-4ded-a6cd-0d9b69965644@arm.com>
Date: Thu, 13 Aug 2026 11:26:15 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] vDSO: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev
References: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 24/07/2026 14:36, Thomas Weißschuh wrote:
> Always provide the definitions of the VDSO_CLOCKMODE_* constants and
> remove some ifdeffery from the clocksource drivers.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
> Changes in v4:
> - Pick up Ack from Mark Zyngier.
> - Fix '-type d' argument to find.
> - Link to v3: https://patch.msgid.link/20260722-vdso-arch-clockmodes-v3-0-4c5753191cc4@linutronix.de
> 
> Changes in v3:
> - Update *all* commit messages to the latest logic.
> - Link to v2: https://patch.msgid.link/20260717-vdso-arch-clockmodes-v2-0-756f5a5d1467@linutronix.de
> 
> Changes in v2:
> - Also drop the IS_ENABLED() logic.
> - Link to v1: https://patch.msgid.link/20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de
> 
> ---
> Thomas Weißschuh (7):
>       kbuild: support generated asm-headers in subdirectories
>       vDSO: Make clockmode constants available without CONFIG_GENERIC_GETTIMEOFDAY
>       MIPS: csrc-r4k: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
>       clocksource/drivers/mips-gic-timer: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
>       clocksource/drivers/arm_arch_timer: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
>       clocksource/drivers/timer-riscv: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
>       LoongArch: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
> 
>  arch/loongarch/kernel/time.c           |  2 --
>  arch/mips/kernel/csrc-r4k.c            |  2 --
>  drivers/clocksource/arm_arch_timer.c   |  4 ----
>  drivers/clocksource/mips-gic-timer.c   |  2 --
>  drivers/clocksource/timer-riscv.c      |  4 ----
>  include/asm-generic/Kbuild             |  1 +
>  include/asm-generic/vdso/clocksource.h |  0
>  include/vdso/clocksource.h             |  4 +---
>  scripts/Makefile.asm-headers           | 11 +++++------
>  9 files changed, 7 insertions(+), 23 deletions(-)
> ---
> base-commit: ecacc9c8d3ed0f63065f4a1e94bfd8bf65a3ffaf
> change-id: 20260605-vdso-arch-clockmodes-bfcaf9a2c848
> 
> Best regards,
> --  
> Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> 

Thanks for this.

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com> # for the series.

-- 
Regards,
Vincenzo

