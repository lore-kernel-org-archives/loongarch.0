Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26067351C2E
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 07:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777360016; cv=none; b=ZViX01TZsH61txyQqqqYdWVvsAlUHGNjJSwTI9rWN0jY/WSe5mQyEJDcy39tWq88xNSZaiLCDt5J4k3dc2yQdIY2ydZ0sZNlE6jg3h9W1gftYO5ymrh4s1uA3PSLSE9mg6yxutogAocc8gIBJPEH3j1gCeV49LOxUsY96w5pHO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777360016; c=relaxed/simple;
	bh=q7Shco4otI1PIItVOttMe3E3dPT9aa6KAXY5FoP8YGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PMyLREF6PiAL18f6C7gVYQ9nimcRf6DKuirsQFgZekk97La/0WZMmfBOCn5223Lt9sVxdTRNdfQX7f2OFLYVdCMs2BnW6Ifpfis6kVIJMdiyYux9T6TRihYuKNZGrFtGpGZ7UTF4ArvZaIp5ILfKaEqFTsMg4Wl/uQfCY7Neaug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.8])
	by gateway (Coremail) with SMTP id _____8AxFemJXPBpy6cEAA--.9755S3;
	Tue, 28 Apr 2026 15:06:49 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.8])
	by front1 (Coremail) with SMTP id qMiowJAxIMN7XPBptmN2AA--.53810S2;
	Tue, 28 Apr 2026 15:06:48 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] LoongArch: Make CONFIG_64BIT as the default option
Date: Tue, 28 Apr 2026 15:06:27 +0800
Message-ID: <20260428070627.1740598-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxIMN7XPBptmN2AA--.53810S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtFWrWFW7tF45XF4UuF15trc_yoW3WFg_G3
	Z3Jw45GF4rJa4UW34aqFWrWwn0ya1kuFZ0y34qvr4UX34agwn8GrWDW3Z8Zrn7K3yUWrs3
	ArWIqa9Ikr1IyosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzsqWUUUUU

CONFIG_64BIT is the mandatory option before v7.0, but in v7.1-rc1 both
CONFIG_32BIT and CONFIG_64BIT are selectable and CONFIG_32BIT became the
default option. This breaks existing configurations, so explicitly make
CONFIG_64BIT as the default option to keep existing behavior.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 3b042dbb2c41..606597da46b8 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -220,6 +220,7 @@ menu "Kernel type and options"
 
 choice
 	prompt "Kernel type"
+	default 64BIT # Keep existing behavior
 
 config 32BIT
 	bool "32-bit kernel"
-- 
2.52.0

