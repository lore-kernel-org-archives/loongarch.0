Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0AF2253A5
	for <loongarch@lists.linux.dev>; Mon, 17 Feb 2025 16:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739810244; cv=none; b=qxvFTYwwWcuXceD4SHP7J7V1rgf8nYWWCXFObl8h5/x/1Lb+y/udrW6JX+e34TmQPt21k4AZV/u4kFqwR79LtysO8d5AWXc/DzBBzKc7ef7LaDhjqVdjlE2+OE/Vcr6+PLyd8pnZ8X5Osi2LY3fZRckvXQ06yTCmpxuctN42K9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739810244; c=relaxed/simple;
	bh=GG0kGpRIKt7R/dR+Zx4rNrL1ZPXiID8tq41Iz9zzsng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YkcKEPwjIwQfjQLDGTi6L0t2gCAV3sHgMzyS+CuGO6AgU0Cam0GxzMTQ29KyYDAkiSE+yJs4UAR2jw0PR0kP+T4NbQhvo7U+2M6qzEHYYIjwyNovNxwrfMBodzLQ1lwr3eJZTK6Ydt9Zx8LEZG7ugII6oPaBRmae490WWrY2eWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3q6wrDb; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3q6wrDb"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43989226283so5887975e9.1
        for <loongarch@lists.linux.dev>; Mon, 17 Feb 2025 08:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810240; x=1740415040; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yiZt2i6xSOw8eOJOYff501csDZIGzCac6UOW2wl3hpw=;
        b=U3q6wrDbPN9I7itDzO32sjmACSusZgVeXt649uEswsRgiUKC95N7k4ACKHs1LwZzj5
         DAohiioqRVcI9vuewNwLs+fN089d6ksDPB8rdaYFtljxzvJlPqf9zecYHqARoh/8asBe
         w/6bPO6kw8cQJ0/A4E34bYY+lcAwtqgvD9Y6yMab33x8hmjY3v4dl/nfNXNYpmLSknRm
         7T0PhUueFV1oBQh2+VFqCyOXU6zdwbFeuIgSwQFejQWDxTmegcFDGHplgLTN/TRzab8M
         p8463YTwk8LH2osd3mOWi8i9QenL6O1wyaFxXriaQJmL1mZBFdvDNgQXhw9FHPKDSXrJ
         8gHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810240; x=1740415040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yiZt2i6xSOw8eOJOYff501csDZIGzCac6UOW2wl3hpw=;
        b=aPr00WlGLlXq9055rfD8g/wWRatIE6aw5VPO9eBYbM038QP4EbaEkbYnSN9i0b+h/7
         0DtPhs7TR7/gdO7AOxMZKyGnVPccIvuuQGeak5HiWnZNZdioyML0Lu0AWmCHS2VumhnI
         VhtTnJOiX5WmuuBu66esuINDFAEgmvsE01n/vC8gdIdCJ4QDeQZVnOaCT13FX5CPtyqo
         TE1GW5PsZ1RVoE+vQ81K2RKIK1H83iuHY1/OC64kRS5WFswR2UanYPACwQ6bI8bcqpzv
         Pi/0grdcgiDo26QCZdEYrTnW98MqmcTKp7BSLJSVA3yE5N58NjWxicIS/NVoW9mIUqdE
         ubXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjYjuvf7qiCeVU/vbJmRBXr6zSSrQq/KfPGNKOo0JUgzPq6aea5L17xjDdTDW7SsG6G90dIt5AJCw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzpz5GR32eWagStIs66x9MBop/D7ZCiJ2bG0CBcHq1agFZS0m8D
	1MJ9sRowjr4GwBb3eYHjMKPAOgnk7EUqFZZvHG5HUoXPktOk7Oxi
X-Gm-Gg: ASbGncsARH9zexVRBGyiurB4Xze+WkZy704X+hv+hZ16+VMb16zCbHIPlUxWQLqbvAR
	2C2hE3ay6FiSnwwX8+F8FvQhWPQyKLI1qCIiZQvwSbPfh1IeG9Cgr6HB8i+bzBbG2iYzECqtJZw
	a1twEohaqfscDiq5QFfOHyFot+iJwJc8apuyfG9e4ltKTN1VHYBG8iLmJS9LHrb7DO5zepvDUF2
	lReYEtkhrBaCk8MoJZt4WO6iO8SjnkOLgoomQCPohFI3D0fg3nLGk8D2lJvREWoqT37QqW1IS1o
	IWM4g7c21INDeyroF/8GNOe8gnKtNq3rVMB90dimUfBlhvWsMX5t44c2pTStwMEJgmOQNnzbBXY
	q60yduv8=
