Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99451BF3C
	for <loongarch@lists.linux.dev>; Fri, 16 Feb 2024 09:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.28.160.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708076295; cv=none; b=R9IIulp0+ZUmjPBYZ1hd2ZH96M+BILCxgJ2IB3oiUWL25bcy2/JskF0IzHEZEXP9RInNtr7dsjtwaoQ1+abrl5O2DlTBZjRDj1YaO2RO2NG7EXwmJT2CHalKJZkcxLb9UJMZnRThgUXeU0cYVVPxr3/SvtOU/dSTSnerCGZFe+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708076295; c=relaxed/simple;
	bh=rEiWf82DA18Wx2w8gv0lu+0/shLFZ5W8HKb5RPqBJ7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=imit825Hl8dfU7URO/7isY6f3AZCsO9LfYFQqfbJhOsTq0jBznyTsPhHJacIRy4LdCpDRGmOk5y711UgTVUBM4JSo6iYAdUrdeYcQASlZRJxcbmNzCx82YJmpMycx+Vy68MgtCuifdFU/uJW57S0pqrpJl8qKNX82I0F64Rhht8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xen0n.name; spf=pass smtp.mailfrom=xen0n.name; dkim=pass (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b=pTrLmwBK; arc=none smtp.client-ip=115.28.160.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xen0n.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xen0n.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b="pTrLmwBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1708076291; bh=rEiWf82DA18Wx2w8gv0lu+0/shLFZ5W8HKb5RPqBJ7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pTrLmwBKY5FMRgpMJJ/RZ1TDW9MvxnohZrjBSKIT+aNui7lLW9PmTFV7CQs93mMjX
	 Me1+9Qf7l0KpD+BzrX+11EuiVSnbcL9pNarzKfLvn3yX+y6utgNThy3Yowy4W0L9Js
	 qtcy5HAk8cVmrLOuwG7XpPgStPEs85sYwW4Vr1Io=
Received: from ld50.lan (unknown [IPv6:240e:388:8d00:6500:cda4:aa27:b0f6:1748])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C9BE660187;
	Fri, 16 Feb 2024 17:38:11 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH RESEND for-6.8 v3 2/3] LoongArch: KVM: Rename _kvm_get_cpucfg to _kvm_get_cpucfg_mask
Date: Fri, 16 Feb 2024 17:37:58 +0800
Message-ID: <20240216093759.3038760-3-kernel@xen0n.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240216093759.3038760-1-kernel@xen0n.name>
References: <20240216093759.3038760-1-kernel@xen0n.name>
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
index 124cd7a75061..e5acd4c08071 100644
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

