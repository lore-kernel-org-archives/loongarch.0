Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA68229CE7
	for <loongarch@lists.linux.dev>; Mon, 26 Aug 2024 05:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724651384; cv=none; b=fifXwNormaPimMjLgT56zpsUD9R5EHZyg1T27ZsD15xGoY+QJIbthd+wNeUu265ECNgse3i70ljgEZBvKK6mG7LtpT58iDbXMVaz5X0mIVE8tH0yrGJPvFALX/mDlbNBzEU3tXfvKMlq3DmWOv8PztFYs3xDTus8/aqJkKo9HrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724651384; c=relaxed/simple;
	bh=nQVe4pkTC4GGqwvv0hQiEOdQUahpl9ZfcNGHajNVUyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nqueGipUIbGqAQ/yfSgy5IxdJ2alrIM7sYVM3GOL3+FGQzaIe91T2mG84Glq25IGmdk7Pz9YEYhKnwOm/7z7C6EJr76G1SS+G6sWYK7jYNiGDYgqorU/8VcSuYd8u+t/f+DX56c2uYbbHigU454E8JXFKieHT9fFe5pIm0KHGTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=GgAtEZAG; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="GgAtEZAG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1724651323;
	bh=LcnF3lEzDOs24/S93gLZ8vPRLn3bYdD6AON3DPimukw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=GgAtEZAGzhULzh9BYhbEAqeyiNaTyStwJA7gBgCWNDPOeoB1WO8vxVoR4SCLjpQ/U
	 6v1ZlIkzUAsrBurtcEjkEfUEhXAj9pEH9ynqECjJ5YM5kPPpdUQIpwDu4qIyOr2BN8
	 rsF2mmIlsKOSnMEGNJmOLNjX/ymqW1VyplHhCTzA=
X-QQ-mid: bizesmtp78t1724651296tfspfpab
X-QQ-Originating-IP: v1Cbbgnlqo89WuZQdgXld1WIjaie1C4oGPQIMjd/6pA=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 26 Aug 2024 13:48:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7317953918435259740
From: Dandan Zhang <zhangdandan@uniontech.com>
To: pbonzini@redhat.com,
	corbet@lwn.net,
	zhaotianrui@loongson.cn,
	maobibo@loongson.cn,
	chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	guanwentao@uniontech.com,
	wangyuli@uniontech.com,
	baimingcong@uniontech.com,
	Xianglai Li <lixianglai@loongson.cn>,
	Mingcong Bai <jeffbai@aosc.io>,
	Dandan Zhang <zhangdandan@uniontech.com>
Subject: [PATCH v2] Loongarch: KVM: Add KVM hypercalls documentation for LoongArch
Date: Mon, 26 Aug 2024 13:47:27 +0800
Message-ID: <DE6B1B9EAC9BEF4C+20240826054727.24166-1-zhangdandan@uniontech.com>
X-Mailer: git-send-email 2.43.4
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-0

From: Bibo Mao <maobibo@loongson.cn>

Add documentation topic for using pv_virt when running as a guest
on KVM hypervisor.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
Signed-off-by: Xianglai Li <lixianglai@loongson.cn>
Co-developed-by: Mingcong Bai <jeffbai@aosc.io>
Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
Link: https://lore.kernel.org/all/5c338084b1bcccc1d57dce9ddb1e7081@aosc.io/
Signed-off-by: Dandan Zhang <zhangdandan@uniontech.com>
---
 Documentation/virt/kvm/index.rst              |  1 +
 .../virt/kvm/loongarch/hypercalls.rst         | 86 +++++++++++++++++++
 Documentation/virt/kvm/loongarch/index.rst    | 10 +++
 MAINTAINERS                                   |  1 +
 4 files changed, 98 insertions(+)
 create mode 100644 Documentation/virt/kvm/loongarch/hypercalls.rst
 create mode 100644 Documentation/virt/kvm/loongarch/index.rst

diff --git a/Documentation/virt/kvm/index.rst b/Documentation/virt/kvm/index.rst
index ad13ec55ddfe..9ca5a45c2140 100644
--- a/Documentation/virt/kvm/index.rst
+++ b/Documentation/virt/kvm/index.rst
@@ -14,6 +14,7 @@ KVM
    s390/index
    ppc-pv
    x86/index
