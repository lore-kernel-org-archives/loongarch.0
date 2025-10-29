Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D762F5306
	for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 16:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761755627; cv=none; b=hjiirgN1AVd9WVCgYTHGjh98AoprKVoLcbeDWmRMuzF2kmp0QWVcv/oJ9zbcWdtlVPa8yFZHS1o/W3tOqB2+/zk8j1t174PSJCqdidAKpVq/9LCRXoO27LMdYnOBl0YBq+nR64obqaMhKjahhXep7zm6hIRj/mzt5HDMm03goE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761755627; c=relaxed/simple;
	bh=VSWqE9UpOBc+UzSqvFu6yaqBRnD97EehWNgVqMvq8m8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kP0LUIeAsYMJeBF0a2I/cNEiyOL25NsCb8yKHphfj+kOD9D5kswlG2YpKs3Ds2zdxU/LGoymhJCy5i2lBH6JF6DbMZ3sHBCSYvI3U28xWu3SRzQb2RhqjU3bVrXSd6uEWkUzRzp6MKLFuXNL5VeOsSm2P2d2vnHe1zqr+1dMoGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mj8/eCPN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mj8/eCPN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-470ffbf2150so7459485e9.1
        for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 09:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755623; x=1762360423; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AAflKtaWcrVF6Nhfrfoz1N7w/0F8UwSgA56H4g4glHQ=;
        b=mj8/eCPNPrsHbx/baCjDuj8CuC/79unVg2yPJOIOSxOygDJQFUy8Ql6646fhDh4dI4
         MeEjt97SGXtUdGGzc9U77fXFpyT/NajQUG2avp5dqMbdgTyRegp30nB5E9VDiuH3Q3Ke
         GGNMc6YWESKj2ZHGguDq64XnTp3vzQNS3Y//OUo6g4QzAAA0gyRcoQzkv9b2Sj9N9xlN
         OXFAT3N9eqCjLJ1vcfetJWCn6ZZyn9cwMnW1s6ZfPfjSAg0XHg2+aox6ulJgAnqItTdB
         HVn2ICTb1vLr20e0eo/1FIAYtkx7+rhlp9KNi3T7BYvUHPt+bXgErCBmQPU2mxoocnEb
         bITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755623; x=1762360423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AAflKtaWcrVF6Nhfrfoz1N7w/0F8UwSgA56H4g4glHQ=;
        b=hxW/PNjoqLPbugeulSpDPoIjfGZQ8pkkskFy4ICS3BvLBnXg3TbpsU2stSdvqJioAC
         lZnBbg0Uyafk+sxiVdE3FjUXt5RnVdzl3rgVARm+HMeOcJTlAkRAJhyJsZ4clhx6ZqsD
         RC/C4w8jNG+Z9xXLPQg1ZaViCVs8a3M2apEf/GrOPkAjOkaQNu6ALGEzYElAqGf33Fe1
         KHvHeYLsUexr+sX+VTxtv4O9yqntzcPxJQOB8qT3N+JyDwOc5Z7EGP6Rn9L9DG9YiKPv
         WVsUyBuc1t8siFXQlU9a8eBKzvGxsSxwm03RWBVJlDM2db0KjUgOFlnMQtulcv2OrGvN
         w3oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvqeKpljDziCWLJaHQpzAHIn/FGbKFI/x5arCSEm2hm9h/U/KS8Ai8gz/QL90KEvVwS5xN3F7nz0I=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxfDTjMJZWh5606mRoNtRjlG1YgKQP8b7HfQGig2jpaORus29s
	9CjXP8FrMVJDxPRAk8S9cMvRnnUBeCNfO9BjoHvnAz+A9CsclLl6hawI
