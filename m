Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15AE1622
	for <loongarch@lists.linux.dev>; Tue, 29 Nov 2022 01:54:44 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.110])
	by gateway (Coremail) with SMTP id _____8Cx6+pjZoVjQuEBAA--.4381S3;
	Tue, 29 Nov 2022 09:54:43 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.110])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxb+JeZoVjwtkdAA--.10346S4;
	Tue, 29 Nov 2022 09:54:42 +0800 (CST)
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
Subject: [PATCH v4 2/2] docs/zh_CN: Add booting Chinese translation
Date: Tue, 29 Nov 2022 09:52:01 +0800
Message-Id: <d3c2d62413214ee1d5d4b31737a305298235c5d1.1669686320.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1669686320.git.siyanteng@loongson.cn>
References: <cover.1669686320.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cxb+JeZoVjwtkdAA--.10346S4
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxAw4ruw45Jr4ruw47uFy5XFb_yoWrZF1Upr
	9xAryxJF4xJryUXr4UKr1UJF1UJr1xGa17GF18W348tr18Aw15Jr1Utr9YqFy7G34FyFyU
	XrW8Kw1UJF1UAwUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
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

Translate ../loongarch/booting.rst into Chinese.

Suggested-by: Xiaotian Wu <wuxiaotian@loongson.cn>
Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/loongarch/booting.rst  | 86 +++++++++++++++++++
 .../translations/zh_CN/loongarch/index.rst    |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/loongarch/booting.rst

diff --git a/Documentation/translations/zh_CN/loongarch/booting.rst b/Documentation/translations/zh_CN/loongarch/booting.rst
new file mode 100644
index 000000000000..a78d5390f6d9
--- /dev/null
+++ b/Documentation/translations/zh_CN/loongarch/booting.rst
@@ -0,0 +1,86 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/loongarch/booting.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+====================
+启动 LoongArch Linux
+====================
+
+:作者: 司延腾 <siyanteng@loongson.cn>
+:日期: 2022年11月18日
+
+BootLoader传递给内核的信息
+==========================
+
+LoongArch兼容ACPI和FDT，需要传递给内核的信息有memmap、initrd、cmdline、fdt等。
+而在LoongArch机器上，BootLoader（EFISTUB/Grub）会给内核传递三个有效参数，
+它们分别是::
+
+      a0 = efi_boot
+      a1 = cmdline
+      a2 = systemtable
+
+其中a1是指向cmdline的指针，a2则包含了需要传递给内核的memmap、initrd、fdt（可选的）……
+
+LoongArch Linux启动镜像文件头
+=============================
+
+在非压缩的Linux内核镜像中存在以下64字节的文件头::
+
+	u32	MZ_MAGIC		/* "MZ", MS-DOS 头 */
+	u32	res0 = 0		/* 保留 */
+	u64	kernel_entry		/* 内核入口点 */
+	u64	_end - _text		/* 内核镜像有效大小 */
+	u64	0			/* 从RAM开始的加载内核镜像的偏移量 */
+	u64	res1 = 0		/* 保留 */
+	u64	res2 = 0		/* 保留 */
+	u64	res3 = 0		/* 保留 */
+	u32	res4 = 0		/* 保留 */
+	u32	pe_header - _head	/* 到PE头的偏移量 */
+
+镜像头注释
+==========
+
+目前LoongArch已经移除“magic”结构体成员。
+
+按照EFI规范的规定，在内核镜像的开始需要PE/COFF镜像文件头。当前LoongArch内核支持
+EFI stub，故内核镜像头最开始两字节为“MZ”魔术字符，且0x3c处应指向PE/COFF文件头的
+其余部分，在此之间，内核的入口点、有效镜像大小、镜像加载偏移布局如下::
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
+所有的位域都是小端序：
+
+    - MZ：有效长度为2字节；
+
+    - 内核入口点：前留空6个字节，自0x8开始，有效长度为8字节；
+
+    - 内核镜像有效大小：紧接内核入口点，有效长度为8字节，该成员对于引导器来说是必须的；
+
+    - 内核镜像加载偏移：紧接内核镜像有效大小，有效长度为8字节；
+
+    - 到PE头的偏移量：前留空28字节，自0x3c开始,有效长度为4字节。
diff --git a/Documentation/translations/zh_CN/loongarch/index.rst b/Documentation/translations/zh_CN/loongarch/index.rst
index 7d23eb78379d..8609ade41981 100644
--- a/Documentation/translations/zh_CN/loongarch/index.rst
+++ b/Documentation/translations/zh_CN/loongarch/index.rst
@@ -15,6 +15,7 @@ LoongArch体系结构
 
    introduction
    irq-chip-model
+   booting
 
    features
 
-- 
2.31.1

