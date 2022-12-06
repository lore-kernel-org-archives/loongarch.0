Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152D517C9
	for <loongarch@lists.linux.dev>; Tue,  6 Dec 2022 02:10:53 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.110])
	by gateway (Coremail) with SMTP id _____8BxeeqnpI5jzHEDAA--.5060S3;
	Tue, 06 Dec 2022 10:10:47 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.110])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxXuClpI5jPFEmAA--.28256S3;
	Tue, 06 Dec 2022 10:10:46 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: chenhuacai@kernel.org,
	corbet@lwn.net,
	alexs@kernel.org,
	seakeel@gmail.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	kernel@xen0n.name,
	wu.xiangcheng@linux.dev,
	jiaxun.yang@flygoat.com,
	liuyun@loongson.cn,
	linux-doc@vger.kernel.org,
	loongarch@lists.linux.dev,
	siyanteng01@gmail.com,
	Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: [PATCH v5 1/2] docs/LoongArch: Add booting
Date: Tue,  6 Dec 2022 10:07:58 +0800
Message-Id: <127d30b477d86b571cc85458d0008b3015f65991.1670289933.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1670289933.git.siyanteng@loongson.cn>
References: <cover.1670289933.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxXuClpI5jPFEmAA--.28256S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Zw4UGF4fWFyUAw1xKF13twb_yoW5Jr1Up3
	WDZryfKF4kJ347uw1ftF1Uur15Aw1xG3W7WFn7Kr1FqFnrXwn5ZryrtrWDXFyrGw1FkFyj
	qF1Ykw1Y93WUAw7anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2Iq
	xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
	1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY
	6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
	AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuY
	vjxU4AhLUUUUU

Describes the meaning and value of the image header field.

Suggested-by: Xiaotian Wu <wuxiaotian@loongson.cn>
Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/loongarch/booting.rst | 43 +++++++++++++++++++++++++++++
 Documentation/loongarch/index.rst   |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 Documentation/loongarch/booting.rst

diff --git a/Documentation/loongarch/booting.rst b/Documentation/loongarch/booting.rst
new file mode 100644
index 000000000000..d893f495ca58
--- /dev/null
+++ b/Documentation/loongarch/booting.rst
@@ -0,0 +1,43 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================
+Booting Linux/LoongArch
+=======================
+
+:Author: Yanteng Si <siyanteng@loongson.cn>
+:Date:   18 Nov 2022
+
+Bootloader passing parameters to the kernel
+============================================
+
+LoongArch supports ACPI and FDT. The information that needs to be
+passed to the kernel includes the memmap, the initrd, the command
+line, optionally the FDT, and so on.
+The kernel is passed the following arguments on `kernel_entry` :
+
+      - a0 = efi_boot: `efi_boot` is a flag indicating whether
+        this boot environment isfully UEFI-compliant.
+
+      - a1 = cmdline: `cmdline` is a pointer to the kernel command line.
+
+      - a2 = systemtable: `systemtable` points to the EFI system table.
+        All pointers involved at this stage are in
+        physical addresses.
+
+Header of Linux/LoongArch kernel images
+=======================================
+
+Linux/LoongArch kernel images are EFI images. Being PE files, they have
+a 64-byte header structured like::
+
+	u32	MZ_MAGIC		    /* "MZ", MS-DOS header */
+	u32	res0 = 0		    /* reserved */
+	u64	kernel_entry		/* Kernel entry point */
+	u64	_end - _text		/* Kernel image effective size */
+	u64	0			        /* Kernel image load offset from start of RAM */
+	u64	res1 = 0		    /* reserved */
+	u64	res2 = 0		    /* reserved */
+	u64	res3 = 0		    /* reserved */
+	u32	LINUX_PE_MAGIC		/* Magic number */
+	u32	pe_header - _head	/* Offset to the PE header */
+
diff --git a/Documentation/loongarch/index.rst b/Documentation/loongarch/index.rst
index aaba648db907..df0174d6d227 100644
--- a/Documentation/loongarch/index.rst
+++ b/Documentation/loongarch/index.rst
@@ -10,6 +10,7 @@ LoongArch Architecture
 
    introduction
    irq-chip-model
+   booting
 
    features
 
-- 
2.31.1