+   loongarch/index
 
    locking
    vcpu-requests
diff --git a/Documentation/virt/kvm/loongarch/hypercalls.rst b/Documentation/virt/kvm/loongarch/hypercalls.rst
new file mode 100644
index 000000000000..58168dc7166c
--- /dev/null
+++ b/Documentation/virt/kvm/loongarch/hypercalls.rst
@@ -0,0 +1,86 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===================================
+The LoongArch paravirtual interface
+===================================
+
+KVM hypercalls use the HVCL instruction with code 0x100 and the hypercall
+number is put in a0. Up to five arguments may be placed in registers a1 - a5.
+The return value is placed in v0 (an alias of a0).
+
+Source code for this interface can be found in arch/loongarch/kvm*.
+
+Querying for existence
+======================
+
+To determine if the host is running on KVM, we can utilize the cpucfg()
+function at index CPUCFG_KVM_BASE (0x40000000).
+
+The CPUCPU_KVM_BASE range, spanning from 0x40000000 to 0x400000FF, The
+CPUCPU_KVM_BASE range between 0x40000000 - 0x400000FF is marked as reserved.
+Consequently, all current and future processors will not implement any
+feature within this range.
+
+On a KVM-virtualized Linux system, a read operation on cpucfg() at index
+CPUCFG_KVM_BASE (0x40000000) returns the magic string 'KVM\0'.
+
+Once you have determined that your host is running on a paravirtualization-
+capable KVM, you may now use hypercalls as described below.
+
+KVM hypercall ABI
+=================
+
+The KVM hypercall ABI is simple, with one scratch register a0 (v0) and at most
+five generic registers (a1 - a5) used as input parameters. The FP (Floating-
+point) and vector registers are not utilized as input registers and must
+remain unmodified during a hypercall.
+
+Hypercall functions can be inlined as it only uses one scratch register.
+
+The parameters are as follows:
+
+        ========	================	================
+	Register	IN			OUT
+        ========	================	================
+	a0		function number		Return code
+	a1		1st parameter		-
+	a2		2nd parameter		-
+	a3		3rd parameter		-
+	a4		4th parameter		-
+	a5		5th parameter		-
+        ========	================	================
+
+The return codes may be one of the following:
+
+	====		=========================
+	Code		Meaning
+	====		=========================
+	0		Success
+	-1		Hypercall not implemented
+	-2		Bad Hypercall parameter
+	====		=========================
+
+KVM Hypercalls Documentation
+============================
+
+The template for each hypercall is as follows:
+
+1. Hypercall name
+2. Purpose
+
+1. KVM_HCALL_FUNC_PV_IPI
+------------------------
+
+:Purpose: Send IPIs to multiple vCPUs.
+
+- a0: KVM_HCALL_FUNC_PV_IPI
+- a1: Lower part of the bitmap for destination physical CPUIDs
+- a2: Higher part of the bitmap for destination physical CPUIDs
+- a3: The lowest physical CPUID in the bitmap
+
+The hypercall lets a guest send multiple IPIs (Inter-Process Interrupts) with
+at most 128 destinations per hypercall.The destinations are represented in a
+bitmap contained in the first two input registers (a1 and a2).
+
+Bit 0 of a1 corresponds to the physical CPUID in the third input register (a3)
+and bit 1 corresponds to the physical CPUID in a3+1 (a4), and so on.
diff --git a/Documentation/virt/kvm/loongarch/index.rst b/Documentation/virt/kvm/loongarch/index.rst
new file mode 100644
index 000000000000..83387b4c5345
--- /dev/null
+++ b/Documentation/virt/kvm/loongarch/index.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================
+KVM for LoongArch systems
+=========================
+
+.. toctree::
+   :maxdepth: 2
+
+   hypercalls.rst
diff --git a/MAINTAINERS b/MAINTAINERS
index 0c94ec0ca478..ae0fa8aa26f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12294,6 +12294,7 @@ L:	kvm@vger.kernel.org
 L:	loongarch@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/virt/kvm/kvm.git
+F:	Documentation/virt/kvm/loongarch/
 F:	arch/loongarch/include/asm/kvm*
 F:	arch/loongarch/include/uapi/asm/kvm*
 F:	arch/loongarch/kvm/
-- 
2.43.4

