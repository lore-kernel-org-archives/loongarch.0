Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A238A111F
	for <loongarch@lists.linux.dev>; Thu, 29 Dec 2022 05:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1672292007; bh=I/GQiQgzEOF9t9culG3TklJ4Phq1cID/SRIOlBJDW1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jlcQWzGvL/1BoKbhjvnRdjbs3We6uoXzorZ2AxQ/KKl0V1DFrZ35MNjckuJBBXXvp
	 9OCkVYNfQIAdgxfKaMUYW8Xuz42g2F9b7ICb8wra271Bz2ntSal9Q+fTZGmNTb19Cb
	 z0029Nu8tb8SmoKWr+AJIpJYNArjo6riHymh79MA=
Received: from ld50.lan (unknown [101.88.134.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 55F49600DA;
	Thu, 29 Dec 2022 13:33:27 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v2 02/11] LoongArch: Add exception subcode definitions for the watchpoint exception
Date: Thu, 29 Dec 2022 13:32:57 +0800
Message-Id: <20221229053306.3285457-3-kernel@xen0n.name>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229053306.3285457-1-kernel@xen0n.name>
References: <20221229053306.3285457-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/include/asm/loongarch.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index 4910969928f0..d087acaf206d 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -1405,7 +1405,9 @@ __BUILD_CSR_OP(tlbidx)
 #define EXCCODE_FPE		18	/* Floating Point Exception */
 	#define EXCSUBCODE_FPE		0	/* Floating Point Exception */
 	#define EXCSUBCODE_VFPE		1	/* Vector Exception */
-#define EXCCODE_WATCH		19	/* Watch address reference */
+#define EXCCODE_WATCH		19	/* WatchPoint Exception */
+	#define EXCSUBCODE_WPEF		0	/* ... on instruction Fetch */
+	#define EXCSUBCODE_WPEM		1	/* ... on Memory access */
 #define EXCCODE_BTDIS		20	/* Binary Trans. Disabled */
 #define EXCCODE_BTE		21	/* Binary Trans. Exception */
 #define EXCCODE_PSI		22	/* Guest Privileged Error */
-- 
2.38.1

