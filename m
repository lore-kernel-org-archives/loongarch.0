Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300617F477
	for <loongarch@lists.linux.dev>; Mon, 11 Nov 2024 06:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731305424; cv=none; b=VI5Wa1/rgemmTRPgPJgVxp4NhiTCIK1kaoaJ5j0ft2zwqE/+h5X4a5EN3zv6xhOJPAqqfZfswC6TmQ+6d61UOU773Fs6DjHWnUsYzfL53zCHp79OLTr4k6I1NbgSW70e8uF+2kLI2YEiubATT3rc6HBLnIIyWCLScskEBr/Rzu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731305424; c=relaxed/simple;
	bh=DbnonwvT9+TeoK0pRjgBRHojNOqJMpZZb5XkAwimCk4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MnKfVnJeXfSsACn1pYSCNoN0hv5aZEQucnj0k37NGAWI7b4na+XzqTlf2aFpPkGZoNUEwiyw0+X+Jr2OeRRDvlcwQ93cUipED+KI7lJNehl/l0KdG1D6tO9S3EVYJwbNeWfoGlgmVO4pGlnC6w1kKJSMoE+IyeklGAGT+5FOpvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.90])
	by gateway (Coremail) with SMTP id _____8Ax6+HDnzFnnjw7AA--.50713S3;
	Mon, 11 Nov 2024 14:10:11 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.90])
	by front1 (Coremail) with SMTP id qMiowMBxnkfDnzFn0ABRAA--.10185S2;
	Mon, 11 Nov 2024 14:10:11 +0800 (CST)
From: Zhao Qunqin <zhaoqunqin@loongson.cn>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chenhuacai@kernel.org,
	bp@alien8.de
Cc: linux-edac@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@xen0n.name,
	tony.luck@intel.com,
	james.morse@arm.com,
	mchehab@kernel.org,
	rric@kernel.org,
	loongarch@lists.linux.dev,
	Zhao Qunqin <zhaoqunqin@loongson.cn>
Subject: [PATCH v7 0/2] Add EDAC driver for loongson memory controller
Date: Mon, 11 Nov 2024 14:09:37 +0800
Message-Id: <20241111060939.5349-1-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxnkfDnzFn0ABRAA--.10185S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7JFyDtrWDJw1rur4xuF4kGrX_yoWxtFg_C3
	WxAFW8Jr4kta4DJay2vr18ZrWayF4UtFn5CFn0gw15XF1avr13Wr97ZF13AFy7tr1DWFy3
	ZrWkKFyxA3WxtosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUUU

Add a simple EDAC driver which report single bit errors (CE) only on
loongson platform.

Zhao Qunqin (2):
  dt-bindings: EDAC for ls3a5000 memory controller
  EDAC: Add EDAC driver for loongson memory controller

 .../edac/loongson,ls3a5000-mc-edac.yaml       |  44 +++++
 MAINTAINERS                                   |   7 +
 arch/loongarch/Kconfig                        |   1 +
 drivers/edac/Kconfig                          |   8 +
 drivers/edac/Makefile                         |   1 +
 drivers/edac/loongson_edac.c                  | 156 ++++++++++++++++++
 6 files changed, 217 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/loongson,ls3a5000-mc-edac.yaml
 create mode 100644 drivers/edac/loongson_edac.c


base-commit: e14232afa94445e03fc3a0291b07a68f3408c120
-- 
2.43.0

