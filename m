Received: from mta0.migadu.com (out-40.mta0.migadu.com [91.218.175.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B472D94B5
	for <loongarch@lists.linux.dev>; Wed, 14 Oct 2026 05:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791955805; cv=none; b=UaJKRZn6YlheaD+AZbXXmRZJgspAxc2YwOfUP7bE/feUxJh973DiB6wY5Z4zxUpYtA75yCityK5r4/AEL5amGXtsRCVT4fris8nWwEbFjZTNu4Z7N1ULAszQdZC1ywR5GWeOY6Q2+U04zqSSGUfOVDKT5DD46jZwoeqBEf/Mb0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791955805; c=relaxed/simple;
	bh=+satW2wovK5/sccsFx3tJk63vH23Jrh2NuQe+3IpqxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CH9lik9/7tQpdiG+ivXj8sgLg+IkUqkuKk+fMBIPxr4fQaT5RNVqfQO/vpLGutcmqM6WzJ1vkzq9d7IDWhOK0nW2Z/TMpBJuKQeN1HHe2ShyNN9ml3QiCBOZN+Sr1UjdkUdAgFc77R3HECi9DZ2Hpb2kY3TYmRbKdnfjiPpjJjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OvoPRAFj; arc=none smtp.client-ip=91.218.175.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OvoPRAFj"
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=+satW2wovK5/sccsFx3tJk63vH23Jrh2NuQe+3IpqxU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791955802; v=1; x=1792560602;
 b=OvoPRAFj5J283EwSEVHUCPgi92jvkYM3RGFePFc+EhH3lGQI8fVaH5ctrUNDn7wTbff1cM1F
 BXmLkFLlmo3mLo64AfC1FYVV1ZhY+XfxC1ffom2Pa60y7Y17ebflvQDbG6dfcTNwjDdCN691jqR
 3oPKTNoU8G3RQT0Eqgby2zo4=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id d931a2ea11dc892d;
	Wed, 14 Oct 2026 05:30:01 +0000
X-Mizu-Trace-ID: d931a2ea11dc892d
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: chenhuacai@kernel.org,
	maobibo@loongson.cn,
	gaosong@loongson.cn,
	zhaotianrui@loongson.cn
Cc: loongarch@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@xen0n.name,
	nagachaithanya9911@gmail.com,
	cui.tao@linux.dev,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH v3 2/3] LoongArch: KVM: Propagate real error code in kvm_pch_pic_create
Date: Wed, 14 Oct 2026 13:29:32 +0800
Message-ID: <20261014052933.723303-3-cui.tao@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014052933.723303-1-cui.tao@linux.dev>
References: <20261014052933.723303-1-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Cui <cuitao@kylinos.cn>

kvm_pch_pic_create() replaces the real error of
kvm_setup_default_irq_routing() with a fixed -ENOMEM.  Return the
actual code, as kvm_eiointc_create() already does; the kvm_ipi_create()
case is fixed separately by "Return the actual error code in
kvm_ipi_create()" (Chaithanya Lagisetty).

Fixes: e785dfacf7e7 ("LoongArch: KVM: Add PCHPIC device support")
Signed-off-by: Tao Cui <cuitao@kylinos.cn>
Reviewed-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/intc/pch_pic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kvm/intc/pch_pic.c b/arch/loongarch/kvm/intc/pch_pic.c
index dab2d3f1b8f6..51e4a6a39dc0 100644
--- a/arch/loongarch/kvm/intc/pch_pic.c
+++ b/arch/loongarch/kvm/intc/pch_pic.c
@@ -444,7 +444,7 @@ static int kvm_pch_pic_create(struct kvm_device *dev, u32 type)
 
 	ret = kvm_setup_default_irq_routing(kvm);
 	if (ret)
-		return -ENOMEM;
+		return ret;
 
 	s = kzalloc_obj(struct loongarch_pch_pic);
 	if (!s)
-- 
2.43.0

