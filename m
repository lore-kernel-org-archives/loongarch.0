Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303317;
	b=HOhH8jpN8J05SzhEY8x86/CNrzJU+BwfTQO+ws8CoVdDHnH3L+4UuKr2u1A+yOq7SUT3
	 6hAtUYN9bHB8uxrlDJQT0DlkNS53cHsHvh7iPn+/NbHO1ZQElFGs+3h2HHlcApBaKyLHv
	 hKRnpICprcUB+o7Y/gCAoIyU0MPZhyESZ8bpS+aa6K6rID0iaQlvlcquLsV7wcDVyJWIP
	 wvQKJbXsBxqdHVaJbUxTB5m7+E14GXZD+5pdFS+0eqWYW02i5l7751Mdr+QciQvZDFJjL
	 RP4ymYzZxNE0wLYNsCHVxuJdS9GQuyukUtUcBPr3RGSBUkVV2J3301lzIxYFp6JbW+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303317;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=xRUrPvQvMgrqsZdTYJoukiNn/2QqZsUFyrY9jS0BkVA=;
	b=fnvISB4GMrGp8wiqhLsYEHBE4uNlrpCpwuYL896cfLun4XgEzTJcnw3fyteoLrxqizPc
	 dAVdVCzjNs3AZp5/iCK2nv20zBy/4Xe7yhVWfgfvd97/5+wR1w/erXfUysUzr1r3GEnpX
	 wTwcFTBHmei/AsT7cA+zzc3u47/SM2ox1rvcUYAeOOQ2Ntou/yIvifG8d2/WKHW2LeQFl
	 +C0jFi0G+2X2dd8nC0Gb8QAPmLv83S5ajGHwuIiAzOI69XXoLmhsRMfJvPQ+YkgkDWJCV
	 8FOPBcE00zoBQz0mmN5hOZOOURx9BulN5XgCLSSaOLEHD6VGLI8SeKq44RofU6G2nnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D9D606CFB9
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 09:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6D9D606CFB9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8DxytFQ5fJq8iMeAA--.20996S3;
	Tue, 10 Nov 2026 17:35:13 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJAxmM1O5fJqHXYzAA--.38371S2;
	Tue, 10 Nov 2026 17:35:12 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	"Rafael J . Wysocki" <rjw@rjwysocki.net>,
	Len Brown <lenb@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] ACPI: LoongArch: Validate ACPI IOVT device entries
Date: Tue, 10 Nov 2026 17:35:00 +0800
Message-ID: <20261110093500.2875664-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
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
X-CM-TRANSID:qMiowJAxmM1O5fJqHXYzAA--.38371S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWrWxAF1kur1kJF4DXF18JFc_yoW5CrW8pF
	43urW5trWxJr47Wr1Iqwn8uFWa9ayv9ayF9rW3K3yYkFs7GrWrXFWxAF90vas5Aa9rWa1f
	J3WUtF4UKF1UZwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AK
	xVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU8fsqJUUUUU==

START and END device entries in ACPI IOVT should be paired and
adjacent, while SINGLE entries shouldn't be between START and END.
So add a iovt_validate_entries() function to validate the entries
before the real parsing.

By the way, move kzalloc_obj() from the ACPI_IOVT_DEVICE_ENTRY_END
case to the ACPI_IOVT_DEVICE_ENTRY_START case, so as to avoid NULL
pointer dereference.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/acpi/loongarch/iovt.c | 53 ++++++++++++++++++++++++++++-------
 1 file changed, 43 insertions(+), 10 deletions(-)

diff --git a/drivers/acpi/loongarch/iovt.c b/drivers/acpi/loongarch/iovt.c
index c972805c8e53..1e97669eaeea 100644
--- a/drivers/acpi/loongarch/iovt.c
+++ b/drivers/acpi/loongarch/iovt.c
@@ -84,10 +84,43 @@ static int __init iovt_get_pci_iommu_fwnode(struct iovt_fwnode *np, u16 segment,
 	return 0;
 }
 
+static int __init iovt_validate_entries(struct acpi_iovt_iommu *iommu)
+{
+	int i, done = 1;
+	struct acpi_iovt_device_entry *ep;
+
+	ep = ACPI_ADD_PTR(struct acpi_iovt_device_entry, iommu, iommu->device_entry_offset);
+	for (i = 0; i < iommu->device_entry_num; i++) {
+		switch (ep->type) {
+		case ACPI_IOVT_DEVICE_ENTRY_START:
+			if (!done)
+				return -EINVAL;
+
+			done = 0;
+			break;
+		case ACPI_IOVT_DEVICE_ENTRY_END:
+			if (done)
+				return -EINVAL;
+
+			done = 1;
+			break;
+		case ACPI_IOVT_DEVICE_ENTRY_SINGLE:
+		default:  /* Reserved for future */
+			if (!done)
+				return -EINVAL;
+
+			done = 1;
+			break;
+		}
+		ep = ACPI_ADD_PTR(struct acpi_iovt_device_entry, ep, ep->length);
+	}
+
+	return done ? 0 : -EINVAL;
+}
+
 static int __init iovt_add_iommu(struct acpi_iovt_iommu *iommu)
 {
 	int i, ret;
-	bool is_start = false;
 	struct iovt_fwnode *np;
 	struct iovt_device_entry *entry;
 	struct acpi_iovt_device_entry *ep;
@@ -121,23 +154,24 @@ static int __init iovt_add_iommu(struct acpi_iovt_iommu *iommu)
 	if (np->flag & ACPI_IOVT_IOMMU_MAGAGE_BY_SEGMENT)
 		goto skip;
 
+	if (iovt_validate_entries(iommu) < 0) {
+		kfree(np);
+		return -EINVAL;
+	}
+
 	INIT_LIST_HEAD(&np->ep_list);
 	ep = ACPI_ADD_PTR(struct acpi_iovt_device_entry, iommu, iommu->device_entry_offset);
 	for (i = 0; i < iommu->device_entry_num; i++) {
 		switch (ep->type) {
 		case ACPI_IOVT_DEVICE_ENTRY_START:
-			is_start = true;
-			entry->start_devid = ep->device_id;
-			break;
-		case ACPI_IOVT_DEVICE_ENTRY_END:
-			if (!is_start)
-				break;
-
 			entry = kzalloc_obj(struct iovt_device_entry, GFP_ATOMIC);
 			if (!entry)
 				return -ENOMEM;
 
-			is_start = false;
+			entry->start_devid = ep->device_id;
+			break;
+		case ACPI_IOVT_DEVICE_ENTRY_END:
+			/* START & END are paired */
 			entry->end_devid = ep->device_id;
 			list_add_tail(&entry->list, &np->ep_list);
 			break;
@@ -146,7 +180,6 @@ static int __init iovt_add_iommu(struct acpi_iovt_iommu *iommu)
 			if (!entry)
 				return -ENOMEM;
 
-			is_start = false;
 			entry->start_devid = ep->device_id;
 			entry->end_devid = ep->device_id;
 			list_add_tail(&entry->list, &np->ep_list);
-- 
2.52.0

