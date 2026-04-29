Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F12031E84E
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 08:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777450040; cv=none; b=OWycH5EytzZ+Wl8rUGenajW7rz+MNGETkVnT45ekq8oN56leuM7O/HyewTCr1aB/65ArqeMIV5WsD6PxZJYstUWqjWe4SEr14Ybr6CpxkBzpN4YFmc9hUvhOj29uqao7pYMB6/k+tqr+2VysaNz3JVyaVtBuHOvT1B/hjjJoWx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777450040; c=relaxed/simple;
	bh=wGu32IMiCnyAgb/TzjLP4pLAkh62VIhosTQmkTrQI4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EQLH/CC5MjUOAPbcF7iC6PdnRcibXLS8u6GsAiWgALD6zxVSN8v5zE9HSPEaCdkAE4NdbKmMXRqXEG6x81ft/ltY1LC5zFlz9bVdy1RvtVzz7WojARr1eLWx5508hEky0OqFxauwK1KjbN2OYgOLI+QhaClQXdW39g6yIL7sa4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.8])
	by gateway (Coremail) with SMTP id _____8Bxzek1vPFpUxAFAA--.15361S3;
	Wed, 29 Apr 2026 16:07:17 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.8])
	by front1 (Coremail) with SMTP id qMiowJDxhcAwvPFp7ix3AA--.43297S2;
	Wed, 29 Apr 2026 16:07:16 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	stable@vger.kernel.org,
	Chao Li <lichao@loongson.cn>,
	Dongyan Qian <qiandongyan@loongson.cn>
Subject: [PATCH] LoongArch: Use per-root-bridge PCIH flag to skip mem resource fixup
Date: Wed, 29 Apr 2026 16:07:04 +0800
Message-ID: <20260429080704.2425187-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxhcAwvPFp7ix3AA--.43297S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7uFy5Gr17AFW7ArWkurWfWFX_yoW8tF1fpF
	ySvw48Gr48Gw17Kws8X34UXF4rZF9YkrW3WF43G34a9an5XryUZw45uryqqa45Aan5Ka1Y
	qFWDJryUWF4DAagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

When firmware enables 64-bit PCI host bridge support, some root bridges
already provide valid 64-bit mem resource windows through ACPI.

In this case, the LoongArch-specific mem resource high-bits fixup in
acpi_prepare_root_resources() should not be applied unconditionally.
Otherwise, the kernel may override the native resource layout derived
from firmware, and later BAR assignment can fail to place device BARs
into the intended 64-bit address space correctly.

Add a per-root-bridge ACPI flag, PCIH, and evaluate it from the current
root bridge device scope. When PCIH is set, skip the mem resource high-
bits fixup path and let the kernel use the firmware-provided resource
description directly. When PCIH is absent or cleared, keep the existing
behavior and continue filling the high address bits from the host bridge
address.

This makes the behavior per-root-bridge configurable and avoids breaking
valid 64-bit BAR space allocation on bridges whose 64-bit windows have
already been fully described by firmware.

Cc: stable@vger.kernel.org
Suggested-by: Chao Li <lichao@loongson.cn>
Tested-by: Dongyan Qian <qiandongyan@loongson.cn>
Signed-off-by: Dongyan Qian <qiandongyan@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/pci/acpi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/loongarch/pci/acpi.c b/arch/loongarch/pci/acpi.c
index 0dde3ddcd544..b02698a338ee 100644
--- a/arch/loongarch/pci/acpi.c
+++ b/arch/loongarch/pci/acpi.c
@@ -61,11 +61,16 @@ static void acpi_release_root_info(struct acpi_pci_root_info *ci)
 static int acpi_prepare_root_resources(struct acpi_pci_root_info *ci)
 {
 	int status;
+	unsigned long long pci_h = 0;
 	struct resource_entry *entry, *tmp;
 	struct acpi_device *device = ci->bridge;
 
 	status = acpi_pci_probe_root_resources(ci);
 	if (status > 0) {
+		acpi_evaluate_integer(device->handle, "PCIH", NULL, &pci_h);
+		if (pci_h)
+			return status;
+
 		resource_list_for_each_entry_safe(entry, tmp, &ci->resources) {
 			if (entry->res->flags & IORESOURCE_MEM) {
 				entry->offset = ci->root->mcfg_addr & GENMASK_ULL(63, 40);
-- 
2.52.0

