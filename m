Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABAEC44605D
	for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 12:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787230223; cv=none; b=oabO3ukmS9kQMylXif8ZKDUsL9VHYgwR4Ia0XktFm8o7i6T+ZLZie77XG/OpKQ0n3evlBUeycHvZLID2GHbKeNP7SnVDSosN6cGWNHi6JOZ4xQ/S5d+ozkm+Wwpj7jwZcWugqLVHQmtqCDjjXBtDw5PGk/Wr+yfGp5Y4Yon4/k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787230223; c=relaxed/simple;
	bh=s/P8N8XO1Npuz7G5tU+wXMQIAUd1ur0fz66U0dNDxvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ol5zK3Nqn5eRot5GbyMxJMUmuRp/JyDlTOOp0E2UEN+uyJsmS/mrRCOogU6d5ZwfvxQbugv27p9+7fmoM2DdVEBfxaDXG1wUpmcRqx2UieCYWs9949dEnP/k3/g/RHViWUoyFxIfT6V5KaHYXF+g51ozzcncaDLyQjNLw8uRxHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8CxKvAF+IZqZB0DAA--.9283S3;
	Thu, 20 Aug 2026 20:50:13 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAx2c0A+IZqX_QLAA--.6716S5;
	Thu, 20 Aug 2026 20:50:12 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-modules@vger.kernel.org,
	loongarch@lists.linux.dev,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Subject: [PATCH v4 3/3] module/kallsyms: Ignore local labels and mapping symbols during module load
Date: Thu, 20 Aug 2026 20:50:07 +0800
Message-ID: <20260820125007.22943-4-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260820125007.22943-1-yangtiezhu@loongson.cn>
References: <20260820125007.22943-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx2c0A+IZqX_QLAA--.6716S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CFW7Ary5Kw4rZF1xAF48Xwc_yoW8WrykpF
	45Cw45WrW8ZF1kua1DAr4F9ry5G3yDXr4Sgan8K34xArn8t3WrZr13tw1Y9r47Zr43KFy8
	XFs2v39Ivas8ArcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUco7KUUUUU

The compiler toolchains may generate local labels and mapping symbols on
certain architectures like LoongArch for optimizations and relocations.

While these local labels and mapping symbols are already ignored during
runtime lookups via find_kallsyms_symbol(), they still leak into kallsyms
for loaded modules because layout_symtab() and add_kallsyms() don't ignore
them during load time.

Consequently, tracing tools like bpftrace (which do not perform internal
filtering, unlike perf) resolve identical addresses into confusing local
labels instead of actual clear C function names.

Fix this by integrating the is_ignored_kernel_symbol() check directly into
is_core_symbol(). This ensures these unneeded symbols are stripped during
module load time, keeping /proc/kallsyms clean and resulting in accurate
call stacks.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 kernel/module/kallsyms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
index d75c9f60d360..1ff8ce857d92 100644
--- a/kernel/module/kallsyms.c
+++ b/kernel/module/kallsyms.c
@@ -89,6 +89,9 @@ static bool is_core_symbol(struct module *mod, const struct load_info *info,
 	    !src->st_name)
 		return false;
 
+	if (is_ignored_kernel_symbol(&info->strtab[src->st_name]))
+		return false;
+
 #ifdef CONFIG_KALLSYMS_ALL
 	if (src->st_shndx == info->index.pcpu)
 		return true;
-- 
2.42.0

