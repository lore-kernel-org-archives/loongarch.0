Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9194154B8
	for <loongarch@lists.linux.dev>; Mon, 26 Jun 2023 21:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8735AC433C0;
	Mon, 26 Jun 2023 21:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687816228;
	bh=uyRqzv463sOSGEFnjbGgo0mc+2j5IYWtviDjYXPpfII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Aa1k45kSUpNLiz5OQyuwNExh5gx/rHcwYWNCsp3n5vO4bnM2LkVpcOZhNzPOOOOzY
	 V1Dn/rsnLZjzGEAAkgRZe7O6h76tOj3OnelXU4PEdxlp3TM/9h/1Zg8O62XEmy0vJp
	 rfe7NltEHgCQN2blNzvctPgmdGEE6Z8OphcRP184TLnHevTPzUQe44cd+WUm4lTswG
	 u5qSyWatY9l+xBZmrMbuway0rW9YbQNDX44o0k8mpmpeu3G1X6txP8NYxurJKT/4cM
	 7hMYRKdaSW1nUVNwscuyup74yK1Vb9ZX/Kls8rWTKYsQNy/Rxgkc1sRCKBKx4nL4aY
	 M10HbrcxT56PQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Qing Zhang <zhangqing@loongson.cn>,
	Colin King <colin.i.king@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Sasha Levin <sashal@kernel.org>,
	chenhuacai@kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH AUTOSEL 6.3 15/16] LoongArch: Avoid uninitialized alignment_mask
Date: Mon, 26 Jun 2023 17:49:55 -0400
Message-Id: <20230626214956.178942-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230626214956.178942-1-sashal@kernel.org>
References: <20230626214956.178942-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.3.9
Content-Transfer-Encoding: 8bit

From: Qing Zhang <zhangqing@loongson.cn>

[ Upstream commit 0246d0aaf0a634a65135050011767b56ba351a8f ]

The hardware monitoring points for instruction fetching and load/store
operations need to align 4 bytes and 1/2/4/8 bytes respectively.

Reported-by: Colin King <colin.i.king@gmail.com>
Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/loongarch/kernel/hw_breakpoint.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kernel/hw_breakpoint.c
index 2406c95b34cc4..021b59c248fac 100644
--- a/arch/loongarch/kernel/hw_breakpoint.c
+++ b/arch/loongarch/kernel/hw_breakpoint.c
@@ -396,6 +396,8 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
 
 	if (hw->ctrl.type != LOONGARCH_BREAKPOINT_EXECUTE)
 		alignment_mask = 0x7;
+	else
+		alignment_mask = 0x3;
 	offset = hw->address & alignment_mask;
 
 	hw->address &= ~alignment_mask;
-- 
2.39.2

