Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA822D9798;
	Sun,  1 Mar 2026 01:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329085; cv=none; b=Erulif4mmCiA9KqINvCjc9MydNYm2ObjCmUykPPdNB/KQy3YoAnTQcTb/5AcxhHYGC1RKGT/439HoLkHYCL4emG72pNKwAzlDgjl6H+S3eT10hIbYfsRajuUdQYjwWx5hgqGvWnD0/6CaGlX64+zChmJiUvmuXUW6uA94HSVxZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329085; c=relaxed/simple;
	bh=HRy7VEhYREGDOrZfgpdc1kukwhorWwdhWbYhrqqAnfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qd2vBq02nY3VGps75ZYGNWybCTeBCh9Qvm086rGRuEIq88cvHJJhwHYABDL63FDw3rTQd0Y61SM7s13xo3HMrHcg8oHwciV9wgRkm8gmRSYhDiqNi8vcEWjUNVdX8SaABstobGpIsPUeZ2N+u2BzHUqEvG0yiU4Ee23y2DBGthM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qAoBRnRc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qAoBRnRc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3D2C19421;
	Sun,  1 Mar 2026 01:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329085;
	bh=HRy7VEhYREGDOrZfgpdc1kukwhorWwdhWbYhrqqAnfA=;
	h=From:To:Cc:Subject:Date:From;
	b=qAoBRnRcHbxRukj/wbqpNJ7R1FSgqNE61FI4feE+2AbsLK2my+AJyIuv3dPEw9DtX
	 ahs5rAOkQN9kyIC4XgeWyDn6ncVt3UW+VDzrmSXy096hfl2OCHLqze7R3I71jG+gxO
	 4XDtOheRQPeVB9TOrQ2y04K1mpw1xJOmxFAJzb6a7+cEut7Rumsaj5n7d7Hz27e69T
	 z/jUcS0nhr6HAkjS0nmDDtYkecgKv1vu5tBgWKgeL9ot+zRtdsLq6GnzayaM+rreij
	 AOU7Acfx75p7HDQItLvxRSu+bB6bPrjBwCxWUfrI44Id+0a1aEubfb9B0F6L06BJqU
	 a16ewSxjfwDsg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	yangtiezhu@loongson.cn
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	loongarch@lists.linux.dev
Subject: FAILED: Patch "LoongArch: Use %px to print unmodified unwinding address" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:38:03 -0500
Message-ID: <20260301013803.1698382-1-sashal@kernel.org>
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

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 77403a06d845db1caf9a6b0867b43e9dd8de8e4a Mon Sep 17 00:00:00 2001
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Date: Tue, 10 Feb 2026 19:31:13 +0800
Subject: [PATCH] LoongArch: Use %px to print unmodified unwinding address

Currently, use %p to prevent leaking information about the kernel memory
layout when printing the PC address, but the kernel log messages are not
useful to debug problem if bt_address() returns 0. Given that the type of
"pc" variable is unsigned long, it should use %px to print the unmodified
unwinding address.

Cc: stable@vger.kernel.org
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/unwind_orc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/unwind_orc.c
index 8a6e3429a860e..d6b3688a1ce97 100644
--- a/arch/loongarch/kernel/unwind_orc.c
+++ b/arch/loongarch/kernel/unwind_orc.c
@@ -494,7 +494,7 @@ bool unwind_next_frame(struct unwind_state *state)
 
 	state->pc = bt_address(pc);
 	if (!state->pc) {
-		pr_err("cannot find unwind pc at %p\n", (void *)pc);
+		pr_err("cannot find unwind pc at %px\n", (void *)pc);
 		goto err;
 	}
 
-- 
2.51.0




