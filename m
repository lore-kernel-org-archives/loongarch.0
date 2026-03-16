Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A410E34D905
	for <loongarch@lists.linux.dev>; Mon, 16 Mar 2026 07:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773646547; cv=none; b=HPs8ByyCeNMkcLX0Y6vaLpCzv/hQ8kFm09RsVBiGNyfdVv/Y1Gwv6m6tb3x9t6yUJC7bWnjcgPYytQxhKhcPHQOBG39/6dMzO5L2XKKtvX3KZdkPTxkS9DGiLhROiXeVsokrzZXSoysEk4ZG0WeRxr9W8f+nHMbuC6uti5Geb8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773646547; c=relaxed/simple;
	bh=rafZZvPGPG7/C2Fjzh5ZhqF4LIAYTNyYf3H+YTpFBS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SJ3haua2wMdOEiigWmxrX49mZoOraQprCIzDmQhjXfbtX9dNgtIJRMyhK5lL/7ch/9jp/glz+8/TAQKbRIcUkN2yw9InxDbTlIxQIrL2tldrEKf7aUkRhzsK/lx9s7sGw8ZnWOMJ6pfDcallJhQgiWU0KDITfMfZNU4cCd7ntvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=K3PX52xP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=64l5qKG8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="K3PX52xP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="64l5qKG8"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1773646178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oPhsobU4F6abVLNhIEn25GFy9fn769tdfue+kCQjVVk=;
	b=K3PX52xPO9RysLmtaah5kf5R1IVP/x7/03ml8sW+M24Sb8K/swF6UJxr8m/t/RK1qTQkDT
	AnGStdxNWGPBy+//Fft2HL5G78gR4vB7NaygUg+T+G4ZrnKolEex5SM+sv/rSnBLoLR5r+
	BQbFDd12CvOtn269i+kb+ZUl3ei04ZviG6BmnGfsA0BmjxB4QnhnmIssp4YzK1X3wu2CiZ
	kXbQNTjD1CGGf0PvKM8h2Pr4zYSh6v/1QTxlP4deDKVvvLcvE0w2/+LHyV4hrBuwZnk6RZ
	Yrf/LBoj+KdbVraVGwdXcD8UnkbexOA8z2e4t2A4MVS+cWgNeUXCEQu5N6ub0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1773646178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oPhsobU4F6abVLNhIEn25GFy9fn769tdfue+kCQjVVk=;
	b=64l5qKG8UkGu2oZE0E5ujEU0DZBye7We+D6BgrJK0GHnmzTm5Dc0emA4zSZ8wwxinheN7i
	6asmmel2r4ignMCQ==
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@kernel.org>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH] genirq/matrix, LoongArch: Delete IRQ_MATRIX_BITS leftovers
Date: Mon, 16 Mar 2026 08:28:50 +0100
Message-ID: <20260316072850.467995-1-namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Delete IRQ_MATRIX_BITS leftovers after commit
5b98d210ac1e ("genirq/matrix: Dynamic bitmap allocation") has made
IRQ_MATRIX_BITS obsolete.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/loongarch/include/asm/irq.h | 1 -
 kernel/irq/matrix.c              | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/loongarch/include/asm/irq.h b/arch/loongarch/include/asm/=
irq.h
index 3943647503a9..537add26daf4 100644
--- a/arch/loongarch/include/asm/irq.h
+++ b/arch/loongarch/include/asm/irq.h
@@ -48,7 +48,6 @@ void spurious_interrupt(void);
  */
 #define NR_VECTORS		256
 #define NR_LEGACY_VECTORS	16
-#define IRQ_MATRIX_BITS		NR_VECTORS
=20
 #define AVEC_IRQ_SHIFT		4
 #define AVEC_IRQ_BIT		8
diff --git a/kernel/irq/matrix.c b/kernel/irq/matrix.c
index 0f79a4abea05..faafb43a4e61 100644
--- a/kernel/irq/matrix.c
+++ b/kernel/irq/matrix.c
@@ -39,7 +39,7 @@ struct irq_matrix {
=20
 /**
  * irq_alloc_matrix - Allocate a irq_matrix structure and initialize it
- * @matrix_bits:	Number of matrix bits must be <=3D IRQ_MATRIX_BITS
+ * @matrix_bits:	Number of matrix bits
  * @alloc_start:	From which bit the allocation search starts
  * @alloc_end:		At which bit the allocation search ends, i.e first
  *			invalid bit
--=20
2.47.3

