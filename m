Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2731617F8
	for <loongarch@lists.linux.dev>; Tue, 18 Jun 2024 01:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718672421; cv=none; b=CkFTcpOel+20O6+At6oHDaiyJiiuPl0hShtx3tCA4jFxKRiiZcbx3T7Or8oO/fIoRHQQ4oX8zr3A2sIiUWg5jcV3PUHQt4GRj7/GA7OZHA0gGtgP1FZxKBrLi4P6W/A4V3UXizrB3FJyZKExG4AsChA3V/kCzbxjUpVGQrf8xtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718672421; c=relaxed/simple;
	bh=mDrq0T+HQM3bOhkSSpMTNr1o8Cbl6azQmUqFgfTlp/0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oFChWNiWnw5NPRCizqkQi5f5dR6eid5xTHsmXQl1+yJyu1SNUHWM/KM+wrhmiFv6bodkS8kP4MT7BWk9WeREqiJR4OomNhiMemImfKnOfL3TXgFas8mM+TNmmsgr+P///qNKZuSturw2CUPZt2fRUY6K3ZbIsmBD/9Ha1JukkdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=aVGAncAW; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="aVGAncAW"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1718672415; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=PbMmDwZAuZi/KwewmWBdmgTN9+o61oCioR4xBXdC2R4=;
	b=aVGAncAW1RjefgK9UKRtkyzBOJUTmiUISWwM9YOeNw/CjDffC9K4TFg8CPXkcozjLUvp020Tcl6GIWOcnVAeVejqtBxFknzKoWgE4qepX/lmdbZkYKOosthfG/0zvQyS+qGNwtFFBQ0BCn/ERLS+pjifN4u98PUSS9oAngaEnCM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045075189;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0W8hk9QZ_1718672414;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0W8hk9QZ_1718672414)
          by smtp.aliyun-inc.com;
          Tue, 18 Jun 2024 09:00:15 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: zhaotianrui@loongson.cn,
	maobibo@loongson.cn,
	chenhuacai@kernel.org
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] LoongArch: KVM: Remove unneeded semicolon
Date: Tue, 18 Jun 2024 09:00:13 +0800
Message-Id: <20240618010013.66332-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

./arch/loongarch/kvm/exit.c:764:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9343
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 arch/loongarch/kvm/exit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kvm/exit.c b/arch/loongarch/kvm/exit.c
index c86e099af5ca..a68573e091c0 100644
--- a/arch/loongarch/kvm/exit.c
+++ b/arch/loongarch/kvm/exit.c
@@ -761,7 +761,7 @@ static void kvm_handle_service(struct kvm_vcpu *vcpu)
 	default:
 		ret = KVM_HCALL_INVALID_CODE;
 		break;
-	};
+	}
 
 	kvm_write_reg(vcpu, LOONGARCH_GPR_A0, ret);
 }
-- 
2.20.1.7.g153144c

