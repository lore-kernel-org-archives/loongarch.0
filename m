Received: from mta0.migadu.com (out-51.mta0.migadu.com [91.218.175.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7257440D588
	for <loongarch@lists.linux.dev>; Wed, 14 Oct 2026 05:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791955810; cv=none; b=jwapx3zOgmx2qCkfTCeYLlX+2QnC6VhC5tHSoBIwdlyXLJR53N+hSeEnLAlNl2GqPTtxTh7ur1GGi+CVi9s1f2apYIOflc3e5jYvMCjqRrNU0NFNKslq5kAYT+qBRSbBrd9IsRQQctlrYIQ4UVL418eVYM5wz7IkvCJr7vugchk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791955810; c=relaxed/simple;
	bh=6Uyp1PLrUQMqMWncjjA0jSGIUkQF62QWUIVeOVITndM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rUQ5ACnZ8hERZkfJUnihbRDzbQkvJq8wR5e+yROBWqQmqpFbGP7YcLMtpIwYMcILjKTyagkDdATryOONkzWjkadFWuiB+Cmz65IeqvDKp4m5vyjvgnJ3W30wY96CT51wsLVOzxl2vu4Ui228SAKRM8uWzHXrkPxzJqDBIMf0gas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=j6WZWvpg; arc=none smtp.client-ip=91.218.175.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="j6WZWvpg"
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=6Uyp1PLrUQMqMWncjjA0jSGIUkQF62QWUIVeOVITndM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791955807; v=1; x=1792560607;
 b=j6WZWvpgeb2wyWSanhijLvoDMIN2elu1ElewO8yNcyWkqhd448WpmWbSajyhIn6cjZ10h/nI
 EKwiGAGpKcPi0W378s8MIp1bv/QLV1bMo2CLHt2JzGHzvGfKuzWb52nLL9LnTyY89gq3f28rcKN
 VpwwxR/hYAZfDmCy5/Yzvn9w=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id ebde0d6083572c2c;
	Wed, 14 Oct 2026 05:30:06 +0000
X-Mizu-Trace-ID: ebde0d6083572c2c
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
Subject: [PATCH v3 3/3] LoongArch: KVM: Reject repeated PCH-PIC CTRL_INIT
Date: Wed, 14 Oct 2026 13:29:33 +0800
Message-ID: <20261014052933.723303-4-cui.tao@linux.dev>
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

KVM_DEV_LOONGARCH_PCH_PIC_CTRL_INIT has no guard against repeated
invocation: every call overwrites pch_pic_base and registers the same
kvm_io_device on the MMIO bus at the new address, while
kvm_pch_pic_destroy() unregisters only one bus range.  After a repeated
init, MMIO to the stale ranges computes its register offset against the
new base and silently reads 0 / drops writes, and the leftover bus
entries persist until the VM is destroyed.

Reject repeated initialization with -EEXIST, using the initialized
state of the kvm_io_device as the indicator.  The MMIO base is only
committed after a successful bus registration, and the real
registration error is propagated instead of being replaced with
-EFAULT.

Fixes: d206d9514873 ("LoongArch: KVM: Add PCHPIC user mode read and write functions")
Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 arch/loongarch/kvm/intc/pch_pic.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/kvm/intc/pch_pic.c b/arch/loongarch/kvm/intc/pch_pic.c
index 51e4a6a39dc0..7979466de729 100644
--- a/arch/loongarch/kvm/intc/pch_pic.c
+++ b/arch/loongarch/kvm/intc/pch_pic.c
@@ -281,16 +281,22 @@ static int kvm_pch_pic_init(struct kvm_device *dev, u64 addr)
 	struct kvm_io_device *device;
 	struct loongarch_pch_pic *s = dev->kvm->arch.pch_pic;
 
-	s->pch_pic_base = addr;
 	device = &s->device;
+	mutex_lock(&kvm->slots_lock);
+	if (s->device.ops) {
+		ret = -EEXIST;
+		goto out;
+	}
 	/* init device by pch pic writing and reading ops */
 	kvm_iodevice_init(device, &kvm_pch_pic_ops);
-	mutex_lock(&kvm->slots_lock);
 	/* register pch pic device */
 	ret = kvm_io_bus_register_dev(kvm, KVM_MMIO_BUS, addr, PCH_PIC_SIZE, device);
+	if (!ret)
+		s->pch_pic_base = addr;
+out:
 	mutex_unlock(&kvm->slots_lock);
 
-	return (ret < 0) ? -EFAULT : 0;
+	return ret;
 }
 
 /* used by user space to get or set pch pic registers */
-- 
2.43.0

