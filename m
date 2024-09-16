Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A93750284
	for <loongarch@lists.linux.dev>; Mon, 16 Sep 2024 09:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726478793; cv=none; b=Lcrc73rNNgfeUsrK0xTGhPdwTE2o7LwYdf70RBopQ96mlfFLONIgiZYu6WG8UOFBlnzTlaXeHwFXt0Pnhk8Y46oypSJdU+Ha4r1O0+I5zmZD9EOhr8ODsCVjvRgzxoyRdnAI4Xboqv1/DBtPdMp7XVhcgCsV4JqfLlxX6o8oMo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726478793; c=relaxed/simple;
	bh=aQkPuDpvwEae30GhlJo8cTrxC0ZYLwt1xKZE9oUNego=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aVGa5TbExdIcncUhooGKKjvnIddeWIS6Sl0V5Lg7GUt9i6kt9wykc0ShYhtXHm2ax+51Vk0NpaRYDYJzIcfmh3eQymqr5gF1o7Of/vWMVzKSOpadomxcgfucdTQ+1SslQfnjqiqNVINHzbj7+efHiwMgAfxPSV9FP+OqBmyZUv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=JMKHr7WJ; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="JMKHr7WJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1726478765;
	bh=5C0HaDNv0z40Dq3FSjo9w53WFVCZuvNtTiGz93K91R0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=JMKHr7WJkQEyAPK4IDKU7NWJ4Xjbq3wOTau5hQzP+CDoQfQRwr+DFMzXswqQaVMK0
	 DaQg5ADY6VUCMAzgmFG1S0dNHIcNdWQFvsRVHHeOom5Ls/bUYmiaaJwc3pGWUuv9LB
	 ttHCBNLnhxdAHmndJzm/stsLaH+CCWboe2UMJtnw=
X-QQ-mid: bizesmtpip3t1726478756ti9l687
X-QQ-Originating-IP: /gJoNUlmd+IboF2jL9DFoR2xzAYrz7MGcmEmwBftpMY=
Received: from avenger-OMEN-by-HP-Gaming-Lapto ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Sep 2024 17:25:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4414229508549440317
From: WangYuli <wangyuli@uniontech.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org,
	sashal@kernel.org,
	maobibo@loongson.cn,
	guanwentao@uniontech.com,
	zhangdandan@uniontech.com,
	wangyuli@uniontech.com,
	chenhuacai@loongson.cn
Cc: zhaotianrui@loongson.cn,
	kernel@xen0n.name,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.10] LoongArch: KVM: Remove undefined a6 argument comment for kvm_hypercall()
Date: Mon, 16 Sep 2024 17:25:46 +0800
Message-ID: <8EFAA3851253EB9A+20240916092546.429464-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1

From: Dandan Zhang <zhangdandan@uniontech.com>

The kvm_hypercall() set for LoongArch is limited to a1-a5. So the
mention of a6 in the comment is undefined that needs to be rectified.

Reviewed-by: Bibo Mao <maobibo@loongson.cn>
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Dandan Zhang <zhangdandan@uniontech.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/loongarch/include/asm/kvm_para.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/include/asm/kvm_para.h b/arch/loongarch/include/asm/kvm_para.h
index 4ba2312e5f8c..6d5e9b6c5714 100644
--- a/arch/loongarch/include/asm/kvm_para.h
+++ b/arch/loongarch/include/asm/kvm_para.h
@@ -28,9 +28,9 @@
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
2.43.0

