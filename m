Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794301107;
	b=xXbzGtafU2zNtamL0HiqsX1II0E/6LlZuOvz4W5uQTpNjB7Nt1rH832lYqgM3RHAiw8x
	 3R0TV5zRlyQ65ZNL9OuF1oR65ELxXhAts3iwdae/M0Fr380a0TK73pKX0rQZ8GA9+lekj
	 hSgnPFdUP0MdL1b0RfpN1DHSLcl2bk933ACkWNT1Wodei6mLowZKzD4K58dhQ0MMzgUhh
	 usJPD3z5zcSuVj66MPt6bFM1RFd9293xx2xbSgObfSVUdof9TAKRE4fJw2/BuWPjqfmT2
	 O2Q/EN/aiziHr8Kj0avucGJMdV+zXYlGV7JBAovrfdiQPwb2K10FeYbCNC9X9KOlEpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301107;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=1bfC9N6ELP+5DriqcpxzXRy+3LJItx2+bFeyZEtPwLY=;
	b=xUp2unf5SAF1M5DRY9mQ1FMw2z7Y+/ijeBmp0FcfCqpQYmkSSYYt1RP/eK3jMfokbaCa
	 8E4Y89gbeLB3D4cIlvx1Jzl0so2ySuipz8IeMQuGgO1hoHFJC+DAFNkODnE0D3LMFitR4
	 4mLXiJWI/XqgB+eonLe8HSjHqSrsoCwN0p/1jIhRJE36VJrIxHduHeTOr62m6Oak+KEkq
	 VoXN18xwRg14Oi/5le83rlGJw3luKboP10NDWuwnowZfMSW9tvCAPEFELtb+uNRdvXE0x
	 /mKwBf4vSNC7X+60PxFtSFNRdbts1zUzYWV1wyLB4TlUYBSHtltEoj/z6xOYlBLGdSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BE5606A334
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 08:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19BE5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.172])
	by gateway (Coremail) with SMTP id _____8DxjdKw3PJqdiAeAA--.21170S3;
	Tue, 10 Nov 2026 16:58:24 +0800 (CST)
Received: from ubuntu.loongson.cn (unknown [127.0.0.1])
	by front1 (Coremail) with SMTP id qMiowJBxrM6m3PJq83MzAA--.21431S4;
	Tue, 10 Nov 2026 16:58:22 +0800 (CST)
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
Subject: [PATCH v3 2/6] LoongArch/PCI: Refresh screen_info after resource assignment
Date: Tue, 10 Nov 2026 16:56:13 +0800
Message-Id: <20261110085617.2626835-3-wuqianhai@loongson.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110085617.2626835-1-wuqianhai@loongson.cn>
References: <20261029033440.973077-1-wuqianhai@loongson.cn>
 <20261110085617.2626835-1-wuqianhai@loongson.cn>
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
X-CM-TRANSID:qMiowJBxrM6m3PJq83MzAA--.21431S4
X-CM-SenderInfo: 5zxtxtpqkdxqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7uF1DKF13CF18Zr4kArW8AFc_yoW8GFWrpF
	ZIvrsrtrW8GF1xGFs8t34DXr4qqF1v93429FZrKFyrA39Fvrn0q397Crn8WF1DJw4Fva1r
	ZFZxCw4FkF4DAabCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwAKzVCY07xG64k0F24lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUxF4EDUUUU

From: wuqianhai <wuqianhai@loongson.cn>

PCI resource assignment runs from acpi_init() at subsys_initcall time.
The firmware framebuffer BAR can be relocated, leaving screen_info's
lfb_base stale.  vga_arb_device_init() runs later at subsys_initcall_sync
time and reads screen_info to identify the firmware default VGA device.

Update screen_info through the generic screen_info_apply_fixups() helper
right after the root bus resources have been assigned, so both the VGA
arbiter and sysfb_init() observe the final framebuffer address.

Signed-off-by: wuqianhai <wuqianhai@loongson.cn>
---
 arch/loongarch/pci/acpi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/loongarch/pci/acpi.c b/arch/loongarch/pci/acpi.c
index ccbcea61fcd9..cb313ff67f7e 100644
--- a/arch/loongarch/pci/acpi.c
+++ b/arch/loongarch/pci/acpi.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 #include <linux/pci-acpi.h>
 #include <linux/pci-ecam.h>
+#include <linux/screen_info.h>
 
 #include <asm/pci.h>
 #include <asm/numa.h>
@@ -256,6 +257,9 @@ struct pci_bus *pci_acpi_scan_root(struct acpi_pci_root *root)
 		 */
 		pci_assign_unassigned_root_bus_resources(bus);
 
+		if (IS_ENABLED(CONFIG_SCREEN_INFO))
+			screen_info_apply_fixups();
+
 		list_for_each_entry(child, &bus->children, node)
 			pcie_bus_configure_settings(child);
 	}
-- 
2.34.1

