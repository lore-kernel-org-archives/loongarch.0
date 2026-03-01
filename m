Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39792244670;
	Sun,  1 Mar 2026 01:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329618; cv=none; b=R8QGe1fpF42jbWx4XRnaBpyaZ/LhfcNO7k8ES6IlUJa4RZWYG2uwjwbyem/VaSetL5a/2PReFiHDMrf9Vjfk5huiRsBBh4a2N+0EhtzqTBedkO7pGI1/h/FnXEQAWp1I9KjKfgAbSrRLpPKWwo16r2XnZm+BWxOw2UQHSI5TrzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329618; c=relaxed/simple;
	bh=7MmCKH264CCWcRiMJcymFcY6AVVyNWwRNvZPFlq5YRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KcmUem53qyNkBnwCEIeOOfQGCGO5TGpJEQ+5qp30apLCb4Bf6nNcnCZn4EvHSIXpVTibmgzqdfqyPcKuwTv26IAQTe2ChSkMdBDGNsFHKI4RiaL1XAq/JXOfLCRXKE6Z0dvIpRIq6i9sQ4pcAdA0HIOmc7HxrHGA7CWXZHAab9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bAfAag9q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bAfAag9q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D18DC19421;
	Sun,  1 Mar 2026 01:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329618;
	bh=7MmCKH264CCWcRiMJcymFcY6AVVyNWwRNvZPFlq5YRw=;
	h=From:To:Cc:Subject:Date:From;
	b=bAfAag9qSdNm+px0qMOr5mNmJCN0WamPs6HXy3buU1tKY2B5OzT7uJSY2H8vNC7f2
	 LUAjjFE/z/hELGSrdhdkF+YF4uV7RHrftddgVNpICzU4y4bhQUm9XWcf5aTnHYSs3H
	 coGLwhMJAZzA+8WKr6+d6/d5FZx/Lj7O3tWMhLJki93B68YVeX2+VC7/FXykZkmbGt
	 zOwW96EzRWW9M8HSoWp+9adw3SXBDfQy4M33gN+Hi8kz+voPYjKc7F7Qru37S93Bqf
	 QKEGEkaZJcFV7fUwpGYdJ0kQSfNY49RA1Vchw3uld4z0UUxLk2J9i8iyTpfkHLdCBR
	 GHYTNsZUvdDbw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	yangtiezhu@loongson.cn
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	loongarch@lists.linux.dev
Subject: FAILED: Patch "LoongArch: Disable instrumentation for setup_ptwalker()" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:46:56 -0500
Message-ID: <20260301014656.1710036-1-sashal@kernel.org>
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

The patch below does not apply to the 6.1-stable tree.
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




