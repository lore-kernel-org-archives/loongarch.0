Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05049763F8
	for <loongarch@lists.linux.dev>; Sat, 31 Aug 2024 05:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725081845; cv=none; b=pASHosv66Zj4dsspTa8HS8dG/KDQLkXfAXoPfMyXkASQJdk0CGZDo2ZVkeD+zfyQAQyFOLIqPbCgaLl920TBtbVb1zbUf868YZawlc1YcIfuP1DG2ajYJ7n+9H+mAqZ4Fo68p/DiSJWIdNpTz08bbMYBA9nPAaRdDCxHhsUz3N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725081845; c=relaxed/simple;
	bh=Qrydd6FpfGREKFpUumfU+PND9ypJPQ0rvGA5gim0Y0I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MyI5bC5mfoPhzEZpgY++H8FfSSc1rQNCwANN6JqRyepxcmpe5pa60as1lHiZjEhsf4Q5iCQ6HUA3ABC6CGMfx46UFvw/gFy8/sIQwaPm0dve0Gf27CITZtj3mWuNqXsZN36bfNAMBdZiK1sREDcbXypeth8JVRi6/tdTPQR1Qm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=lS6+8Lqe; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="lS6+8Lqe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1725081795;
	bh=BeFS78svjvX4dgZ/pXmTXrW3I/8Ubt/o8uwqmQay4rc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=lS6+8LqeCYg27XDxF6TuwCvzN6M0aLM/fliy5tWtRFWZa268/Xxk0s6vg9uKjveLA
	 CGvctqtcpp0hNI3VUkz2Q6msqowr961ol/zxRbA3g5Anp5vk011EDaX9a5WRA7ro/p
	 ZuvpwkJLiaAtcXaoGUcFIVsqDakXw0nXNy3nQixs=
X-QQ-mid: bizesmtp85t1725081789tfeka6ky
X-QQ-Originating-IP: E3dMKFpfvXJ0xiShuJTZplZjy33NIhkzA8HM6/RTArs=
Received: from localhost.localdomain ( [111.172.4.23])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 31 Aug 2024 13:23:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2311621511106180187
From: Wentao Guan <guanwentao@uniontech.com>
To: henhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Wentao Guan <guanwentao@uniontech.com>,
	Wangyuli <wangyuli@uniontech.com>
Subject: [PATCH] Loongarch64: pci: fix memleak in pci_acpi_scan_root
Date: Sat, 31 Aug 2024 13:21:57 +0800
Message-Id: <20240831052157.13532-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-0

Add kfree(root_ops) in this case to avoid memleak root_ops,
leaks when pci_find_bus() != 0.
Also delay assign root_ops when used for making code read clean.
Found by code review

Signed-off-by: Wangyuli <wangyuli@uniontech.com>
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
---
 arch/loongarch/pci/acpi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/pci/acpi.c b/arch/loongarch/pci/acpi.c
index 3eb61b8cd5e3..7f3539f5fa23 100644
--- a/arch/loongarch/pci/acpi.c
+++ b/arch/loongarch/pci/acpi.c
@@ -219,17 +219,18 @@ struct pci_bus *pci_acpi_scan_root(struct acpi_pci_root *root)
 		return NULL;
 	}
 
-	root_ops->release_info = acpi_release_root_info;
-	root_ops->prepare_resources = acpi_prepare_root_resources;
-	root_ops->pci_ops = (struct pci_ops *)&info->cfg->ops->pci_ops;
-
 	bus = pci_find_bus(domain, busnum);
 	if (bus) {
 		memcpy(bus->sysdata, info->cfg, sizeof(struct pci_config_window));
 		kfree(info);
+		kfree(root_ops);
 	} else {
 		struct pci_bus *child;
 
+		root_ops->release_info = acpi_release_root_info;
+		root_ops->prepare_resources = acpi_prepare_root_resources;
+		root_ops->pci_ops = (struct pci_ops *)&info->cfg->ops->pci_ops;
+
 		bus = acpi_pci_root_create(root, root_ops,
 					   &info->common, info->cfg);
 		if (!bus) {
-- 
2.20.1

