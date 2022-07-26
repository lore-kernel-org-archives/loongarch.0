Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5BD812
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 12:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1658838576; bh=NV+yavBPbFtEcwfkQQlHlIAK3M6yPJ8NxM7pKdKCDc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QCxTn7bMSXI5l7c0FQ8wvuH2zgQXudBQfzG567x6qFk47/YvZqcE3HD+fHROY6ZKd
	 LMsVyBBZB7XD0kwKZehnbW5Ukdm+/D3pXCWEHgJb9+mLF+69MIOmUNyuVcgWi4zVfT
	 fSUh51a5d564PU48UdvUaMy0GYNWaN3xauD68t7E=
Received: from ld50.lan (unknown [101.228.137.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 482336068A;
	Tue, 26 Jul 2022 20:29:36 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v2 6/6] LoongArch: Simplify "BGT foo, zero" with BGTZ
Date: Tue, 26 Jul 2022 20:29:20 +0800
Message-Id: <20220726122920.2291947-7-kernel@xen0n.name>
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
 arch/loongarch/lib/clear_user.S | 2 +-
 arch/loongarch/lib/copy_user.S  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/lib/clear_user.S b/arch/loongarch/lib/clear_user.S
index 25d9be5fbb19..16ba2b8dd68a 100644
--- a/arch/loongarch/lib/clear_user.S
+++ b/arch/loongarch/lib/clear_user.S
@@ -32,7 +32,7 @@ SYM_FUNC_START(__clear_user)
 1:	st.b	zero, a0, 0
 	addi.d	a0, a0, 1
 	addi.d	a1, a1, -1
-	bgt	a1, zero, 1b
+	bgtz	a1, 1b
 
 2:	move	a0, a1
 	jr	ra
diff --git a/arch/loongarch/lib/copy_user.S b/arch/loongarch/lib/copy_user.S
index 9ae507f851b5..97d20327a69e 100644
--- a/arch/loongarch/lib/copy_user.S
+++ b/arch/loongarch/lib/copy_user.S
@@ -35,7 +35,7 @@ SYM_FUNC_START(__copy_user)
 	addi.d	a0, a0, 1
 	addi.d	a1, a1, 1
 	addi.d	a2, a2, -1
-	bgt	a2, zero, 1b
+	bgtz	a2, 1b
 
 3:	move	a0, a2
 	jr	ra
-- 
2.35.1

