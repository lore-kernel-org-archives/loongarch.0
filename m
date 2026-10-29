Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793245009;
	b=xQbBtY8QGbGEltYgVMb5MUts9zu634b9paUep3xMA/1M0INWkMR/w+Ol45iTaj+L9VwB
	 RACykttRA4xdmWc9JqNqfmWVp4XiIq9PMP6K3HUVz1/muFCn9vAtcfjJDLgVqBkZy0mI7
	 UQvrm6ZBC9x1xd2wGYgl5klrqm0oP+6P9ntHgGsIk5QgDTHohx+Kgv2q+ZLWlUVwUsVGi
	 9TcbY+On+c7I0DTR59GW11AJBgQNVCk1xQP9xLYchREsPso4IxWaCJJM01993LAFperIh
	 eVfwleX49iM6rvBwA1TJxdTKnUX1bpTUkSGxJHmeQuPb/bL1Z4iPmYD7N7CVpO/nqpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793245009;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=XUB/7JwFVR3vCwhz9vzj6yKZKYA2g43PyYaNlGDfQBs=;
	b=5ILIoG8kqy3nfuwizVZpbg0/cUBAPEhyzrn8FAlwpQCNrFyJLtiLi5cRMYPXVf+Nfksn
	 CAZt5nXSyD9YYycxQrXmMNMGt8gvK4AW49IURPZyXn2uAMT8nPbdGvYcdtIldkvDdrwRt
	 s+QrQ8TJSu8/c2e6BHNrpjR8QU9KzIV7TvZOYVolSFXNAF9W6Quz49KDtYhO17anH3eGK
	 q+NLg8lMHLQPiKmz02fJrVOs1+n6wWueIEng/piWpeaedf62gcPwC67NVUmF8ZYwP2ZVG
	 X5fqDmMFmbI1HFwLg4PkbyEv6gzfW51xwfSx2rkNpHcejNAHeC1764DEoZ229CVrknw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5336D606A320
	for <loongarch@lists.linux.dev>; Thu, 29 Oct 2026 03:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5336D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Bx79JNv+Jq01MaAA--.11438S3;
	Thu, 29 Oct 2026 11:36:45 +0800 (CST)
Received: from localhost.localdomain (unknown [127.0.0.1])
	by front1 (Coremail) with SMTP id qMiowJDxzM5Nv+JqXRAxAA--.11789S2;
	Thu, 29 Oct 2026 11:36:45 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: KVM: Add KVM_LOONGARCH_VM_FEAT_CRASH feature detect support
Date: Thu, 29 Oct 2026 11:36:36 +0800
Message-Id: <20261029033636.1280539-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxzM5Nv+JqXRAxAA--.11789S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Add feature detect with KVM_LOONGARCH_VM_FEAT_CRASH, so that VMM in
user space can detect and enable this feature.

Fixes: 00289c235d40 ("LoongArch: KVM: Add hypercall crash support")
Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/vm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/kvm/vm.c b/arch/loongarch/kvm/vm.c
index e4c1c65fe20b..ba5fdfcd7016 100644
--- a/arch/loongarch/kvm/vm.c
+++ b/arch/loongarch/kvm/vm.c
@@ -165,6 +165,7 @@ static int kvm_vm_feature_has_attr(struct kvm *kvm, struct kvm_device_attr *attr
 	case KVM_LOONGARCH_VM_FEAT_PV_IPI:
 	case KVM_LOONGARCH_VM_FEAT_PV_PREEMPT:
 	case KVM_LOONGARCH_VM_FEAT_PV_STEALTIME:
+	case KVM_LOONGARCH_VM_FEAT_CRASH:
 		if (kvm_vm_support(&kvm->arch, attr->attr))
 			return 0;
 		return -ENXIO;

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.39.3

