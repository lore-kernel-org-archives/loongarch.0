Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6297F
	for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 07:17:37 +0000 (UTC)
Received: from localhost.localdomain (unknown [112.20.110.105])
	by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX92JKqxirf5HAA--.12068S3;
	Fri, 17 Jun 2022 15:17:34 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: chenhuacai@kernel.org,
	alexs@kernel.org,
	bobwxc@email.cn,
	seakeel@gmail.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	corbet@lwn.net,
	kernel@xen0n.name,
	jiaxun.yang@flygoat.com,
	linux-doc@vger.kernel.org,
	siyanteng01@gmail.com,
	loongarch@lists.linux.dev
Subject: [PATCH 1/2] docs/loongarch: rewrite all the notes
Date: Fri, 17 Jun 2022 15:19:06 +0800
Message-Id: <67f35d431f8a1565403c03fa5d855ddcf15c87d4.1655450200.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1655450200.git.siyanteng@loongson.cn>
References: <cover.1655450200.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf9DxX92JKqxirf5HAA--.12068S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCF1xZrW3AFy5XFyDAr1UZFb_yoWrXr4DpF
	WDA39agrn8J3y7Zw48A3WfZr1YvFn7JFsxW3y0kr1UAwsxZ3s5tr1ayF4fXay5Gry8AFWF
	vr18Kw4UWa4UA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPC14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
	MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
	AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
	80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
	43ZEXa7VUUAnY5UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/

Note is an admonition, let's use the directives
implemented in the reference reStructuredText parser.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/loongarch/introduction.rst   | 15 +++++++++------
 Documentation/loongarch/irq-chip-model.rst | 22 +++++++++++++---------
 2 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/Documentation/loongarch/introduction.rst b/Documentation/loongarch/introduction.rst
index 2bf40ad370df..46e3f8d54067 100644
--- a/Documentation/loongarch/introduction.rst
+++ b/Documentation/loongarch/introduction.rst
@@ -45,10 +45,12 @@ Name              Alias           Usage               Preserved
 ``$r23``-``$r31`` ``$s0``-``$s8`` Static registers    Yes
 ================= =============== =================== ============
 
-Note: The register ``$r21`` is reserved in the ELF psABI, but used by the Linux
-kernel for storing the percpu base address. It normally has no ABI name, but is
-called ``$u0`` in the kernel. You may also see ``$v0`` or ``$v1`` in some old code,
-however they are deprecated aliases of ``$a0`` and ``$a1`` respectively.
+.. Note:
+    The register ``$r21`` is reserved in the ELF psABI, but used by the Linux
+    kernel for storing the percpu base address. It normally has no ABI name,
+    but is called ``$u0`` in the kernel. You may also see ``$v0`` or ``$v1``
+    in some old code,however they are deprecated aliases of ``$a0`` and ``$a1``
+    respectively.
 
 FPRs
 ----
@@ -69,8 +71,9 @@ Name              Alias              Usage               Preserved
 ``$f24``-``$f31`` ``$fs0``-``$fs7``  Static registers    Yes
 ================= ================== =================== ============
 
-Note: You may see ``$fv0`` or ``$fv1`` in some old code, however they are deprecated
-aliases of ``$fa0`` and ``$fa1`` respectively.
+.. Note::
+    You may see ``$fv0`` or ``$fv1`` in some old code, however they are
+    deprecated aliases of ``$fa0`` and ``$fa1`` respectively.
 
 VRs
 ----
diff --git a/Documentation/loongarch/irq-chip-model.rst b/Documentation/loongarch/irq-chip-model.rst
index 8d88f7ab2e5e..7988f4192363 100644
--- a/Documentation/loongarch/irq-chip-model.rst
+++ b/Documentation/loongarch/irq-chip-model.rst
@@ -145,12 +145,16 @@ Documentation of Loongson's LS7A chipset:
 
   https://github.com/loongson/LoongArch-Documentation/releases/latest/download/Loongson-7A1000-usermanual-2.00-EN.pdf (in English)
 
-Note: CPUINTC is CSR.ECFG/CSR.ESTAT and its interrupt controller described
-in Section 7.4 of "LoongArch Reference Manual, Vol 1"; LIOINTC is "Legacy I/O
-Interrupts" described in Section 11.1 of "Loongson 3A5000 Processor Reference
-Manual"; EIOINTC is "Extended I/O Interrupts" described in Section 11.2 of
-"Loongson 3A5000 Processor Reference Manual"; HTVECINTC is "HyperTransport
-Interrupts" described in Section 14.3 of "Loongson 3A5000 Processor Reference
-Manual"; PCH-PIC/PCH-MSI is "Interrupt Controller" described in Section 5 of
-"Loongson 7A1000 Bridge User Manual"; PCH-LPC is "LPC Interrupts" described in
-Section 24.3 of "Loongson 7A1000 Bridge User Manual".
+.. Note::
+    - CPUINTC is CSR.ECFG/CSR.ESTAT and its interrupt controller described
+      in Section 7.4 of "LoongArch Reference Manual, Vol 1";
+    - LIOINTC is "Legacy I/OInterrupts" described in Section 11.1 of
+      "Loongson 3A5000 Processor Reference Manual";
+    - EIOINTC is "Extended I/O Interrupts" described in Section 11.2 of
+      "Loongson 3A5000 Processor Reference Manual";
+    - HTVECINTC is "HyperTransport Interrupts" described in Section 14.3 of
+      "Loongson 3A5000 Processor Reference Manual";
+    - PCH-PIC/PCH-MSI is "Interrupt Controller" described in Section 5 of
+      "Loongson 7A1000 Bridge User Manual";
+    - PCH-LPC is "LPC Interrupts" described in Section 24.3 of
+      "Loongson 7A1000 Bridge User Manual".
-- 
2.27.0

