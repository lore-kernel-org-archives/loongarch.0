Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092E1387566
	for <loongarch@lists.linux.dev>; Wed, 12 Aug 2026 03:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786505299; cv=none; b=b/feHSQAvKGNtpNoLdiDIzM+69MUUUI7idIOV54IrqqPSF7bn7g7uJ68WjETa+GaIGxnP8rYBaaF0T+wwQThzKvTyMzu217CI6AxEgi+SGrYuDeWgWC0Q+5E1D+vv4pZcBkc6kcaH45wCJmOErGzbExxSkhIyKUfvgRFSjl/5a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786505299; c=relaxed/simple;
	bh=BSAt31KS5ThObbnb9aQj86DJ+YuEIQHjUeIkmYfjQIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SqzZI6JO5x5Cuu65+xiAR9ZV+VCcLQ9mwiZzfqOIrxK7TaIs7aYXVhr0xq3hYCsfSat5oOPO4Vk2rEglE/EchrKur84sDaO6EEisUOgECFv2qGzgItEiOM48M3fHFJdaAoD24fs/Z4iSn0LaM1KqMt3JGnXe/RntS5Ijuz7PHqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8DxOvBO6HtqSGwAAA--.1436S3;
	Wed, 12 Aug 2026 11:28:14 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJCxPs9J6HtqfoUBAA--.10453S5;
	Wed, 12 Aug 2026 11:28:12 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>
Cc: linux-modules@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] module/kallsyms: Filter out local and mapping symbols during module load
Date: Wed, 12 Aug 2026 11:28:07 +0800
Message-ID: <20260812032807.15034-4-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260812032807.15034-1-yangtiezhu@loongson.cn>
References: <20260812032807.15034-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxPs9J6HtqfoUBAA--.10453S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7WF4xWw48uFWrWFW8ZF47GFX_yoW8XF18pF
	45Cw45GrW8Jr4v9a1DJ3yI9ry5Ga4DWr4akan0k34fAFn8X3W0vr43Kw1Y93y2vr4rGry0
	qan2vayaya4DAagCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9jb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y
	6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7IU8XyCJUUUUU==

The compiler toolchains generate local and mapping symbols on certain
architectures like LoongArch for optimizations and relocations.

While the symbols are already filtered out during runtime lookups via
find_kallsyms_symbol(), they still leak into /proc/kallsyms for loaded
modules because layout_symtab() and add_kallsyms() do not filter them
during load time.

Consequently, tracing tools like bpftrace (which do not perform internal
filtering, unlike perf) resolve identical addresses into confusing local
labels instead of actual clear C function names.

Fix this by integrating the is_local_mapping_symbol() check directly into
the newly introduced is_kept_symbol() helper. This ensures these unneeded
symbols are stripped during module load time, keeping /proc/kallsyms clean
and resulting in accurate call stacks.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 kernel/module/kallsyms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
index ff8d904afe56..cc2a68956e43 100644
--- a/kernel/module/kallsyms.c
+++ b/kernel/module/kallsyms.c
@@ -89,6 +89,9 @@ static bool is_kept_symbol(struct module *mod, const struct load_info *info,
 	    !src->st_name)
 		return false;
 
+	if (is_local_mapping_symbol(&info->strtab[src->st_name]))
+		return false;
+
 #ifdef CONFIG_KALLSYMS_ALL
 	if (src->st_shndx == info->index.pcpu)
 		return true;
-- 
2.42.0

