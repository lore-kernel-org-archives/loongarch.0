Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DC013AA36
	for <loongarch@lists.linux.dev>; Thu, 25 Jul 2024 13:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721915358; cv=none; b=O22RZ3+mqXV1IzFJML8Nk9glVqvDDV9l1QXthj84vMvpttIBPEMZCSQLTyOmm52b6XNPZQ+ZmR531tvqwPFK4OhDTKBkwqU4Shnv0Nd3szFlCnToFSUrIbnu7LKhIemXYgR4NtYXCT/o3VrV2EuBJuyvtSIxpP9wnNrv16f53Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721915358; c=relaxed/simple;
	bh=mlnvQkZF8haoVtd03wlfeODswdiv6cYjuNDKaho37bU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DHQ7mgF1cCNylKXcN92eE7pywA8pFCLCsEWNbGMLKWQX+eekR58DBnRMm/DUa1ebhnmVjtsWgfUuT/QGQxoritGDQhHBz/mlRZ53vedQlCRk2JH6xAq9IZfBp8Dkpysa9sASQOcTmEn8v8LN1Z0YiVv3uO18iAcBUhWCs0Qg9Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
X-QQ-mid: bizesmtpsz10t1721915305t6fofr
X-QQ-Originating-IP: I9iGX2cphYkxFE07t+CqcFR1Z6bXblmwSD3nkC9paCk=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Jul 2024 21:48:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 138238057667816493
From: Dandan Zhang <zhangdandan@uniontech.com>
To: zhaotianrui@loongson.cn,
	maobibo@loongson.cn,
	chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangyuli@uniontech.com,
	Dandan Zhang <zhangdandan@uniontech.com>,
	Wentao Guan <guanwentao@uniontech.com>
Subject: [PATCH] KVM: Loongarch: Remove undefined a6 argument comment for kvm_hypercall
Date: Thu, 25 Jul 2024 21:48:20 +0800
Message-ID: <6D5128458C9E19E4+20240725134820.55817-1-zhangdandan@uniontech.com>
X-Mailer: git-send-email 2.43.4
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-0

The kvm_hypercall set for LoongArch is limited to a1-a5.
The mention of a6 in the comment is undefined that needs to be rectified.

Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Dandan Zhang <zhangdandan@uniontech.com>
---
 arch/loongarch/include/asm/kvm_para.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/include/asm/kvm_para.h b/arch/loongarch/include/asm/kvm_para.h
index 335fb86778e2..43ec61589e6c 100644
--- a/arch/loongarch/include/asm/kvm_para.h
+++ b/arch/loongarch/include/asm/kvm_para.h
@@ -39,9 +39,9 @@ struct kvm_steal_time {
  * Hypercall interface for KVM hypervisor
  *
  * a0: function identifier
- * a1-a6: args
+ * a1-a5: args
  * Return value will be placed in a0.
- * Up to 6 arguments are passed in a1, a2, a3, a4, a5, a6.
+ * Up to 5 arguments are passed in a1, a2, a3, a4, a5.
  */
 static __always_inline long kvm_hypercall0(u64 fid)
 {
-- 
2.43.4

