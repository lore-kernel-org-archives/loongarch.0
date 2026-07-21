Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75176449B18
	for <loongarch@lists.linux.dev>; Tue, 21 Jul 2026 09:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784624781; cv=none; b=PRDFU5Erm4MxDH+BR7cO2M7tqYbgwpo/RVuVPrjC6P2Qmkgqw46PhTgsUZwdGLDiGqCuuP9e8Q1p+59aT+/Y+a1ubA/7+2Pv+IXgHDDJnXOtNcvIUSIilekzBuXsOyTiAliSgncdZ/2YN+ZSPix4RePxF+L+wUFagW7pCQJWuII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784624781; c=relaxed/simple;
	bh=Xqa3OTnGmwzu6ktltFgfIgBJgdT4NlsJJlzkbULWit8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jNWX7mGZSyIAW/B1FHPiL1jzrY5ysP1kGFFSI4Xt2MmHNS0XpayXkf0D+gxGr3Tu5AB9D33T13HME1keNf2PDBtDOvwS08G1kyRuMuBQDYPK10x/WNA9Fc+pjtaBGg89A+TP5Es+tQAIGtuwPHs4BNZboR7o0QDZvMd985xlGRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxVeqANl9qIJMFAA--.20562S3;
	Tue, 21 Jul 2026 17:06:08 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxb8d_Nl9qdssTAA--.39236S2;
	Tue, 21 Jul 2026 17:06:07 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: linux-mm@kvack.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v2 0/2] Fix and optimize LoongArch module loading
Date: Tue, 21 Jul 2026 17:06:04 +0800
Message-ID: <20260721090606.8982-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxb8d_Nl9qdssTAA--.39236S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2
	jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

Fix "execmem: unable to allocate memory" failures and optimize
apply_relocate_add() to improve module loading efficiency.

v2:
  -- Drop the size/align/caller print patch for mm/execmem.
  -- Update the commit message for the 2GB space expansion patch.
  -- Add a new patch to skip address pairing for non-exec sections.

Tiezhu Yang (2):
  LoongArch: Expand module virtual address space to 2GB
  LoongArch: Skip address pairing for non-exec sections

 arch/loongarch/include/asm/pgtable.h | 2 +-
 arch/loongarch/kernel/module.c       | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.42.0

