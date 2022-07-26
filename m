Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7650D814
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 12:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1658838576; bh=P37Cw+X1ZAGQWhIXyv6E9LddT9OagLH+vBFxav+ZAB4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JWu3NC1ILh/1usS449vu0/wEWS6ejTr4V/76P3jyukR5/VIHxYaJno/p9PeJ03q16
	 bkeOKnICc4RkrUQ0jEgy2xFLG0fUWaqmNtZoBcozf4Vvf1lgncHeDjN+82XNQCER/L
	 f8Tj4t1NAGLwZR3W/BStm+4ZrgPj6P3v2o8AmNqw=
Received: from ld50.lan (unknown [101.228.137.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id ECD6560689;
	Tue, 26 Jul 2022 20:29:35 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v2 5/6] LoongArch: Simplify "BLT foo, zero" with BLTZ
Date: Tue, 26 Jul 2022 20:29:19 +0800
Message-Id: <20220726122920.2291947-6-kernel@xen0n.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220726122920.2291947-1-kernel@xen0n.name>
References: <20220726122920.2291947-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

Support for the syntactic sugar is present in upstream binutils port
from the beginning. Use it for shorter lines and better consistency.
Generated code should be identical.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/include/asm/atomic.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/include/asm/atomic.h b/arch/loongarch/include/asm/atomic.h
index 0869bec2c937..dc2ae4f22c8e 100644
--- a/arch/loongarch/include/asm/atomic.h
+++ b/arch/loongarch/include/asm/atomic.h
@@ -158,7 +158,7 @@ static inline int arch_atomic_sub_if_positive(int i, atomic_t *v)
 		"1:	ll.w	%1, %2		# atomic_sub_if_positive\n"
 		"	addi.w	%0, %1, %3				\n"
 		"	move	%1, %0					\n"
-		"	blt	%0, $zero, 2f				\n"
+		"	bltz	%0, 2f					\n"
 		"	sc.w	%1, %2					\n"
 		"	beqz	%1, 1b					\n"
 		"2:							\n"
@@ -171,7 +171,7 @@ static inline int arch_atomic_sub_if_positive(int i, atomic_t *v)
 		"1:	ll.w	%1, %2		# atomic_sub_if_positive\n"
 		"	sub.w	%0, %1, %3				\n"
 		"	move	%1, %0					\n"
-		"	blt	%0, $zero, 2f				\n"
+		"	bltz	%0, 2f					\n"
 		"	sc.w	%1, %2					\n"
 		"	beqz	%1, 1b					\n"
 		"2:							\n"
@@ -321,7 +321,7 @@ static inline long arch_atomic64_sub_if_positive(long i, atomic64_t *v)
 		"1:	ll.d	%1, %2	# atomic64_sub_if_positive	\n"
 		"	addi.d	%0, %1, %3				\n"
 		"	move	%1, %0					\n"
-		"	blt	%0, $zero, 2f				\n"
+		"	bltz	%0, 2f					\n"
 		"	sc.d	%1, %2					\n"
 		"	beqz	%1, 1b					\n"
 		"2:							\n"
@@ -334,7 +334,7 @@ static inline long arch_atomic64_sub_if_positive(long i, atomic64_t *v)
 		"1:	ll.d	%1, %2	# atomic64_sub_if_positive	\n"
 		"	sub.d	%0, %1, %3				\n"
 		"	move	%1, %0					\n"
-		"	blt	%0, $zero, 2f				\n"
+		"	bltz	%0, 2f					\n"
 		"	sc.d	%1, %2					\n"
 		"	beqz	%1, 1b					\n"
 		"2:							\n"
-- 
2.35.1