X-Gm-Gg: ASbGnctI50t/aXWhvlwd+v34yxlAkxZltb1DCEWPblyS/qN/Fwgrt7qRSNpcC/wkJS9
	0z2v16yKFRVgSo/gmJXl1W0uCqrGsIinaw+dVK4x9ENykXGPr7nwR5pd5R3vkgxpzcKwsAtgdj3
	E0uFTF8XFmTm/1uu+rkyqish5SgCLy4zEZj49dqoRzIGuPLmP/pmFwSPT5YcOdr1WZkKXkjXdM9
	jl4tnTxx+YVDlgCxKs6c19v3Gg8xqQvtvHcFmaHV4C76sYjRdFKT1t2A/gJh2FMNGFZmnKkB0Rd
	3Go/rMS8OEPDQuzDrHGikXfnIUKXxOA+EOxx2ecMABSNc0GVm99cmmbBDu10ipXgUluPd/jFn5b
	8nGjqhxA6uCWkdOpTdL+Ougb1yxvUMDUKZM0WB0HMpu5mV1n7xkVAcvfBcwYmTQF5S6y/X48BPE
	dxfuAzatgW5DKCa3Woc+PlxiMKw0MER397dte7IAwYT0mo9cFuh1wlTz0R7B+59AW5hDd9
X-Google-Smtp-Source: AGHT+IHTmDPmMpNCDFFQsAevLNP6qOs7nF+wicDIMZb/6KQd4rRWs7Qottj+hraNqh61j+yol+JE4g==
X-Received: by 2002:a05:6000:430c:b0:425:86da:325f with SMTP id ffacd0b85a97d-429b4c5303emr258811f8f.27.1761755622916;
        Wed, 29 Oct 2025 09:33:42 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952da12dsm27463002f8f.29.2025.10.29.09.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:41 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
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
Subject: [PATCH v3 0/7] syscore: Pass context data to callbacks
Date: Wed, 29 Oct 2025 17:33:29 +0100
Message-ID: <20251029163336.2785270-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Hi Greg, Rafael,

sorry, this took a while to rework because I had to find a large enough
block of free time to push through. I played around a bit with different
ideas based on our discussion and ended up with a mix between Rafael's
and my proposal. struct syscore_ops is now split out and can be made
const. struct syscore is introduced to contain the variable data such
as the list head and the driver data. It also has a pointer to the ops
structure. Registration APIs are changed accordingly. I initially wanted
to avoid this churn, but then realized I was already touching all of the
files anyway, so might as well make it all consistent. As a result the
series is about twice as large in terms of LOC, but that's mostly due to
the structure split.

For anyone who hasn't seen this yet, here's the full cover letter:

Hi,

Something that's been bugging me over the years is how some drivers have
had to adopt file-scoped variables to pass data into something like the
syscore operations. This is often harmless, but usually leads to drivers
not being able to deal with multiple instances, or additional frameworks
or data structures needing to be created to handle multiple instances.

This series proposes to "objectify" struct syscore_ops by passing driver
specific data to the syscore callbacks. The contextual data is stored in
a new struct syscore before registering the structure with the framework
and the structure can be embedded in driver-specific data to make it per
instance.

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

Changes in v3:
- add separate syscore structure containing the modifiable fields,
  including driver-specific data, as well as a pointer to the constified
  syscore_ops structure
- change registration/unregistration API to make these changes more
  obvious

Changes in v2:
- kerneldoc fixes

Thanks,
Thierry