X-Google-Smtp-Source: AGHT+IFZaRz1DpftXgns+QX0TjkeJRpqUCBrHv7Z6/192+MAz8sD7WUt6O+3frJRvsZQb4k9gj7a7g==
X-Received: by 2002:a05:600c:4f56:b0:439:3c71:16be with SMTP id 5b1f17b1804b1-4396e6f66a1mr101592005e9.13.1739810240075;
        Mon, 17 Feb 2025 08:37:20 -0800 (PST)
Received: from localhost (p200300e41f22a600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-439880fbd6fsm24614705e9.18.2025.02.17.08.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:37:18 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] syscore: Pass context data to callbacks
Date: Mon, 17 Feb 2025 17:37:06 +0100
Message-ID: <20250217163713.211949-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Hi,

Something that's been bugging me over the years is how some drivers have
had to adopt file-scoped variables to pass data into something like the
syscore operations. This is often harmless, but usually leads to drivers
not being able to deal with multiple instances, or additional frameworks
or data structures needing to be created to handle multiple instances.

This series proposes to "objectify" struct syscore_ops by passing a
pointer to struct syscore_ops to the syscore callbacks. Implementations
of these callbacks can then make use of container_of() to get access to
contextual data that struct syscore_ops was embedded in. This elegantly
avoids the need for file-scoped, singleton variables, by tying syscore
to individual instances.

Patch 1 contains the bulk of these changes. It's fairly intrusive
because it does the conversion of the function signature all in one
patch. An alternative would've been to introduce new callbacks such that
these changes could be staged in. However, the amount of changes here
are not quite numerous enough to justify that, in my opinion, and
syscore isn't very frequently used, so the risk of another user getting
added while this is merged is rather small. All in all I think merging
this in one go is the simplest way.

Patches 2-7 are conversions of some existing drivers to take advantage
of this new parameter and tie the code to per-instance data.

