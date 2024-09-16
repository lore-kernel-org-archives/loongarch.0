Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2404314659B
	for <loongarch@lists.linux.dev>; Mon, 16 Sep 2024 09:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726478962; cv=none; b=A0S9p/AlpaCu3iXcKkWwZBgtEdY8yq1TuUHRi+OS3ODDaskXRurYdTVP2F2JFOcMXFlLl3iRgthggI/j5OVgV462/Vs8GVSyZI2kN6h4Y3h7W+NHIDgWsU0QxvUvQEipZrkB/d+Y4vA0JPXNbUnJ7jklPSfgDnzbl2waZCS2AUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726478962; c=relaxed/simple;
	bh=LurvBMAZgV5vSM0HyPmLqsMnwdCNy2bUJ7ttWHTaj4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n3wZM3yaaZ+4tUQdwbri6Ai2DEvHs33wXS0YOyOIWekXY+r3T/PwNDNaVHSlE5lPlc8ZcYqI3rk+b/zMurBNQ1vhtaviQbUIrK9rP8nG318MIqjAUkZz+L3qVRTN2L5J+RDJJGJt5ESOYQnVyI0NFtP9f9JaYitfkMS6kmhtvEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=HJt+5vCG; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="HJt+5vCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1726478949;
	bh=/J9ycsKmev+JnOkYZ8ZrOJcZ2sdXEpc0VMnSBiYWn1k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=HJt+5vCGYboMfqLXq0kOzJkQ0ZblHKn2fM/FqN+6Riqm1nYMT3v/vN3c4aKk4uN9u
	 7Z7uY9maZPH7bzSVeZDVI/VFZV1yq/dGg4IzVG7PDE+CyxkM7fkE7ek/1iDE3y+1uF
	 zFti9t+/w7iGp1wEYkDNVD2fujsZ7AhzD49UNNYc=
X-QQ-mid: bizesmtpip3t1726478942tk58g1r
X-QQ-Originating-IP: +2qEEGnAhCVxuAAwv4tZUJOrInBum+BnrvEqM8e9iaw=
Received: from avenger-OMEN-by-HP-Gaming-Lapto ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Sep 2024 17:29:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13749986778819452041
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
Subject: [PATCH v2 6.10] LoongArch: KVM: Remove undefined a6 argument comment for kvm_hypercall()
Date: Mon, 16 Sep 2024 17:28:57 +0800
Message-ID: <5B13B2AF7C2779A7+20240916092857.433334-1-wangyuli@uniontech.com>
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

[ Upstream commit 494b0792d962e8efac72b3a5b6d9bcd4e6fa8cf0 ]

The kvm_hypercall() set for LoongArch is limited to a1-a5. So the
mention of a6 in the comment is undefined that needs to be rectified.

Reviewed-by: Bibo Mao <maobibo@loongson.cn>
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Dandan Zhang <zhangdandan@uniontech.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
--
Changlog:
 *v1 -> v2: Correct the commit-msg format.
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

