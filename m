Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794301446;
	b=PmvaFAnTeTcTWCOEiVjaeVUf7SVJaKaY7u40b7cKx6cyFUiQPL34GfZ+1lW4j/Fdgfsv
	 n+E3yJQj/OVcRUASm35mIFusbw3n8KZfl7kiW8z8UctRxES4DxAFLq6oP/UGQ0tiN2TNt
	 i0yyEfbZRoNXoPNokGoOcW9Uauqnh8p7X92xt+INYKADbUiltlHkrn8FmrYZD//qrKR38
	 L7UbtuijPVmvTL/cA6hTuG9ORnXJuAMPcRMiuvH5HLVtEG+JCmnQGMWr5/U52HzwNZGjq
	 vslfbs01W6ey7sJ1SR6dPvBgqEo19FieQxmjBvFjChkNZAnv3vJJgClyocqYoQFe+AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301446;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=/BerbQ1LqYXVXHKPiWMSxnG91S54BmhY5Kon5U7NqOY=;
	b=W4jt/+XVk/VeC0QoEugg1HkDwMAZEzJTFisxzibPLtz8waDuuHTzGhLxcnYdt7aCzdp1
	 nbFtRyjckq5umV3tV7qskGmaPBZNV07o1GyAQKlHx88iWIDZj4Fde40lt2tMC8dNJ3URl
	 tYU6GrIISYkpJZSekWqjkYPFhpqVMLjLmo08t1YYOSCyv5H12Ds5XF4jTiDBIgdincs28
	 LGEpi/YqQY/+Ck+vLHvKTceEvq1YNDOvmD8dg1g4EY8g2pHGVdE3Kf3tN+TaObG99VZzc
	 HKkLeniaccyD9AbzTF7pZkLkE5tHe1X2RnqrtYOkNudTEA/6f9eXlG/U70nprF6r7/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98F8606A330
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 09:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D98F8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.172])
	by gateway (Coremail) with SMTP id _____8BxLtMC3vJqWCEeAA--.21058S3;
	Tue, 10 Nov 2026 17:04:02 +0800 (CST)
Received: from ubuntu.loongson.cn (unknown [127.0.0.1])
	by front1 (Coremail) with SMTP id qMiowJCxe84A3vJqYXQzAA--.22085S2;
	Tue, 10 Nov 2026 17:04:00 +0800 (CST)
From: wuqianhai@loongson.cn
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	tzimmermann@suse.de,
	deller@gmx.de,
	bhelgaas@google.com
Cc: ardb@kernel.org,
	ilias.apalodimas@linaro.org,
	javierm@redhat.com,
	loongarch@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-efi@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wuqianhai <wuqianhai@loongson.cn>
Subject: [PATCH v3 0/6] LoongArch: Identify the firmware/boot display device
Date: Tue, 10 Nov 2026 17:01:57 +0800
Message-Id: <20261110090203.2631481-1-wuqianhai@loongson.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029033440.973077-1-wuqianhai@loongson.cn>
References: <20261029033440.973077-1-wuqianhai@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxe84A3vJqYXQzAA--.22085S2
X-CM-SenderInfo: 5zxtxtpqkdxqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGw17XFy8uF1kWrW7Zw15ZFc_yoWruFWUpF
	4a9a9xJr4kWr4xGryIy34UXFn8Arn7G3yagFWakw18C345Jr18WF93t3yDXa4UJ393J3WF
	qF15Jw1xWF4DuagCm3ZEXasCq-sJn29KB7ZKAUJUUUjU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1ln4kS14v26r1q6r43M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6Fy26r45twAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0x
	vY0x0EwIxGrwAKzVCY07xG64k0F24lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j
	6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IUe
	JDGUUUUUU==

From: wuqianhai <wuqianhai@loongson.cn>

On LoongArch the kernel cannot reliably identify the display device that
was set up by the firmware and used for the boot console.  Two code paths
need this information and currently get it wrong:

  * The PCI VGA arbiter: vga_is_firmware_default() is compiled only on
    x86, so on LoongArch vga_default_device() may select the wrong GPU
    when several are present (for example an integrated display
    controller and a discrete card).

  * The framebuffer console: LoongArch does not implement
    video_is_primary_device(), so with
    CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y the console falls back to
    the generic stub that always returns false and binds to the first
    registered framebuffer instead of the boot display.