Thierry Reding (7):
  syscore: Pass context data to callbacks
  MIPS: PCI: Use contextual data instead of global variable
  bus: mvebu-mbus: Use contextual data instead of global variable
  clk: ingenic: tcu: Use contextual data instead of global variable
  clk: mvebu: Use contextual data instead of global variable
  irqchip/irq-imx-gpcv2: Use contextual data instead of global variable
  soc/tegra: pmc: Use contextual data instead of global variable

 arch/arm/mach-exynos/mcpm-exynos.c        | 12 ++--
 arch/arm/mach-exynos/suspend.c            | 48 +++++++------
 arch/arm/mach-pxa/generic.h               |  6 +-
 arch/arm/mach-pxa/irq.c                   | 10 ++-
 arch/arm/mach-pxa/mfp-pxa2xx.c            | 10 ++-
 arch/arm/mach-pxa/mfp-pxa3xx.c            | 10 ++-
 arch/arm/mach-pxa/pxa25x.c                |  4 +-
 arch/arm/mach-pxa/pxa27x.c                |  4 +-
 arch/arm/mach-pxa/pxa3xx.c                |  4 +-
 arch/arm/mach-pxa/smemc.c                 | 12 ++--
 arch/arm/mach-s3c/irq-pm-s3c64xx.c        | 12 ++--
 arch/arm/mach-s5pv210/pm.c                | 10 ++-
 arch/arm/mach-versatile/integrator_ap.c   | 12 ++--
 arch/arm/mm/cache-b15-rac.c               | 12 ++--
 arch/loongarch/kernel/smp.c               | 12 ++--
 arch/mips/alchemy/common/dbdma.c          | 12 ++--
 arch/mips/alchemy/common/irq.c            | 24 ++++---
 arch/mips/alchemy/common/usb.c            | 12 ++--
 arch/mips/pci/pci-alchemy.c               | 30 +++------
 arch/powerpc/platforms/cell/spu_base.c    | 10 ++-
 arch/powerpc/platforms/powermac/pic.c     | 12 ++--
 arch/powerpc/sysdev/fsl_lbc.c             | 12 ++--
 arch/powerpc/sysdev/fsl_pci.c             | 12 ++--
 arch/powerpc/sysdev/ipic.c                | 12 ++--
 arch/powerpc/sysdev/mpic.c                | 14 ++--
 arch/powerpc/sysdev/mpic_timer.c          | 10 ++-
 arch/sh/mm/pmb.c                          | 10 ++-
 arch/x86/events/amd/ibs.c                 | 12 ++--
 arch/x86/hyperv/hv_init.c                 | 12 ++--
 arch/x86/kernel/amd_gart_64.c             | 10 ++-
 arch/x86/kernel/apic/apic.c               | 12 ++--
 arch/x86/kernel/apic/io_apic.c            | 17 +++--
 arch/x86/kernel/cpu/aperfmperf.c          | 20 +++---
 arch/x86/kernel/cpu/intel_epb.c           | 16 +++--
 arch/x86/kernel/cpu/mce/core.c            | 14 ++--
 arch/x86/kernel/cpu/microcode/core.c      | 15 ++++-
 arch/x86/kernel/cpu/mtrr/legacy.c         | 12 ++--
 arch/x86/kernel/cpu/umwait.c              | 10 ++-
 arch/x86/kernel/i8237.c                   | 10 ++-
 arch/x86/kernel/i8259.c                   | 14 ++--
 arch/x86/kernel/kvm.c                     | 12 ++--
 drivers/acpi/pci_link.c                   | 10 ++-
 drivers/acpi/sleep.c                      | 12 ++--
 drivers/base/firmware_loader/main.c       | 12 ++--
 drivers/base/syscore.c                    | 82 ++++++++++++-----------
 drivers/bus/mvebu-mbus.c                  | 19 +++---
 drivers/clk/at91/pmc.c                    | 12 ++--
 drivers/clk/imx/clk-vf610.c               | 12 ++--
 drivers/clk/ingenic/jz4725b-cgu.c         |  2 +-
 drivers/clk/ingenic/jz4740-cgu.c          |  2 +-
 drivers/clk/ingenic/jz4755-cgu.c          |  2 +-
 drivers/clk/ingenic/jz4760-cgu.c          |  2 +-
 drivers/clk/ingenic/jz4770-cgu.c          |  2 +-
 drivers/clk/ingenic/jz4780-cgu.c          |  2 +-
 drivers/clk/ingenic/pm.c                  | 14 ++--
 drivers/clk/ingenic/pm.h                  |  2 +-
 drivers/clk/ingenic/tcu.c                 | 59 ++++++++--------
 drivers/clk/ingenic/x1000-cgu.c           |  2 +-
 drivers/clk/ingenic/x1830-cgu.c           |  2 +-
 drivers/clk/mvebu/common.c                | 19 ++++--
 drivers/clk/rockchip/clk-rk3288.c         | 12 ++--
 drivers/clk/samsung/clk-s5pv210-audss.c   | 12 ++--
 drivers/clk/samsung/clk.c                 | 12 ++--
 drivers/clk/tegra/clk-tegra210.c          | 12 ++--
 drivers/clocksource/timer-armada-370-xp.c | 12 ++--
 drivers/cpuidle/cpuidle-psci.c            | 12 ++--
 drivers/gpio/gpio-mxc.c                   | 12 ++--
 drivers/gpio/gpio-pxa.c                   | 12 ++--
 drivers/gpio/gpio-sa1100.c                | 12 ++--
 drivers/hv/vmbus_drv.c                    | 14 ++--
 drivers/iommu/amd/init.c                  | 12 ++--
 drivers/iommu/intel/iommu.c               | 12 ++--
 drivers/irqchip/exynos-combiner.c         | 14 ++--
 drivers/irqchip/irq-armada-370-xp.c       | 12 ++--
 drivers/irqchip/irq-bcm7038-l1.c          | 12 ++--
 drivers/irqchip/irq-gic-v3-its.c          | 12 ++--
 drivers/irqchip/irq-i8259.c               | 12 ++--
 drivers/irqchip/irq-imx-gpcv2.c           | 30 +++------
 drivers/irqchip/irq-loongson-eiointc.c    | 12 ++--
 drivers/irqchip/irq-loongson-htpic.c      | 10 ++-
 drivers/irqchip/irq-loongson-htvec.c      | 12 ++--
 drivers/irqchip/irq-loongson-pch-lpc.c    | 12 ++--
 drivers/irqchip/irq-loongson-pch-pic.c    | 12 ++--
 drivers/irqchip/irq-mchp-eic.c            | 12 ++--
 drivers/irqchip/irq-mst-intc.c            | 12 ++--
 drivers/irqchip/irq-mtk-cirq.c            | 12 ++--
 drivers/irqchip/irq-renesas-rzg2l.c       | 12 ++--
 drivers/irqchip/irq-sa11x0.c              | 12 ++--
 drivers/irqchip/irq-sifive-plic.c         | 12 ++--
 drivers/irqchip/irq-sun6i-r.c             | 18 +++--
 drivers/irqchip/irq-tegra.c               | 12 ++--
 drivers/irqchip/irq-vic.c                 | 12 ++--
 drivers/leds/trigger/ledtrig-cpu.c        | 14 ++--
 drivers/macintosh/via-pmu.c               | 12 ++--
 drivers/power/reset/sc27xx-poweroff.c     | 10 ++-
 drivers/sh/clk/core.c                     | 10 ++-
 drivers/sh/intc/core.c                    | 12 ++--
 drivers/soc/bcm/brcmstb/biuctrl.c         | 12 ++--
 drivers/soc/tegra/pmc.c                   | 21 ++++--
 drivers/thermal/intel/intel_hfi.c         | 12 ++--
 drivers/xen/xen-acpi-processor.c          | 12 ++--
 include/linux/syscore_ops.h               | 15 +++--
 kernel/cpu_pm.c                           | 12 ++--
 kernel/irq/generic-chip.c                 | 14 ++--
 kernel/irq/pm.c                           | 11 ++-
 kernel/printk/printk.c                    | 11 ++-
 kernel/time/sched_clock.c                 | 22 ++++--
 kernel/time/timekeeping.c                 | 22 ++++--
 virt/kvm/kvm_main.c                       | 18 +++--
 109 files changed, 930 insertions(+), 523 deletions(-)

-- 
2.51.0

