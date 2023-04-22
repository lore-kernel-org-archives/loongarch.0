Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7623A6AAA
	for <loongarch@lists.linux.dev>; Sat, 22 Apr 2023 17:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1682184909; bh=TjU6eqiRK1crClPaSs+/FZgpf/zsP/abTfWWIOmeE+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ll3dDVHn6uOgx0MeuNapUllJ7zkKXzp45SzE9TSOeG4hHOPMzDSLjhq/quZjjFIDP
	 ffMm0W5WV2/4TpGAH5h63oMfYAbandg8+MMovbyv3DXk8dtknHYNzjt/WTGeCrGsrN
	 dJL9v/WsBt1QIhBjGj15x8VDUY7rFbJaOi82C7dc=
Received: from ld50.lan (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id D88EC600DA;
	Sun, 23 Apr 2023 01:35:09 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v6 02/13] LoongArch: Add exception subcode definitions for the watchpoint exception
Date: Sun, 23 Apr 2023 01:34:44 +0800
Message-Id: <20230422173455.3354690-3-kernel@xen0n.name>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230422173455.3354690-1-kernel@xen0n.name>
References: <20230422173455.3354690-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

Add them to enable matching the sub-exceptions for humanization purposes
later.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/include/asm/loongarch.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index 7d8b83dd32e9..da5b572b2d2f 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -1408,7 +1408,9 @@ __BUILD_CSR_OP(tlbidx)
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
2.40.0

