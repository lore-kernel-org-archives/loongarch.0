Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94073238C1B
	for <loongarch@lists.linux.dev>; Wed,  3 Dec 2025 03:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764734085; cv=none; b=ISZwrJfyu8xJRlbYQ3B0dYw+njP1ADx8zgSRQ6/1nNif8HK4MP3YXDIrLOn0HiYVp9frk3EMNNsxrfk9KgHL3Lpeqgc1K4JcijjDM88o48qvXmTKr3NmhIQYLedTrJgo8U5GFr0Y8f74smlEeqVlnE8KWYZdb3MgUMluznPYKMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764734085; c=relaxed/simple;
	bh=t3Cd7hg2hGbCtGJ9jeKcQ1i/dz5mbmLQ3jxvFDoyah4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LXb9Ou1s8Krvh4nO5/B/M7oLHRNpmriynvrgVq2AD0QRynzno8cfpq0nxtEsfQUxSZXAEGulcHrDTlDPLtwXgoXkHZWrenWni62SwkAknVvDwXuT5On7EcRGD7gepvSCP//pu6Y74uEJiJ9T7QO0IxzrGwXp5+GlmtZp2L1mSfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.57.136])
	by gateway (Coremail) with SMTP id _____8Cx5tB4tC9pLJMqAA--.26342S3;
	Wed, 03 Dec 2025 11:54:32 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.57.136])
	by front1 (Coremail) with SMTP id qMiowJBxpeRvtC9pdtVEAQ--.50913S3;
	Wed, 03 Dec 2025 11:54:28 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	akpm@linux-foundation.org,
	willy@infradead.org,
	david@redhat.com,
	linmag7@gmail.com,
	thuth@redhat.com,
	maobibo@loongson.cn,
	apopple@nvidia.com
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: [PATCH v7 1/5] Docs/LoongArch: Add Advanced Extended-Redirect IRQ model description
Date: Wed,  3 Dec 2025 11:54:17 +0800
Message-ID: <20251203035422.32205-2-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20251203035422.32205-1-zhangtianyang@loongson.cn>
References: <20251203035422.32205-1-zhangtianyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxpeRvtC9pdtVEAQ--.50913S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxAryfuw1rKw1kKFyUuw45Jwc_yoWrXr4fpr
	Z3GryxXF18Jry5Xr17Jr4UXr13Gwn3Ja1DtF1xKry8Xr4kAr1ktr1UJrykJFy7G34rAr1U
	XFWrJw4UJr1UJwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU90b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVj
	vjDU0xZFpf9x07j0HqcUUUUU=

Introduce the redirect interrupt controllers.When the redirect interrupt
controller is enabled, the routing target of MSI interrupts is no longer
a specific CPU and vector number, but a specific redirect entry. The
actual CPU and vector number used are described by the redirect entry.

Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
---
 .../arch/loongarch/irq-chip-model.rst         | 38 +++++++++++++++++++
 .../zh_CN/arch/loongarch/irq-chip-model.rst   | 37 ++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/Documentation/arch/loongarch/irq-chip-model.rst b/Documentation/arch/loongarch/irq-chip-model.rst
index a7ecce11e445..d9a2e8d7f70e 100644
--- a/Documentation/arch/loongarch/irq-chip-model.rst
+++ b/Documentation/arch/loongarch/irq-chip-model.rst
@@ -181,6 +181,44 @@ go to PCH-PIC/PCH-LPC and gathered by EIOINTC, and then go to CPUINTC directly::
              | Devices |
              +---------+
 
+Advanced Extended IRQ model (with redirection)
+==============================================
+
+In this model, IPI (Inter-Processor Interrupt) and CPU Local Timer interrupt go
+to CPUINTC directly, CPU UARTS interrupts go to LIOINTC, PCH-MSI interrupts go
+to REDIRECT for remapping it to AVEC, and then go to CPUINTC directly, while all
+other devices interrupts go to PCH-PIC/PCH-LPC and gathered by EIOINTC, and then
+go to CPUINTC directly::
+
+ +-----+     +-----------------------+     +-------+
+ | IPI | --> |        CPUINTC        | <-- | Timer |
+ +-----+     +-----------------------+     +-------+
+              ^          ^          ^
+              |          |          |
+       +---------+ +----------+ +---------+     +-------+
+       | EIOINTC | | AVECINTC | | LIOINTC | <-- | UARTs |
+       +---------+ +----------+ +---------+     +-------+
+            ^            ^
+            |            |
+            |      +----------+
+            |      | REDIRECT |
+            |      +----------+
+            |            ^
+            |            |
+       +---------+  +---------+
+       | PCH-PIC |  | PCH-MSI |
+       +---------+  +---------+
+         ^     ^           ^
+         |     |           |
+ +---------+ +---------+ +---------+
+ | Devices | | PCH-LPC | | Devices |
+ +---------+ +---------+ +---------+
+                  ^
+                  |
+             +---------+
+             | Devices |
+             +---------+
+
 ACPI-related definitions
 ========================
 
diff --git a/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst b/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
index d4ff80de47b6..7e4e3e55c7ad 100644
--- a/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
+++ b/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
@@ -174,6 +174,43 @@ CPU串口（UARTs）中断发送到LIOINTC，PCH-MSI中断发送到AVECINTC，
              | Devices |
              +---------+
 
+高级扩展IRQ模型 (带重定向)
+==========================
+
+在这种模型里面，IPI（Inter-Processor Interrupt）和CPU本地时钟中断直接发送到CPUINTC，
+CPU串口（UARTs）中断发送到LIOINTC，PCH-MSI中断首先发送到REDIRECT模块,完成重定向后发
+送到AVECINTC，而后通过AVECINTC直接送达CPUINTC，而其他所有设备的中断则分别发送到所连
+接的PCH-PIC/PCH-LPC，然后由EIOINTC统一收集，再直接到达CPUINTC::
+
+ +-----+     +-----------------------+     +-------+
+ | IPI | --> |        CPUINTC        | <-- | Timer |
+ +-----+     +-----------------------+     +-------+
+              ^          ^          ^
+              |          |          |
+       +---------+ +----------+ +---------+     +-------+
+       | EIOINTC | | AVECINTC | | LIOINTC | <-- | UARTs |
+       +---------+ +----------+ +---------+     +-------+
+            ^            ^
+            |            |
+            |      +----------+
+            |      | REDIRECT |
+            |      +----------+
+            |            ^
+            |            |
+       +---------+  +---------+
+       | PCH-PIC |  | PCH-MSI |
+       +---------+  +---------+
+         ^     ^           ^
+         |     |           |
+ +---------+ +---------+ +---------+
+ | Devices | | PCH-LPC | | Devices |
+ +---------+ +---------+ +---------+
+                  ^
+                  |
+             +---------+
+             | Devices |
+             +---------+
+
 ACPI相关的定义
 ==============
 
-- 
2.41.0

