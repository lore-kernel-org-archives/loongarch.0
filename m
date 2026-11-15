Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755542;
	b=CKmXDBzaiz2LhgOS7trj7zoGsuppQ0ml+DVxlnVdIJHm/3tDiesCPsoNVTgQv90goaDQ
	 vrkU0OrKPutePKXOnyc96gFjIFM2LKDPi/wnHob4Dg2nFKl+EVmGEt9fQOJ7YK/CJcQsP
	 XK7tKS1xn1SosaQHgBBcyNBpZDJXfQtmShRtZxkt57W7KtQL3hIxW6Jt/m6r6xUQ02TEV
	 HG1BU2AkZvl4O1gReLSS8VQp8eIVVBBcf7gLMyhjWlcLVZpeXjsAmkPONsWlUu4gZQqGQ
	 FYmizO6MKlMXlV1zgYGvIAmsf8ZtW0xuVAt/56BADbmH3nCoWmCK/ZCEj6edVNVcHAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755542;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8VRnGlElQsFCv5R28x1Gbp07GlpWyV9JaiJRHuKTiKs=;
	b=AYOkWv9ua155qBQBWKPsQV0Ug9U7gjwHGf+1ElQ2cZSY8RwuRSO1Itp/GPcjZizPv+yj
	 urtGz5OyNNSIIHnyPOqgBd7fOoiPW7JzBmgDlZUA776VRRgEU+RuqFwkoQ0kUFMXYVEaX
	 eEy/l/SMKi81Vi+t/j4Bcm/E0EoNp8UFmv8bPibNOdnJRgrdHsNdUi3DNpYP4AdSI63qm
	 P3+y59xyVyaSqq9opxAVTrzuhEfkVrUt1OtPm8d3zygQ1SQE4nga1HOAxt1fvIGNHxg4Z
	 3sr3S8z0tA5OF+Oe+WV48A4N3GMzNc1lC6MRu/JWrDhx4A2Ij7pWogmwI70s6Rg+40A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WceBVUOD;
	arc=none smtp.remote-ip=95.215.58.144
Received: from mta1.migadu.com (out-144.mta1.migadu.com [95.215.58.144])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FCA606A31F
	for <loongarch@lists.linux.dev>; Sun, 15 Nov 2026 15:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93FCA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WceBVUOD
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=K1rYyVGAnrzeZXd3FlMro7kB2ZINE/qYB84gIwgS6iE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794755539; v=1; x=1795360339;
 b=WceBVUODB3nRmr1alBjCVjpgX0ecg5odOOrbQBlpafWUZp0pOBJUu+W1D7JYuLeKeT2Us6O2
 9IR5G4MyIzecU44EnVB+gFmRl9WExMaHdgq1v42RcAKoHh/o+VHPoCEsTfLtuPZhC5GbRaQqCSs
 BhGWXHdRlJo+H0PnLvktIdy4=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id d986cb89a3ce2d99;
	Sun, 15 Nov 2026 15:12:19 +0000
X-Mizu-Trace-ID: d986cb89a3ce2d99
X-Migadu-Flow: FLOW_OUT
From: Zenghui Yu <zenghui.yu@linux.dev>
To: kvm@vger.kernel.org,
	loongarch@lists.linux.dev
Cc: zhaotianrui@loongson.cn,
	maobibo@loongson.cn,
	chenhuacai@kernel.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH] LoongArch: KVM: Remove unused macros and declaration
Date: Sun, 15 Nov 2026 23:12:04 +0800
Message-ID: <20261115151204.82817-1-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The KVM_LOONGSON_IRQ_* macros and kvm_restore_fcsr() declaration are never
used anywhere, drop them.

Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---
 arch/loongarch/include/asm/kvm_vcpu.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/loongarch/include/asm/kvm_vcpu.h b/arch/loongarch/include/asm/kvm_vcpu.h
index a70a32103523..439731f715aa 100644
--- a/arch/loongarch/include/asm/kvm_vcpu.h
+++ b/arch/loongarch/include/asm/kvm_vcpu.h
@@ -44,14 +44,6 @@
 
 #define MNSEC_PER_SEC			(NSEC_PER_SEC >> 20)
 
-/* KVM_IRQ_LINE irq field index values */
-#define KVM_LOONGSON_IRQ_TYPE_SHIFT	24
-#define KVM_LOONGSON_IRQ_TYPE_MASK	0xff
-#define KVM_LOONGSON_IRQ_VCPU_SHIFT	16
-#define KVM_LOONGSON_IRQ_VCPU_MASK	0xff
-#define KVM_LOONGSON_IRQ_NUM_SHIFT	0
-#define KVM_LOONGSON_IRQ_NUM_MASK	0xffff
-
 typedef union loongarch_instruction  larch_inst;
 typedef int (*exit_handle_fn)(struct kvm_vcpu *, int);
 
@@ -70,7 +62,6 @@ void kvm_own_fpu(struct kvm_vcpu *vcpu);
 void kvm_lose_fpu(struct kvm_vcpu *vcpu);
 void kvm_save_fpu(struct loongarch_fpu *fpu);
 void kvm_restore_fpu(struct loongarch_fpu *fpu);
-void kvm_restore_fcsr(struct loongarch_fpu *fpu);
 
 #ifdef CONFIG_CPU_HAS_LSX
 int kvm_own_lsx(struct kvm_vcpu *vcpu);
-- 
2.56.0

