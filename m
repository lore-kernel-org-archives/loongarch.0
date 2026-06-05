Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3F438C41B
	for <loongarch@lists.linux.dev>; Fri,  5 Jun 2026 08:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780648303; cv=none; b=m7aFlv5O+HkHLzY7TKwD7pp76jPgSWpCUWH3EfLv6uuQEW05gl27+gd6xil73SK1gNWtc8BHasmmY4Q00JYddQ8+Gnofe1t7S4GQhuRqg+Qez8VKd41T+miCUWmo385kMFZn6PdLTqV/1+lvvZ6qKJuU/Jtl7HpooizCrflrfQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780648303; c=relaxed/simple;
	bh=fMZtIWme5b7xJuiONLfTlChtrx+lMbt1bP2+xkY0Rlc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o6hxMi/z8CzbEjq+qkvPhj/CPYG8r5oHaymclaExrCkwRTEvsxwSiO44IUjhiGYhcNHNWQVnwdbukWX63eDOnOPTgt7EoZ3bUwRjS/iSVuWvFYtbUy3fmcJJGl5/pOk/PPBLpfrcWMctbS79H1B9ClXjZUReB7xmpwPZfyEnluY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=QZd1YsuZ; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QZd1YsuZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Eg
	mdkVQuPff3keShyxNiPT4E0wXBaHgzYCJbQUlyoWc=; b=QZd1YsuZgKM37TmqGA
	F/hMCfY7X38ya/KukpdlmQumz8CE0bXlcwLg42fFZLZ0/BO6Pv87Qe8nopnIHxGN
	0icpd73mFDHnqGMe4w6GkBZwnlNUxigtKazFI5KNiguzB9rvpYUZhLf+070hw3cd
	4Rqkvl24DAMO+aIbEgfAWFIhI=
Received: from zengchi (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgBXrvVRiSJqTU1+Ag--.49169S2;
	Fri, 05 Jun 2026 16:31:14 +0800 (CST)
From: Zeng Chi <zeng_chi911@163.com>
To: zeng_chi911@163.com,
	zhaotianrui@loongson.cn,
	maobibo@loongson.cn,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	kees@kernel.org,
	maqianga@uniontech.com,
	gaosong@loongson.cn
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zengchi@kylinos.cn
Subject: [PTACH v3] LoongArch: KVM: Add missing slots_lock for IO bus device register/unregister
Date: Fri,  5 Jun 2026 16:31:08 +0800
Message-Id: <20260605083108.2534481-1-zeng_chi911@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260525092633.1706633-1-zeng_chi911@163.com>
References: <20260525092633.1706633-1-zeng_chi911@163.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgBXrvVRiSJqTU1+Ag--.49169S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFWfuF13Zr1fCr43Kry5twb_yoW5CrW5pF
	45ua4qkr4rWrnrXrZ2vF1DWF4UCan2gw1furyUuFW7GF4DtryrtF1kAFyUWF1qkayruFW0
	qF15Jw1Yv3WUAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUUhL8UUUUU=
X-CM-SenderInfo: 52hqws5fklmiqr6rljoofrz/xtbCwBKZVWoiiVKlegAA3S

From: Zeng Chi <zengchi@kylinos.cn>

kvm_io_bus_register_dev() and kvm_io_bus_unregister_dev() should be
called under kvm->slots_lock. The unregister calls in ipi.c, pch_pic.c
and eiointc.c were missing this protection. Add it to match the
register side.

Signed-off-by: Zeng Chi <zengchi@kylinos.cn>
Reviewed-by: Bibo Mao <maobibo@loongson.cn>
---
v3: fix subject prefix (drop "net", LoongArch KVM does not go through the
    net tree); add Reviewed-by from Bibo Mao. No code change.
v2: extend the fix from the EIOINTC virtual extension device registration
    (v1) to the ipi.c / pch_pic.c / eiointc.c destroy paths as well.
---
 arch/loongarch/kvm/intc/eiointc.c | 6 ++++++
 arch/loongarch/kvm/intc/ipi.c     | 2 ++
 arch/loongarch/kvm/intc/pch_pic.c | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/arch/loongarch/kvm/intc/eiointc.c b/arch/loongarch/kvm/intc/eiointc.c
index 2ab7fafa86d5..2b14485d14a7 100644
--- a/arch/loongarch/kvm/intc/eiointc.c
+++ b/arch/loongarch/kvm/intc/eiointc.c
@@ -645,10 +645,14 @@ static int kvm_eiointc_create(struct kvm_device *dev, u32 type)
 
 	device = &s->device_vext;
 	kvm_iodevice_init(device, &kvm_eiointc_virt_ops);
+	mutex_lock(&kvm->slots_lock);
 	ret = kvm_io_bus_register_dev(kvm, KVM_IOCSR_BUS,
 			EIOINTC_VIRT_BASE, EIOINTC_VIRT_SIZE, device);
+	mutex_unlock(&kvm->slots_lock);
 	if (ret < 0) {
+		mutex_lock(&kvm->slots_lock);
 		kvm_io_bus_unregister_dev(kvm, KVM_IOCSR_BUS, &s->device);
+		mutex_unlock(&kvm->slots_lock);
 		kfree(s);
 		return ret;
 	}
@@ -667,8 +671,10 @@ static void kvm_eiointc_destroy(struct kvm_device *dev)
 
 	kvm = dev->kvm;
 	eiointc = kvm->arch.eiointc;
+	mutex_lock(&kvm->slots_lock);
 	kvm_io_bus_unregister_dev(kvm, KVM_IOCSR_BUS, &eiointc->device);
 	kvm_io_bus_unregister_dev(kvm, KVM_IOCSR_BUS, &eiointc->device_vext);
+	mutex_unlock(&kvm->slots_lock);
 	kfree(eiointc);
 	kfree(dev);
 }
diff --git a/arch/loongarch/kvm/intc/ipi.c b/arch/loongarch/kvm/intc/ipi.c
index 1f6ebbd0af5c..4fa0897d7bdb 100644
--- a/arch/loongarch/kvm/intc/ipi.c
+++ b/arch/loongarch/kvm/intc/ipi.c
@@ -447,7 +447,9 @@ static void kvm_ipi_destroy(struct kvm_device *dev)
 
 	kvm = dev->kvm;
 	ipi = kvm->arch.ipi;
+	mutex_lock(&kvm->slots_lock);
 	kvm_io_bus_unregister_dev(kvm, KVM_IOCSR_BUS, &ipi->device);
+	mutex_unlock(&kvm->slots_lock);
 	kfree(ipi);
 	kfree(dev);
 }
diff --git a/arch/loongarch/kvm/intc/pch_pic.c b/arch/loongarch/kvm/intc/pch_pic.c
index aa0ed59ae8cf..175a630aceb4 100644
--- a/arch/loongarch/kvm/intc/pch_pic.c
+++ b/arch/loongarch/kvm/intc/pch_pic.c
@@ -481,7 +481,9 @@ static void kvm_pch_pic_destroy(struct kvm_device *dev)
 	kvm = dev->kvm;
 	s = kvm->arch.pch_pic;
 	/* unregister pch pic device and free it's memory */
+	mutex_lock(&kvm->slots_lock);
 	kvm_io_bus_unregister_dev(kvm, KVM_MMIO_BUS, &s->device);
+	mutex_unlock(&kvm->slots_lock);
 	kfree(s);
 	kfree(dev);
 }
-- 
2.25.1

