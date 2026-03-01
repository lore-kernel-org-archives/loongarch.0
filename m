Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797362EBBA9;
	Sun,  1 Mar 2026 01:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330111; cv=none; b=iMKnplJiOD/yykyUhB7kbfz+kFxlx0KxbUp2H9hAPuRTfKkUx0Kaw6erGlbImd3MUsizPZVeUrEvIb4QdCQxY+RPu+4J9SVYwr5WxFt14qeILq61sRbfRDOm5nrc9PeBbwUulncl2gkfBqAQERFu5rQDLd8TYe9CFbQL8fJEICw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330111; c=relaxed/simple;
	bh=/MjnyF/uA5gUuq22TYmYFvlmHZfbYj1mSB5UNWzUxZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TjTBLWF9M0gxzMI5AWJ96qD8q0cETJEgY2oU3JICrift5sKZ/hUE9Icbyz3WUbnWJieJP+7jQKXtDCZxDrjrldRSB3CznRiXBD80MZ18VMXUVKEjCJlv/gafZwD2IP0nShiJ324HuxXSGMYBr1/hV4Jaful+rOHiAL5BtBjEXnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZETfzRE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZETfzRE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13BAC19421;
	Sun,  1 Mar 2026 01:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330111;
	bh=/MjnyF/uA5gUuq22TYmYFvlmHZfbYj1mSB5UNWzUxZ8=;
	h=From:To:Cc:Subject:Date:From;
	b=gZETfzRE2W9/SnfWl5RzPTvHOxErfNqtyXU2C+oG+ZpfFj9KmAI3GBxWlH+XVIPg8
	 51cP20KAWGMz3rseJNcILxq5EDTmRr5tnhvvUBTLrK7yl/BPTIqb2a70EnO0Imz6Zr
	 /DC14Y5vHowOfZ+bLldhQPbEE6a3kIiT1HRUVNdBOCSgQ8zhoUQTxuIx+7OpwjpXzI
	 cg0EXMShwcay0khHnOGkjnmdiRT/CZBXzPGEzroF9JomVf9CX/b7pIdrV6cEdi5vpo
	 Ap1Y7DIHcuVJ9TaM/QnhYR3AX/6HZ6NFKrzdnCuG8KANSoiqaHPXOpMPn0j8DSeA5/
	 6CE/a/TQ5jr+Q==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	yangtiezhu@loongson.cn
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	loongarch@lists.linux.dev
Subject: FAILED: Patch "LoongArch: Use %px to print unmodified unwinding address" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:55:09 -0500
Message-ID: <20260301015509.1722300-1-sashal@kernel.org>
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

The patch below does not apply to the 5.15-stable tree.
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




