Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B1A7F
	for <loongarch@lists.linux.dev>; Fri, 17 Jun 2022 09:32:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [112.20.110.105])
	by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxD+YQSqxiAz1IAA--.12781S3;
	Fri, 17 Jun 2022 17:32:04 +0800 (CST)
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
Subject: [PATCH v2 1/2] docs/LoongArch: Rewrite all the notes
Date: Fri, 17 Jun 2022 17:33:10 +0800
Message-Id: <ad1d2316a4240ae05697759990b7e0c6f94faa83.1655456950.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1655456950.git.siyanteng@loongson.cn>
References: <cover.1655456950.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf9CxD+YQSqxiAz1IAA--.12781S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCr4kZFyxKFW3Aw18WF13CFg_yoWrXF4xpF
	WDA39agrn8J347Zw48A3W7Zr1YvFn7JFsrW3y0kr1UAwsxZ3s5tr1ayF4fXay5Gry8AayF
	vr18Kw4UWa4UA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPG14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
	x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
	v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
	x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
	Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
	yTuYvjTR_fQRUUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/

Since 0ea8ce61cb2c ("Documentation: LoongArch: Add
basic documentations"), Note is an admonition, But
it doesn't show correctly, let's fix it.

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
+.. Note::
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

