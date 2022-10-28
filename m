Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29E21867
	for <loongarch@lists.linux.dev>; Fri, 28 Oct 2022 02:55:20 +0000 (UTC)
Received: from loongson.cn (unknown [10.180.13.64])
	by gateway (Coremail) with SMTP id _____8BxWtiURFtjQwEDAA--.9649S3;
	Fri, 28 Oct 2022 10:55:16 +0800 (CST)
Received: from localhost.localdomain (unknown [10.180.13.64])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxmFePRFtj1R8GAA--.3496S2;
	Fri, 28 Oct 2022 10:55:16 +0800 (CST)
From: Yinbo Zhu <zhuyinbo@loongson.cn>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Yang Li <yang.lee@linux.alibaba.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/3] dt-bindings: clock: add loongson-2 clock include file
Date: Fri, 28 Oct 2022 10:55:02 +0800
Message-Id: <20221028025504.13247-1-zhuyinbo@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxmFePRFtj1R8GAA--.3496S2
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Wry3AFyUJrW7AFWruFW7Jwb_yoW8KFy3pr
	4kCFyfKry2yF4IkwsYqFy3Kr13uw4xJ3W7AF47uF1UAFnrJw18JwnruF1fA39xXrWkGFWx
	ZaykCw4j9FsrW3DanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bfkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
	kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28E
	F7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY
	6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrV
	C2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE
	7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x
	0EwIxGrwCF04k20xvE74AGY7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xF
	xVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_
	JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIY
	CTnIWIevJa73UjIFyTuYvjxUciSdDUUUU

This file defines all Loongson-2 SoC clock indexes, it should be
included in the device tree in which there's device using the
clocks.

Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Change in v5:
		1. Replace loongson2/Loongson2 with loongson-2/Loongson-2.
		2. Replace soc with SoC.

 MAINTAINERS                                   |  6 ++++
 include/dt-bindings/clock/loongson,ls2k-clk.h | 29 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 include/dt-bindings/clock/loongson,ls2k-clk.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6ae50b1257e9..369a527740c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11907,6 +11907,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
 F:	drivers/thermal/loongson2_thermal.c
 
+LOONGSON2 SOC SERIES CLOCK DRIVER
+M:	Yinbo Zhu <zhuyinbo@loongson.cn>
+L:	linux-clk@vger.kernel.org
+S:	Maintained
+F:	include/dt-bindings/clock/loongson,ls2k-clk.h
+
 LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI)
 M:	Sathya Prakash <sathya.prakash@broadcom.com>
 M:	Sreekanth Reddy <sreekanth.reddy@broadcom.com>
diff --git a/include/dt-bindings/clock/loongson,ls2k-clk.h b/include/dt-bindings/clock/loongson,ls2k-clk.h
new file mode 100644
index 000000000000..db1e27e792ff
--- /dev/null
+++ b/include/dt-bindings/clock/loongson,ls2k-clk.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Author: Yinbo Zhu <zhuyinbo@loongson.cn>
+ * Copyright (C) 2022-2023 Loongson Technology Corporation Limited
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_LOONGSON2_H
+#define __DT_BINDINGS_CLOCK_LOONGSON2_H
+
+#define LOONGSON2_REF_100M				0
+#define LOONGSON2_NODE_PLL				1
+#define LOONGSON2_DDR_PLL				2
+#define LOONGSON2_DC_PLL				3
+#define LOONGSON2_PIX0_PLL				4
+#define LOONGSON2_PIX1_PLL				5
+#define LOONGSON2_NODE_CLK				6
+#define LOONGSON2_HDA_CLK				7
+#define LOONGSON2_GPU_CLK				8
+#define LOONGSON2_DDR_CLK				9
+#define LOONGSON2_GMAC_CLK				10
+#define LOONGSON2_DC_CLK				11
+#define LOONGSON2_APB_CLK				12
+#define LOONGSON2_USB_CLK				13
+#define LOONGSON2_SATA_CLK				14
+#define LOONGSON2_PIX0_CLK				15
+#define LOONGSON2_PIX1_CLK				16
+#define LOONGSON2_CLK_END				17
+
+#endif
-- 
2.31.1

