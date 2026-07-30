Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D6B32B10F
	for <loongarch@lists.linux.dev>; Thu, 30 Jul 2026 06:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785393956; cv=none; b=tlzNvuS0Qlu2wBmUL8BQFvnuVPaO0rHeEeq7UJ8fGjbJMQN5a5aD/rUKJwZ2cS1e1DFl25A0OM68TMtrAHGh2AGRnluiBiCXWp1YLUERqpGvnK3p44YB6faWGXNCKv9g8WVDvrzpL7fCl8ozAShnCOW6p9V+yfwq9t/LgXs4j2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785393956; c=relaxed/simple;
	bh=p0vkAZlX/X5tEDTVu20rW1wp8TPLM3IgWx/vwd0RY44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ajqP0jJCwnjrevZ4FKAhQ37/UBtLFtSao6MCK4b9zeIHPAV28gzJikN2ZzK/Astcu8I1g9Yh0BI+1rCu+wD83iFZfAsxHM1t7tUnGDN9jUrYWivCONthvLVuyb/4/9Akr/u653nudzGBzK7Ms4TNUuLaML0uSA/9Lj0sxVRYXvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.123])
	by gateway (Coremail) with SMTP id _____8Axx+og82pqrMQIAA--.30010S3;
	Thu, 30 Jul 2026 14:45:52 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.123])
	by front1 (Coremail) with SMTP id qMiowJAxSsQU82pq8IUdAA--.41200S3;
	Thu, 30 Jul 2026 14:45:52 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
To: bp@alien8.de
Cc: tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Wang Jinwei <wangjinwei@loongson.cn>,
	Dongyan Qian <qiandongyan@loongson.cn>,
	Chao Li <lichao@loongson.cn>,
	Qunqin Zhao <zhaoqunqin@loongson.cn>
Subject: [PATCH 2/3] EDAC/loongson: get DIMM size from ACPI _DSM method
Date: Thu, 30 Jul 2026 14:30:34 +0800
Message-ID: <20260730063035.230686-2-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260730063035.230686-1-zhaoqunqin@loongson.cn>
References: <20260730063035.230686-1-zhaoqunqin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxSsQU82pq8IUdAA--.41200S3
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Zr13Zry8Gr4fKw1fWw15trc_yoW8Kr4xpF
	45u34fKr43KFnF9wsIyry5uFy3u34fJasrGFWxJ3yYgw1DA34UXa4rKa43JFZ5A345JFWj
	vrWkGws5uF1DJrcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU82g43UUUUU==

From: Wang Jinwei <wangjinwei@loongson.cn>

Add support to retrieve DIMM size from ACPI _DSM method instead
of using hardcoded values.

1. Add loongson_get_dimm_size_acpi() to call ACPI _DSM method
   to get DIMM size in MB.

2. Update dimm_config_init() to use the size from ACPI, with
   fallback to default 1 MB if ACPI method fails.

3. Add ACPI UUID and DSM function definitions for EDAC.

The DIMM size is passed from UEFI through ACPI OperationRegion
and _DSM method, enabling correct display of memory size in
/sys/devices/system/edac/mc/mc*/size_mb.

Cc: Dongyan Qian <qiandongyan@loongson.cn>
Cc: Chao Li <lichao@loongson.cn>
Signed-off-by: Wang Jinwei <wangjinwei@loongson.cn>
Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
---
 drivers/edac/loongson_edac.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
index f2452e98f5..b458f81dfe 100644
--- a/drivers/edac/loongson_edac.c
+++ b/drivers/edac/loongson_edac.c
@@ -13,6 +13,8 @@
 #include "edac_module.h"
 
 #define ECC_CS_COUNT_REG	0x18
+#define LOONGSON_EDAC_DSM_UUID	"65d0431b-7eb8-46df-b914-b7d568553140"
+#define LOONGSON_EDAC_DSM_FUNC_GET_DIMM_SIZE	1
 
 struct loongson_edac_pvt {
 	void __iomem *ecc_base;
@@ -69,13 +71,39 @@ static void edac_check(struct mem_ctl_info *mci)
 			     0, 0, 0, 0, 0, -1, "error", other_detail);
 }
 
+static u32 loongson_get_dimm_size_acpi(struct device *dev)
+{
+	acpi_handle handle = ACPI_HANDLE(dev);
+	union acpi_object *obj;
+	u32 size_mb = 1;
+	guid_t guid;
+
+	if (!handle)
+		return size_mb;
+
+	if (guid_parse(LOONGSON_EDAC_DSM_UUID, &guid))
+		return size_mb;
+
+	obj = acpi_evaluate_dsm(handle, &guid, 0,
+				LOONGSON_EDAC_DSM_FUNC_GET_DIMM_SIZE, NULL);
+	if (!obj)
+		return size_mb;
+
+	if (obj->type == ACPI_TYPE_INTEGER)
+		size_mb = (u32)obj->integer.value;
+
+	ACPI_FREE(obj);
+	return size_mb;
+}
+
 static void dimm_config_init(struct mem_ctl_info *mci)
 {
 	struct dimm_info *dimm;
+	struct device *dev = mci->pdev;
 	u32 size, npages;
 
-	/* size not used */
-	size = -1;
+	size = loongson_get_dimm_size_acpi(dev);
+
 	npages = MiB_TO_PAGES(size);
 
 	dimm = edac_get_dimm(mci, 0, 0, 0);
-- 
2.47.2

