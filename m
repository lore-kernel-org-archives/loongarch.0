Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B04A1D9592
	for <loongarch@lists.linux.dev>; Tue, 17 Dec 2024 07:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734421167; cv=none; b=XAe1tIGXQZHqJPnYSUbKMtb7+YqkEeDULsTf6QqEq66pY6IM8NRS+Qphz1gubd2+eR8LuKFRJiiKa22LIaV+9OxWIPFZHezD+swa6C4oTVYfqKddhnIL0or9l91oovRNeotB1kLPLub6shm/YpkOAJHjkta/02Gk0SJezZUYfw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734421167; c=relaxed/simple;
	bh=FF0k0pW14USJyXZVa625InLmts54SM6uhXD/5HffYxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gTR5xZ66yFU/287Y/LsV99nzFnN50FMZqnNHoL/ViNfnzr/btFfVtQ7jjcMv/udwWlpv8qY7biOz1MnLYo3tkcoC7lot6cOmtNbYbT9Km2j2GD83QyTlOVYHKsfi8h9mFyJPh9n35rIVzMyjvRNK743upMKXk0FkHAqZ4Nel/9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.7])
	by gateway (Coremail) with SMTP id _____8CxieCrKmFn47FXAA--.39742S3;
	Tue, 17 Dec 2024 15:39:23 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.7])
	by front1 (Coremail) with SMTP id qMiowMAxz8eoKmFn0gUAAA--.24S2;
	Tue, 17 Dec 2024 15:39:22 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Add pgprot_nx() implementation
Date: Tue, 17 Dec 2024 15:39:08 +0800
Message-ID: <20241217073908.3347287-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxz8eoKmFn0gUAAA--.24S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtFy3trWxuFy7ZFW5tF1xtFc_yoWDAFX_A3
	W7Xaykuw48Ja9rAw1ayF93Jr13Gw48C3ZYqF1ktw47tw1qqws8GFy7W3y3Zr4a9FZ7Zrs0
	9rs5tw4rCF13tosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

Commit cca98e9f8b5ebcd964 ("mm: enforce that vmap can't map pages
executable") enforces the W^X protection by not allowing remapping
existing pages as executable. Add LoongArch bits so that LoongArch
can benefit the same protection.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/pgtable-bits.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/loongarch/include/asm/pgtable-bits.h b/arch/loongarch/include/asm/pgtable-bits.h
index 82cd3a9f094b..45bfc65a0c9f 100644
--- a/arch/loongarch/include/asm/pgtable-bits.h
+++ b/arch/loongarch/include/asm/pgtable-bits.h
@@ -96,6 +96,13 @@
 
 #define _PAGE_IOREMAP		pgprot_val(PAGE_KERNEL_SUC)
 
+#define pgprot_nx pgprot_nx
+
+static inline pgprot_t pgprot_nx(pgprot_t _prot)
+{
+	return __pgprot(pgprot_val(_prot) | _PAGE_NO_EXEC);
+}
+
 #define pgprot_noncached pgprot_noncached
 
 static inline pgprot_t pgprot_noncached(pgprot_t _prot)
-- 
2.43.5

