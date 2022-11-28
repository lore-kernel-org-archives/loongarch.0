Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA9E23B8
	for <loongarch@lists.linux.dev>; Mon, 28 Nov 2022 09:56:42 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.110])
	by gateway (Coremail) with SMTP id _____8AxuPHZhYRj9KMBAA--.3953S3;
	Mon, 28 Nov 2022 17:56:41 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.110])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxn+DWhYRjXzUdAA--.9071S3;
	Mon, 28 Nov 2022 17:56:41 +0800 (CST)
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
Subject: [PATCH v3 1/2] docs/LoongArch: Add booting
Date: Mon, 28 Nov 2022 17:54:02 +0800
Message-Id: <e8ed14458cde5534a65a5caf37952a4a29476182.1669628226.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1669628226.git.siyanteng@loongson.cn>
References: <cover.1669628226.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cxn+DWhYRjXzUdAA--.9071S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXryDuF17ur43Cw45trykAFb_yoWrWw48pr
	nxJryxJF1DJry3Xr4UJr1UWr15Aw1xJ3WUGF1xKry8XF1UZwn5Jr1Utr18XFyUG348Aa4j
	q345Jr1jk3WUJw7anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAa
	w2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2
	jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s02
	6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw
	0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvE
	c7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x
	07jz2NtUUUUU=

Describes the meaning and value of the image header field.

Suggested-by: Xiaotian Wu <wuxiaotian@loongson.cn>
Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/loongarch/booting.rst | 89 +++++++++++++++++++++++++++++
 Documentation/loongarch/index.rst   |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 Documentation/loongarch/booting.rst

diff --git a/Documentation/loongarch/booting.rst b/Documentation/loongarch/booting.rst
new file mode 100644
index 000000000000..f59de4eea39d
--- /dev/null
+++ b/Documentation/loongarch/booting.rst
@@ -0,0 +1,89 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====================
+启动 LoongArch Linux
+====================
+
+:Author: Yanteng Si <siyanteng@loongson.cn>
+:Date:   18 Nov 2022
+
+BootLoader passing parameters to the kernel
+===========================================
+
+LoongArch is an ACPI system and the information that needs to be passed
+to the kernel are memmap, initrd, cmdline, etc.
+On LoongArch machines, the BootLoader (EFISTUB/Grub) will pass three
+valid parameters to the kernel, which are::
+
+      a0 = efi_boot
+      a1 = cmdline
+      a2 = systemtable
+
+where a1 is a pointer to cmdline, a2 contains the memmap, initrd,
+cmdline and other information that needs to be passed to the kernel.
+
+Boot image header in LoongArch Linux
+====================================
+
+The following 64-byte header is present in decompressed Linux
+kernel image::
+
+	u32	MZ_MAGIC		/* "MZ", MS-DOS header */
+	u32	res0 = 0		/* reserved */
+	u64	kernel_entry		/* Kernel entry point */
+	u64	_end - _text		/* Kernel image effective size */
+	u64	0			/* Kernel image load offset from start of RAM */
+	u64	res1 = 0		/* reserved */
+	u64	res2 = 0		/* reserved */
+	u64	res3 = 0		/* reserved */
+	u32	res4 = 0		/* reserved */
+	u32	pe_header - _head	/* Offset to the PE header */
+
+Header notes
+============
+
+Currently, LoongArch has removed the "magic" field.
+
+According to the EFI specification, the PE/COFF image file header is
+required at the beginning of the kernel image; the LoongArch kernel
+supports the EFI stub, so the first two bytes of the kernel image header
+are "MZ" magic characters, and 0x3c should point to the rest of the
+PE/COFF file header, between which The kernel entry point, image
+effectivesize, and image load offset layout are as follows::
+
+          +-----------------------------------------------+
+          |  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7  |
+          +-----------------------------------------------+
+    0x00: |       MZ_MAGIC        |          res0         |
+          +-----------------------------------------------+
+    0x08: |                 kernel_entry                  |
+          +-----------------------------------------------+
+    0x10: |                  _end - _text                 |
+          +-----------------------------------------------+
+    0x18: |                       0                       |
+          +-----------------------------------------------+
+    0x20: |                      res1                     |
+          +-----------------------------------------------+
+    0x28: |                      res2                     |
+          +-----------------------------------------------+
+    0x30: |                      res3                     |
+          +-----------------------------------------------+
+    0x38: |          res4         |       PE header       |
+          +-----------------------------------------------+
+
+All bit fields are in little endian:
+
+    - MZ: Effective length of 2 bytes;
+
+    - kernel entry point: leaving 6 bytes blank in front, starting
+      from 0x8, with a effective length of 8 bytes;
+
+    - kernel image effective size: Immediately following the kernel
+      entry point, with a effective length of 8 bytes, this field is
+      required for the bootloader;
+
+    - kernel image load offset: Immediately following the kernel
+      image effective size, with a effective length of 8 bytes;
+
+    - Offset to the PE header: leaving 28 bytes blank in front,
+      starting from 0x3c, with a effective length of 4 bytes.
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

