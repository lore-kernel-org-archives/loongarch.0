Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739033F9277
	for <loongarch@lists.linux.dev>; Tue,  4 Aug 2026 08:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785830685; cv=none; b=QCDq+O0LBVM1k5+3BZP3JxMX+qQIjDpP+V8m3BOg8a3ACUN6NOx51ysOGfIRoTHRt9aWWoYUrBoIeswgzQhHjDIF26l/TjhH8NO/Rg9g5mdHvLrLC9evNPRT832XCeB/glxTZftzeS5aZwoCM/j+HwXtEsp9MhUinsY0cveSu2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785830685; c=relaxed/simple;
	bh=6DJCN9Nf8oFjMNMX+C+kdDaYVGgRPvnr6sQD4ya7eJI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eMmn2Vv3G/Ws+BE21+gM0xeGEHQ4OG/DThxFbeLpGXEwNphaamy7l5UX7IW0BAXsXmA6l594V4z6na1Ngg7Yqm3BlskItbL95PNTDQLj3i0Pxh2F6YdGOrJRqz9zOR6WvulaWaqjl5dCBWSpwXzwVOUTAj7Pg1623py4cqJmxJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8CxqusWnXFqwTQKAA--.33445S3;
	Tue, 04 Aug 2026 16:04:38 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJAxnMYVnXFqtCYjAA--.56081S2;
	Tue, 04 Aug 2026 16:04:38 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Rong Bao <rong.bao@csmantle.top>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] LoongArch: Fix acpi_package_ids array overflow
Date: Tue,  4 Aug 2026 15:57:19 +0800
Message-Id: <20260804075719.1137338-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxnMYVnXFqtCYjAA--.56081S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

With LoongArch virt machine, one typical setting is one core per socket,
there will max 256 sockets on one VM. With PPTT acpi table, array
acpi_package_ids will be overflowed.

Here change array size of acpi_package_ids with max value of
MAX_PACKAGES and KVM_MAX_VCPUS.

Fixes: 4e8f58620f67 ("LoongArch: Retrieve CPU package ID from PPTT when available")
Cc: stable@vger.kernel.org
Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kernel/acpi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/acpi.c b/arch/loongarch/kernel/acpi.c
index 873e90990771..cb454ee92b20 100644
--- a/arch/loongarch/kernel/acpi.c
+++ b/arch/loongarch/kernel/acpi.c
@@ -13,6 +13,7 @@
 #include <linux/export.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
+#include <linux/kvm_host.h>
 #include <linux/memblock.h>
 #include <linux/of_fdt.h>
 #include <linux/serial_core.h>
@@ -202,7 +203,7 @@ static void __init acpi_process_madt(void)
 
 int pptt_enabled;
 static int acpi_nr_packages;
-static int acpi_package_ids[MAX_PACKAGES];
+static int acpi_package_ids[MAX(MAX_PACKAGES, KVM_MAX_VCPUS)];
 
 int __init parse_acpi_topology(void)
 {

base-commit: 075b74841bd0065a3bda3440873c747938e69b68
-- 
2.39.3

