Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA37255F2D
	for <loongarch@lists.linux.dev>; Tue, 30 Dec 2025 07:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767081358; cv=none; b=eiiB3T2s/NTsXxSaLLgWXd4w0QstP7OBWTmij0IFwmwShRCva8dyK7CQY3fEoqjiSDUfXfqLauHjvphele+fnswh3VhKkFRbNc7VxfSSByo9M3EOrLs+gOeA8Te2qYV+sr9SehvvLIXNFehB1nys+Se4cqn/qC7sd+aQwx3eFW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767081358; c=relaxed/simple;
	bh=ZsWjoTO9+pmc5TbmCJ7I+aDy/n3KgSCNl5fqRtX9fg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g6bSbHT+YuwEDT4oD3GthnJV+GZkVdNfMza1n/DFqCYIOIhWxBIMsSXsgfyfjbey5OvoVtBZVTzSNmLdnQAqb1w441H3HpeoZ3afgNddR/WYPeOB7aIoSR82eucq3IevTaZ02LJepZl4wU+IzGLDoqoszIiBxc2JxsrPcHjQAaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8BxnsOGhVNpaVYEAA--.14122S3;
	Tue, 30 Dec 2025 15:55:51 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJBxxuKChVNphKEGAA--.6236S2;
	Tue, 30 Dec 2025 15:55:49 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Set correct protection_map[] for VM_NONE/VM_SHARED
Date: Tue, 30 Dec 2025 15:55:37 +0800
Message-ID: <20251230075537.3934277-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxxuKChVNphKEGAA--.6236S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7AryUKr1DCrWxtry7uF4rZwc_yoW8Xr45pw
	n7Zw1kArW7Gr93Ary8Xw17A3yrua9rtF1Iqa17u3Z8ury7X34vqr15CryDZr1UX3yvvw4x
	ur1rXrn5XF1jqFbCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8PfHUUUUUU==

For 32BIT platform _PAGE_PROTNONE is 0, so set a VMA to be VM_NONE or
VM_SHARED will make pages non-present, then cause Oops with kernel page
fault.

Fix it by set correct protection_map[] for VM_NONE/VM_SHARED, replacing
_PAGE_PROTNONE with _PAGE_PRESENT.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/mm/cache.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/mm/cache.c b/arch/loongarch/mm/cache.c
index 6be04d36ca07..496916845ff7 100644
--- a/arch/loongarch/mm/cache.c
+++ b/arch/loongarch/mm/cache.c
@@ -160,8 +160,8 @@ void cpu_cache_init(void)
 
 static const pgprot_t protection_map[16] = {
 	[VM_NONE]					= __pgprot(_CACHE_CC | _PAGE_USER |
-								   _PAGE_PROTNONE | _PAGE_NO_EXEC |
-								   _PAGE_NO_READ),
+								   _PAGE_NO_EXEC | _PAGE_NO_READ |
+								   (_PAGE_PROTNONE ? : _PAGE_PRESENT)),
 	[VM_READ]					= __pgprot(_CACHE_CC | _PAGE_VALID |
 								   _PAGE_USER | _PAGE_PRESENT |
 								   _PAGE_NO_EXEC),
@@ -180,8 +180,8 @@ static const pgprot_t protection_map[16] = {
 	[VM_EXEC | VM_WRITE | VM_READ]			= __pgprot(_CACHE_CC | _PAGE_VALID |
 								   _PAGE_USER | _PAGE_PRESENT),
 	[VM_SHARED]					= __pgprot(_CACHE_CC | _PAGE_USER |
-								   _PAGE_PROTNONE | _PAGE_NO_EXEC |
-								   _PAGE_NO_READ),
+								   _PAGE_NO_EXEC | _PAGE_NO_READ |
+								   (_PAGE_PROTNONE ? : _PAGE_PRESENT)),
 	[VM_SHARED | VM_READ]				= __pgprot(_CACHE_CC | _PAGE_VALID |
 								   _PAGE_USER | _PAGE_PRESENT |
 								   _PAGE_NO_EXEC),
-- 
2.47.3