This series fixes both by publishing the firmware framebuffer information
through screen_info on LoongArch and consuming it the same way x86 does.

Patch 1 always defines and initializes sysfb_primary_display, and always
provides its EFI stub alias, instead of guarding them behind
SYSFB/EFI_EARLYCON.

Patch 2 refreshes screen_info from the PCI resource-assignment path after
the root-bus resources are assigned, so the framebuffer address is final
before the VGA arbiter and sysfb_init() consume it.  The call is placed
in the LoongArch PCI scan path because only LoongArch has this ordering:
acpi_init() relocates the BAR before vga_arb_device_init() runs.  On x86
the screen_info address is still accurate at that point.  If you would
rather have the helper called from the generic
pci_assign_unassigned_root_bus_resources() path so that all architectures
share it, that can be done instead.

Patch 3 removes pci_fixup_vgadev(), which overrides the VGA default
device to a discrete card after the arbiter has already selected the
firmware framebuffer device, so vga_default_device() consistently
reflects the boot display.

Patch 4 implements video_is_primary_device() for LoongArch by reusing the
VGA default device selected by the arbiter.

Patch 5 lets the EFI stub link directly to sysfb_primary_display on
LoongArch, so the firmware framebuffer information is always populated.

Patch 6 lets the VGA arbiter use CONFIG_SCREEN_INFO instead of an
architecture check and makes VGA_ARB select SCREEN_INFO on LoongArch.

Patches 1-4 are LoongArch-specific.  Patches 5 and 6 touch generic code
(the EFI stub and the PCI VGA arbiter) and are placed last so they can be
reviewed and merged separately.  Patches 3 and 4 depend on patch 6 taking
effect, but are ordered ahead of it only to group the LoongArch changes
together.

Changes since v2:
  - Split the screen_info refresh out of vga_arb_device_init() into the
    LoongArch PCI resource-assignment path (patch 2), following Thomas'
    suggestion to decouple it from sysfb_init().
  - Drop the per-architecture check in vgaarb.c and the select of SYSFB
    in favour of CONFIG_SCREEN_INFO and select SCREEN_INFO (patch 6).
  - Always define and initialize sysfb_primary_display, and let the EFI
    stub link to it directly (patches 1 and 5), instead of guarding them
    behind SYSFB/EFI_EARLYCON.
  - Remove the vga_default_device() override (patch 3) so the arbiter's
    firmware-framebuffer selection takes effect.
  - Implement video_is_primary_device() (patch 4) by reusing the arbiter's
    default device, so FRAMEBUFFER_CONSOLE_DETECT_PRIMARY works.

Build-tested on loongarch64 with GCC 8.3.0.

wuqianhai (6):
  LoongArch: efi: Provide sysfb_primary_display for screen_info users
  LoongArch/PCI: Refresh screen_info after resource assignment
  LoongArch/PCI: Remove vga default device override
  LoongArch: video: Implement primary framebuffer device detection
  efi/libstub: Enable direct sysfb_primary_display access on LoongArch
  PCI/VGA: Enable firmware default device detection on LoongArch

 arch/loongarch/Makefile                       |  3 ++
 arch/loongarch/include/asm/video.h            |  7 +++++
 arch/loongarch/kernel/efi.c                   |  5 +---
 arch/loongarch/kernel/image-vars.h            |  2 --
 arch/loongarch/pci/acpi.c                     |  4 +++
 arch/loongarch/pci/pci.c                      | 18 ------------
 arch/loongarch/video/Makefile                 |  3 ++
 arch/loongarch/video/video-common.c           | 29 +++++++++++++++++++
 drivers/firmware/efi/libstub/efi-stub-entry.c |  1 +
 drivers/pci/Kconfig                           |  2 +-
 drivers/pci/vgaarb.c                          |  2 +-
 11 files changed, 50 insertions(+), 26 deletions(-)
 create mode 100644 arch/loongarch/video/Makefile
 create mode 100644 arch/loongarch/video/video-common.c

-- 
2.34.1

