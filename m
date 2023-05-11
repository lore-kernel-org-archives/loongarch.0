Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30AF2112
	for <loongarch@lists.linux.dev>; Thu, 11 May 2023 19:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A00DC4339B;
	Thu, 11 May 2023 19:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683833976;
	bh=WPWno58C7d2p1+nNcFXQlAlMN7jh82hgl7KOvRdoEbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KZ159l+O+VDxhXQQf3CN+uN4d2DvcWW34NN5dxnDfQgfuBfbfDtt/JDpqmlN96onK
	 uKzovQs7Nowst1woPmiL5qb9+tQ/ti+SDa+bry6drpCqAIhAtyzP1wK4IW7ixJBcRg
	 SPhfYYNdYXTsYYmnPUd5MZj9sozX+3zPl8MCsCilR0ljMJsoJZQDCplqEAT/yFW0Cu
	 PB8DS+6BGnCxzxn0VdFi0d3djQV6H52vKV6KPdXx01Vqy73HqKlSCASTjMl0JV53XO
	 UbpWWY7/iQN7U5j4RKzEiDGwCiMOSmPdBKksbpQPyeFQQMHI/bxwL00zW0uJJKv7/9
	 xtZp7W20kwr0g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Qing Zhang <zhangqing@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Sasha Levin <sashal@kernel.org>,
	chenhuacai@kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH AUTOSEL 6.2 07/10] LoongArch: Add ARCH_HAS_FORTIFY_SOURCE selection
Date: Thu, 11 May 2023 15:38:45 -0400
Message-Id: <20230511193850.623289-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230511193850.623289-1-sashal@kernel.org>
References: <20230511193850.623289-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Qing Zhang <zhangqing@loongson.cn>

[ Upstream commit d4c937c2a57bbba24790be6fe7a791456f5fbb60 ]

FORTIFY_SOURCE could detect various overflows at compile and run time.
ARCH_HAS_FORTIFY_SOURCE means that the architecture can be built and run
with CONFIG_FORTIFY_SOURCE. So select it in LoongArch.

See more about this feature from commit 6974f0c4555e285 ("include/linux/
string.h: add the option of fortified string.h functions").

Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/loongarch/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index e349cc9e3c228..403f2270c1215 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -10,6 +10,7 @@ config LOONGARCH
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
+	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
-- 
2.39.2

