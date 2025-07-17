Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BC220A5EC
	for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 10:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752748371; cv=none; b=J11HAKH4IiHITNoyPK6LGEu6lHhBcbBk8eeuXxAw+CRHBzGiB6Z+h0JFn7hBHm1i3fkoFRHtU/mnSOylAlZ+ib3Q+VYhbpW5uK/zxhl4WwYU2cbd4dwRyflDHtpN0+XmROpNeMHfvFicMJXN2y6Hj+J4Tb7z6ko3UZmIRE161mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752748371; c=relaxed/simple;
	bh=Tuk33qsaetTzTY1pTe8BNrf3fBLF3ke0rVBC5uLyFZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SzSlrrmhJ84/rDuMZS16+7l75VuHNv+3lUIW5zLBTtJpc177nSD5z1hFzI38ZG1JJIMJYNsbB0asAA0B6/3rEXS4khHw/qj9+H2wkIdzScDsy648UKuyFfd5HI8PfO0Um59f45tICrXb0decQAIVHUEZMahc5GpbDyyFV6iyiDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvFY6W6p; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvFY6W6p"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso667140f8f.3
        for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 03:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748368; x=1753353168; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xP6wsSa2I9jK6Li7EuaB1j8wTTblX6ds2wLK7BFJsdc=;
        b=gvFY6W6pPO1lT8fmQyG2eyU0GskOKc9h9HlkN6S4vyW3ynZrlZNr4siodOwsRcGDqv
         CIj/NnatBmUmWh2BGrZ5rQgXLGh7uFwPJ//6K3Dyj5LP4I1O0WVZYKVrPaUyo6mKuBL9
         G9Sw4kt4gk4/jwhyTmX0kTYAyHnPwma52gb9jOKdDrOW24VWlA69OM5AGv+2oFNT34t2
         9iguaKL+J+RB6P3S/omKDNkW34FKA3qaWCynSBlWbTj9Va7GprDHOYNIAUVt9sQZr/OR
         9qOf09+elRQx362Ofv7TJ81eY6m6BdCnPBt9taEEnBkDs1IWsnHXml79mq6eY9HeNTgQ
         sf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748368; x=1753353168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xP6wsSa2I9jK6Li7EuaB1j8wTTblX6ds2wLK7BFJsdc=;
        b=Np7BXLT3Ta3PRDZ3CsrAu1+RGpgnM3eVzC+rnYumbHDyrfmIaENTp9ooY12Iy59kXu
         vBhkK5uaTeX0XKqoQ0zmsBOjUoYKPO3QHqcdF2NIsycHzwaYUWwJt5VhehMmgwutW860
         HIF+NxvWJ2QVS8/CAf93XRM5F6qgUgEygTeFXd4akkfDVQrDSsls6j+rE3Uj3VW9WpQ5
         sqtaKSwnZ3NGjtnYfg0c87Nc/0h0sZPjPGz1KrEJRciB/bPJNG6zNRQRVLEYJ//2v0Z6
         l75oGXeqvLwWwISrmP406NM/Ms2T3UJy3ktxrMyWdjysw3+GyxI/SsD7NT4Nx1HKwGLF
         llRA==
X-Forwarded-Encrypted: i=1; AJvYcCXKHjDtpp3uKdPQgkZQpIYKoD4gHzQFO2FS1GY2/np2l0w/aXzD8PFnXYnhPMVnzZ1dqAfyX33lomE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFEqiYmZ0hCawuhw1ugl7X//Uhx+z+ScOw43qYWjZ243bNvOkT
	IQcAIGKU7+Eale/X2/TGa2AO6Sc1WaFiMSZw4Z53bWLE/r1hcyZxHk3t
X-Gm-Gg: ASbGncs3sblWgM/sco3a2XlMVB4G+iChyhQ/vpvVxy9LIxTb7i8eCG0x7FRyCGPgqOs
	ie8D63egTk0G99fiaCEUch1nHf6mlsezu3DFBD+jhsA3Villn8FcT3iNOjopv6mfxArcJ842tzH
	qFfIm7hbIlwvN2qhXHlTzjw+x5x8SBTxekH6pTQnfUWScgEwySCWNZltwyBRZJD6o9jtoztYx+q
	DrCdmBvwz3/SoiAOfiw6R6ZR6OHkYSH5hS3F2MayDKihq9/O9EdglxPMNhdKAPlxWUY9T4u4Z8q
	dXb2O/pO6UfY6r4lhojDRrei26/IHlaMxGpYd/KTEzWYvbn3y6Eu5vlDEvRybXJKehzEqVb9Q89
	lNjQA5Q+CiGATBX0kpu8g1j7h5XjuZNsfAjPdpdMz2elq98dYkui9yHQCKoWzitNsx54v83+ztR
	dRI7zP8n235Pqmxw==
X-Google-Smtp-Source: AGHT+IHYr+e6HRnWiJaX4uEEec2eLY7pIXWpQP51NQ3+bvIOdtAIUdk3bgr+G16cAKYOJRVTeTk/yA==
X-Received: by 2002:a05:6000:1882:b0:3a6:d2ae:1503 with SMTP id ffacd0b85a97d-3b60dd731damr5816056f8f.34.1752748367574;
        Thu, 17 Jul 2025 03:32:47 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e0d758sm20033465f8f.49.2025.07.17.03.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:32:46 -0700 (PDT)
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
Subject: [PATCH v2 0/7] syscore: Pass context data to callbacks
Date: Thu, 17 Jul 2025 12:32:34 +0200
Message-ID: <20250717103241.2806798-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
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

Changes in v2:
- kerneldoc fixes

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
 drivers/gpio/gpio-sa1100.c                |  4 +-
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
 kernel/irq/pm.c                           |  3 +-
 kernel/printk/printk.c                    |  3 +-
 kernel/time/sched_clock.c                 | 14 +++++-
 kernel/time/timekeeping.c                 | 14 +++++-
 virt/kvm/kvm_main.c                       |  6 +--
 96 files changed, 306 insertions(+), 269 deletions(-)

-- 
2.50.0

