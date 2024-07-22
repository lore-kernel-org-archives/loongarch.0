Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0923C23DE
	for <loongarch@lists.linux.dev>; Mon, 22 Jul 2024 10:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721644063; cv=none; b=OftU2X4XYZK02Bv8NegIKEkVHzHlTNm7YnooNkla1dW21HNnHd8cDwhufpq4UZCJoCR6oSYnCbeyErDfShhC0FqqoWWIaoQ5/HNXn5zWeHUR11aW2MMcD/HR4241yPaRZsjqYMVsA684Ij7ncYe8mNXPukqXNuqhBYaIMXpipv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721644063; c=relaxed/simple;
	bh=1FRGGeU+wym2xELmubxiqoYTkV0hARifRn2Z6nZoCfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lagd4ghsPTWgIoHsxj2zyk+LjQHNetp3d9cCpX6ghMP682AZu894ta+ZABOWlYNl71XxFYSKJAmhOSagdOJKIqqDDGhyUzF0xRJoHIcGJtAXkpjTcRcfcJiYRHKBg1psQXylI3Wxa2G20MUHjoOeFHP+CX0Q0/CPx9WCGA0mhMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
X-QQ-mid: bizesmtpsz1t1721643990twg6sco
X-QQ-Originating-IP: ZQWrQ315tVoU0wN0faBAvkhf0b2ujopfRfQI60mXTkc=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Ò», 22 7ÔÂ 2024 18:26:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6738067066252403474
From: WangYuli <wangyuli@uniontech.com>
To: zhaotianrui@loongson.cn,
	maobibo@loongson.cn,
	chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pbonzini@redhat.com,
	chao.p.peng@linux.intel.com,
	WangYuli <wangyuli@uniontech.com>,
	Wentao Guan <guanwentao@uniontech.com>
Subject: [PATCH] KVM: Loongarch: remove unnecessary definition of KVM_PRIVATE_MEM_SLOTS
Date: Mon, 22 Jul 2024 18:26:24 +0800
Message-ID: <09A6BAA84F3EF573+20240722102624.293359-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.43.4
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1

"KVM_PRIVATE_MEM_SLOTS" is renamed as "KVM_INTERNAL_MEM_SLOTS".

KVM_PRIVATE_MEM_SLOTS defaults to zero, so it is not necessary to
define it in Loongarch's asm/kvm_host.h.

Link: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=bdd1c37a315bc50ab14066c4852bc8dcf070451e
Link: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=b075450868dbc0950f0942617f222eeb989cad10
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/loongarch/include/asm/kvm_host.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
index fe38f98eeff8..ce3d36a890aa 100644
--- a/arch/loongarch/include/asm/kvm_host.h
+++ b/arch/loongarch/include/asm/kvm_host.h
@@ -26,8 +26,6 @@
 
 #define KVM_MAX_VCPUS			256
 #define KVM_MAX_CPUCFG_REGS		21
-/* memory slots that does not exposed to userspace */
-#define KVM_PRIVATE_MEM_SLOTS		0
 
 #define KVM_HALT_POLL_NS_DEFAULT	500000
 #define KVM_REQ_TLB_FLUSH_GPA		KVM_ARCH_REQ(0)
-- 
2.43.4

