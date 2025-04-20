Received: from outbound.pv.icloud.com (p-west1-cluster5-host4-snip4-1.eps.apple.com [57.103.66.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF085C96
	for <loongarch@lists.linux.dev>; Sun, 20 Apr 2025 14:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745159083; cv=none; b=fjLXsAYCmy0q4tC0C/05vPIMaP2VWYPqfWzFcnZFb8cctcSt71HvtJzBdvwZx3xE8puRp41PjbXbO4FNazt5yt5b7cZyzcFDX/R6ZYd43dUUxl14nHpGMDhvQM0zubUkxZMNEnTQlItRzJmdPdeIyAVzCRYrU4JfmsusG7pdWeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745159083; c=relaxed/simple;
	bh=C7oHjwBFQPcC5W8X662UjLV6BfkP4JZLsO6qkF2LO5I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T60bvsqrvxRcj3ooQv68MPO45LN8XaKo4Imp5Xh/xU32T9IOyZbZWzaUwSZnJlutIVqB6cNYwop0KmKASQyzKEzkRq+6UEWeXeJLdWeLtbnMK1E9uL5iS3UO9tna6RvtUOsCm8BGD5u2pHFoKk0qwHVsww1bEAFkSVuar6gr9OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=taHIXa0G; arc=none smtp.client-ip=57.103.66.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="taHIXa0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=SLL53Zyrzf/XGPI8J2sDrnNWqwFR43iPnrLdrzXb5hY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:x-icloud-hme;
	b=taHIXa0GjkN/gisTDtEOUdA2oMNKqVYKWCWXgwgneRuvSvaXZnmphoG4JjHv95m7w
	 2bzG4MwdVu/koEqcEIWsVfwqGoByzpxZrWZ/Ruh9MDqyVDA5IyRH7i58tmyOILQRJn
	 z6fcQ8bqdMTTUJFWH9+t31jGUzs04ky/MHaAZ1woCVlTwTjq9y0DniFPlRw/Cfh+RF
	 rjtQNitJgtCH8EOzw7Q7GfL7TSsF+vKNSb2MkmwfTvFdEErpen029GcWKVNZMWmRDM
	 Ez4/IuzBqEbqBhgyVbwde2ayESt6FLclxJsFcYl6biLIVwc3VzTfGf5qR6cRtI9dFv
	 F5Cl6ufRaP4QA==
Received: from localhost.localdomain (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id CFE43180009C;
	Sun, 20 Apr 2025 14:24:37 +0000 (UTC)
From: Yulong Han <wheatfox17@icloud.com>
To: zhaotianrui@loongson.cn
Cc: loongarch@lists.linux.dev,
	Yulong Han <wheatfox17@icloud.com>
Subject: [PATCH] LoongArch: Fixed multiple typos of KVM code
Date: Sun, 20 Apr 2025 22:22:09 +0800
Message-Id: <20250420142208.2252280-1-wheatfox17@icloud.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CMo66aeNh-HOB2qtibKmSPWzgphIhy4O
X-Proofpoint-GUID: CMo66aeNh-HOB2qtibKmSPWzgphIhy4O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_06,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1011 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2504200118

Fixed multiple typos inside arch/loongarch/kvm.

Signed-off-by: Yulong Han <wheatfox17@icloud.com>
---
 arch/loongarch/kvm/intc/ipi.c | 4 ++--
 arch/loongarch/kvm/main.c     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/kvm/intc/ipi.c b/arch/loongarch/kvm/intc/ipi.c
index 93f4acd44..fe734dc06 100644
--- a/arch/loongarch/kvm/intc/ipi.c
+++ b/arch/loongarch/kvm/intc/ipi.c
@@ -111,7 +111,7 @@ static int send_ipi_data(struct kvm_vcpu *vcpu, gpa_t addr, uint64_t data)
 		ret = kvm_io_bus_read(vcpu, KVM_IOCSR_BUS, addr, sizeof(val), &val);
 		srcu_read_unlock(&vcpu->kvm->srcu, idx);
 		if (unlikely(ret)) {
-			kvm_err("%s: : read date from addr %llx failed\n", __func__, addr);
+			kvm_err("%s: : read data from addr %llx failed\n", __func__, addr);
 			return ret;
 		}
 		/* Construct the mask by scanning the bit 27-30 */
@@ -127,7 +127,7 @@ static int send_ipi_data(struct kvm_vcpu *vcpu, gpa_t addr, uint64_t data)
 	ret = kvm_io_bus_write(vcpu, KVM_IOCSR_BUS, addr, sizeof(val), &val);
 	srcu_read_unlock(&vcpu->kvm->srcu, idx);
 	if (unlikely(ret))
-		kvm_err("%s: : write date to addr %llx failed\n", __func__, addr);
+		kvm_err("%s: : write data to addr %llx failed\n", __func__, addr);
 
 	return ret;
 }
diff --git a/arch/loongarch/kvm/main.c b/arch/loongarch/kvm/main.c
index d165cd38c..80ea63d46 100644
--- a/arch/loongarch/kvm/main.c
+++ b/arch/loongarch/kvm/main.c
@@ -296,10 +296,10 @@ int kvm_arch_enable_virtualization_cpu(void)
 	/*
 	 * Enable virtualization features granting guest direct control of
 	 * certain features:
-	 * GCI=2:       Trap on init or unimplement cache instruction.
+	 * GCI=2:       Trap on init or unimplemented cache instruction.
 	 * TORU=0:      Trap on Root Unimplement.
 	 * CACTRL=1:    Root control cache.
-	 * TOP=0:       Trap on Previlege.
+	 * TOP=0:       Trap on Privilege.
 	 * TOE=0:       Trap on Exception.
 	 * TIT=0:       Trap on Timer.
 	 */
-- 
2.39.5

