Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066025FF03
	for <loongarch@lists.linux.dev>; Wed, 14 Feb 2024 16:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.28.160.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707928447; cv=none; b=TkIwmLxSrN9OLxbjJclpDWY4jOP6b/9Fq56lEgPqgkaXth3/i9ZNlaIhxfM542z5wOrNoJ+UuCa56Q5pgAl/44kmwLvH32tuU131t9R5HXd2FhKl1JASyVbLoInwc6P8K+SvHrzTrTPuC2/3pe0tgOT5dZaiyW78zyH3bt4Jnvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707928447; c=relaxed/simple;
	bh=qUTm7/R3ovfw0MXxK4QrZKdILlZUuBNM9kI6bR5Fxzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ivei1IOIwjwKAyITzNzRw4fDn6odhXQLq9+DZLX5yFXjTDEksF85Qh62GnSgzRz2W5EixYen/IC+QjjgzEUYkunxOlN6UF24r0zZXwJ0ZfA4B2RLmsnGn1Qm/TFbK9ixe0+3l8TtzAKkuSO4+2ryKYJtQ2u/b+QSM5FxuFp9XA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xen0n.name; spf=pass smtp.mailfrom=xen0n.name; dkim=pass (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b=ZNU0AkXX; arc=none smtp.client-ip=115.28.160.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xen0n.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xen0n.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b="ZNU0AkXX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1707928441; bh=qUTm7/R3ovfw0MXxK4QrZKdILlZUuBNM9kI6bR5Fxzc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZNU0AkXX04CwM3rMQCCubKT7skrrj0VQW66Is5+V1MQyNxnY5LDUUe1L4voIFJ1vH
	 NoEbvYoF9cKwr6ofnBvYlg2hkbMBUnEsHOxaDuSohruYvUH45ZJarDyHMElfK6rli4
	 yTIfRvmdTBaROi9uTRmpVLZnSkX14DLrLQfnty54=
Received: from ld50.lan (unknown [IPv6:240e:388:8d00:6500:42e8:c06f:a0dc:12f8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 90E38601A7;
	Thu, 15 Feb 2024 00:34:01 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH for-6.8 v2 1/4] KVM: LoongArch: Fix input value checking of _kvm_get_cpucfg
Date: Thu, 15 Feb 2024 00:33:54 +0800
Message-ID: <20240214163358.2913090-2-kernel@xen0n.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214163358.2913090-1-kernel@xen0n.name>
References: <20240214163358.2913090-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

The range check for the CPUCFG ID is wrong (should have been a ||
instead of &&), and pointless, because the default case a few lines
below already serves to deny all unhandled cases.

Furthermore, the juggling of the temp return value is unnecessary,
because it is semantically equivalent and more readable to just
return at every switch case's end. This is done too to avoid potential
bugs in the future related to the unwanted complexity.

Fixes: db1ecca22edf ("LoongArch: KVM: Add LSX (128bit SIMD) support")
Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kvm/vcpu.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 27701991886d..c4a592623da6 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -300,11 +300,6 @@ static int _kvm_setcsr(struct kvm_vcpu *vcpu, unsigned int id, u64 val)
 
 static int _kvm_get_cpucfg(int id, u64 *v)
 {
-	int ret = 0;
-
-	if (id < 0 && id >= KVM_MAX_CPUCFG_REGS)
-		return -EINVAL;
-
 	switch (id) {
 	case 2:
 		/* Return CPUCFG2 features which have been supported by KVM */
@@ -324,12 +319,10 @@ static int _kvm_get_cpucfg(int id, u64 *v)
 		if (cpu_has_lasx)
 			*v |= CPUCFG2_LASX;
 
-		break;
+		return 0;
 	default:
-		ret = -EINVAL;
-		break;
+		return -EINVAL;
 	}
-	return ret;
 }
 
 static int kvm_check_cpucfg(int id, u64 val)
-- 
2.43.0

