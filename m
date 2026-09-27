Received: from mta0.migadu.com (out-175.mta0.migadu.com [91.218.175.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A5B3CC324
	for <loongarch@lists.linux.dev>; Sun, 27 Sep 2026 07:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790495617; cv=none; b=NaV4APCCXTakxkd12m3ikzCWUHrLvztAs388x2Rxh3+fatZOP+Xa9uHqWYPFZeyCSJg1PUJ+iJd8u2b8AZTiDDfllztxjE4unbxfdqZLLTTZA5g2B+GjPJyP5M5PmVFKgc+sGTOfbgWpbGLvhg+xgSFXa+qX15duxyqkWgcfCmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790495617; c=relaxed/simple;
	bh=XCswxa9b/tXHdsukhzPqYOjn9XQ9Tfvmw3A9PCSdgF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RC7UDWRhe2dItGhctePCeBbNZ1M7KImdXJDOfi22hNBn4OdMUR8NHGlF6800aZo/21skteT8hHfy/oqsg7JrjSARTMXAhWyeOQUqc51g5V9+TAgzWWsFNb2TFDAKa5UwJYF14nG4+bVZtLVgt7PSMmf9F+NLoJ4TdnGpWdGHeBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iztnD04W; arc=none smtp.client-ip=91.218.175.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iztnD04W"
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=XCswxa9b/tXHdsukhzPqYOjn9XQ9Tfvmw3A9PCSdgF4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790495611; v=1; x=1791100411;
 b=iztnD04W19FWX4RUiG6R0FngmshhHxAiTIdwmkd8UO/667GqBCTRuyWBZTnatpoQ1XvTdvL6
 toQ7Fd3fNSv6AC4XatKsAu4pFj9Zv1SZ8afM5Wkqk1didvmijmiydFpIYkW6x1ChihGiZpKtiZn
 BB7be2zJBjz/HMJ1UVm6WkWo=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 2c34b2d94c18373c;
	Sun, 27 Sep 2026 07:53:31 +0000
X-Mizu-Trace-ID: 2c34b2d94c18373c
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: maobibo@loongson.cn,
	gaosong@loongson.cn,
	zhaotianrui@loongson.cn
Cc: loongarch@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	nagachaithanya9911@gmail.com,
	cui.tao@linux.dev,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH 6/6] LoongArch: KVM: Reject repeated PCH-PIC CTRL_INIT
Date: Sun, 27 Sep 2026 15:52:40 +0800
Message-ID: <20260927075240.3007947-7-cui.tao@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927075240.3007947-1-cui.tao@linux.dev>
References: <20260927075240.3007947-1-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Cui <cuitao@kylinos.cn>

KVM_DEV_LOONGARCH_PCH_PIC_CTRL_INIT has no guard against repeated
invocation: every call overwrites pch_pic_base and registers the same
kvm_io_device on the MMIO bus at the new address, while
kvm_pch_pic_destroy() unregisters only one bus range.  After a repeated
init, MMIO to the stale ranges computes its register offset against the
new base and silently reads 0 / drops writes, and the leftover bus
entries persist until the VM is destroyed.

Reject a repeated init with -EBUSY, a null address with -EINVAL, and
only set pch_pic_base after the bus registration succeeds so a failed
init does not leave the device half-initialized.  The registration
error is propagated instead of being replaced with -EFAULT.

Fixes: d206d9514873 ("LoongArch: KVM: Add PCHPIC user mode read and write functions")
Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 arch/loongarch/kvm/intc/pch_pic.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kvm/intc/pch_pic.c b/arch/loongarch/kvm/intc/pch_pic.c
index 136211f154d4..2baf9ecf0c8a 100644
--- a/arch/loongarch/kvm/intc/pch_pic.c
+++ b/arch/loongarch/kvm/intc/pch_pic.c
@@ -285,7 +285,10 @@ static int kvm_pch_pic_init(struct kvm_device *dev, u64 addr)
 	struct kvm_io_device *device;
 	struct loongarch_pch_pic *s = dev->kvm->arch.pch_pic;
 
-	s->pch_pic_base = addr;
+	if (!addr)
+		return -EINVAL;
+	if (s->pch_pic_base)
+		return -EBUSY;
 	device = &s->device;
 	/* init device by pch pic writing and reading ops */
 	kvm_iodevice_init(device, &kvm_pch_pic_ops);
@@ -293,8 +296,11 @@ static int kvm_pch_pic_init(struct kvm_device *dev, u64 addr)
 	/* register pch pic device */
 	ret = kvm_io_bus_register_dev(kvm, KVM_MMIO_BUS, addr, PCH_PIC_SIZE, device);
 	mutex_unlock(&kvm->slots_lock);
+	if (ret < 0)
+		return ret;
 
-	return (ret < 0) ? -EFAULT : 0;
+	s->pch_pic_base = addr;
+	return 0;
 }
 
 /* used by user space to get or set pch pic registers */
-- 
2.43.0