Given that the recipient list for this is huge, I'm limiting this to
Greg (because it's at the core a... core change) and a set of larger
lists for architectures and subsystems that are impacted.

Thanks,
Thierry

Thierry Reding (7):
  syscore: Pass context data to callbacks
  MIPS: Embed syscore_ops in PCI context
  bus: mvebu-mbus: Embed syscore_ops in mbus context
  clk: ingenic: tcu: Embed syscore_ops in TCU context
  clk: mvebu: Embed syscore_ops in clock context
  irqchip/irq-imx-gpcv2: Embed syscore_ops in chip context
  soc/tegra: pmc: Derive PMC context from syscore ops

 arch/arm/mach-exynos/mcpm-exynos.c        |  4 +-
 arch/arm/mach-exynos/suspend.c            | 14 +++---
 arch/arm/mach-pxa/irq.c                   |  4 +-
 arch/arm/mach-pxa/mfp-pxa2xx.c            |  4 +-
 arch/arm/mach-pxa/mfp-pxa3xx.c            |  4 +-
 arch/arm/mach-pxa/smemc.c                 |  4 +-
 arch/arm/mach-s3c/irq-pm-s3c64xx.c        |  4 +-
 arch/arm/mach-s5pv210/pm.c                |  2 +-
 arch/arm/mach-versatile/integrator_ap.c   |  4 +-
 arch/arm/mm/cache-b15-rac.c               |  4 +-
 arch/loongarch/kernel/smp.c               |  4 +-
 arch/mips/alchemy/common/dbdma.c          |  4 +-
 arch/mips/alchemy/common/irq.c            |  8 ++--
 arch/mips/alchemy/common/usb.c            |  4 +-
 arch/mips/pci/pci-alchemy.c               | 28 ++++++------
 arch/powerpc/platforms/cell/spu_base.c    |  2 +-
 arch/powerpc/platforms/powermac/pic.c     |  4 +-
 arch/powerpc/sysdev/fsl_lbc.c             |  4 +-
 arch/powerpc/sysdev/fsl_pci.c             |  4 +-
 arch/powerpc/sysdev/ipic.c                |  4 +-
 arch/powerpc/sysdev/mpic.c                |  4 +-
 arch/powerpc/sysdev/mpic_timer.c          |  2 +-
 arch/sh/mm/pmb.c                          |  2 +-
 arch/x86/events/amd/ibs.c                 |  4 +-
 arch/x86/hyperv/hv_init.c                 |  4 +-
 arch/x86/kernel/amd_gart_64.c             |  2 +-
 arch/x86/kernel/apic/apic.c               |  4 +-
 arch/x86/kernel/apic/io_apic.c            |  9 +++-
 arch/x86/kernel/cpu/aperfmperf.c          |  6 +--
 arch/x86/kernel/cpu/intel_epb.c           |  8 ++--
 arch/x86/kernel/cpu/mce/core.c            |  6 +--
 arch/x86/kernel/cpu/microcode/core.c      |  7 ++-
 arch/x86/kernel/cpu/mtrr/legacy.c         |  4 +-
 arch/x86/kernel/cpu/umwait.c              |  2 +-
 arch/x86/kernel/i8237.c                   |  2 +-
 arch/x86/kernel/i8259.c                   |  6 +--
 arch/x86/kernel/kvm.c                     |  4 +-
 drivers/acpi/pci_link.c                   |  2 +-
 drivers/acpi/sleep.c                      |  4 +-
 drivers/base/firmware_loader/main.c       |  2 +-
 drivers/base/syscore.c                    |  8 ++--
 drivers/bus/mvebu-mbus.c                  | 24 +++++-----
 drivers/clk/at91/pmc.c                    |  4 +-
 drivers/clk/imx/clk-vf610.c               |  4 +-
 drivers/clk/ingenic/pm.c                  |  4 +-
 drivers/clk/ingenic/tcu.c                 | 54 +++++++++++------------
 drivers/clk/mvebu/common.c                | 25 +++++++----
 drivers/clk/rockchip/clk-rk3288.c         |  4 +-
 drivers/clk/samsung/clk-s5pv210-audss.c   |  4 +-
 drivers/clk/samsung/clk.c                 |  4 +-
 drivers/clk/tegra/clk-tegra210.c          |  4 +-
 drivers/clocksource/timer-armada-370-xp.c |  4 +-
 drivers/cpuidle/cpuidle-psci.c            |  4 +-
 drivers/gpio/gpio-mxc.c                   |  4 +-
 drivers/gpio/gpio-pxa.c                   |  4 +-
 drivers/hv/vmbus_drv.c                    |  4 +-
 drivers/iommu/amd/init.c                  |  4 +-
 drivers/iommu/intel/iommu.c               |  4 +-
 drivers/irqchip/exynos-combiner.c         |  6 ++-
 drivers/irqchip/irq-armada-370-xp.c       |  4 +-
 drivers/irqchip/irq-bcm7038-l1.c          |  4 +-
 drivers/irqchip/irq-gic-v3-its.c          |  4 +-
 drivers/irqchip/irq-i8259.c               |  4 +-
 drivers/irqchip/irq-imx-gpcv2.c           | 33 ++++++--------
 drivers/irqchip/irq-loongson-eiointc.c    |  4 +-
 drivers/irqchip/irq-loongson-htpic.c      |  2 +-
 drivers/irqchip/irq-loongson-htvec.c      |  4 +-
 drivers/irqchip/irq-loongson-pch-lpc.c    |  4 +-
 drivers/irqchip/irq-loongson-pch-pic.c    |  4 +-
 drivers/irqchip/irq-mchp-eic.c            |  4 +-
 drivers/irqchip/irq-mst-intc.c            |  4 +-
 drivers/irqchip/irq-mtk-cirq.c            |  4 +-
 drivers/irqchip/irq-renesas-rzg2l.c       |  4 +-
 drivers/irqchip/irq-sa11x0.c              |  4 +-
 drivers/irqchip/irq-sifive-plic.c         |  4 +-
 drivers/irqchip/irq-sun6i-r.c             | 10 ++---
 drivers/irqchip/irq-tegra.c               |  4 +-
 drivers/irqchip/irq-vic.c                 |  4 +-
 drivers/leds/trigger/ledtrig-cpu.c        |  6 +--
 drivers/macintosh/via-pmu.c               |  4 +-
 drivers/power/reset/sc27xx-poweroff.c     |  2 +-
 drivers/sh/clk/core.c                     |  2 +-
 drivers/sh/intc/core.c                    |  4 +-
 drivers/soc/bcm/brcmstb/biuctrl.c         |  4 +-
 drivers/soc/tegra/pmc.c                   |  7 ++-
 drivers/thermal/intel/intel_hfi.c         |  4 +-
 drivers/xen/xen-acpi-processor.c          |  2 +-
 include/linux/syscore_ops.h               |  6 +--
 kernel/cpu_pm.c                           |  4 +-
 kernel/irq/generic-chip.c                 |  6 +--
 kernel/irq/pm.c                           |  2 +-
 kernel/printk/printk.c                    |  2 +-
 kernel/time/sched_clock.c                 | 14 +++++-
 kernel/time/timekeeping.c                 | 14 +++++-
 virt/kvm/kvm_main.c                       |  6 +--
 95 files changed, 302 insertions(+), 267 deletions(-)

-- 
2.48.1

