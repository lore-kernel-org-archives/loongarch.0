Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCBD3200
	for <loongarch@lists.linux.dev>; Sun, 24 Jul 2022 13:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1658669474; bh=DtPW2v4hv1RbbAs85X/FaRB7B5J3+llX0O5ulbN4OkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xqlk/ppyYgOfCmEicHySYYyHiTK4yLQzson23kOV4u7SpHssKnvcC2+oIEZlDeFyo
	 w5Hn9Ii7ysu51256bB7LNPn90UNJe2gdMX/EJHE8Ll+rAuXekVgcQDp0iOD+fPsz+N
	 U3Oxa1t2gl49KBEFjmO/LVmr5ylKoSjRFXyvg3Ag=
Received: from ld50.lan (unknown [101.228.137.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id A8EC660689;
	Sun, 24 Jul 2022 21:31:14 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH 4/4] LoongArch: Remove several syntactic sugar macros for branches
Date: Sun, 24 Jul 2022 21:30:52 +0800
Message-Id: <20220724133052.1872885-5-kernel@xen0n.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220724133052.1872885-1-kernel@xen0n.name>
References: <20220724133052.1872885-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

These syntactic sugars have been supported by upstream binutils from the
beginning, so no need to patch them locally.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/include/asm/asmmacro.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/loongarch/include/asm/asmmacro.h b/arch/loongarch/include/asm/asmmacro.h
index a1a04083bd67..be037a40580d 100644
--- a/arch/loongarch/include/asm/asmmacro.h
+++ b/arch/loongarch/include/asm/asmmacro.h
@@ -274,16 +274,4 @@
 	nor	\dst, \src, zero
 .endm
 
-.macro bgt r0 r1 label
-	blt	\r1, \r0, \label
-.endm
-
-.macro bltz r0 label
-	blt	\r0, zero, \label
-.endm
-
-.macro bgez r0 label
-	bge	\r0, zero, \label
-.endm
-
 #endif /* _ASM_ASMMACRO_H */
-- 
2.35.1

