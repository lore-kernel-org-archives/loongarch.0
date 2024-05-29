Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE5B1643A
	for <loongarch@lists.linux.dev>; Wed, 29 May 2024 13:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716989908; cv=none; b=uSpmnxyWe36le9Mdguq9Lr/xwznamCGrhfyibaupVSNfCgFBDn4gPpvUeA0ClNKmHh2E+XV87zJ4xfSnjmbY5r4YpUyZEcW75Qv3t7Nd7jJUepYuVN4vO+g1pa4gUqo+37thcie92+XWIKP5GYK06hd7NNtYMr7EwkaIfBoi4eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716989908; c=relaxed/simple;
	bh=yx6wFWgL+4ZV/IlKvfT0XGMVimYLKMlnFu30z0Q8X98=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qcg8esEqaT1m6xx9gQIhQxtuLB5Ok9oCsery2pNUooHxEEwVNoJ6ezNEPLfCQrhDmFkBnWGZZxZTI7XpQYADJfMoms+upVUVip23PS6Sj7IvScQrH5xwGVHX7CSkNpogdEBklj4CM3snj27JG676W9fUdD1w/UoZMw0YydPvfPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Vq9RR0qVbz67PFb;
	Wed, 29 May 2024 21:37:23 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id CD609140A78;
	Wed, 29 May 2024 21:38:23 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 14:38:23 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, <linux-acpi@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, <loongarch@lists.linux.dev>,
	<x86@kernel.org>, Russell King <linux@armlinux.org.uk>, "Rafael J . Wysocki"
	<rafael@kernel.org>, Miguel Luis <miguel.luis@oracle.com>, James Morse
	<james.morse@arm.com>, Salil Mehta <salil.mehta@huawei.com>, Jean-Philippe
 Brucker <jean-philippe@linaro.org>, Hanjun Guo <guohanjun@huawei.com>, Gavin
 Shan <gshan@redhat.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	<linuxarm@huawei.com>, <justin.he@arm.com>, <jianyong.wu@arm.com>
Subject: [PATCH v10 07/19] ACPI: processor: Add acpi_get_processor_handle() helper
Date: Wed, 29 May 2024 14:34:34 +0100
Message-ID: <20240529133446.28446-8-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240529133446.28446-1-Jonathan.Cameron@huawei.com>
References: <20240529133446.28446-1-Jonathan.Cameron@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

If CONFIG_ACPI_PROCESSOR provide a helper to retrieve the
acpi_handle for a given CPU allowing access to methods
in DSDT.

Tested-by: Miguel Luis <miguel.luis@oracle.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/acpi/acpi_processor.c | 11 +++++++++++
 include/linux/acpi.h          |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index 0bc0419adf6b..56592462d2fb 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -35,6 +35,17 @@ EXPORT_PER_CPU_SYMBOL(processors);
 struct acpi_processor_errata errata __read_mostly;
 EXPORT_SYMBOL_GPL(errata);
 
+acpi_handle acpi_get_processor_handle(int cpu)
+{
+	struct acpi_processor *pr;
+
+	pr = per_cpu(processors, cpu);
+	if (pr)
+		return pr->handle;
+
+	return NULL;
+}
+
 static int acpi_processor_errata_piix4(struct pci_dev *dev)
 {
 	u8 value1 = 0;
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 28c3fb2bef0d..fd45bfab66b8 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -304,6 +304,8 @@ int acpi_map_cpu(acpi_handle handle, phys_cpuid_t physid, u32 acpi_id,
 int acpi_unmap_cpu(int cpu);
 #endif /* CONFIG_ACPI_HOTPLUG_CPU */
 
+acpi_handle acpi_get_processor_handle(int cpu);
+
 #ifdef CONFIG_ACPI_HOTPLUG_IOAPIC
 int acpi_get_ioapic_id(acpi_handle handle, u32 gsi_base, u64 *phys_addr);
 #endif
@@ -1076,6 +1078,11 @@ static inline bool acpi_sleep_state_supported(u8 sleep_state)
 	return false;
 }
 
+static inline acpi_handle acpi_get_processor_handle(int cpu)
+{
+	return NULL;
+}
+
 #endif	/* !CONFIG_ACPI */
 
 extern void arch_post_acpi_subsys_init(void);
-- 
2.39.2

