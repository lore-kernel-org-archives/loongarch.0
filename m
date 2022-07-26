Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D64323B
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 15:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1658851050; bh=DtPW2v4hv1RbbAs85X/FaRB7B5J3+llX0O5ulbN4OkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JKID8/luwf2Cvshkytgy9cKquHC5si1b+9hbCSXhZJXFFcOoAMeXz4LmRUMNqWWMY
	 BXjWF3HCUkDS5aESklY7FO52xbJcO/d/cA/vSVgoqdskre2a0wjosOCzEwKlBLnHV6
	 EDJb5NSRx6eKn77bHzgUyXeDPfjQQZCHlxgYac70=
Received: from ld50.lan (unknown [101.228.137.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 2C0F86067B;
	Tue, 26 Jul 2022 23:57:29 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Jinyang He <hejinyang@loongson.cn>,
	loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v3 1/8] LoongArch: Remove several syntactic sugar macros for branches
Date: Tue, 26 Jul 2022 23:57:15 +0800
Message-Id: <20220726155722.2402337-2-kernel@xen0n.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220726155722.2402337-1-kernel@xen0n.name>
References: <20220726155722.2402337-1-kernel@xen0n.name>
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

