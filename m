Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B14F10A19
	for <loongarch@lists.linux.dev>; Sun, 29 Oct 2023 22:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qbJmcvEO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 081DFC4167D;
	Sun, 29 Oct 2023 22:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620200;
	bh=2aIYLIjhBACuLNLbp6WIuPI+Kz9KP0HOlGxSnfGtGPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qbJmcvEOL7t0m/JXDKTK4i3JRDB0rfxybsukpgc1u9gTEOWDUAG8rSETxpjX1m1KV
	 5NWUMVWMm66rwjx17dNYsZWA5Q6rJOCSS4k2AagcznvQZsnCQKOQUV9Qd2l7u9qJTm
	 cnDxA2AmGaF6ErQXtU56XD5XojLHNVHneBBmJXWQktxJC7aov4LxLf5AgOuzBePqJR
	 iyHdCU+Ngn6aQY95t+Kuy3BAqxvv3sV0L1riU0I0iBwHPCadwbQBINkiEd3PNby06S
	 aoFPCAmYucYSztsf1uCuXBRrXnEBD+BuWMzfQoXoZ1duBZMPhyFnYYVoIibjQ4PAQA
	 fuuM6K6haTqSw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	Deepak R Varma <drv@mailo.com>,
	Sasha Levin <sashal@kernel.org>,
	chenhuacai@kernel.org,
	maobibo@loongson.cn,
	akpm@linux-foundation.org,
	chenfeiyang@loongson.cn,
	arnd@arndb.de,
	loongarch@lists.linux.dev
Subject: [PATCH AUTOSEL 6.5 42/52] LoongArch: Replace kmap_atomic() with kmap_local_page() in copy_user_highpage()
Date: Sun, 29 Oct 2023 18:53:29 -0400
Message-ID: <20231029225441.789781-42-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225441.789781-1-sashal@kernel.org>
References: <20231029225441.789781-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.9
Content-Transfer-Encoding: 8bit

From: Huacai Chen <chenhuacai@loongson.cn>

[ Upstream commit 477a0ebec101359f49d92796e3b609857d564b52 ]

Replace kmap_atomic()/kunmap_atomic() calls with kmap_local_page()/
kunmap_local() in copy_user_highpage() which can be invoked from both
preemptible and atomic context [1].

[1] https://lore.kernel.org/all/20201029222652.302358281@linutronix.de/

Suggested-by: Deepak R Varma <drv@mailo.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/loongarch/mm/init.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index 51c9a6c90a169..d967d881c3fef 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -68,11 +68,11 @@ void copy_user_highpage(struct page *to, struct page *from,
 {
 	void *vfrom, *vto;
 
-	vto = kmap_atomic(to);
-	vfrom = kmap_atomic(from);
+	vfrom = kmap_local_page(from);
+	vto = kmap_local_page(to);
 	copy_page(vto, vfrom);
-	kunmap_atomic(vfrom);
-	kunmap_atomic(vto);
+	kunmap_local(vfrom);
+	kunmap_local(vto);
 	/* Make sure this page is cleared on other CPU's too before using it */
 	smp_wmb();
 }
-- 
2.42.0

