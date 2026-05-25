Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABDF2DE6FF
	for <loongarch@lists.linux.dev>; Mon, 25 May 2026 07:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779692545; cv=none; b=iqGFT0F63Kws1vHs432DzQvCbQ/2c2yn31dbQCIwUxcOXNXjwpizKFW+xNphc1BC0GKz5krloM3kaqkVNqfsSIX6zy4uPRIhj08nF0YonNcwq3czoMvWRW78fWERJjq2uTxYPZnI7khkqaynfIvkv69VoOFxsmIW2iwOk/seunY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779692545; c=relaxed/simple;
	bh=nVeNCtCxeDva7j1QDt54ZLI4KVS3DgJyxkKmXByYEAw=;
	h=Subject:Message-Id:Mime-Version:Content-Type:From:Cc:Date:To; b=fUfv02qFdDvNd8KkE0Xa0jCRQTabSFgzflKnI1PmlZDmdRGnDbhVWRWp3HuqOiUMvkXySsBqYME7pQofgqYN0n8c/7cJ+q5VtsZR6zxTCTme4JSd+G9PxFW/dRTtVw3YnKk4/lZ+orUHcXlcnscXkm40q1fC3zf4l7tSzZSoIiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=n8KD4sOS; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="n8KD4sOS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1779692535; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=FSPlzs2arfc5IQb4eW/8WkmdON8YANDuE11YBYOEbL8=;
 b=n8KD4sOSLz78RhwV62EDGGMUc8UtaywsjsAopjIbOMsrDioHdfebXQzG4eMWm5X1OfNVbi
 xqhSA4KL8Kt3OGmJVWVm7EqTAmmtXMRPNRx3NeY4vgPas14jlUsF6wUpIkplDNiwoWNG9r
 CpXHnKOWAD6jLY1NYqasdwQMjclfamR3tUCQ8OrnAbcuSOR9gWvuhZNtnniucOHp7sU0eo
 x2afAQ6huL+oBF6zq8lKPh+mKvINo9pYQa/mRwrDfQ4xA7auJPZaX3XoIpJwXrb7KFX179
 lL0Qy+4Dj7TSmINrtt6BOCQbvoMiqXzYy9MM04W7WwOl2G+AKAzF1Or7gtJikQ==
Subject: [PATCH] KVM: Validate irqchip index for LoongArch and PowerPC
Message-Id: <20260525070154.495455-1-yanfei.xu@bytedance.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Original-From: Yanfei Xu <yanfei.xu@bytedance.com>
Content-Type: text/plain; charset=UTF-8
From: "Yanfei Xu" <yanfei.xu@bytedance.com>
X-Mailer: git-send-email 2.20.1
Cc: <kvm@vger.kernel.org>, <loongarch@lists.linux.dev>, 
	<linuxppc-dev@lists.ozlabs.org>, <caixiangfeng@bytedance.com>, 
	<fangying.tommy@bytedance.com>, <yanfei.xu@bytedance.com>, 
	<isyanfei.xu@gmail.com>, "Sashiko" <sashiko-bot@kernel.org>
Date: Mon, 25 May 2026 15:01:54 +0800
X-Lms-Return-Path: <lba+26a13f3f5+64fe3c+lists.linux.dev+yanfei.xu@bytedance.com>
To: <zhaotianrui@loongson.cn>, <maobibo@loongson.cn>, 
	<chenhuacai@kernel.org>, <maddy@linux.ibm.com>, <npiggin@gmail.com>, 
	<sashiko-reviews@lists.linux.dev>, <seanjc@google.com>, 
	<pbonzini@redhat.com>

Sashiko reported that irqchip index is not validated for LoongArch and
PowerPC. Add validation and reject out-of-range irqchip indexes to avoid
indexing past the routing table's chip array.

Fixes: de9ba2f36368 ("KVM: PPC: Support irq routing and irqfd for in-kernel MPIC")
Fixes: 1928254c5ccb ("LoongArch: KVM: Add irqfd support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/kvm/20260525051714.485D51F000E9@smtp.kernel.org/
Signed-off-by: Yanfei Xu <yanfei.xu@bytedance.com>
---
 arch/loongarch/kvm/irqfd.c | 3 ++-
 arch/powerpc/kvm/mpic.c    | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kvm/irqfd.c b/arch/loongarch/kvm/irqfd.c
index f4f953b22419..40ed1081c4b6 100644
--- a/arch/loongarch/kvm/irqfd.c
+++ b/arch/loongarch/kvm/irqfd.c
@@ -51,7 +51,8 @@ int kvm_set_routing_entry(struct kvm *kvm,
 		e->irqchip.irqchip = ue->u.irqchip.irqchip;
 		e->irqchip.pin = ue->u.irqchip.pin;
 
-		if (e->irqchip.pin >= KVM_IRQCHIP_NUM_PINS)
+		if (e->irqchip.pin >= KVM_IRQCHIP_NUM_PINS ||
+		    e->irqchip.irqchip >= KVM_NR_IRQCHIPS)
 			return -EINVAL;
 
 		return 0;
diff --git a/arch/powerpc/kvm/mpic.c b/arch/powerpc/kvm/mpic.c
index 3070f36d9fb8..fb5f9e65e02e 100644
--- a/arch/powerpc/kvm/mpic.c
+++ b/arch/powerpc/kvm/mpic.c
@@ -1833,7 +1833,8 @@ int kvm_set_routing_entry(struct kvm *kvm,
 		e->set = mpic_set_irq;
 		e->irqchip.irqchip = ue->u.irqchip.irqchip;
 		e->irqchip.pin = ue->u.irqchip.pin;
-		if (e->irqchip.pin >= KVM_IRQCHIP_NUM_PINS)
+		if (e->irqchip.pin >= KVM_IRQCHIP_NUM_PINS ||
+		    e->irqchip.irqchip >= KVM_NR_IRQCHIPS)
 			goto out;
 		break;
 	case KVM_IRQ_ROUTING_MSI:
-- 
2.20.1
