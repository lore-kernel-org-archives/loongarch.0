Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B03718A6CF
	for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 01:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776130305; cv=none; b=FtBeQKab8sUlVto3pq+ooJou7kTxA0O3ioiKbY8192DlNNTLs9LKViP9vfTtWGy3jOdbUcNS5WbHyyzjorYNBuFIVOa2JVfmom1oGkERU9y2wkwA8EeJKq0NnWjGXE2JVgzjRU7ON8Yj/5NzyP449MJ26w7RVYQxkjzl+QExqwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776130305; c=relaxed/simple;
	bh=BrpkMpwELP0qX8aBvX+1EzczKH3uDGlqpIBrcjIoSBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j7q2yqIvZOgpwdPfHRJvSyDOaaiYP9316YhnoXOLcov5rjcpKbAOykAzG3WRCWwweELXVEcJOBpzGSyz3P0InxZdL9GpN5lYXkPyNb85yR20Db86I0iE0LsJnevdv9OghEFv7qPxPuIf5hKprbN+59xUS+s0BP1jJHW1c4qJUxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: a86985f637a111f1aa26b74ffac11d73-20260414
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
X-CID-O-INFO: VERSION:1.3.12,REQID:b71987a5-8653-4a3b-a5b3-307c5d802ff5,IP:10,
	URL:0,TC:0,Content:0,EDM:-20,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-15
X-CID-INFO: VERSION:1.3.12,REQID:b71987a5-8653-4a3b-a5b3-307c5d802ff5,IP:10,UR
	L:0,TC:0,Content:0,EDM:-20,RT:0,SF:-5,FILE:0,BULK:0,RULE:EDM_GE969F26,ACTI
	ON:release,TS:-15
X-CID-META: VersionHash:e7bac3a,CLOUDID:cfe76710a64398a24676b26ed1739114,BulkI
	D:260414093130NFQ69WNS,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|102|127|
	898,TC:nil,Content:0|15|50,EDM:1,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:n
	il,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_AEC,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a86985f637a111f1aa26b74ffac11d73-20260414
X-User: cuitao@kylinos.cn
Received: from ctao-book.. [(183.242.174.20)] by mailgw.kylinos.cn
	(envelope-from <cuitao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2146840628; Tue, 14 Apr 2026 09:31:27 +0800
From: cuitao <cuitao@kylinos.cn>
To: zhaotianrui@loongson.cn,
	maobibo@loongson.cn,
	chenhuacai@kernel.org,
	loongarch@lists.linux.dev
Cc: kernel@xen0n.name,
	cuitao <cuitao@kylinos.cn>
Subject: [PATCH] LoongArch/KVM: Fix missing EMULATE_FAIL in ldptr default case of kvm_emu_mmio_read
Date: Tue, 14 Apr 2026 09:31:14 +0800
Message-ID: <20260414013114.306033-1-cuitao@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the ldptr (0x24...0x27) opcode decoding path, the default case
only breaks out without setting ret to EMULATE_FAIL. This leaves
run->mmio.len uninitialized (stale from a previous MMIO operation)
while ret remains EMULATE_DO_MMIO, causing the code to proceed with
an incorrect MMIO length.

Add ret = EMULATE_FAIL to match the other default branches in the
same function (e.g. the 0x28...0x2e and 0x38 cases).

Signed-off-by: cuitao <cuitao@kylinos.cn>
---
 arch/loongarch/kvm/exit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/kvm/exit.c b/arch/loongarch/kvm/exit.c
index da0ad89f2eb7..3b95cd0f989b 100644
--- a/arch/loongarch/kvm/exit.c
+++ b/arch/loongarch/kvm/exit.c
@@ -390,6 +390,7 @@ int kvm_emu_mmio_read(struct kvm_vcpu *vcpu, larch_inst inst)
 			run->mmio.len = 8;
 			break;
 		default:
+			ret = EMULATE_FAIL;
 			break;
 		}
 		break;
-- 
2.43.0

