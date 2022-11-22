Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1A31C03
	for <loongarch@lists.linux.dev>; Tue, 22 Nov 2022 11:35:07 +0000 (UTC)
Received: from loongson.cn (unknown [112.20.109.110])
	by gateway (Coremail) with SMTP id _____8Bx3+vqs3xjewQAAA--.39S3;
	Tue, 22 Nov 2022 19:35:06 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.110])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxPuLms3xj8xoYAA--.62977S4;
	Tue, 22 Nov 2022 19:35:06 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>
Cc: loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V2 2/2] LoongArch: Process ISA Node in DeviceTree
Date: Tue, 22 Nov 2022 19:32:35 +0800
Message-Id: <7a4f86d31dfc70cd8bdaacee283aa8c9820c4724.1669112023.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1669112023.git.zhoubinbin@loongson.cn>
References: <cover.1669112023.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxPuLms3xj8xoYAA--.62977S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxuF17GFy7CF1DAFy3XFWxtFb_yoW5GrWDp3
	43Cws5Ar4Ygw4xK3yfJr1rur4Yq3WI9ayxXFyay390vF1YqryxXr1rJFWUuFy5W34kGr4Y
	gFs5Xa1agayDZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
	0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
	W8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8QJ57UUUUU==

Previously, we are hardcoding reserved ISA I/O Space in, now we are
processing it I/O via DeviceTree directly.

The ranges property if ISA node is used to determine the size and
address of reserved I/O space.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 arch/loongarch/kernel/setup.c | 76 +++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 6bc1b9b0186d..d42a1461fd67 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -258,6 +258,82 @@ static void __init arch_parse_crashkernel(void)
 #endif
 }
 
+static int __init add_legacy_isa_io(struct fwnode_handle *fwnode, resource_size_t hw_start,
+				    resource_size_t size)
+{
+	int ret = 0;
+	struct logic_pio_hwaddr *range;
+	unsigned long vaddr;
+
+	range = kzalloc(sizeof(*range), GFP_ATOMIC);
+	if (!range)
+		return -ENOMEM;
+
+	range->fwnode = fwnode;
+	range->size = size = round_up(size, PAGE_SIZE);
+	range->hw_start = hw_start;
+	range->flags = LOGIC_PIO_CPU_MMIO;
+
+	ret = logic_pio_register_range(range);
+	if (ret) {
+		kfree(range);
+		return ret;
+	}
+
+	/* Legacy ISA must placed at the start of PCI_IOBASE */
+	if (range->io_start != 0) {
+		logic_pio_unregister_range(range);
+		kfree(range);
+		return -EINVAL;
+	}
+
+	vaddr = (unsigned long) (PCI_IOBASE + range->io_start);
+
+	ioremap_page_range(vaddr, vaddr + size, hw_start, pgprot_device(PAGE_KERNEL));
+
+	return 0;
+}
+
+static __init int arch_reserve_pio_range(void)
+{
+	struct device_node *np;
+
+	for_each_node_by_name(np, "isa") {
+		struct of_range range;
+		struct of_range_parser parser;
+
+		pr_info("ISA Bridge: %pOF\n", np);
+
+		if (of_range_parser_init(&parser, np)) {
+			pr_info("Failed to parse resources.\n");
+			of_node_put(np);
+			break;
+		}
+
+		for_each_of_range(&parser, &range) {
+			switch (range.flags & IORESOURCE_TYPE_BITS) {
+			case IORESOURCE_IO:
+				pr_info(" IO 0x%016llx..0x%016llx  ->  0x%016llx\n",
+					range.cpu_addr,
+					range.cpu_addr + range.size - 1,
+					range.bus_addr);
+				if (add_legacy_isa_io(&np->fwnode, range.cpu_addr, range.size))
+					pr_warn("Failed to reserve legacy IO in Logic PIO\n");
+				break;
+			case IORESOURCE_MEM:
+				pr_info(" MEM 0x%016llx..0x%016llx  ->  0x%016llx\n",
+					range.cpu_addr,
+					range.cpu_addr + range.size - 1,
+					range.bus_addr);
+				break;
+			}
+		}
+	}
+
+	return 0;
+}
+arch_initcall(arch_reserve_pio_range);
+
 void __init platform_init(void)
 {
 	arch_reserve_vmcore();
-- 
2.31.1

