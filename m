Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF15F18A6CF
	for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 01:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776130420; cv=none; b=cMWRAP7cEGmcZ9oZ0vEDbzm53mnUah4cxhV/TMDgQlHJP7q6vJ31lzpj5zVjuCgxjg8l8Ef8KoKonaAwhIXk5EngTdi5g6jiSQWqJONqAE3cv/cBXM8bjb91s+lFVddn5AYrGwbyf4osfjCTNKHcKyeCZQKsSncx2LmggqjChjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776130420; c=relaxed/simple;
	bh=R7JyYHPOAgdrilG23EGipZGEBkvZyfudyyRNIDfttHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qtoOunrujIYuOZT0jsophOVmugHcxzU4Kg5z1u4EXRGAHoi8KGPOnjQq/EKEZ+/VOA3/cmp598HNFmT/Stn3C1z9tyF3/SMHsFO9gd/FgCJ8znfD2IGeBzyWvqFb03uDPt/fD677yLtrH84UESVrf6+BSHNoOo4takxJUqJ5IN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f1a47a6e37a111f1aa26b74ffac11d73-20260414
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_EXISTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD
	CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD
	ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e2c4543b-be83-4e8e-957c-aba74641d16d,IP:10,
	URL:0,TC:0,Content:0,EDM:-20,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-15
X-CID-INFO: VERSION:1.3.12,REQID:e2c4543b-be83-4e8e-957c-aba74641d16d,IP:10,UR
	L:0,TC:0,Content:0,EDM:-20,RT:0,SF:-5,FILE:0,BULK:0,RULE:EDM_GE969F26,ACTI
	ON:release,TS:-15
X-CID-META: VersionHash:e7bac3a,CLOUDID:c4610dfc3584d710e2266116b3a3f884,BulkI
	D:260414093333ZDLHVRIS,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|102|127|
	898,TC:nil,Content:0|15|50,EDM:1|19,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,Q
	S:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,
	ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_AEC,TF_CID_SPAM_FAS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f1a47a6e37a111f1aa26b74ffac11d73-20260414
X-User: cuitao@kylinos.cn
Received: from ctao-book.. [(183.242.174.21)] by mailgw.kylinos.cn
	(envelope-from <cuitao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 974189430; Tue, 14 Apr 2026 09:33:30 +0800
From: cuitao <cuitao@kylinos.cn>
To: zhaotianrui@loongson.cn,
	maobibo@loongson.cn,
	chenhuacai@kernel.org,
	loongarch@lists.linux.dev
Cc: kernel@xen0n.name,
	cuitao <cuitao@kylinos.cn>
Subject: [PATCH] LoongArch: KVM: Fix data race in kvm_ipi_regs_access
Date: Tue, 14 Apr 2026 09:33:16 +0800
Message-ID: <20260414013316.306075-1-cuitao@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add spin_lock protection around ipi_state field accesses in
kvm_ipi_regs_access(). get_user/put_user are performed
outside the lock since they may sleep on page faults.

Signed-off-by: cuitao <cuitao@kylinos.cn>
---
 arch/loongarch/kvm/intc/ipi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/loongarch/kvm/intc/ipi.c b/arch/loongarch/kvm/intc/ipi.c
index 1f6ebbd0af5c..e6a4a461a0c8 100644
--- a/arch/loongarch/kvm/intc/ipi.c
+++ b/arch/loongarch/kvm/intc/ipi.c
@@ -348,18 +348,26 @@ static int kvm_ipi_regs_access(struct kvm_device *dev,
 		if (len == 4) {
 			if (get_user(val, (uint32_t __user *)attr->addr))
 				return -EFAULT;
+			spin_lock(&vcpu->arch.ipi_state.lock);
 			*(uint32_t *)p = (uint32_t)val;
+			spin_unlock(&vcpu->arch.ipi_state.lock);
 		} else if (len == 8) {
 			if (get_user(val, (uint64_t __user *)attr->addr))
 				return -EFAULT;
+			spin_lock(&vcpu->arch.ipi_state.lock);
 			*(uint64_t *)p = val;
+			spin_unlock(&vcpu->arch.ipi_state.lock);
 		}
 	} else {
 		if (len == 4) {
+			spin_lock(&vcpu->arch.ipi_state.lock);
 			val = *(uint32_t *)p;
+			spin_unlock(&vcpu->arch.ipi_state.lock);
 			return put_user(val, (uint32_t __user *)attr->addr);
 		} else if (len == 8) {
+			spin_lock(&vcpu->arch.ipi_state.lock);
 			val = *(uint64_t *)p;
+			spin_unlock(&vcpu->arch.ipi_state.lock);
 			return put_user(val, (uint64_t __user *)attr->addr);
 		}
 	}
-- 
2.43.0

