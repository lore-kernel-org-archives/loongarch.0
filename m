Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB67E1B962
	for <loongarch@lists.linux.dev>; Fri, 16 Feb 2024 08:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.28.160.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708073917; cv=none; b=ka1z92ymPs8nGAMw3j/x+ZkVuepXz90GAH5ueOtBdxbtoZEoi/KaCBAcdnueWNdIqUg8IIaxSUPK2S/eS4zGl2QZa/2OSRCGBwM2ZBALaRO03y5uh0dlI4rEIMLzTXcaVGsB6w8/ubRocVw/lFr+R7kVgrKstYjD+C7HP2IfBm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708073917; c=relaxed/simple;
	bh=WzF4cixCPUKQp/NgbAjzvNdu2i9KtmYFWq3pDpAX4VY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t76SAcuJ2NxPJl9ENrIr3z4V0S5UBRVT7tfnkv5nwovi9dNZxNluQV4PtnADp1ghGVjPrSBEuDL7FnhvQvJvXuZ4O0Zg3m4swzP3JIydk7EMx17veCn20Ln45qUNn9m2SwFSli6vD9M3HQ5RVzn+GLV9L46fBCPGvPMoa0jijms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xen0n.name; spf=pass smtp.mailfrom=xen0n.name; dkim=pass (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b=F9bXnQpg; arc=none smtp.client-ip=115.28.160.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xen0n.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xen0n.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b="F9bXnQpg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1708073911; bh=WzF4cixCPUKQp/NgbAjzvNdu2i9KtmYFWq3pDpAX4VY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F9bXnQpgwb2FtaeGfQJodNaSJrq9YUMnHgqBlv1a4o/9oaEQ+z9VH0GKcx9O2cwsK
	 EBzBff4UhzVOI9FHYClUt+t7QFrJVSIxCwOLyQqcqfSlm9p06pl3ry2g05V49biFwg
	 1vVq1ctq3TmPlJBElaHaf8nu5dRM10xhtdyE3tKI=
Received: from ld50.lan (unknown [IPv6:240e:388:8d00:6500:cda4:aa27:b0f6:1748])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 43BF8601C2;
	Fri, 16 Feb 2024 16:58:31 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH for-6.8 v3 2/3] LoongArch: KVM: Rename _kvm_get_cpucfg to _kvm_get_cpucfg_mask
Date: Fri, 16 Feb 2024 16:58:21 +0800
Message-ID: <20240216085822.3032984-3-kernel@xen0n.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240216085822.3032984-1-kernel@xen0n.name>
References: <20240216085822.3032984-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

The function is not actually a getter of guest CPUCFG, but rather
validation of the input CPUCFG ID plus information about the supported
bit flags of that CPUCFG leaf. So rename it to avoid confusion.

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 arch/loongarch/kvm/vcpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 56da0881fc94..d86da3811bea 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -298,7 +298,7 @@ static int _kvm_setcsr(struct kvm_vcpu *vcpu, unsigned int id, u64 val)
 	return ret;
 }
 
-static int _kvm_get_cpucfg(int id, u64 *v)
+static int _kvm_get_cpucfg_mask(int id, u64 *v)
 {
 	switch (id) {
 	case 2:
@@ -335,7 +335,7 @@ static int kvm_check_cpucfg(int id, u64 val)
 	u64 mask = 0;
 	int ret;
 
-	ret = _kvm_get_cpucfg(id, &mask);
+	ret = _kvm_get_cpucfg_mask(id, &mask);
 	if (ret)
 		return ret;
 
@@ -563,7 +563,7 @@ static int kvm_loongarch_get_cpucfg_attr(struct kvm_vcpu *vcpu,
 	uint64_t val;
 	uint64_t __user *uaddr = (uint64_t __user *)attr->addr;
 
-	ret = _kvm_get_cpucfg(attr->attr, &val);
+	ret = _kvm_get_cpucfg_mask(attr->attr, &val);
 	if (ret)
 		return ret;
 
-- 
2.43.0

