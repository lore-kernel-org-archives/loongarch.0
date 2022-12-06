Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A247517D2
	for <loongarch@lists.linux.dev>; Tue,  6 Dec 2022 02:10:55 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.110])
	by gateway (Coremail) with SMTP id _____8CxZPCnpI5j1HEDAA--.7932S3;
	Tue, 06 Dec 2022 10:10:47 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.110])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxXuClpI5jPFEmAA--.28256S4;
	Tue, 06 Dec 2022 10:10:47 +0800 (CST)
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
Subject: [PATCH v5 2/2] docs/zh_CN: Add booting Chinese translation
Date: Tue,  6 Dec 2022 10:07:59 +0800
Message-Id: <3f66a26d1099155346e890d61a85adda2dc2dd07.1670289933.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1670289933.git.siyanteng@loongson.cn>
References: <cover.1670289933.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxXuClpI5jPFEmAA--.28256S4
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxAw4rJF4Dtr13Xr47ZFW8WFg_yoW5XF48pF
	97ur97Gan7Z343J343KryUXF1UXF1xGa17WFn2g3sYgFn7tw1FvryUtr90qa4xG34FyFyU
	XF4rK34Y9F1jyw7anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b3AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
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
	vjxU4miiDUUUU

Translate ../loongarch/booting.rst into Chinese.

Suggested-by: Xiaotian Wu <wuxiaotian@loongson.cn>
Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/loongarch/booting.rst  | 48 +++++++++++++++++++
 .../translations/zh_CN/loongarch/index.rst    |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/loongarch/booting.rst

diff --git a/Documentation/translations/zh_CN/loongarch/booting.rst b/Documentation/translations/zh_CN/loongarch/booting.rst
new file mode 100644
index 000000000000..71c71c5f1b4d
--- /dev/null
+++ b/Documentation/translations/zh_CN/loongarch/booting.rst
@@ -0,0 +1,48 @@
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
+启动 Linux/LoongArch
+====================
+
+:作者: 司延腾 <siyanteng@loongson.cn>
+:日期: 2022年11月18日
+
+BootLoader传递给内核的信息
+==========================
+
+LoongArch支持ACPI和FDT，需要传递给内核的信息包括memmap、initrd、cmdline、可选
+的fdt等。
+内核在 `kernel_entry` 被传递给以下参数:
+
+      - a0 = efi_boot: `efi_boot` 是一个标志，表示这个启动环境是否完全符合UEFI
+        的要求。
+
+      - a1 = cmdline: `cmdline` 是一个指向内核命令行的指针。
+
+      - a2 = systemtable: `systemtable` 指向EFI的系统表，在这个阶段涉及的所有
+        指针都是物理地址。
+
+Linux/LoongArch启动镜像文件头
+=============================
+
+内核镜像是EFI镜像。作为PE文件，它们有一个64字节的头结构体，如下所示::
+
+	u32	MZ_MAGIC		    /* "MZ", MS-DOS 头 */
+	u32	res0 = 0		    /* 保留 */
+	u64	kernel_entry		/* 内核入口点 */
+	u64	_end - _text		/* 内核镜像有效大小 */
+	u64	0			        /* 从RAM开始的加载内核镜像的偏移量 */
+	u64	res1 = 0		    /* 保留 */
+	u64	res2 = 0		    /* 保留 */
+	u64	res3 = 0		    /* 保留 */
+	u32	LINUX_PE_MAGIC		/* 魔术数 */
+	u32	pe_header - _head	/* 到PE头的偏移量 */
+
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

