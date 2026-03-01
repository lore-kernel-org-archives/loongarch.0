Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E717C3033F6;
	Sun,  1 Mar 2026 02:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330703; cv=none; b=sg322VI8T45U3xEJugjlP2LPQZKAu4wMR/S2sB7mhm+XU/3GJxXEAXv5BNlKAQDoLRorXhiA3XNc5wqFAd/mjvZ5sTsKbyxj3AzLkNcYkFtbwdYr3ml96haRZgBOD5j5N6dQl2ertiQOcHvDhBqK64D0pfeRIaOQTlumh5pfUWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330703; c=relaxed/simple;
	bh=5n1+hCwcNY/4fFIoZ646pQNGpdHBW/utRb3wLHJWV00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mYJd38bnrQJt1sFlk53h/acIAHAn0v6tOvwXYXMUWt0UvIsN2RYFXsDbycqUn+NgWiAUS9MNw/pJWD7igfVfGpGy2IB+DpyLNifNaU9/5blEhOFtWb6rHJRTpuuR+lIJbPYoQQEZdjRJs/oxxBMPz2ckZo8U+SoP4lqFlVEX8bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HeaRsLWl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HeaRsLWl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5878FC19421;
	Sun,  1 Mar 2026 02:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330702;
	bh=5n1+hCwcNY/4fFIoZ646pQNGpdHBW/utRb3wLHJWV00=;
	h=From:To:Cc:Subject:Date:From;
	b=HeaRsLWl8AeLhX7BzjpuWvEKyGaD73UkpJI7MZjGtFH/MV9j4c4lwz3rhM5GDHPA1
	 Sj+cGSpB0cp8aZ0pUr+mwz+gttt+qDHhCEJEtwQPVOd77iqKFWTbqmbUB3dV4HeQpB
	 pUAX3icz905c2Lme52RU2B9nviAUqV5z3IFh1C2lqGTjj1kwVozO6oq2HWuQtlhyWN
	 kyqa9mj/TMLW/9qe0fvd2Uw9FLMV+iKgFtWTxfUG9YLRsYN/2aLJr6ul/TN8ms9rzA
	 BGTcNkUl2alYlWYcSFV0pMNug+VO0Np9NKBYir4kx+O2914gSgcLV5X+9shBggaWsT
	 FGk/38vbD7T1A==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	yangtiezhu@loongson.cn
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	loongarch@lists.linux.dev
Subject: FAILED: Patch "LoongArch: Disable instrumentation for setup_ptwalker()" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 21:05:00 -0500
Message-ID: <20260301020501.1733590-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 5.10-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 7cb37af61f09c9cfd90c43c9275307c16320cbf2 Mon Sep 17 00:00:00 2001
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Date: Tue, 10 Feb 2026 19:31:17 +0800
Subject: [PATCH] LoongArch: Disable instrumentation for setup_ptwalker()

According to Documentation/dev-tools/kasan.rst, software KASAN modes use
compiler instrumentation to insert validity checks. Such instrumentation
might be incompatible with some parts of the kernel, and therefore needs
to be disabled, just use the attribute __no_sanitize_address to disable
instrumentation for the low level function setup_ptwalker().

Otherwise bringing up the secondary CPUs failed when CONFIG_KASAN is set
(especially when PTW is enabled), here are the call chains:

    smpboot_entry()
      start_secondary()
        cpu_probe()
          per_cpu_trap_init()
            tlb_init()
              setup_tlb_handler()
                setup_ptwalker()

The reason is the PGD registers are configured in setup_ptwalker(), but
KASAN instrumentation may cause TLB exceptions before that.

Cc: stable@vger.kernel.org
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/mm/tlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/mm/tlb.c b/arch/loongarch/mm/tlb.c
index 4014c44695878..aaf7d685cc2aa 100644
--- a/arch/loongarch/mm/tlb.c
+++ b/arch/loongarch/mm/tlb.c
@@ -202,7 +202,7 @@ void __update_tlb(struct vm_area_struct *vma, unsigned long address, pte_t *ptep
 	local_irq_restore(flags);
 }
 
-static void setup_ptwalker(void)
+static void __no_sanitize_address setup_ptwalker(void)
 {
 	unsigned long pwctl0, pwctl1;
 	unsigned long pgd_i = 0, pgd_w = 0;
-- 
2.51.0




