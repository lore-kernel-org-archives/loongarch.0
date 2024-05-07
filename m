Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE1D15E5B8
	for <loongarch@lists.linux.dev>; Tue,  7 May 2024 12:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715084556; cv=none; b=NlH7OazC2qijWVbbBXzbswwSoLObtsn47nnTKvbIutYIP9UQLG8iEv/EcoGCnyw/sj8WUXTQ+qMyN7wxQDlkqaP+4bIubh8VZCMSfScSA8GbJa1ue8StptqoHMvFUw1UrBlpe6HO5g1h3Pr+aXxtfLdD/BCAk2zDehuTYbODJxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715084556; c=relaxed/simple;
	bh=P6OVKvpCCsdebuKqd+D/tHWKONqi84dZHxn/mU5HZQM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=hgY76/+/lZObaAfwgd6tonktWSc+RDWSvxtLY+ZD9MEI8+TntS9G7hHeotX7IRRpei0429tbMY/pNZDWb4rJ+aLDEtKiQ4LbhHW1pGAds3G8ljtdT0+48yMkguxWvDpa32W1KXFhuZthGCL1xXAaLd+maFVB4unFExYy+tgLnmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.10.34])
	by gateway (Coremail) with SMTP id _____8AxK+oHHTpm+NIIAA--.11776S3;
	Tue, 07 May 2024 20:22:32 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.10.34])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx8VUGHTpm9QsUAA--.22782S2;
	Tue, 07 May 2024 20:22:31 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	corbet@lwn.net,
	alexs@kernel.org,
	siyanteng@loongson.cn
Cc: loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: [PATCH 1/2] docs: Add advanced extended IRQ model description
Date: Tue,  7 May 2024 20:22:28 +0800
Message-Id: <20240507122228.5288-1-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dx8VUGHTpm9QsUAA--.22782S2
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxCFy8Gr17WryfWr47KF1fZrc_yoWrZr47pr
	ZxCryIqF48Gry5Xr17Jr18Wr13G3Z3Ja1DtF1xtry8Xr1kAr1Utr1UtrykJFy7G34rAF1j
	qFWrtw1UGw1UJwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2eT5DUUUU

From 3C6000, Loongarch began to support advanced extended
interrupt mode, in which each CPU has an independent interrupt
vector number.This will enhance the architecture's ability
to support modern devices

Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
---
 .../arch/loongarch/irq-chip-model.rst         | 33 +++++++++++++++++
 .../zh_CN/arch/loongarch/irq-chip-model.rst   | 37 +++++++++++++++++--
 2 files changed, 67 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/loongarch/irq-chip-model.rst b/Documentation/arch/loongarch/irq-chip-model.rst
index 7988f4192363..79228741d1b9 100644
--- a/Documentation/arch/loongarch/irq-chip-model.rst
+++ b/Documentation/arch/loongarch/irq-chip-model.rst
@@ -85,6 +85,39 @@ to CPUINTC directly::
     | Devices |
     +---------+
 
+Advanced Extended IRQ model
+=======================
+
+In this model, IPI (Inter-Processor Interrupt) and CPU Local Timer interrupt go
+to CPUINTC directly, CPU UARTS interrupts go to LIOINTC, MSI interrupts go to AVEC,
+and then go to CPUINTC, Other devices interrupts go to PCH-PIC/PCH-LPC and gathered
+by EIOINTC, and then go to CPUINTC directly::
+
+ +-----+     +--------------------------+     +-------+
+ | IPI | --> |           CPUINTC        | <-- | Timer |
+ +-----+     +--------------------------+     +-------+
+              ^        ^             ^
+              |        |             |
+      +--------+  +---------+ +---------+     +-------+
+      | AVEC   |  | EIOINTC | | LIOINTC | <-- | UARTs |
+      +--------+  +---------+ +---------+     +-------+
+           ^            ^
+           |            |
+         +---------+  +---------+
+         |   MSI   |  | PCH-PIC |
+         +---------+  +---------+
+            ^          ^       ^
+            |          |       |
+    +---------+ +---------+ +---------+
+    | Devices | | PCH-LPC | | Devices |
+    +---------+ +---------+ +---------+
+                     ^
+                     |
+                +---------+
+                | Devices |
+                +---------+
+
+
 ACPI-related definitions
 ========================
 
diff --git a/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst b/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
index f1e9ab18206c..7ccde82dd666 100644
--- a/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
+++ b/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
@@ -9,9 +9,8 @@
 LoongArch的IRQ芯片模型（层级关系）
 ==================================
 
-目前，基于LoongArch的处理器（如龙芯3A5000）只能与LS7A芯片组配合工作。LoongArch计算机
-中的中断控制器（即IRQ芯片）包括CPUINTC（CPU Core Interrupt Controller）、LIOINTC（
-Legacy I/O Interrupt Controller）、EIOINTC（Extended I/O Interrupt Controller）、
+LoongArch计算机中的中断控制器（即IRQ芯片）包括CPUINTC（CPU Core Interrupt Controller）、
+LIOINTC（Legacy I/O Interrupt Controller）、EIOINTC（Extended I/O Interrupt Controller）、
 HTVECINTC（Hyper-Transport Vector Interrupt Controller）、PCH-PIC（LS7A芯片组的主中
 断控制器）、PCH-LPC（LS7A芯片组的LPC中断控制器）和PCH-MSI（MSI中断控制器）。
 
@@ -87,6 +86,38 @@ PCH-LPC/PCH-MSI，然后被EIOINTC统一收集，再直接到达CPUINTC::
     | Devices |
     +---------+
 
+高级扩展IRQ模型
+=======================
+
+在这种模型里面，IPI（Inter-Processor Interrupt）和CPU本地时钟中断直接发送到CPUINTC，
+CPU串口（UARTs）中断发送到LIOINTC，MSI中断发送到AVEC,而后通过AVEC送达CPUINTC，而
+其他所有设备的中断则分别发送到所连接的PCH-PIC/PCH-LPC，然后由EIOINTC统一收集，再直
+接到达CPUINTC::
+
+ +-----+     +--------------------------+     +-------+
+ | IPI | --> |           CPUINTC        | <-- | Timer |
+ +-----+     +--------------------------+     +-------+
+              ^        ^             ^
+              |        |             |
+      +--------+  +---------+ +---------+     +-------+
+      | AVEC   |  | EIOINTC | | LIOINTC | <-- | UARTs |
+      +--------+  +---------+ +---------+     +-------+
+              ^        ^
+              |        |
+      +---------+  +-------------+
+      |   MSI   |  |   PCH-PIC   |
+      +---------+  +-------------+
+            ^          ^       ^
+            |          |       |
+    +---------+ +---------+ +---------+
+    | Devices | | PCH-LPC | | Devices |
+    +---------+ +---------+ +---------+
+                     ^
+                     |
+                +---------+
+                | Devices |
+                +---------+
+
 ACPI相关的定义
 ==============
 
-- 
2.20.1

