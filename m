Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B252618C930
	for <loongarch@lists.linux.dev>; Thu,  6 Mar 2025 02:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741227527; cv=none; b=VHXAafCw7fnMOkLTOwNYzWmq/JiRB6k6nIlBWnbHUE7AEa+4I5Htt0CoFbpsy1RJrtWwE6xT2ggHKrdfR6W6NZZGPiH57jvM92wR9imXpptID1Q4IWkKzCr0neREJraw3hKAtEI9wrLlQRU/OBKu16JBHRNkLuEO/TkJv8djCiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741227527; c=relaxed/simple;
	bh=bMdJ8AlLh9wn+pe/MILqOgP8VEhUckiGvJca8sKVwNk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lgXNqO6jIODvx9i4rNGyQk/ZJ2BZj+h/3teT4mBZhRIpUmglM7qOFVtsODuuzMb+G5anKP23Tk1zIJ2EfhpyoJ1DG2s2cE2tMl4QVPN83sVAQRqqIbj5emtw0p3f3ibFJA6W4RHBRpil8qZjydnwLihQMvib4QH7ZA4v0j+FNMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Ax3eIBBslnecqLAA--.3300S3;
	Thu, 06 Mar 2025 10:18:41 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMDxu8QABslnjKE4AA--.11561S2;
	Thu, 06 Mar 2025 10:18:41 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xianglai Li <lixianglai@loongson.cn>
Subject: [PATCH v2 0/2] LoongArch: KVM: Small enhancements about KVM
Date: Thu,  6 Mar 2025 10:18:38 +0800
Message-Id: <20250306021840.2120016-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxu8QABslnjKE4AA--.11561S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

There are two small enhancements about LoongArch KVM, one is VM fails
to run after host resumes from S4, the other is AVEC interrupt status
fails to check in KVM. It is solved in these two patches.

Bibo Mao (2):
  LoongArch: KVM: Reload guest CSR registers after S4
  LoongArch: KVM: Add interrupt checking with Loongson AVEC

 arch/loongarch/kvm/main.c | 6 ++++++
 arch/loongarch/kvm/vcpu.c | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)


base-commit: 848e076317446f9c663771ddec142d7c2eb4cb43
-- 
2.39.3

